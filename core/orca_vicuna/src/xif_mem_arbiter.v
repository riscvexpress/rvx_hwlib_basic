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

  reg                         read_pending;
  reg                         read_owner_v;
  reg [XIF_ID_W-1:0]          read_id;
  reg                         store_result_valid;
  reg [XIF_ID_W-1:0]          store_result_id;
  reg                         vbuf_valid;
  reg [XIF_ID_W-1:0]          vbuf_id;
  reg [REGISTER_SIZE-1:0]     vbuf_addr;
  reg                         vbuf_we;
  reg [(REGISTER_SIZE/8)-1:0] vbuf_be;
  reg [REGISTER_SIZE-1:0]     vbuf_wdata;
  reg                         pending_load_q;
  reg                         pending_store_q;

  wire                        v_req;
  wire                        s_hold;
  wire                        s_req;
  wire                        accept;
  wire                        v_sent;

  assign v_ready = ~vbuf_valid;

  assign v_req  = vbuf_valid & (~read_pending);
  assign s_hold = vbuf_valid | pending_store_q | (pending_load_q & (~s_readnotwrite)) | read_pending;
  assign s_req  = s_requestvalid & (~s_hold);

  assign m_requestvalid = v_req | s_req;
  assign m_address      = v_req ? vbuf_addr : s_address;
  assign m_byteenable   = v_req ? vbuf_be : s_byteenable;
  assign m_readnotwrite = v_req ? (~vbuf_we) : s_readnotwrite;
  assign m_writedata    = v_req ? vbuf_wdata : s_writedata;

  assign accept = m_requestvalid & (~m_waitrequest);
  assign v_sent = v_req & (~m_waitrequest);

  assign s_waitrequest = ~(s_req & (~v_req) & (~m_waitrequest));

  assign s_readdata      = m_readdata;
  assign s_readdatavalid = m_readdatavalid & read_pending & (~read_owner_v);

  assign v_result_valid = (m_readdatavalid & read_pending & read_owner_v) | store_result_valid;
  assign v_result_id    = store_result_valid ? store_result_id : read_id;
  assign v_result_rdata = m_readdata;

  assign idle = (~read_pending) & (~store_result_valid) & (~vbuf_valid) & (~pending_load_q) & (~pending_store_q);

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      read_pending       <= 1'b0;
      read_owner_v       <= 1'b0;
      read_id            <= {XIF_ID_W{1'b0}};
      store_result_valid <= 1'b0;
      store_result_id    <= {XIF_ID_W{1'b0}};
      vbuf_valid         <= 1'b0;
      pending_load_q     <= 1'b0;
      pending_store_q    <= 1'b0;
    end else begin
      pending_load_q  <= v_pending_load;
      pending_store_q <= v_pending_store;

      if ((v_valid & v_ready) == 1'b1) begin
        vbuf_valid <= 1'b1;
      end else if (v_sent == 1'b1) begin
        vbuf_valid <= 1'b0;
      end

      if (m_readdatavalid == 1'b1) begin
        read_pending <= 1'b0;
      end
      if ((accept & m_readnotwrite) == 1'b1) begin
        read_pending <= 1'b1;
        read_owner_v <= v_req;
        read_id      <= vbuf_id;
      end
      store_result_valid <= v_sent & vbuf_we;
      if ((v_sent & vbuf_we) == 1'b1) begin
        store_result_id <= vbuf_id;
      end
    end
  end

  always @(posedge clk) begin
    if ((v_valid & v_ready) == 1'b1) begin
      vbuf_id    <= v_id;
      vbuf_addr  <= v_addr;
      vbuf_we    <= v_we;
      vbuf_be    <= v_be;
      vbuf_wdata <= v_wdata;
    end
  end

endmodule
