module OPENTITAN_CSRNG
(
	clk,
	rstnn,

	rtlavalid,
	rtlaready,
	rtlaopcode,
	rtlaparam,
	rtlasize,
	rtlasource,
	rtlaaddress,
	rtlamask,
	rtladata,
	rtlauser,

	rtldvalid,
	rtldready,
	rtldopcode,
	rtldparam,
	rtldsize,
	rtldsource,
	rtldsink,
	rtlddata,
	rtlderror,
	rtlduser
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;

localparam NUM_HW_APPS = 2;
localparam NUM_BYTE = BW_DATA/8;
localparam BW_TLOT_A_USER = 23;
localparam BW_TLOT_D_USER = 14;

input wire clk;
input wire rstnn;

input wire rtlavalid;
output wire rtlaready;
input wire [3-1:0] rtlaopcode;
input wire [3-1:0] rtlaparam;
input wire [BW_TLUL_SIZE-1:0] rtlasize;
input wire [BW_TLUL_SOURCE-1:0] rtlasource;
input wire [BW_ADDR-1:0] rtlaaddress;
input wire [NUM_BYTE-1:0] rtlamask;
input wire [BW_DATA-1:0] rtladata;
input wire [BW_TLOT_A_USER-1:0] rtlauser;

output wire rtldvalid;
input wire rtldready;
output wire [3-1:0] rtldopcode;
output wire [3-1:0] rtldparam;
output wire [BW_TLUL_SIZE-1:0] rtldsize;
output wire [BW_TLUL_SOURCE-1:0] rtldsource;
output wire [BW_TLUL_SINK-1:0] rtldsink;
output wire [BW_DATA-1:0] rtlddata;
output wire rtlderror;
output wire [BW_TLOT_D_USER-1:0] rtlduser;

/////////////
/* signals */
/////////////

tlul_pkg::tl_h2d_t tl_h2d;
tlul_pkg::tl_d2h_t tl_d2h;

prim_alert_pkg::alert_rx_t [csrng_reg_pkg::NumAlerts-1:0] alert_rx;
prim_alert_pkg::alert_tx_t [csrng_reg_pkg::NumAlerts-1:0] alert_tx;

csrng_pkg::csrng_req_t [NUM_HW_APPS-1:0] csrng_cmd_req;
csrng_pkg::csrng_rsp_t [NUM_HW_APPS-1:0] csrng_cmd_rsp;

////////////
/* logics */
////////////

assign tl_h2d.a_valid = rtlavalid;
assign tl_h2d.a_opcode = tlul_pkg::tl_a_op_e'(rtlaopcode);
assign tl_h2d.a_param = rtlaparam;
assign tl_h2d.a_size = rtlasize;
assign tl_h2d.a_source = rtlasource;
assign tl_h2d.a_address = rtlaaddress;
assign tl_h2d.a_mask = rtlamask;
assign tl_h2d.a_data = rtladata;
assign tl_h2d.a_user = rtlauser;
assign tl_h2d.d_ready = rtldready;

assign rtlaready = tl_d2h.a_ready;
assign rtldvalid = tl_d2h.d_valid;
assign rtldopcode = tl_d2h.d_opcode;
assign rtldparam = tl_d2h.d_param;
assign rtldsize = tl_d2h.d_size;
assign rtldsource = tl_d2h.d_source;
assign rtldsink = tl_d2h.d_sink;
assign rtlddata = tl_d2h.d_data;
assign rtlderror = tl_d2h.d_error;
assign rtlduser = tl_d2h.d_user;

assign alert_rx = {csrng_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
assign csrng_cmd_req = {NUM_HW_APPS{csrng_pkg::CSRNG_REQ_DEFAULT}};

`ifdef SIM_ENV
initial
begin
	$assertoff(0, i_csrng);
	wait(rstnn===1'b 0);
	$asserton(0, i_csrng);
end
`endif

csrng
#(
	.NHwApps(NUM_HW_APPS)
)
i_csrng
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.tl_i(tl_h2d),
	.tl_o(tl_d2h),
	.otp_en_csrng_sw_app_read_i(prim_mubi_pkg::MuBi8True),
	.lc_hw_debug_en_i(lc_ctrl_pkg::Off),
	.entropy_src_hw_if_o(),
	.entropy_src_hw_if_i(entropy_src_pkg::ENTROPY_SRC_HW_IF_RSP_DEFAULT),
	.cs_aes_halt_i(entropy_src_pkg::CS_AES_HALT_REQ_DEFAULT),
	.cs_aes_halt_o(),
	.csrng_cmd_i(csrng_cmd_req),
	.csrng_cmd_o(csrng_cmd_rsp),
	.alert_rx_i(alert_rx),
	.alert_tx_o(alert_tx),
	.intr_cs_cmd_req_done_o(),
	.intr_cs_entropy_req_o(),
	.intr_cs_hw_inst_exc_o(),
	.intr_cs_fatal_err_o()
);

endmodule
