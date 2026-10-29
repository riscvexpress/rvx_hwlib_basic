// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_22.vh"
`include "rvx_include_15.vh"



module FRVP_PLIC
(
	clk,
	rstnn,

	uart_interrupts,
	spi_interrupt,
	i2c_interrupts,
	i2s_interrupt,
	gpio_interrupts,
	wifi_interrupt,
	hbc1_interrupt,
	user_interrupts,
	plic_interrupt,

	rpslverr,
	rpready,
	rprdata,
	rpwdata,
	rpenable,
	rpsel,
	rpwrite,
	rpaddr
);



parameter NUM_UART = 1;
parameter NUM_SPI = 1;
parameter NUM_I2C = 1;
parameter NUM_GPIO = 1;

localparam  RVX_LPARA_3 = 32;
localparam  RVX_LPARA_0 = 32'h 0c000000;

input wire clk;
input wire rstnn;

input wire [31:0] uart_interrupts;
input wire spi_interrupt;
input wire [31:0] i2c_interrupts;
input wire i2s_interrupt;
input wire [31:0] gpio_interrupts;
input wire wifi_interrupt;
input wire hbc1_interrupt;
input wire [31:0] user_interrupts;
output wire plic_interrupt;

output wire rpslverr;
output wire rpready;
output wire [31:0] rprdata;
input wire [31:0] rpwdata;
input wire rpenable;
input wire rpsel;
input wire rpwrite;
input wire [31:0] rpaddr;

genvar i;

localparam  RVX_LPARA_4 = 28;
localparam  RVX_LPARA_5 = 32;
localparam  RVX_LPARA_6 = 10;
localparam  RVX_LPARA_1 = 2;
localparam  RVX_LPARA_2 = 1;

wire rvx_signal_27;
wire rvx_signal_26;
wire [2:0] rvx_signal_17;
wire [2:0] rvx_signal_10;
wire [RVX_LPARA_1-1:0] rvx_signal_16;
wire [RVX_LPARA_6-1:0] rvx_signal_03;
wire [RVX_LPARA_4-1:0] rvx_signal_35;
wire [`BW_AXI_WSTRB(RVX_LPARA_5)-1:0] rvx_signal_15;
wire [RVX_LPARA_5-1:0] rvx_signal_01;

