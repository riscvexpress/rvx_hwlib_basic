module TRVP_SPI_DEVICE
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

	intr_upload_cmdfifo_not_empty,
	intr_upload_payload_not_empty,
	intr_upload_payload_overflow,
	intr_readbuf_watermark,
	intr_readbuf_flip,

	qspi_device_rclk,
	qspi_device_rcs,
	qspi_device_dq_sod,
	qspi_device_dq_soval,
	qspi_device_dq_sival
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;

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

output wire intr_upload_cmdfifo_not_empty;
output wire intr_upload_payload_not_empty;
output wire intr_upload_payload_overflow;
output wire intr_readbuf_watermark;
output wire intr_readbuf_flip;

input wire qspi_device_rclk;
input wire qspi_device_rcs;
output wire [4-1:0] qspi_device_dq_sod;
output wire [4-1:0] qspi_device_dq_soval;
input wire [4-1:0] qspi_device_dq_sival;

/////////////
/* signals */
/////////////

tlul_pkg::tl_h2d_t tl_h2d;
tlul_pkg::tl_d2h_t tl_d2h;

prim_alert_pkg::alert_rx_t [spi_device_reg_pkg::NumAlerts-1:0] alert_rx;
prim_alert_pkg::alert_tx_t [spi_device_reg_pkg::NumAlerts-1:0] alert_tx;

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

assign alert_rx = {spi_device_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
assign passthrough_rsp = spi_device_pkg::PASSTHROUGH_RSP_DEFAULT;
assign qspi_device_dq_sod = ~sd_en;

`ifdef SIM_ENV
initial
begin
	$assertoff(0, i_spi_device);
	wait(rstnn===1'b 0);
	wait(rstnn===1'b 1);
	$asserton(0, i_spi_device);
end
`endif

spi_device
i_spi_device
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.tl_i(tl_h2d),
	.tl_o(tl_d2h),
	.alert_rx_i(alert_rx),
	.alert_tx_o(alert_tx),
	.cio_sck_i(qspi_device_rclk),
	.cio_csb_i(qspi_device_rcs),
	.cio_sd_o(qspi_device_dq_soval),
	.cio_sd_en_o(sd_en),
	.cio_sd_i(qspi_device_dq_sival),
	.cio_tpm_csb_i(1'b 1),
	.passthrough_o(passthrough_req),
	.passthrough_i(passthrough_rsp),
	.intr_upload_cmdfifo_not_empty_o(intr_upload_cmdfifo_not_empty),
	.intr_upload_payload_not_empty_o(intr_upload_payload_not_empty),
	.intr_upload_payload_overflow_o(intr_upload_payload_overflow),
	.intr_readbuf_watermark_o(intr_readbuf_watermark),
	.intr_readbuf_flip_o(intr_readbuf_flip),
	.intr_tpm_header_not_empty_o(),
	.intr_tpm_rdfifo_cmd_end_o(),
	.intr_tpm_rdfifo_drop_o(),
	.ram_cfg_i(prim_ram_2p_pkg::RAM_2P_CFG_DEFAULT),
	.sck_monitor_o(),
	.mbist_en_i(1'b 0),
	.scan_clk_i(1'b 0),
	.scan_rst_ni(1'b 1),
	.scanmode_i(prim_mubi_pkg::MuBi4False)
);

endmodule
