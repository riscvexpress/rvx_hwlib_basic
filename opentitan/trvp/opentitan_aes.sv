module OPENTITAN_AES
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
parameter AES192_ENABLE = 1;
parameter SEC_MASKING = 1;
parameter EDN_STUB_SEED = 32'h 9E3779B9;

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

prim_alert_pkg::alert_rx_t [aes_reg_pkg::NumAlerts-1:0] alert_rx;
prim_alert_pkg::alert_tx_t [aes_reg_pkg::NumAlerts-1:0] alert_tx;

edn_pkg::edn_req_t edn_req;
edn_pkg::edn_rsp_t edn_rsp;
reg edn_ack;
reg [32-1:0] edn_bus;
wire [32-1:0] edn_bus_x0;
wire [32-1:0] edn_bus_x1;
wire [32-1:0] edn_bus_next;

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

assign alert_rx = {aes_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

assign edn_rsp.edn_ack = edn_ack;
assign edn_rsp.edn_fips = 1'b 0;
assign edn_rsp.edn_bus = edn_bus;

assign edn_bus_x0 = edn_bus ^ (edn_bus << 13);
assign edn_bus_x1 = edn_bus_x0 ^ (edn_bus_x0 >> 17);
assign edn_bus_next = edn_bus_x1 ^ (edn_bus_x1 << 5);

always@(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		edn_ack <= 0;
		edn_bus <= EDN_STUB_SEED;
	end
	else
	begin
		edn_ack <= edn_req.edn_req & (~edn_ack);
		if(edn_ack)
			edn_bus <= edn_bus_next;
	end
end

`ifdef SIM_ENV
initial
begin
	$assertoff(0, i_aes);
	wait(rstnn===1'b 0);
	$asserton(0, i_aes);
end
`endif

aes
#(
	.AES192Enable(AES192_ENABLE),
	.SecMasking(SEC_MASKING),
	.SecSBoxImpl(SEC_MASKING ? aes_pkg::SBoxImplDom : aes_pkg::SBoxImplCanright)
)
i_aes
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.rst_shadowed_ni(rstnn),
	.idle_o(),
	.lc_escalate_en_i(lc_ctrl_pkg::Off),
	.clk_edn_i(clk),
	.rst_edn_ni(rstnn),
	.edn_o(edn_req),
	.edn_i(edn_rsp),
	.keymgr_key_i(keymgr_pkg::HW_KEY_REQ_DEFAULT),
	.tl_i(tl_h2d),
	.tl_o(tl_d2h),
	.alert_rx_i(alert_rx),
	.alert_tx_o(alert_tx)
);

endmodule
