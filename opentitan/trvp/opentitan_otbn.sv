module OPENTITAN_OTBN
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
parameter EDN_RND_STUB_SEED = 32'h 9E3779B9;
parameter EDN_URND_STUB_SEED = 32'h 7F4A7C15;
parameter OTP_STUB_KEY = 128'h 0123456789ABCDEF_FEDCBA9876543210;
parameter OTP_STUB_NONCE = 64'h 0F1E2D3C4B5A6978;

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

prim_alert_pkg::alert_rx_t [otbn_reg_pkg::NumAlerts-1:0] alert_rx;
prim_alert_pkg::alert_tx_t [otbn_reg_pkg::NumAlerts-1:0] alert_tx;

edn_pkg::edn_req_t edn_rnd_req;
edn_pkg::edn_rsp_t edn_rnd_rsp;
edn_pkg::edn_req_t edn_urnd_req;
edn_pkg::edn_rsp_t edn_urnd_rsp;
reg edn_rnd_ack;
reg [32-1:0] edn_rnd_bus;
reg edn_urnd_ack;
reg [32-1:0] edn_urnd_bus;

otp_ctrl_pkg::otbn_otp_key_req_t otp_key_req;
otp_ctrl_pkg::otbn_otp_key_rsp_t otp_key_rsp;
reg otp_key_ack;

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

assign alert_rx = {otbn_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

function automatic [32-1:0] xorshift32;
	input [32-1:0] value;
	reg [32-1:0] temp;
	begin
		temp = value ^ (value << 13);
		temp = temp ^ (temp >> 17);
		xorshift32 = temp ^ (temp << 5);
	end
endfunction

assign edn_rnd_rsp.edn_ack = edn_rnd_ack;
assign edn_rnd_rsp.edn_fips = 1'b 0;
assign edn_rnd_rsp.edn_bus = edn_rnd_bus;

assign edn_urnd_rsp.edn_ack = edn_urnd_ack;
assign edn_urnd_rsp.edn_fips = 1'b 0;
assign edn_urnd_rsp.edn_bus = edn_urnd_bus;

assign otp_key_rsp.ack = otp_key_ack;
assign otp_key_rsp.key = OTP_STUB_KEY;
assign otp_key_rsp.nonce = OTP_STUB_NONCE;
assign otp_key_rsp.seed_valid = 1'b 1;

always@(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		edn_rnd_ack <= 0;
		edn_rnd_bus <= EDN_RND_STUB_SEED;
		edn_urnd_ack <= 0;
		edn_urnd_bus <= EDN_URND_STUB_SEED;
		otp_key_ack <= 0;
	end
	else
	begin
		edn_rnd_ack <= edn_rnd_req.edn_req & (~edn_rnd_ack);
		if(edn_rnd_ack)
			edn_rnd_bus <= xorshift32(edn_rnd_bus);
		edn_urnd_ack <= edn_urnd_req.edn_req & (~edn_urnd_ack);
		if(edn_urnd_ack)
			edn_urnd_bus <= xorshift32(edn_urnd_bus);
		otp_key_ack <= otp_key_req.req & (~otp_key_ack);
	end
end

`ifdef SIM_ENV
initial
begin
	$assertoff(0, i_otbn);
	wait(rstnn===1'b 0);
	$asserton(0, i_otbn);
end
`endif

otbn i_otbn
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.tl_i(tl_h2d),
	.tl_o(tl_d2h),
	.idle_o(),
	.intr_done_o(),
	.alert_rx_i(alert_rx),
	.alert_tx_o(alert_tx),
	.lc_escalate_en_i(lc_ctrl_pkg::Off),
	.lc_rma_req_i(lc_ctrl_pkg::Off),
	.lc_rma_ack_o(),
	.ram_cfg_i(prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT),
	.clk_edn_i(clk),
	.rst_edn_ni(rstnn),
	.edn_rnd_o(edn_rnd_req),
	.edn_rnd_i(edn_rnd_rsp),
	.edn_urnd_o(edn_urnd_req),
	.edn_urnd_i(edn_urnd_rsp),
	.clk_otp_i(clk),
	.rst_otp_ni(rstnn),
	.otbn_otp_key_o(otp_key_req),
	.otbn_otp_key_i(otp_key_rsp),
	.keymgr_key_i(keymgr_pkg::OTBN_KEY_REQ_DEFAULT)
);

endmodule
