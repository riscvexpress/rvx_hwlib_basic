module TRVP_SPI_HOST
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
	rtlduser,

	intr_error,
	intr_spi_event,

	qspi_host_sclk,
	qspi_host_scs_list,
	qspi_host_sdq_od,
	qspi_host_sdq_oval,
	qspi_host_sdq_ival
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;
parameter NUM_DEVICE = 1;

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

output wire intr_error;
output wire intr_spi_event;

output wire qspi_host_sclk;
output wire [NUM_DEVICE-1:0] qspi_host_scs_list;
output wire [4-1:0] qspi_host_sdq_od;
output wire [4-1:0] qspi_host_sdq_oval;
input wire [4-1:0] qspi_host_sdq_ival;

/////////////
/* signals */
/////////////

tlul_pkg::tl_h2d_t tl_h2d;
tlul_pkg::tl_d2h_t tl_d2h;

prim_alert_pkg::alert_rx_t [spi_host_reg_pkg::NumAlerts-1:0] alert_rx;
prim_alert_pkg::alert_tx_t [spi_host_reg_pkg::NumAlerts-1:0] alert_tx;

spi_device_pkg::passthrough_req_t passthrough_req;
spi_device_pkg::passthrough_rsp_t passthrough_rsp;

wire [4-1:0] sd_en;

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

assign alert_rx = {spi_host_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
assign passthrough_req = spi_device_pkg::PASSTHROUGH_REQ_DEFAULT;
assign qspi_host_sdq_od = ~sd_en;

`ifdef SIM_ENV
initial
begin
	$assertoff(0, i_spi_host);
	wait(rstnn===1'b 0);
	wait(rstnn===1'b 1);
	$asserton(0, i_spi_host);
end
`endif

spi_host
#(
	.NumDevice(NUM_DEVICE)
)
i_spi_host
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.tl_i(tl_h2d),
	.tl_o(tl_d2h),
	.alert_rx_i(alert_rx),
	.alert_tx_o(alert_tx),
	.cio_sck_o(qspi_host_sclk),
	.cio_sck_en_o(),
	.cio_csb_o(qspi_host_scs_list),
	.cio_csb_en_o(),
	.cio_sd_o(qspi_host_sdq_oval),
	.cio_sd_en_o(sd_en),
	.cio_sd_i(qspi_host_sdq_ival),
	.passthrough_i(passthrough_req),
	.passthrough_o(passthrough_rsp),
	.intr_error_o(intr_error),
	.intr_spi_event_o(intr_spi_event)
);

endmodule
