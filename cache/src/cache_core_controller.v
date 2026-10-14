//------------------------------------------------------------------------------
// cache_controller.v
// Converted 1:1 from cache_controller.vhd (entity cache_controller, arch rtl)
// POLICY uses cache_policy encoding: 0=READ_ONLY, 1=WRITE_THROUGH, 2=WRITE_BACK
// to_cache_control_command uses 2-bit cache_control_command encoding.
// Instantiates cache (instance name: the_cache).
//------------------------------------------------------------------------------
`include "cache_constants_pkg.vh"

module cache_core_controller
  #(
    parameter CACHE_SIZE            = 32768,
    parameter LINE_SIZE             = 32,
    parameter ADDRESS_WIDTH         = 32,
    parameter INTERNAL_WIDTH        = 32,
    parameter EXTERNAL_WIDTH        = 32,
    parameter LOG2_BURSTLENGTH      = 8,
    parameter POLICY                = `CACHE_POLICY_READ_ONLY,
    parameter REGION_OPTIMIZATIONS  = 0,  // boolean
    parameter WRITE_FIRST_SUPPORTED = 0,  // boolean
    parameter DIRTY_BITS            = 0
    )
  (
   input  wire                                        clk,
   input  wire                                        reset,

   //Cache control (Invalidate/flush/writeback)
   output reg                                         from_cache_control_ready,
   input  wire                                        to_cache_control_valid,
   input  wire [`CACHE_CONTROL_COMMAND_WIDTH-1:0]     to_cache_control_command,
   input  wire [ADDRESS_WIDTH-1:0]                    to_cache_control_base,
   input  wire [ADDRESS_WIDTH-1:0]                    to_cache_control_last,

   input  wire                                        precache_idle,
   output wire                                        cache_idle,

   //Cache interface ORCA-internal memory-mapped slave
   input  wire [ADDRESS_WIDTH-1:0]                    cacheint_oimm_address,
   input  wire [(INTERNAL_WIDTH/8)-1:0]               cacheint_oimm_byteenable,
   input  wire                                        cacheint_oimm_requestvalid,
   input  wire                                        cacheint_oimm_readnotwrite,
   input  wire [INTERNAL_WIDTH-1:0]                   cacheint_oimm_writedata,
   output wire [INTERNAL_WIDTH-1:0]                   cacheint_oimm_readdata,
   output wire                                        cacheint_oimm_readdatavalid,
   output wire                                        cacheint_oimm_waitrequest,

   //Cached ORCA-internal memory-mapped master
   output wire [ADDRESS_WIDTH-1:0]                    c_oimm_address,
   output wire [LOG2_BURSTLENGTH:0]                   c_oimm_burstlength,
   output wire [LOG2_BURSTLENGTH-1:0]                 c_oimm_burstlength_minus1,
   output wire [(EXTERNAL_WIDTH/8)-1:0]               c_oimm_byteenable,
   output wire                                        c_oimm_requestvalid,
   output wire                                        c_oimm_readnotwrite,
   output wire [EXTERNAL_WIDTH-1:0]                   c_oimm_writedata,
   output wire                                        c_oimm_writelast,
   input  wire [EXTERNAL_WIDTH-1:0]                   c_oimm_readdata,
   input  wire                                        c_oimm_readdatavalid,
   input  wire                                        c_oimm_waitrequest,

   output wire                                        cache_tag_renable,
   output wire [`log2_min1(CACHE_SIZE/LINE_SIZE)-1:0] cache_tag_raddr,
   input  wire [ADDRESS_WIDTH-`log2(CACHE_SIZE)+DIRTY_BITS:0] cache_tag_rdata,
   output wire [`log2_min1(CACHE_SIZE/LINE_SIZE)-1:0] cache_tag_waddr,
   output wire                                        cache_tag_wenable,
   output wire [ADDRESS_WIDTH-`log2(CACHE_SIZE)+DIRTY_BITS:0] cache_tag_wdata,

   output wire                                        cache_data_renable,
   output wire [`log2_min1(CACHE_SIZE/LINE_SIZE)+`log2(LINE_SIZE/(EXTERNAL_WIDTH/8))-1:0] cache_data_raddr,
   input  wire [EXTERNAL_WIDTH-1:0]                   cache_data_rdata,
   output wire                                        cache_data_wenable,
   output wire [`log2_min1(CACHE_SIZE/LINE_SIZE)+`log2(LINE_SIZE/(EXTERNAL_WIDTH/8))-1:0] cache_data_waddr,
   output wire [(EXTERNAL_WIDTH/8)-1:0]               cache_data_wstrb,
   output wire [EXTERNAL_WIDTH-1:0]                   cache_data_wdata,

   output wire [`log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8))-1:0] spill_raddr,
   input  wire [EXTERNAL_WIDTH-1:0]                   spill_rdata,
   output wire [`log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8))-1:0] spill_waddr,
   output wire                                        spill_wenable,
   output wire [EXTERNAL_WIDTH-1:0]                   spill_wdata
   );

  localparam NUM_LINES                        = CACHE_SIZE/LINE_SIZE;
  localparam TAG_BITS                         = ADDRESS_WIDTH-`log2(CACHE_SIZE);
  localparam TAG_LEFT                         = ADDRESS_WIDTH-1;
  localparam TAG_RIGHT                        = `log2(NUM_LINES)+`log2(LINE_SIZE);
  localparam CACHELINE_BITS                   = `log2(NUM_LINES);
  localparam CACHELINE_RIGHT                  = `log2(LINE_SIZE);
  localparam INTERNAL_WORDS_PER_EXTERNAL_WORD = EXTERNAL_WIDTH/INTERNAL_WIDTH;

  // function compute_burst_length
  localparam BEATS_PER_BURST = ((LINE_SIZE/(EXTERNAL_WIDTH/8)) > (2**LOG2_BURSTLENGTH)) ?
                               (2**LOG2_BURSTLENGTH) : (LINE_SIZE/(EXTERNAL_WIDTH/8));
  localparam BYTES_PER_BEAT  = EXTERNAL_WIDTH/8;
  localparam BYTES_PER_BURST = BYTES_PER_BEAT*BEATS_PER_BURST;
  localparam BEATS_PER_LINE  = LINE_SIZE/BYTES_PER_BEAT;
  localparam BURSTS_PER_LINE = LINE_SIZE/BYTES_PER_BURST;

  // aliases of to_cache_control_base/last (TAG_LEFT downto CACHELINE_RIGHT)
  wire [TAG_BITS+CACHELINE_BITS-1:0] to_cache_control_base_tag_line;
  wire [TAG_BITS+CACHELINE_BITS-1:0] to_cache_control_last_tag_line;
  wire                               to_cache_control_base_partial;
  wire                               to_cache_control_last_partial;

  wire [TAG_BITS+CACHELINE_BITS-1:0] cache_walker_read_tag_line;

  wire read_region_base_hit;
  wire read_region_inner_hit;
  wire read_region_last_hit;
  wire read_region_hit;
  wire read_region_hit_partial;

  wire                     read_miss;
  wire                     read_requestinflight;
  wire [ADDRESS_WIDTH-1:0] read_lastaddress;
  wire [`log2(NUM_LINES)-1:0] read_lastline;

  // type control_state_type is (WALK_CACHE, IDLE, CACHE_MISSED, WAIT_FOR_HIT)
  localparam [1:0] WALK_CACHE   = 2'd0;
  localparam [1:0] IDLE         = 2'd1;
  localparam [1:0] CACHE_MISSED = 2'd2;
  localparam [1:0] WAIT_FOR_HIT = 2'd3;
  reg [1:0] control_state;
  reg [1:0] next_control_state;

  wire [ADDRESS_WIDTH-1:0]      write_address;
  wire [(EXTERNAL_WIDTH/8)-1:0] write_byteenable;
  wire [EXTERNAL_WIDTH-1:0]     write_writedata;
  wire                          write_requestvalid;
  wire                          write_tag_update;
  wire [DIRTY_BITS:0]           write_dirty_valid;

  reg                           cache_mgt_tag_update;
  reg  [DIRTY_BITS:0]           cache_mgt_dirty_valid;  // bit 0 = cache_mgt_tag_valid

  wire                          cache_walker_tag_update;
  wire [DIRTY_BITS:0]           cache_walker_dirty_valid;  // bit 0 = cache_walker_tag_valid
  reg                           start_to_cache_walker;
  wire                          ready_from_cache_walker;
  wire                          done_from_cache_walker;
  reg                           cache_walking;
  reg  [`CACHE_CONTROL_COMMAND_WIDTH-1:0] cache_walker_command;
  reg  [`log2(NUM_LINES)-1:0]   cache_walker_line;
  wire                          cache_walker_line_increment;
  wire                          cache_walker_line_last;

  wire                          write_hit;
  wire [DIRTY_BITS:0]           write_hit_dirty_valid;

  reg                           filling;
  reg                           fill_reading;
  reg                           start_to_filler;
  wire                          ready_from_filler;
  wire                          done_from_filler;

  wire [`log2(LINE_SIZE)-1:0]   fill_external_offset;
  wire                          fill_external_offset_increment;
  wire                          fill_external_offset_last;
  wire [`log2(LINE_SIZE)-1:0]   fill_internal_offset;
  wire                          fill_internal_offset_increment;
  wire                          fill_internal_offset_last;

  wire                          write_idle;
  wire                          write_ready;
  wire                          write_on_hit;

  wire [ADDRESS_WIDTH-1:0]      read_address;
  wire                          read_requestvalid;
  wire                          read_speculative;
  wire [EXTERNAL_WIDTH-1:0]     read_readdata;
  wire                          read_readdatavalid;
  wire                          read_readabort;
  wire [TAG_BITS-1:0]           read_tag;
  wire [DIRTY_BITS:0]           read_dirty_valid;

  assign to_cache_control_base_tag_line = to_cache_control_base[TAG_LEFT:CACHELINE_RIGHT];
  assign to_cache_control_last_tag_line = to_cache_control_last[TAG_LEFT:CACHELINE_RIGHT];

  //Idle when no reads in flight (either hit or miss), not waiting on a
  //writeback/writethrough, and not walking the cache.
  //Idle is state-only; do not check for incoming requests
  assign cache_idle = (~read_requestinflight) & write_idle & (~cache_walking);

  assign cacheint_oimm_waitrequest = read_miss |
                                     (~write_ready) |
                                     cache_walking;

  generate
    if (`log2(BYTES_PER_BEAT) > 0) begin : beat_addr_zero_gen
      assign c_oimm_address[`log2(BYTES_PER_BEAT)-1:0] = {`log2(BYTES_PER_BEAT){1'b0}};
    end
  endgenerate

  assign read_requestvalid           = cacheint_oimm_requestvalid & (~cacheint_oimm_waitrequest);
  assign cacheint_oimm_readdatavalid = read_readdatavalid & (~write_on_hit);

  generate
    if (INTERNAL_WORDS_PER_EXTERNAL_WORD == 1) begin : single_internal_word_gen
      assign cacheint_oimm_readdata = read_readdata;
    end
    if (INTERNAL_WORDS_PER_EXTERNAL_WORD > 1) begin : multiple_internal_words_gen
      wire [`log2(INTERNAL_WORDS_PER_EXTERNAL_WORD)-1:0] read_word_select;
      assign read_word_select = read_lastaddress[`log2(EXTERNAL_WIDTH/8)-1:`log2(INTERNAL_WIDTH/8)];
      assign cacheint_oimm_readdata = read_readdata >> (read_word_select*INTERNAL_WIDTH);
    end
  endgenerate

  //----------------------------------------------------------------------------
  // Cache Contol FSM
  //----------------------------------------------------------------------------
  always @(*) begin
    next_control_state       = control_state;
    cache_mgt_tag_update     = 1'b0;
    cache_mgt_dirty_valid    = {(DIRTY_BITS+1){1'b0}};
    start_to_filler          = 1'b0;
    from_cache_control_ready = 1'b0;
    start_to_cache_walker    = 1'b0;

    case (control_state)
      WALK_CACHE: begin
        cache_mgt_tag_update  = cache_walker_tag_update;
        cache_mgt_dirty_valid = cache_walker_dirty_valid;
        if (done_from_cache_walker == 1'b1) begin
          next_control_state = IDLE;
        end
      end

      IDLE: begin
        //Could make this combinational to reduce miss latency by one cycle at
        //the expense of a longer path to external memory.
        if (read_miss == 1'b1) begin
          start_to_filler = 1'b1;
          if (ready_from_filler == 1'b1) begin
            next_control_state       = CACHE_MISSED;
            cache_mgt_tag_update     = 1'b1;
            cache_mgt_dirty_valid[0] = 1'b0;  // cache_mgt_tag_valid
          end
        end else begin
          if ((precache_idle == 1'b1) && (cacheint_oimm_requestvalid == 1'b0) && (write_idle == 1'b1)) begin
            if (ready_from_cache_walker == 1'b1) begin
              from_cache_control_ready = 1'b1;
              if (to_cache_control_valid == 1'b1) begin
                case (to_cache_control_command)
                  `CACHE_CONTROL_WRITEBACK: begin
                    //Skip writeback commands for read_only and writethrough caches
                    if (POLICY == `CACHE_POLICY_WRITE_BACK) begin
                      start_to_cache_walker = 1'b1;
                      next_control_state    = WALK_CACHE;
                    end
                  end
                  default: begin
                    //Initialize/Invalidate/Flush
                    start_to_cache_walker = 1'b1;
                    next_control_state    = WALK_CACHE;
                  end
                endcase
              end
            end
          end
        end
      end

      CACHE_MISSED: begin
        if (done_from_filler == 1'b1) begin
          cache_mgt_tag_update     = 1'b1;
          cache_mgt_dirty_valid[0] = 1'b1;  // cache_mgt_tag_valid
          next_control_state       = WAIT_FOR_HIT;
        end
      end

      WAIT_FOR_HIT: begin
        if (read_miss == 1'b0) begin
          next_control_state = IDLE;
        end
      end

      default: begin
      end
    endcase
  end

  assign ready_from_cache_walker = 1'b1;
  assign cache_walker_line_last  = (cache_walker_line == NUM_LINES-1) ? 1'b1 : 1'b0;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      control_state        <= WALK_CACHE;
      cache_walker_command <= `CACHE_CONTROL_INITIALIZE;
      cache_walking        <= 1'b1;
      cache_walker_line    <= {`log2(NUM_LINES){1'b0}};
    end else begin
      control_state <= next_control_state;

      if (done_from_cache_walker == 1'b1) begin
        cache_walking <= 1'b0;
      end

      if ((start_to_cache_walker == 1'b1) && (ready_from_cache_walker == 1'b1)) begin
        cache_walking        <= 1'b1;
        cache_walker_command <= to_cache_control_command;
      end

      if (cache_walker_line_increment == 1'b1) begin
        cache_walker_line <= cache_walker_line + 1'b1;
      end
    end
  end

  //----------------------------------------------------------------------------
  // Cache Filler FSM
  //----------------------------------------------------------------------------
  assign done_from_filler = filling & (fill_internal_offset_increment & fill_internal_offset_last);
  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      fill_reading <= 1'b0;
      filling      <= 1'b0;
    end else begin
      if ((fill_external_offset_increment == 1'b1) && (fill_external_offset_last == 1'b1)) begin
        fill_reading <= 1'b0;
      end
      if (done_from_filler == 1'b1) begin
        filling <= 1'b0;
      end

      if ((start_to_filler == 1'b1) && (ready_from_filler == 1'b1)) begin
        fill_reading <= 1'b1;
        filling      <= 1'b1;
      end
    end
  end

  assign fill_internal_offset_increment = c_oimm_readdatavalid;
  assign fill_external_offset_increment = (~c_oimm_waitrequest) & fill_reading;
  generate
    if (BEATS_PER_LINE == 1) begin : one_beat_per_line_gen
      assign fill_internal_offset_last = 1'b1;
      assign fill_internal_offset      = {`log2(LINE_SIZE){1'b0}};
    end
    if (BEATS_PER_LINE > 1) begin : multiple_beats_per_line_gen
      reg [`log2(LINE_SIZE)-1:0] fill_internal_offset_reg;

      assign fill_internal_offset = fill_internal_offset_reg;
      assign fill_internal_offset_last =
        (fill_internal_offset_reg[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)] ==
         BEATS_PER_LINE-1) ? 1'b1 : 1'b0;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          fill_internal_offset_reg <= {`log2(LINE_SIZE){1'b0}};
        end else begin
          if (fill_internal_offset_increment == 1'b1) begin
            fill_internal_offset_reg <= fill_internal_offset_reg + BYTES_PER_BEAT;
          end
        end
      end
    end
    if (BURSTS_PER_LINE == 1) begin : one_burst_per_line_gen
      assign fill_external_offset_last = 1'b1;
      assign fill_external_offset      = {`log2(LINE_SIZE){1'b0}};
    end
    if (BURSTS_PER_LINE > 1) begin : multiple_bursts_per_line_gen
      reg [`log2(LINE_SIZE)-1:0] fill_external_offset_reg;

      assign fill_external_offset = fill_external_offset_reg;
      assign fill_external_offset_last =
        (fill_external_offset_reg[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BURST)] ==
         BURSTS_PER_LINE-1) ? 1'b1 : 1'b0;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          fill_external_offset_reg <= {`log2(LINE_SIZE){1'b0}};
        end else begin
          if (fill_external_offset_increment == 1'b1) begin
            fill_external_offset_reg <= fill_external_offset_reg + BYTES_PER_BURST;
          end
        end
      end
    end
  endgenerate

  //Write if filling a cacheline (c_oimm_readdatavalid) or a write has caused a
  //tag check (write_on_hit) and that write has hit an existing cacheline
  //(read_readdatavalid)
  assign write_hit                = write_on_hit & read_readdatavalid;
  assign write_hit_dirty_valid[0] = 1'b1;
  assign write_requestvalid       = c_oimm_readdatavalid | write_hit;
  assign write_tag_update         = cache_mgt_tag_update | write_hit;
  assign write_dirty_valid        = (write_hit == 1'b1) ? write_hit_dirty_valid : cache_mgt_dirty_valid;

  //----------------------------------------------------------------------------
  // Cache Internals
  //----------------------------------------------------------------------------
  cache_core
    #(
      .NUM_LINES             (NUM_LINES),
      .LINE_SIZE             (LINE_SIZE),
      .ADDRESS_WIDTH         (ADDRESS_WIDTH),
      .WIDTH                 (EXTERNAL_WIDTH),
      .DIRTY_BITS            (DIRTY_BITS),
      .WRITE_FIRST_SUPPORTED (WRITE_FIRST_SUPPORTED)
      )
  the_cache (
      .clk   (clk),
      .reset (reset),

      .read_address         (read_address),
      .read_requestvalid    (read_requestvalid),
      .read_speculative     (read_speculative),
      .read_readdata        (read_readdata),
      .read_readdatavalid   (read_readdatavalid),
      .read_readabort       (read_readabort),
      .read_miss            (read_miss),
      .read_requestinflight (read_requestinflight),
      .read_lastaddress     (read_lastaddress),
      .read_tag             (read_tag),
      .read_dirty_valid     (read_dirty_valid),

      .write_address      (write_address),
      .write_byteenable   (write_byteenable),
      .write_requestvalid (write_requestvalid),
      .write_writedata    (write_writedata),
      .write_tag_update   (write_tag_update),
      .write_dirty_valid  (write_dirty_valid),

      .cache_tag_renable (cache_tag_renable),
      .cache_tag_raddr   (cache_tag_raddr),
      .cache_tag_rdata   (cache_tag_rdata),
      .cache_tag_waddr   (cache_tag_waddr),
      .cache_tag_wenable (cache_tag_wenable),
      .cache_tag_wdata   (cache_tag_wdata),

      .cache_data_renable (cache_data_renable),
      .cache_data_raddr   (cache_data_raddr),
      .cache_data_rdata   (cache_data_rdata),
      .cache_data_wenable (cache_data_wenable),
      .cache_data_waddr   (cache_data_waddr),
      .cache_data_wstrb   (cache_data_wstrb),
      .cache_data_wdata   (cache_data_wdata)
      );

  assign read_lastline = read_lastaddress[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)];

  assign cache_walker_read_tag_line = {read_tag, cache_walker_line};
  assign to_cache_control_base_partial =
    (to_cache_control_base[`log2(LINE_SIZE)-1:0] != {`log2(LINE_SIZE){1'b0}}) ? 1'b1 : 1'b0;
  assign read_region_base_hit = (cache_walker_read_tag_line == to_cache_control_base_tag_line) ? 1'b1 : 1'b0;
  assign read_region_inner_hit = ((cache_walker_read_tag_line > to_cache_control_base_tag_line) &&
                                  (cache_walker_read_tag_line < to_cache_control_last_tag_line)) ? 1'b1 : 1'b0;
  assign to_cache_control_last_partial =
    (to_cache_control_last[`log2(LINE_SIZE)-1:0] != {`log2(LINE_SIZE){1'b1}}) ? 1'b1 : 1'b0;
  assign read_region_last_hit = (cache_walker_read_tag_line == to_cache_control_last_tag_line) ? 1'b1 : 1'b0;

  //If REGION_OPTIMIZATIONS are off then everything hits and we treat all hits
  //as partial hits (i.e. requiring a writeback before invalidating).
  assign read_region_hit = (REGION_OPTIMIZATIONS != 0) ?
                           (read_region_base_hit | read_region_inner_hit | read_region_last_hit) : 1'b1;
  assign read_region_hit_partial = (REGION_OPTIMIZATIONS != 0) ?
                                   ((read_region_base_hit & to_cache_control_base_partial) |
                                    (read_region_last_hit & to_cache_control_last_partial)) : 1'b1;

  //----------------------------------------------------------------------------
  // Not Write-back
  //----------------------------------------------------------------------------
  generate
    if (POLICY != `CACHE_POLICY_WRITE_BACK) begin : not_writeback_gen
      assign spill_raddr   = {`log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8)){1'b0}};
      assign spill_waddr   = {`log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8)){1'b0}};
      assign spill_wenable = 1'b0;
      assign spill_wdata   = {EXTERNAL_WIDTH{1'b0}};
    end
  endgenerate

  //----------------------------------------------------------------------------
  // Read-only
  //----------------------------------------------------------------------------
  generate
    if (POLICY == `CACHE_POLICY_READ_ONLY) begin : read_only_gen
      //Cache walking 'FSM'; just invalidate every line (not entered on Writeback/Flush)
      assign cache_walker_tag_update     = cache_walking;
      assign cache_walker_dirty_valid    = {(DIRTY_BITS+1){1'b0}};  // tag_valid (bit0) = '0'
      assign cache_walker_line_increment = cache_walking;
      assign done_from_cache_walker      = cache_walker_line_last & cache_walking;

      assign write_idle       = 1'b1;
      assign write_ready      = 1'b1;
      assign write_on_hit     = 1'b0;
      assign write_writedata  = c_oimm_readdata;
      assign write_byteenable = {(EXTERNAL_WIDTH/8){1'b1}};
      assign c_oimm_byteenable = {(EXTERNAL_WIDTH/8){1'b1}};
      assign c_oimm_writedata  = {EXTERNAL_WIDTH{1'bx}};  // (others => '-')
      assign c_oimm_burstlength        = BEATS_PER_BURST[LOG2_BURSTLENGTH:0];
      assign c_oimm_burstlength_minus1 = (BEATS_PER_BURST-1);
      assign c_oimm_writelast    = 1'b1;
      assign ready_from_filler   = (~filling) | done_from_filler;
      assign c_oimm_requestvalid = fill_reading;
      assign c_oimm_readnotwrite = 1'b1;
      assign c_oimm_address[ADDRESS_WIDTH-1:`log2(LINE_SIZE)] =
        read_lastaddress[ADDRESS_WIDTH-1:`log2(LINE_SIZE)];
      if (BEATS_PER_LINE > 1) begin : multiple_beats_per_line_gen
        assign c_oimm_address[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)] =
          fill_external_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)];
      end
      assign read_address = (read_miss == 1'b0) ? cacheint_oimm_address : read_lastaddress;
      assign read_speculative = 1'b0;

      //On a cacheline fill use the last address (which caused the miss).
      assign write_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] =
        read_lastaddress[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)];
      assign write_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] =
        (cache_walking == 1'b1) ? cache_walker_line : read_lastline;
      assign write_address[`log2(LINE_SIZE)-1:0] =
        (read_miss == 1'b1) ? fill_internal_offset : read_lastaddress[`log2(LINE_SIZE)-1:0];
    end
  endgenerate

  //----------------------------------------------------------------------------
  // Not Read-only
  //----------------------------------------------------------------------------
  generate
    if (POLICY != `CACHE_POLICY_READ_ONLY) begin : not_read_only_gen
      reg  [(EXTERNAL_WIDTH/8)-1:0] write_hit_byteenable;
      reg  [INTERNAL_WIDTH-1:0]     last_writedata;
      wire                          done_to_write_on_hit;
      reg                           write_on_hit_reg;

      assign write_on_hit = write_on_hit_reg;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          write_on_hit_reg <= 1'b0;
          last_writedata   <= {INTERNAL_WIDTH{1'b0}};
        end else begin
          if (cacheint_oimm_waitrequest == 1'b0) begin
            last_writedata <= cacheint_oimm_writedata;
          end

          if (done_to_write_on_hit == 1'b1) begin
            write_on_hit_reg <= 1'b0;
          end

          if ((cacheint_oimm_requestvalid == 1'b1) &&
              (cacheint_oimm_readnotwrite == 1'b0) &&
              (cacheint_oimm_waitrequest == 1'b0)) begin
            write_on_hit_reg <= 1'b1;
          end
        end
      end

      if (INTERNAL_WORDS_PER_EXTERNAL_WORD == 1) begin : single_internal_word_gen
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            write_hit_byteenable <= {(EXTERNAL_WIDTH/8){1'b0}};
          end else begin
            if (cacheint_oimm_waitrequest == 1'b0) begin
              write_hit_byteenable <= cacheint_oimm_byteenable;
            end
          end
        end
      end
      if (INTERNAL_WORDS_PER_EXTERNAL_WORD > 1) begin : multiple_internal_words_gen
        integer iword;
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            write_hit_byteenable <= {(EXTERNAL_WIDTH/8){1'b0}};
          end else begin
            if (cacheint_oimm_waitrequest == 1'b0) begin
              write_hit_byteenable <= {(EXTERNAL_WIDTH/8){1'b0}};
              for (iword = 0; iword <= INTERNAL_WORDS_PER_EXTERNAL_WORD-1; iword = iword + 1) begin
                if (cacheint_oimm_address[`log2(BYTES_PER_BEAT)-1:`log2(INTERNAL_WIDTH/8)] == iword) begin
                  write_hit_byteenable[(iword*(INTERNAL_WIDTH/8)) +: (INTERNAL_WIDTH/8)] <=
                    cacheint_oimm_byteenable;
                end
              end
            end
          end
        end
      end
      assign write_writedata = (read_miss == 1'b1) ? c_oimm_readdata :
                               {INTERNAL_WORDS_PER_EXTERNAL_WORD{last_writedata}};
      assign write_byteenable = (read_miss == 1'b1) ? {(EXTERNAL_WIDTH/8){1'b1}} : write_hit_byteenable;

      //--------------------------------------------------------------------------
      // Write-through
      //--------------------------------------------------------------------------
      if (POLICY == `CACHE_POLICY_WRITE_THROUGH) begin : writethrough_gen
        reg  writing_through;
        wire start_to_write_through;
        wire ready_from_write_through;
        wire done_from_write_through;

        //Cache walking 'FSM'; just invalidate every line (not entered on Writeback/Flush)
        assign cache_walker_tag_update     = cache_walking;
        assign cache_walker_dirty_valid    = {(DIRTY_BITS+1){1'b0}};  // tag_valid (bit0) = '0'
        assign cache_walker_line_increment = cache_walking;
        assign done_from_cache_walker      = cache_walker_line_last & cache_walking;

        assign write_idle  = ~writing_through;
        assign write_ready = ready_from_write_through;

        //In write-through mode all writes are single cycle, all reads are BEATS_PER_BURST
        assign c_oimm_burstlength = (writing_through == 1'b1) ?
                                    {{LOG2_BURSTLENGTH{1'b0}}, 1'b1} :
                                    BEATS_PER_BURST[LOG2_BURSTLENGTH:0];
        assign c_oimm_burstlength_minus1 = (writing_through == 1'b1) ?
                                           {LOG2_BURSTLENGTH{1'b0}} :
                                           (BEATS_PER_BURST-1);
        assign c_oimm_writedata  = {INTERNAL_WORDS_PER_EXTERNAL_WORD{last_writedata}};
        assign c_oimm_byteenable = (writing_through == 1'b1) ? write_hit_byteenable :
                                   {(EXTERNAL_WIDTH/8){1'b1}};
        assign c_oimm_writelast = 1'b1;

        assign ready_from_filler = ((~filling) | done_from_filler) & ready_from_write_through;

        assign c_oimm_requestvalid = fill_reading | writing_through;
        assign c_oimm_readnotwrite = ~writing_through;
        assign c_oimm_address[ADDRESS_WIDTH-1:`log2(LINE_SIZE)] =
          read_lastaddress[ADDRESS_WIDTH-1:`log2(LINE_SIZE)];
        if (BEATS_PER_LINE > 1) begin : multiple_beats_per_line_gen
          assign c_oimm_address[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)] =
            (writing_through == 1'b1) ?
            read_lastaddress[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)] :
            fill_external_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)];
        end
        assign read_address = (read_miss == 1'b0) ? cacheint_oimm_address : read_lastaddress;
        assign read_speculative     = ~cacheint_oimm_readnotwrite;
        assign done_to_write_on_hit = read_readdatavalid | read_readabort;

        //On a cacheline fill use the last address (which caused the miss).  On a
        //write hit, use the last address (which caused the hit).
        assign write_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] =
          read_lastaddress[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)];
        assign write_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] =
          (cache_walking == 1'b1) ? cache_walker_line : read_lastline;
        assign write_address[`log2(LINE_SIZE)-1:0] =
          (read_miss == 1'b1) ? fill_internal_offset : read_lastaddress[`log2(LINE_SIZE)-1:0];

        assign done_from_write_through  = (~c_oimm_waitrequest);
        assign ready_from_write_through = (~writing_through) | done_from_write_through;
        assign start_to_write_through =
          cacheint_oimm_requestvalid & (~cacheint_oimm_readnotwrite) & (~cacheint_oimm_waitrequest);
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            writing_through <= 1'b0;
          end else begin
            if (done_from_write_through == 1'b1) begin
              writing_through <= 1'b0;
            end

            if ((start_to_write_through == 1'b1) && (ready_from_write_through == 1'b1)) begin
              writing_through <= 1'b1;
            end
          end
        end
      end

      //--------------------------------------------------------------------------
      // Write-back
      //--------------------------------------------------------------------------
      if (POLICY == `CACHE_POLICY_WRITE_BACK) begin : writeback_gen
        wire                          start_to_spiller;
        reg                           spilling;
        reg                           spill_reading_into_buffer;
        reg                           spill_reading_from_buffer;
        reg                           spill_writing_to_memory;
        reg                           spill_skipping;
        wire                          ready_from_spiller;
        wire                          done_from_spiller;

        wire [`log2(LINE_SIZE)-1:0]   spill_offset;
        wire [`log2(LINE_SIZE)-1:0]   next_spill_offset;
        wire                          spill_offset_increment;
        wire                          spill_offset_last;
        wire                          next_spill_offset_last;
        wire                          spill_burst_last;

        wire [EXTERNAL_WIDTH-1:0]     spill_buffer_read_data;
        reg                           spill_buffer_write_enable;
        wire [EXTERNAL_WIDTH-1:0]     spill_buffer_write_data;
        reg  [TAG_BITS-1:0]           spill_tag;
        reg  [DIRTY_BITS:0]           spill_dirty_valid;
        reg                           spill_region_hit;
        reg  [`log2(NUM_LINES)-1:0]   spill_line;

        // type cache_walker_state_type is (IDLE, START_SPILLER, WAIT_ON_SPILLER)
        localparam [1:0] CW_IDLE         = 2'd0;
        localparam [1:0] START_SPILLER   = 2'd1;
        localparam [1:0] WAIT_ON_SPILLER = 2'd2;
        reg [1:0] cache_walker_state;
        reg [1:0] next_cache_walker_state;
        reg       cache_walker_start_to_spiller;

        reg                 cache_walker_tag_update_reg;
        reg [DIRTY_BITS:0]  cache_walker_dirty_valid_reg;
        reg                 done_from_cache_walker_reg;
        reg                 cache_walker_line_increment_reg;

        assign cache_walker_tag_update     = cache_walker_tag_update_reg;
        assign cache_walker_dirty_valid    = cache_walker_dirty_valid_reg;
        assign done_from_cache_walker      = done_from_cache_walker_reg;
        assign cache_walker_line_increment = cache_walker_line_increment_reg;

        //Cache walking FSM.
        always @(*) begin
          next_cache_walker_state         = cache_walker_state;
          cache_walker_tag_update_reg     = 1'b0;
          cache_walker_dirty_valid_reg    = {(DIRTY_BITS+1){1'b0}};
          done_from_cache_walker_reg      = 1'b0;
          cache_walker_line_increment_reg = 1'b0;
          cache_walker_start_to_spiller   = 1'b0;

          case (cache_walker_state)
            CW_IDLE: begin
              if (cache_walking == 1'b1) begin
                case (cache_walker_command)
                  `CACHE_CONTROL_INITIALIZE: begin
                    //Write every line until done
                    cache_walker_tag_update_reg     = 1'b1;
                    cache_walker_dirty_valid_reg[0] = 1'b0;  // tag_valid
                    cache_walker_line_increment_reg = 1'b1;
                    if (cache_walker_line_last == 1'b1) begin
                      done_from_cache_walker_reg = 1'b1;
                    end
                  end
                  default: begin          //INVALIDATE/WRITEBACK/FLUSH
                    //Loading in line address to spill
                    next_cache_walker_state = START_SPILLER;
                  end
                endcase
              end
            end

            START_SPILLER: begin
              //Address loaded; wait for spiller to ack
              cache_walker_start_to_spiller = 1'b1;
              if (ready_from_spiller == 1'b1) begin
                next_cache_walker_state = WAIT_ON_SPILLER;
              end
            end

            WAIT_ON_SPILLER: begin
              //Spiller FSM in progress
              if (done_from_spiller == 1'b1) begin
                cache_walker_tag_update_reg = spill_region_hit;
                if (cache_walker_command == `CACHE_CONTROL_WRITEBACK) begin
                  //Set to clean, valid if previously valid
                  cache_walker_dirty_valid_reg[0] = spill_dirty_valid[0];
                end else begin
                  //FLUSH, set to invalid
                  cache_walker_dirty_valid_reg[0] = 1'b0;
                end
                cache_walker_line_increment_reg = 1'b1;
                next_cache_walker_state        = CW_IDLE;
                if (cache_walker_line_last == 1'b1) begin
                  done_from_cache_walker_reg = 1'b1;
                end
              end
            end

            default: begin
            end
          endcase
        end

        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            cache_walker_state <= CW_IDLE;
          end else begin
            cache_walker_state <= next_cache_walker_state;
          end
        end

        assign write_idle  = ~spilling;
        assign write_ready = ready_from_spiller;

        //In write-back mode writes and reads are all BEATS_PER_BURST
        assign c_oimm_burstlength        = BEATS_PER_BURST[LOG2_BURSTLENGTH:0];
        assign c_oimm_burstlength_minus1 = (BEATS_PER_BURST-1);
        assign c_oimm_writedata    = spill_buffer_read_data;
        assign c_oimm_byteenable   = {(EXTERNAL_WIDTH/8){1'b1}};
        assign c_oimm_writelast    = spill_burst_last;
        assign ready_from_filler   = ((~filling) | done_from_filler) & ready_from_spiller;
        assign c_oimm_requestvalid = fill_reading | spill_writing_to_memory;
        assign c_oimm_readnotwrite = fill_reading;
        assign c_oimm_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] =
          (fill_reading == 1'b1) ? read_lastaddress[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] :
          spill_tag;
        assign c_oimm_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] =
          (fill_reading == 1'b1) ? read_lastline : spill_line;
        if (BURSTS_PER_LINE > 1) begin : multiple_bursts_per_line_address_gen
          assign c_oimm_address[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BURST)] =
            (fill_reading == 1'b1) ?
            fill_external_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BURST)] :
            spill_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BURST)];
        end
        if (BEATS_PER_BURST > 1) begin : multiple_beats_per_burst_line_address_gen
          assign c_oimm_address[`log2(BYTES_PER_BURST)-1:`log2(BYTES_PER_BEAT)] =
            {(`log2(BYTES_PER_BURST)-`log2(BYTES_PER_BEAT)){1'b0}};
        end
        assign read_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] =
          (spill_reading_into_buffer == 1'b1) ? spill_tag :
          (read_miss == 1'b0) ? cacheint_oimm_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] :
          read_lastaddress[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)];
        assign read_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] =
          (spill_reading_into_buffer == 1'b1) ? spill_line :
          (cache_walking == 1'b1) ? cache_walker_line :
          (read_miss == 1'b0) ? cacheint_oimm_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] :
          read_lastline;
        assign read_address[`log2(LINE_SIZE)-1:0] =
          (spill_reading_into_buffer == 1'b1) ? spill_offset :
          (read_miss == 1'b0) ? cacheint_oimm_address[`log2(LINE_SIZE)-1:0] :
          read_lastaddress[`log2(LINE_SIZE)-1:0];

        assign read_speculative     = 1'b0;
        assign done_to_write_on_hit = read_readdatavalid;
        if (DIRTY_BITS > 0) begin : write_hit_dirty_gen
          assign write_hit_dirty_valid[DIRTY_BITS] = 1'b1;
        end

        //On a cacheline fill use the last address (which caused the miss).  On a
        //write hit, use the last address (which caused the hit).  When spilling
        //a line use the same tag so that the WRITEBACK command correctly sets
        //the line to clean after writing it out to memory.
        assign write_address[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)] =
          (cache_walking == 1'b1) ? spill_tag :
          read_lastaddress[ADDRESS_WIDTH-1:`log2(CACHE_SIZE)];
        assign write_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)] =
          (cache_walking == 1'b1) ? cache_walker_line : read_lastline;
        assign write_address[`log2(LINE_SIZE)-1:0] =
          (read_miss == 1'b1) ? fill_internal_offset : read_lastaddress[`log2(LINE_SIZE)-1:0];

        //------------------------------------------------------------------------
        // Cache Spiller FSM
        //------------------------------------------------------------------------
        assign start_to_spiller   = (start_to_filler & ready_from_filler) | cache_walker_start_to_spiller;
        assign ready_from_spiller = ((~spilling) | done_from_spiller);
        assign done_from_spiller  = (spill_writing_to_memory &
                                     (~c_oimm_waitrequest) &
                                     (~fill_reading) &
                                     spill_offset_last) |
                                    spill_skipping;
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            spilling                  <= 1'b0;
            spill_tag                 <= {TAG_BITS{1'b0}};
            spill_reading_into_buffer <= 1'b0;
            spill_reading_from_buffer <= 1'b0;
            spill_writing_to_memory   <= 1'b0;
            spill_skipping            <= 1'b0;
          end else begin
            if (done_from_spiller == 1'b1) begin
              spilling                <= 1'b0;
              spill_writing_to_memory <= 1'b0;
              spill_skipping          <= 1'b0;
            end

            if (spill_offset_increment == 1'b1) begin
              if (spill_offset_last == 1'b1) begin
                spill_reading_from_buffer <= spill_reading_into_buffer;
                spill_reading_into_buffer <= 1'b0;
              end
              if (next_spill_offset_last == 1'b1) begin
                if (spill_reading_into_buffer == 1'b0) begin
                  spill_reading_from_buffer <= 1'b0;
                end
              end
            end

            if (spill_reading_from_buffer == 1'b1) begin
              spill_writing_to_memory <= 1'b1;
            end

            //Set spilling to indicate the line needs to be spilled
            if ((start_to_spiller == 1'b1) && (ready_from_spiller == 1'b1)) begin
              spilling          <= 1'b1;
              spill_tag         <= read_tag;
              spill_line        <= read_address[`log2(CACHE_SIZE)-1:`log2(LINE_SIZE)];
              spill_dirty_valid <= read_dirty_valid;
              spill_region_hit  <= read_region_hit;

              //Spill for real only if valid, within the region, dirty, and not
              //invalidating (except partial cachelines, which must be flushed on
              //invalidate).
              if ((read_dirty_valid[0] == 1'b1) &&
                  (read_dirty_valid[DIRTY_BITS] == 1'b1) &&
                  ((cache_walking == 1'b0) ||
                   ((read_region_hit == 1'b1) &&
                    ((cache_walker_command != `CACHE_CONTROL_INVALIDATE) ||
                     (read_region_hit_partial == 1'b1))))) begin
                spill_reading_into_buffer <= 1'b1;
              end else begin
                spill_skipping <= 1'b1;
              end
            end
          end
        end

        assign spill_offset_increment = spill_reading_into_buffer |
                                        (spill_writing_to_memory & ((~c_oimm_waitrequest) & (~fill_reading)));
        if (BEATS_PER_LINE == 1) begin : one_beat_per_line_offset_gen
          assign next_spill_offset      = {`log2(LINE_SIZE){1'b0}};
          assign spill_offset           = {`log2(LINE_SIZE){1'b0}};
          assign next_spill_offset_last = 1'b1;
          assign spill_offset_last      = 1'b1;
        end
        if (BEATS_PER_LINE > 1) begin : multiple_beats_per_line_offset_gen
          reg [`log2(LINE_SIZE)-1:0] spill_offset_reg;
          reg                        spill_offset_last_reg;

          assign spill_offset      = spill_offset_reg;
          assign spill_offset_last = spill_offset_last_reg;

          assign next_spill_offset = (spill_offset_increment == 1'b1) ?
                                     (spill_offset_reg + BYTES_PER_BEAT) : spill_offset_reg;
          assign next_spill_offset_last =
            (next_spill_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)] ==
             BEATS_PER_LINE-1) ? 1'b1 : 1'b0;

          always @(posedge clk or posedge reset) begin
            if (reset == 1'b1) begin
              spill_offset_reg      <= {`log2(LINE_SIZE){1'b0}};
              spill_offset_last_reg <= 1'b0;
            end else begin
              spill_offset_reg      <= next_spill_offset;
              spill_offset_last_reg <= next_spill_offset_last;
            end
          end
        end
        if (BEATS_PER_BURST == 1) begin : one_beat_per_burst_gen
          assign spill_burst_last = 1'b1;
        end
        if (BEATS_PER_BURST > 1) begin : multiple_beats_per_burst_gen
          assign spill_burst_last =
            (spill_offset[`log2(BYTES_PER_BURST)-1:`log2(BYTES_PER_BEAT)] ==
             BEATS_PER_BURST-1) ? 1'b1 : 1'b0;
        end

        //------------------------------------------------------------------------
        // Spill Buffer
        //------------------------------------------------------------------------
        always @(posedge clk or posedge reset) begin
          if (reset == 1'b1) begin
            spill_buffer_write_enable <= 1'b0;
          end else begin
            //Readdata comes back one cycle after fill address changes
            spill_buffer_write_enable <= spill_offset_increment & spill_reading_into_buffer;
          end
        end
        assign spill_buffer_write_data = read_readdata;
        if (BEATS_PER_LINE == 1) begin : one_beat_per_line_buffer_gen
          reg [EXTERNAL_WIDTH-1:0] spill_buffer_read_data_reg;

          assign spill_buffer_read_data = spill_buffer_read_data_reg;

          always @(posedge clk or posedge reset) begin
            if (reset == 1'b1) begin
              spill_buffer_read_data_reg <= {EXTERNAL_WIDTH{1'b0}};
            end else begin
              if (spill_buffer_write_enable == 1'b1) begin
                spill_buffer_read_data_reg <= spill_buffer_write_data;
              end
            end
          end
        end
        if (BEATS_PER_LINE > 1) begin : multiple_beats_per_line_buffer_gen
          wire [`log2(BEATS_PER_LINE)-1:0] spill_buffer_read_address;
          reg  [`log2(BEATS_PER_LINE)-1:0] spill_buffer_write_address;

          always @(posedge clk or posedge reset) begin
            if (reset == 1'b1) begin
              spill_buffer_write_address <= {`log2(BEATS_PER_LINE){1'b0}};
            end else begin
              //Readdata comes back one cycle after fill address changes
              spill_buffer_write_address <= spill_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)];
            end
          end
          assign spill_buffer_read_address = next_spill_offset[`log2(LINE_SIZE)-1:`log2(BYTES_PER_BEAT)];

          assign spill_raddr            = spill_buffer_read_address;
          assign spill_buffer_read_data = spill_rdata;
          assign spill_waddr            = spill_buffer_write_address;
          assign spill_wenable          = spill_buffer_write_enable;
          assign spill_wdata            = spill_buffer_write_data;
        end
      end
    end
  endgenerate

  //----------------------------------------------------------------------------
  // Assertions (VHDL assert statements omitted):
  //  - CACHE_SIZE must be an even multiple of LINE_SIZE
  //  - CACHE_SIZE must be a power of 2
  //  - EXTERNAL_WIDTH must be >= INTERNAL_WIDTH
  //----------------------------------------------------------------------------

endmodule
