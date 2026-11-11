module xif_mem_arbiter
  #(
    parameter REGISTER_SIZE = 32,
    parameter XIF_ID_W      = 3
    )
  (
   input  wire                         clk,
   input  wire                         reset,

   input  wire [REGISTER_SIZE-1:0]     s_address,
   input  wire [(REGISTER_SIZE/8)-1:0] s_byteenable,
   input  wire                         s_requestvalid,
   input  wire                         s_readnotwrite,
   input  wire [REGISTER_SIZE-1:0]     s_writedata,
   output wire [REGISTER_SIZE-1:0]     s_readdata,
   output wire                         s_readdatavalid,
   output wire                         s_waitrequest,

   input  wire                         v_valid,
   output wire                         v_ready,
   input  wire [XIF_ID_W-1:0]          v_id,
   input  wire [REGISTER_SIZE-1:0]     v_addr,
   input  wire                         v_we,
   input  wire [(REGISTER_SIZE/8)-1:0] v_be,
   input  wire [REGISTER_SIZE-1:0]     v_wdata,
   output wire                         v_result_valid,
   output wire [XIF_ID_W-1:0]          v_result_id,
   output wire [REGISTER_SIZE-1:0]     v_result_rdata,
   input  wire                         v_pending_load,
   input  wire                         v_pending_store,

   output wire [REGISTER_SIZE-1:0]     m_address,
   output wire [(REGISTER_SIZE/8)-1:0] m_byteenable,
   output wire                         m_requestvalid,
   output wire                         m_readnotwrite,
   output wire [REGISTER_SIZE-1:0]     m_writedata,
   input  wire [REGISTER_SIZE-1:0]     m_readdata,
   input  wire                         m_readdatavalid,
   input  wire                         m_waitrequest,

   output wire                         idle
   );

  reg                 read_pending;
  reg                 read_owner_v;
  reg [XIF_ID_W-1:0]  read_id;
  reg                 store_result_valid;
  reg [XIF_ID_W-1:0]  store_result_id;

  wire                v_req;
  wire                s_hold;
  wire                s_req;
  wire                accept;

  assign v_req  = v_valid & (~read_pending);
  assign s_hold = v_valid | v_pending_store | (v_pending_load & (~s_readnotwrite)) | read_pending;
  assign s_req  = s_requestvalid & (~s_hold);

  assign m_requestvalid = v_req | s_req;
  assign m_address      = v_req ? v_addr : s_address;
  assign m_byteenable   = v_req ? v_be : s_byteenable;
  assign m_readnotwrite = v_req ? (~v_we) : s_readnotwrite;
  assign m_writedata    = v_req ? v_wdata : s_writedata;

  assign accept = m_requestvalid & (~m_waitrequest);

  assign v_ready       = v_req & (~m_waitrequest);
  assign s_waitrequest = ~(s_req & (~v_req) & (~m_waitrequest));

  assign s_readdata      = m_readdata;
  assign s_readdatavalid = m_readdatavalid & read_pending & (~read_owner_v);

  assign v_result_valid = (m_readdatavalid & read_pending & read_owner_v) | store_result_valid;
  assign v_result_id    = store_result_valid ? store_result_id : read_id;
  assign v_result_rdata = m_readdata;

  assign idle = (~read_pending) & (~store_result_valid) & (~v_pending_load) & (~v_pending_store);

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      read_pending       <= 1'b0;
      read_owner_v       <= 1'b0;
      read_id            <= {XIF_ID_W{1'b0}};
      store_result_valid <= 1'b0;
      store_result_id    <= {XIF_ID_W{1'b0}};
    end else begin
      if (m_readdatavalid == 1'b1) begin
        read_pending <= 1'b0;
      end
      if ((accept & m_readnotwrite) == 1'b1) begin
        read_pending <= 1'b1;
        read_owner_v <= v_req;
        read_id      <= v_id;
      end
      store_result_valid <= v_ready & v_we;
      if ((v_ready & v_we) == 1'b1) begin
        store_result_id <= v_id;
      end
    end
  end

endmodule
