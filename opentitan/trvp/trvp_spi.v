module TRVP_SPI
(
	clk,
	rstnn,

	spi_clk,
	spi_cs_list,
	spi_dq0_in,
	spi_dq0_out,
	spi_dq0_oe,
	spi_dq1_in,
	spi_dq1_out,
	spi_dq1_oe,
	spi_dq2_in,
	spi_dq2_out,
	spi_dq2_oe,
	spi_dq3_in,
	spi_dq3_out,
	spi_dq3_oe,
	interrupt,

	rpslverr,
	rpready,
	rprdata,
	rpwdata,
	rpenable,
	rpsel,
	rpwrite,
	rpaddr
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter NUM_DEVICE = 1;

localparam BW_ADDR = 32;
localparam BW_DATA = 32;
localparam BW_TLUL_SIZE = 2;
localparam BW_TLUL_SOURCE = 8;
localparam BW_TLUL_SINK = 1;
localparam NUM_BYTE = BW_DATA/8;
localparam BW_TLOT_A_USER = 23;
localparam BW_TLOT_D_USER = 14;

input wire clk;
input wire rstnn;

output wire spi_clk;
output wire [NUM_DEVICE-1:0] spi_cs_list;
input wire spi_dq0_in;
output wire spi_dq0_out;
output wire spi_dq0_oe;
input wire spi_dq1_in;
output wire spi_dq1_out;
output wire spi_dq1_oe;
input wire spi_dq2_in;
output wire spi_dq2_out;
output wire spi_dq2_oe;
input wire spi_dq3_in;
output wire spi_dq3_out;
output wire spi_dq3_oe;
output wire interrupt;

output wire rpslverr;
output wire rpready;
output wire [BW_DATA-1:0] rprdata;
input wire [BW_DATA-1:0] rpwdata;
input wire rpenable;
input wire rpsel;
input wire rpwrite;
input wire [BW_ADDR-1:0] rpaddr;

/////////////
/* signals */
/////////////

wire tlavalid;
wire tlaready;
wire [3-1:0] tlaopcode;
wire [3-1:0] tlaparam;
wire [BW_TLUL_SIZE-1:0] tlasize;
wire [BW_TLUL_SOURCE-1:0] tlasource;
wire [BW_ADDR-1:0] tlaaddress;
wire [NUM_BYTE-1:0] tlamask;
wire [BW_DATA-1:0] tladata;
wire [BW_TLOT_A_USER-1:0] tlauser;

wire tldvalid;
wire tldready;
wire [3-1:0] tldopcode;
wire [3-1:0] tldparam;
wire [BW_TLUL_SIZE-1:0] tldsize;
wire [BW_TLUL_SOURCE-1:0] tldsource;
wire [BW_TLUL_SINK-1:0] tldsink;
wire [BW_DATA-1:0] tlddata;
wire tlderror;
wire [BW_TLOT_D_USER-1:0] tlduser;

wire intr_error;
wire intr_spi_event;

wire [4-1:0] sdq_od;
wire [4-1:0] sdq_oval;

////////////
/* logics */
////////////

RVX_MODULE_042
#(
	.RVX_GPARA_3(BW_ADDR),
	.RVX_GPARA_4(BW_DATA),
	.RVX_GPARA_0(BW_TLUL_SIZE),
	.RVX_GPARA_1(BW_TLUL_SOURCE),
	.RVX_GPARA_2(BW_TLUL_SINK)
)
i_apb2tlot
(
	.rvx_port_19(clk),
	.rvx_port_23(rstnn),

	.rvx_port_07(rpsel),
	.rvx_port_15(rpenable),
	.rvx_port_04(rpwrite),
	.rvx_port_02(rpaddr),
	.rvx_port_13(rpwdata),
	.rvx_port_03(rprdata),
	.rvx_port_16(rpready),
	.rvx_port_12(rpslverr),

	.rvx_port_26(tlavalid),
	.rvx_port_17(tlaready),
	.rvx_port_14(tlaopcode),
	.rvx_port_25(tlaparam),
	.rvx_port_28(tlasize),
	.rvx_port_05(tlasource),
	.rvx_port_21(tlaaddress),
	.rvx_port_24(tlamask),
	.rvx_port_11(tladata),
	.rvx_port_01(tlauser),

	.rvx_port_00(tldvalid),
	.rvx_port_10(tldready),
	.rvx_port_09(tldopcode),
	.rvx_port_18(tldparam),
	.rvx_port_06(tldsize),
	.rvx_port_20(tldsource),
	.rvx_port_22(tldsink),
	.rvx_port_29(tlddata),
	.rvx_port_27(tlderror),
	.rvx_port_08(tlduser)
);

assign interrupt = intr_error | intr_spi_event;

assign spi_dq0_out = sdq_oval[0];
assign spi_dq1_out = sdq_oval[1];
assign spi_dq2_out = sdq_oval[2];
assign spi_dq3_out = sdq_oval[3];
assign spi_dq0_oe = ~sdq_od[0];
assign spi_dq1_oe = ~sdq_od[1];
assign spi_dq2_oe = ~sdq_od[2];
assign spi_dq3_oe = ~sdq_od[3];

TRVP_SPI_HOST
#(
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.BW_TLUL_SIZE(BW_TLUL_SIZE),
	.BW_TLUL_SOURCE(BW_TLUL_SOURCE),
	.BW_TLUL_SINK(BW_TLUL_SINK),
	.NUM_DEVICE(NUM_DEVICE)
)
i_spi_host
(
	.clk(clk),
	.rstnn(rstnn),
	.rtlavalid(tlavalid),
	.rtlaready(tlaready),
	.rtlaopcode(tlaopcode),
	.rtlaparam(tlaparam),
	.rtlasize(tlasize),
	.rtlasource(tlasource),
	.rtlaaddress(tlaaddress),
	.rtlamask(tlamask),
	.rtladata(tladata),
	.rtlauser(tlauser),
	.rtldvalid(tldvalid),
	.rtldready(tldready),
	.rtldopcode(tldopcode),
	.rtldparam(tldparam),
	.rtldsize(tldsize),
	.rtldsource(tldsource),
	.rtldsink(tldsink),
	.rtlddata(tlddata),
	.rtlderror(tlderror),
	.rtlduser(tlduser),
	.intr_error(intr_error),
	.intr_spi_event(intr_spi_event),
	.qspi_host_sclk(spi_clk),
	.qspi_host_scs_list(spi_cs_list),
	.qspi_host_sdq_od(sdq_od),
	.qspi_host_sdq_oval(sdq_oval),
	.qspi_host_sdq_ival({spi_dq3_in,spi_dq2_in,spi_dq1_in,spi_dq0_in})
);

endmodule