wire rvx_signal_02;
wire rvx_signal_18;
wire [2:0] rvx_signal_07;
wire [1:0] rvx_signal_13;
wire [RVX_LPARA_1-1:0] rvx_signal_00;
wire [RVX_LPARA_6-1:0] rvx_signal_21;
wire [RVX_LPARA_4-1:0] rvx_signal_34;
wire [`BW_AXI_WSTRB(RVX_LPARA_5)-1:0] rvx_signal_39;
wire [RVX_LPARA_5-1:0] rvx_signal_29;

wire rvx_signal_24;
wire rvx_signal_11;
wire [2:0] rvx_signal_41;
wire [2:0] rvx_signal_08;
wire [RVX_LPARA_1-1:0] rvx_signal_19;
wire [RVX_LPARA_6-1:0] rvx_signal_25;
wire [RVX_LPARA_4-1:0] rvx_signal_37;
wire [RVX_LPARA_5-1:0] rvx_signal_40;
wire rvx_signal_20;

wire rvx_signal_05;
wire rvx_signal_23;
wire [2:0] rvx_signal_06;
wire [1:0] rvx_signal_12;
wire [RVX_LPARA_1-1:0] rvx_signal_28;
wire [RVX_LPARA_6-1:0] rvx_signal_14;
wire rvx_signal_09;
wire [RVX_LPARA_2-1:0] rvx_signal_04;
wire [RVX_LPARA_5-1:0] rvx_signal_38;
wire rvx_signal_31;

wire rvx_signal_33;
wire rvx_signal_36;
wire rvx_signal_32;

reg [32-1:0] rvx_signal_22;
wire [32-1:0] rvx_signal_30;

RVX_MODULE_033
#(
	.RVX_GPARA_3(32),
	.RVX_GPARA_2(32),
	.RVX_GPARA_5(RVX_LPARA_4),
	.RVX_GPARA_8(RVX_LPARA_5),
	.RVX_GPARA_6(RVX_LPARA_6),
	.RVX_GPARA_1(RVX_LPARA_1),
	.RVX_GPARA_7(RVX_LPARA_2),
	.RVX_GPARA_4(RVX_LPARA_0),
	.RVX_GPARA_0(22)
)
i_rvx_instance_0
(
	.rvx_port_10(clk),
	.rvx_port_09(rstnn),

	.rvx_port_36(rpsel),
	.rvx_port_38(rpenable),
	.rvx_port_33(rpaddr),
	.rvx_port_46(rpwrite),
	.rvx_port_25(rpwdata),
	.rvx_port_23(rprdata),
	.rvx_port_49(rpready),
	.rvx_port_13(rpslverr),

	.rvx_port_27(rvx_signal_27),
	.rvx_port_31(rvx_signal_26),
	.rvx_port_48(rvx_signal_17),
	.rvx_port_26(rvx_signal_10),
	.rvx_port_17(rvx_signal_16),
	.rvx_port_32(rvx_signal_03),
	.rvx_port_02(rvx_signal_35),
	.rvx_port_03(rvx_signal_15),
	.rvx_port_00(rvx_signal_01),
	.rvx_port_44(rvx_signal_02),
	.rvx_port_30(rvx_signal_18),
	.rvx_port_07(rvx_signal_07),
	.rvx_port_35(rvx_signal_13),
	.rvx_port_11(rvx_signal_00),
	.rvx_port_37(rvx_signal_21),
	.rvx_port_41(rvx_signal_34),
	.rvx_port_28(rvx_signal_39),
	.rvx_port_47(rvx_signal_29),
	.rvx_port_39(rvx_signal_24),
	.rvx_port_19(rvx_signal_11),
	.rvx_port_29(rvx_signal_41),
	.rvx_port_15(rvx_signal_08),
	.rvx_port_43(rvx_signal_19),
	.rvx_port_14(rvx_signal_25),
	.rvx_port_16(rvx_signal_37),
	.rvx_port_45(rvx_signal_40),
	.rvx_port_01(rvx_signal_20),
	.rvx_port_18(rvx_signal_05),
	.rvx_port_04(rvx_signal_23),
	.rvx_port_12(rvx_signal_06),
	.rvx_port_05(rvx_signal_12),
	.rvx_port_42(rvx_signal_28),
	.rvx_port_20(rvx_signal_14),
	.rvx_port_06(rvx_signal_09),
	.rvx_port_22(rvx_signal_04),
	.rvx_port_40(rvx_signal_38),
	.rvx_port_21(rvx_signal_31),
	.rvx_port_34(rvx_signal_33),
	.rvx_port_24(rvx_signal_36),
	.rvx_port_08(rvx_signal_32)
);

RVX_MODULE_130
i_rvx_instance_2
(
  .rvx_port_14(clk),
  .rvx_port_00(~rstnn),

  .rvx_port_10(rvx_signal_30[0]),
  .rvx_port_41(rvx_signal_30[1]),
  .rvx_port_44(rvx_signal_30[2]),
  .rvx_port_03(rvx_signal_30[3]),
  .rvx_port_39(rvx_signal_30[4]),
  .rvx_port_27(rvx_signal_30[5]),
  .rvx_port_48(rvx_signal_30[6]),
  .rvx_port_11(rvx_signal_30[7]),
  .rvx_port_46(rvx_signal_30[8]),
  .rvx_port_38(rvx_signal_30[9]),
  .rvx_port_23(rvx_signal_30[10]),
  .rvx_port_26(rvx_signal_30[11]),
  .rvx_port_45(rvx_signal_30[12]),
  .rvx_port_24(rvx_signal_30[13]),
  .rvx_port_01(rvx_signal_30[14]),
  .rvx_port_12(rvx_signal_30[15]),
  .rvx_port_21(rvx_signal_30[16]),
  .rvx_port_33(rvx_signal_30[17]),
  .rvx_port_06(rvx_signal_30[18]),
  .rvx_port_13(rvx_signal_30[19]),
  .rvx_port_22(rvx_signal_30[20]),
  .rvx_port_36(rvx_signal_30[21]),
  .rvx_port_15(rvx_signal_30[22]),
  .rvx_port_16(rvx_signal_30[23]),
  .rvx_port_20(rvx_signal_30[24]),
  .rvx_port_09(rvx_signal_30[25]),
  .rvx_port_31(rvx_signal_30[26]),
  .rvx_port_32(rvx_signal_30[27]),
  .rvx_port_29(rvx_signal_30[28]),
  .rvx_port_37(rvx_signal_30[29]),
  .rvx_port_05(rvx_signal_30[30]),
  .rvx_port_35(rvx_signal_30[31]),
  .rvx_port_25(plic_interrupt),

	.rvx_port_18(rvx_signal_27),
	.rvx_port_34(rvx_signal_26),
	.rvx_port_17(rvx_signal_17),
	.rvx_port_08(rvx_signal_16),
	.rvx_port_02(rvx_signal_03),
	.rvx_port_43(rvx_signal_35),
	.rvx_port_04(rvx_signal_15),
	.rvx_port_19(rvx_signal_01),
	.rvx_port_28(rvx_signal_05),
	.rvx_port_42(rvx_signal_23),
	.rvx_port_47(rvx_signal_06),
	.rvx_port_07(rvx_signal_28),
	.rvx_port_30(rvx_signal_14),
	.rvx_port_40(rvx_signal_38)
);

assign rvx_signal_18 = 0;
assign rvx_signal_07 = 0;
assign rvx_signal_13 = 0;
assign rvx_signal_00 = 0;
assign rvx_signal_21 = 0;
assign rvx_signal_34 = 0;
assign rvx_signal_39 = 0;
assign rvx_signal_29 = 0;

assign rvx_signal_24 = 0;

assign rvx_signal_12 = 0;
assign rvx_signal_09 = 0;
assign rvx_signal_04 = 0;
assign rvx_signal_31 = 0;

assign rvx_signal_33 = 0;

always@(*)
begin
	rvx_signal_22 = 0;
	rvx_signal_22[`RVX_GDEF_351+`RVX_GDEF_028-1:`RVX_GDEF_351] = gpio_interrupts;
	rvx_signal_22[`RVX_GDEF_414+`RVX_GDEF_325-1:`RVX_GDEF_414] = user_interrupts;
	rvx_signal_22[`RVX_GDEF_090+`RVX_GDEF_398-1:`RVX_GDEF_090] = wifi_interrupt;
	rvx_signal_22[`RVX_GDEF_579+`RVX_GDEF_574-1:`RVX_GDEF_579] = spi_interrupt;
	rvx_signal_22[`RVX_GDEF_059+`RVX_GDEF_478-1:`RVX_GDEF_059] = hbc1_interrupt;
	rvx_signal_22[`RVX_GDEF_405+`RVX_GDEF_499-1:`RVX_GDEF_405] = i2s_interrupt;
	rvx_signal_22[`RVX_GDEF_345+`RVX_GDEF_223-1:`RVX_GDEF_345] = i2c_interrupts;
	rvx_signal_22[`RVX_GDEF_297+`RVX_GDEF_445-1:`RVX_GDEF_297] = uart_interrupts;
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(32)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_22),
	.synch_value(rvx_signal_30)
);

endmodule
