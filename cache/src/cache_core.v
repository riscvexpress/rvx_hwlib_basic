//------------------------------------------------------------------------------
// cache.v
// Converted 1:1 from cache.vhd (entity cache, architecture rtl)
//------------------------------------------------------------------------------
`include "cache_utils_pkg.vh"

module cache_core
  #(
    parameter NUM_LINES             = 1,
    parameter LINE_SIZE             = 16,
    parameter ADDRESS_WIDTH         = 32,
    parameter WIDTH                 = 32,
    parameter DIRTY_BITS            = 0,
    parameter WRITE_FIRST_SUPPORTED = 0  // boolean
    )
  (
   input  wire                                                            clk,
   input  wire                                                            reset,

   //Read-only data ORCA-internal memory-mapped slave
   input  wire [ADDRESS_WIDTH-1:0]                                        read_address,
   input  wire                                                            read_requestvalid,
   input  wire                                                            read_speculative,
   output wire [WIDTH-1:0]                                                read_readdata,
   output wire                                                            read_readdatavalid,
   output wire                                                            read_readabort,
   output wire                                                            read_miss,
   output reg                                                             read_requestinflight,
   output reg  [ADDRESS_WIDTH-1:0]                                        read_lastaddress,
   output wire [(ADDRESS_WIDTH-`log2(NUM_LINES*LINE_SIZE))-1:0]           read_tag,
   output wire [DIRTY_BITS:0]                                             read_dirty_valid,

   //Write-only data ORCA-internal memory-mapped slave
   input  wire [ADDRESS_WIDTH-1:0]                                        write_address,
   input  wire [(WIDTH/8)-1:0]                                            write_byteenable,
   input  wire                                                            write_requestvalid,
   input  wire [WIDTH-1:0]                                                write_writedata,
   input  wire                                                            write_tag_update,
   input  wire [DIRTY_BITS:0]                                             write_dirty_valid,

   output wire                                                            cache_tag_renable,
   output wire [`log2_min1(NUM_LINES)-1:0]                                cache_tag_raddr,
   input  wire [ADDRESS_WIDTH-`log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS:0]    cache_tag_rdata,
   output wire [`log2_min1(NUM_LINES)-1:0]                                cache_tag_waddr,
   output wire                                                            cache_tag_wenable,
   output wire [ADDRESS_WIDTH-`log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS:0]    cache_tag_wdata,

   output wire                                                            cache_data_renable,
   output wire [`log2_min1(NUM_LINES)+`log2(LINE_SIZE/(WIDTH/8))-1:0]     cache_data_raddr,
   input  wire [WIDTH-1:0]                                                cache_data_rdata,
   output wire                                                            cache_data_wenable,
   output wire [`log2_min1(NUM_LINES)+`log2(LINE_SIZE/(WIDTH/8))-1:0]     cache_data_waddr,
   output wire [(WIDTH/8)-1:0]                                            cache_data_wstrb,
   output wire [WIDTH-1:0]                                                cache_data_wdata
   );

  localparam WORDS_PER_LINE  = LINE_SIZE/(WIDTH/8);
  localparam TAG_BITS        = ADDRESS_WIDTH-`log2(NUM_LINES*LINE_SIZE);
  localparam TAG_LEFT        = ADDRESS_WIDTH-1;
  localparam TAG_RIGHT       = `log2(NUM_LINES)+`log2(LINE_SIZE);
  localparam CACHELINE_BITS  = `log2(NUM_LINES);
  localparam CACHELINE_RIGHT = `log2(LINE_SIZE);
  localparam CACHEWORD_BITS  = `log2(NUM_LINES)+`log2(WORDS_PER_LINE);
  localparam CACHEWORD_LEFT  = `log2(NUM_LINES)+`log2(LINE_SIZE)-1;
  localparam CACHEWORD_RIGHT = `log2(WIDTH/8);

  reg                            read_speculationinflight;
  wire                           read_hit;

  wire [TAG_BITS+DIRTY_BITS:0]   read_dirty_valid_tag;
  // alias read_valid : read_dirty_valid_tag(TAG_BITS)
  wire                           read_valid;
  wire                           read_tag_equal;

  wire [TAG_BITS+DIRTY_BITS:0]   write_dirty_valid_tag_in;

  wire [CACHELINE_BITS-1:0]      read_cacheline;
  wire [CACHELINE_BITS-1:0]      write_cacheline;
  wire [CACHEWORD_BITS-1:0]      read_cacheword;
  wire [CACHEWORD_BITS-1:0]      write_cacheword;

  // alias write_tag : write_address(TAG_LEFT downto TAG_RIGHT)
  wire [TAG_BITS-1:0]            write_tag;
  // alias read_request_tag : read_lastaddress(TAG_LEFT downto TAG_RIGHT)
  wire [TAG_BITS-1:0]            read_request_tag;

  assign read_valid       = read_dirty_valid_tag[TAG_BITS];
  assign write_tag        = write_address[TAG_LEFT:TAG_RIGHT];
  assign read_request_tag = read_lastaddress[TAG_LEFT:TAG_RIGHT];

  assign read_miss = read_requestinflight & (~read_hit);


  assign cache_tag_renable = 1;
  assign cache_data_renable = 1;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      read_requestinflight     <= 1'b0;
      read_lastaddress         <= {ADDRESS_WIDTH{1'b0}};
      read_speculationinflight <= 1'b0;
    end else begin
      read_speculationinflight <= 1'b0;
      if (read_hit == 1'b1) begin
        read_requestinflight <= 1'b0;
      end

      if ((read_requestvalid == 1'b1) && (read_miss == 1'b0)) begin
        read_lastaddress         <= read_address;
        read_requestinflight     <= ~read_speculative;
        read_speculationinflight <= read_speculative;
      end
    end
  end

  assign read_tag_equal = (read_tag == read_request_tag) ? 1'b1 : 1'b0;

  assign read_dirty_valid[0] = read_valid;
  assign read_tag            = read_dirty_valid_tag[TAG_BITS-1:0];
  generate
    if (DIRTY_BITS > 0) begin : dirty_gen
      // alias read_dirty : read_dirty_valid_tag(TAG_BITS+DIRTY_BITS downto TAG_BITS+1)
      assign read_dirty_valid[DIRTY_BITS:1] = read_dirty_valid_tag[TAG_BITS+DIRTY_BITS:TAG_BITS+1];
    end
  endgenerate
  assign read_hit           = read_valid & read_tag_equal;
  assign read_readdatavalid = read_hit & (read_requestinflight | read_speculationinflight);
  assign read_readabort     = (~read_hit) & read_speculationinflight;

  assign write_dirty_valid_tag_in = {write_dirty_valid, write_tag};

  //This block contains the tag, with a valid bit.
  assign read_cacheline  = read_address[TAG_RIGHT-1:CACHELINE_RIGHT];
  assign write_cacheline = write_address[TAG_RIGHT-1:CACHELINE_RIGHT];

  assign cache_tag_raddr      = read_cacheline;
  assign read_dirty_valid_tag = cache_tag_rdata;
  assign cache_tag_waddr      = write_cacheline;
  assign cache_tag_wenable    = write_tag_update;
  assign cache_tag_wdata      = write_dirty_valid_tag_in;

  //For each byte generate a separate data cache RAM
  assign read_cacheword  = read_address[CACHEWORD_LEFT:CACHEWORD_RIGHT];
  assign write_cacheword = write_address[CACHEWORD_LEFT:CACHEWORD_RIGHT];

  assign cache_data_raddr = read_cacheword;
  assign read_readdata    = cache_data_rdata;
  assign cache_data_wenable = write_requestvalid;
  assign cache_data_waddr = write_cacheword;
  genvar gbyte;
  generate
    for (gbyte = 0; gbyte <= (WIDTH/8)-1; gbyte = gbyte + 1) begin : byteenable_gen
      assign cache_data_wstrb[gbyte] = write_requestvalid & write_byteenable[gbyte];
    end
  endgenerate
  assign cache_data_wdata = write_writedata;

endmodule
