module rvc_cva6_core
#(
  parameter logic [31:0] CACHEABLE_START = 32'h 00000000,
  parameter logic [31:0] CACHEABLE_LAST = 32'h bfffffff
)
(
  input  logic clk_i,
  input  logic rst_ni,
  input  logic [31:0] boot_addr_i,
  input  logic irq_external_i,
  input  logic irq_timer_i,
  input  logic irq_software_i,

  output logic [3:0] awid_o,
  output logic [31:0] awaddr_o,
  output logic [7:0] awlen_o,
  output logic [2:0] awsize_o,
  output logic [1:0] awburst_o,
  output logic awvalid_o,
  input  logic awready_i,

  output logic [63:0] wdata_o,
  output logic [7:0] wstrb_o,
  output logic wlast_o,
  output logic wvalid_o,
  input  logic wready_i,

  input  logic [3:0] bid_i,
  input  logic [1:0] bresp_i,
  input  logic bvalid_i,
  output logic bready_o,

  output logic [3:0] arid_o,
  output logic [31:0] araddr_o,
  output logic [7:0] arlen_o,
  output logic [2:0] arsize_o,
  output logic [1:0] arburst_o,
  output logic arvalid_o,
  input  logic arready_i,

  input  logic [3:0] rid_i,
  input  logic [63:0] rdata_i,
  input  logic [1:0] rresp_i,
  input  logic rlast_i,
  input  logic rvalid_i,
  output logic rready_o,

  output logic commit_valid_o,
  output logic [31:0] commit_pc_o
);

  function automatic config_pkg::cva6_user_cfg_t rvx_user_cfg();
    config_pkg::cva6_user_cfg_t cfg;
    int unsigned num_rule;
    cfg = cva6_config_pkg::cva6_cfg;
    cfg.NrCachedRegionRules = 1;
    cfg.CachedRegionAddrBase = '0;
    cfg.CachedRegionLength = '0;
    cfg.CachedRegionAddrBase[0] = 64'(CACHEABLE_START);
    cfg.CachedRegionLength[0] = 64'(CACHEABLE_LAST) - 64'(CACHEABLE_START) + 64'd1;
    num_rule = 0;
    cfg.NonIdempotentAddrBase = '0;
    cfg.NonIdempotentLength = '0;
    if (CACHEABLE_START != 32'h0) begin
      cfg.NonIdempotentAddrBase[num_rule] = 64'h0;
      cfg.NonIdempotentLength[num_rule] = 64'(CACHEABLE_START);
      num_rule++;
    end
    if (CACHEABLE_LAST != 32'hffffffff) begin
      cfg.NonIdempotentAddrBase[num_rule] = 64'(CACHEABLE_LAST) + 64'd1;
      cfg.NonIdempotentLength[num_rule] = 64'h1_0000_0000 - 64'(CACHEABLE_LAST) - 64'd1;
      num_rule++;
    end
    cfg.NrNonIdempotentRules = num_rule;
    return cfg;
  endfunction

  localparam config_pkg::cva6_cfg_t CVA6Cfg = build_config_pkg::build_config(rvx_user_cfg());

  localparam type axi_ar_chan_t = struct packed {
    logic [CVA6Cfg.AxiIdWidth-1:0]   id;
    logic [CVA6Cfg.AxiAddrWidth-1:0] addr;
    axi_pkg::len_t                   len;
    axi_pkg::size_t                  size;
    axi_pkg::burst_t                 burst;
    logic                            lock;
    axi_pkg::cache_t                 cache;
    axi_pkg::prot_t                  prot;
    axi_pkg::qos_t                   qos;
    axi_pkg::region_t                region;
    logic [CVA6Cfg.AxiUserWidth-1:0] user;
  };
  localparam type axi_aw_chan_t = struct packed {
    logic [CVA6Cfg.AxiIdWidth-1:0]   id;
    logic [CVA6Cfg.AxiAddrWidth-1:0] addr;
    axi_pkg::len_t                   len;
    axi_pkg::size_t                  size;
    axi_pkg::burst_t                 burst;
    logic                            lock;
    axi_pkg::cache_t                 cache;
    axi_pkg::prot_t                  prot;
    axi_pkg::qos_t                   qos;
    axi_pkg::region_t                region;
    axi_pkg::atop_t                  atop;
    logic [CVA6Cfg.AxiUserWidth-1:0] user;
  };
  localparam type axi_w_chan_t = struct packed {
    logic [CVA6Cfg.AxiDataWidth-1:0]     data;
    logic [(CVA6Cfg.AxiDataWidth/8)-1:0] strb;
    logic                                last;
    logic [CVA6Cfg.AxiUserWidth-1:0]     user;
  };
  localparam type b_chan_t = struct packed {
    logic [CVA6Cfg.AxiIdWidth-1:0]   id;
    axi_pkg::resp_t                  resp;
    logic [CVA6Cfg.AxiUserWidth-1:0] user;
  };
  localparam type r_chan_t = struct packed {
    logic [CVA6Cfg.AxiIdWidth-1:0]   id;
    logic [CVA6Cfg.AxiDataWidth-1:0] data;
    axi_pkg::resp_t                  resp;
    logic                            last;
    logic [CVA6Cfg.AxiUserWidth-1:0] user;
  };
  localparam type noc_req_t = struct packed {
    axi_aw_chan_t aw;
    logic         aw_valid;
    axi_w_chan_t  w;
    logic         w_valid;
    logic         b_ready;
    axi_ar_chan_t ar;
    logic         ar_valid;
    logic         r_ready;
  };
  localparam type noc_resp_t = struct packed {
    logic    aw_ready;
    logic    ar_ready;
    logic    w_ready;
    logic    b_valid;
    b_chan_t b;
    logic    r_valid;
    r_chan_t r;
  };

  noc_req_t  noc_req;
  noc_resp_t noc_resp;

  cva6 #(
    .CVA6Cfg(CVA6Cfg),
    .axi_ar_chan_t(axi_ar_chan_t),
    .axi_aw_chan_t(axi_aw_chan_t),
    .axi_w_chan_t(axi_w_chan_t),
    .b_chan_t(b_chan_t),
    .r_chan_t(r_chan_t),
    .noc_req_t(noc_req_t),
    .noc_resp_t(noc_resp_t)
  ) i_cva6 (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .boot_addr_i(boot_addr_i),
    .hart_id_i('0),
    .irq_i({1'b0, irq_external_i}),
    .ipi_i(irq_software_i),
    .time_irq_i(irq_timer_i),
    .debug_req_i(1'b0),
    .rvfi_probes_o(),
    .cvxif_req_o(),
    .cvxif_resp_i('0),
    .noc_req_o(noc_req),
    .noc_resp_i(noc_resp)
  );

  assign awid_o = noc_req.aw.id;
  assign awaddr_o = noc_req.aw.addr[31:0];
  assign awlen_o = noc_req.aw.len;
  assign awsize_o = noc_req.aw.size;
  assign awburst_o = noc_req.aw.burst;
  assign awvalid_o = noc_req.aw_valid;

  assign wdata_o = noc_req.w.data;
  assign wstrb_o = noc_req.w.strb;
  assign wlast_o = noc_req.w.last;
  assign wvalid_o = noc_req.w_valid;

  assign bready_o = noc_req.b_ready;

  assign arid_o = noc_req.ar.id;
  assign araddr_o = noc_req.ar.addr[31:0];
  assign arlen_o = noc_req.ar.len;
  assign arsize_o = noc_req.ar.size;
  assign arburst_o = noc_req.ar.burst;
  assign arvalid_o = noc_req.ar_valid;

  assign rready_o = noc_req.r_ready;

  always_comb begin
    noc_resp = '0;
    noc_resp.aw_ready = awready_i;
    noc_resp.w_ready = wready_i;
    noc_resp.b_valid = bvalid_i;
    noc_resp.b.id = bid_i;
    noc_resp.b.resp = bresp_i;
    noc_resp.ar_ready = arready_i;
    noc_resp.r_valid = rvalid_i;
    noc_resp.r.id = rid_i;
    noc_resp.r.data = rdata_i;
    noc_resp.r.resp = rresp_i;
    noc_resp.r.last = rlast_i;
  end

  assign commit_valid_o = i_cva6.commit_ack[0];
  assign commit_pc_o = i_cva6.commit_instr_id_commit[0].pc;

endmodule
