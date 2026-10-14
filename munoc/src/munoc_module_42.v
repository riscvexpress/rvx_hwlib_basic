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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_04.vh"
`include "munoc_include_08.vh"
`include "munoc_include_05.vh"
`include "munoc_control.vh"





module MUNOC_MODULE_42
(
	munoc_port_08,
	munoc_port_12,
	munoc_port_39,
	munoc_port_21,
	munoc_port_05,
	munoc_port_23,

	munoc_port_28,
	munoc_port_09,
	munoc_port_27,
	munoc_port_11,
	munoc_port_01,
	munoc_port_33,
	munoc_port_07,

	munoc_port_14,
	munoc_port_03,
	munoc_port_15,
	munoc_port_16,
	munoc_port_36,
	munoc_port_32, 

	munoc_port_22,
	munoc_port_31,
	munoc_port_29,
	munoc_port_19,

	munoc_port_38,
	munoc_port_18,
	munoc_port_30,
	munoc_port_26,
	munoc_port_04,
	munoc_port_34,
	munoc_port_02,

	munoc_port_20,
	munoc_port_17,
	munoc_port_24,
	munoc_port_10,
	munoc_port_37,
	munoc_port_25,

	munoc_port_13,
	munoc_port_06,
	munoc_port_35,
	munoc_port_00
);





parameter MUNOC_GPARA_02 = -1;
parameter MUNOC_GPARA_10 = 8;
parameter MUNOC_GPARA_13 = 8;
parameter MUNOC_GPARA_05 = 32;
parameter MUNOC_GPARA_09 = 32;
parameter MUNOC_GPARA_11 = `DEFAULT_BW_AXI_TID;
parameter MUNOC_GPARA_04 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_14 = `LLIMIT_OF_DATA_WIDTH;

parameter MUNOC_GPARA_00 = 2;
parameter MUNOC_GPARA_08 = 2;
parameter MUNOC_GPARA_01 = 4;
parameter MUNOC_GPARA_06 = 4;
parameter MUNOC_GPARA_03 = 2;

parameter MUNOC_GPARA_07 = 1;
parameter MUNOC_GPARA_12 = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_07==1)? ((MUNOC_GPARA_12==1)? `BW_MASTER_NODE_ID : MUNOC_GPARA_11) : `MAX(MUNOC_GPARA_11,`REQUIRED_BW_OF_SLAVE_TID);
localparam  MUNOC_LPARA_2 = `MAX(`MAX(`QUANTIZERU(MUNOC_GPARA_00,8),MUNOC_GPARA_08),2);
localparam  MUNOC_LPARA_1 = MUNOC_GPARA_01;

input wire munoc_port_08, munoc_port_12;

input wire [`BW_FNI_LINK(MUNOC_GPARA_10)-1:0] munoc_port_39;
output wire munoc_port_21;
output wire [`BW_BNI_LINK(MUNOC_GPARA_13)-1:0] munoc_port_05;
input wire munoc_port_23;

output wire [MUNOC_LPARA_0-1:0] munoc_port_28;
output wire [MUNOC_GPARA_05-1:0] munoc_port_09;
output wire [`BW_AXI_ALEN-1:0] munoc_port_27;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_11;
output wire [`BW_AXI_ABURST-1:0] munoc_port_01;
output wire munoc_port_33;
input wire munoc_port_07;

output wire [MUNOC_LPARA_0-1:0] munoc_port_14;
output wire [MUNOC_GPARA_09-1:0] munoc_port_03;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_09)-1:0] munoc_port_15;
output wire munoc_port_16;
output wire munoc_port_36;
input wire munoc_port_32;

input wire [MUNOC_LPARA_0-1:0] munoc_port_22;
input wire [`BW_AXI_BRESP-1:0] munoc_port_31;
input wire munoc_port_29;
output wire munoc_port_19;

output wire [MUNOC_LPARA_0-1:0] munoc_port_38;
output wire [MUNOC_GPARA_05-1:0] munoc_port_18;
output wire [`BW_AXI_ALEN-1:0] munoc_port_30;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_26;
output wire [`BW_AXI_ABURST-1:0] munoc_port_04;
output wire munoc_port_34;
input wire munoc_port_02;

input wire [MUNOC_LPARA_0-1:0] munoc_port_20;
input wire [MUNOC_GPARA_09-1:0] munoc_port_17;
input wire [`BW_AXI_RRESP-1:0] munoc_port_24;
input wire munoc_port_10;
input wire munoc_port_37;
output wire munoc_port_25;

input wire munoc_port_13;
output wire [`MUNOC_GDEF_02-1:0] munoc_port_06;
output wire [`MUNOC_GDEF_49-1:0] munoc_port_35;
output wire munoc_port_00;

genvar i;

wire munoc_signal_22;
wire munoc_signal_33;
wire munoc_signal_35;
wire munoc_signal_39;

wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_00;
wire [`MUNOC_GDEF_64-1:0] munoc_signal_12;
wire [`MUNOC_GDEF_60-1:0] munoc_signal_27;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_42;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_23;
wire [MUNOC_GPARA_05-1:0] munoc_signal_02;
wire [`BW_AXI_ALEN-1:0] munoc_signal_14;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_16;
wire [`BW_AXI_ABURST-1:0] munoc_signal_15;

wire munoc_signal_24;
wire [MUNOC_GPARA_04-1:0] munoc_signal_03;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_04)-1:0] munoc_signal_36;

wire munoc_signal_28;
wire munoc_signal_06;
wire [`MUNOC_GDEF_21-1:0] munoc_signal_41;

wire munoc_signal_30;
wire munoc_signal_21;
wire [`MUNOC_GDEF_27-1:0] munoc_signal_11;
wire munoc_signal_18;
wire munoc_signal_09;
wire [`MUNOC_GDEF_27-1:0] munoc_signal_08;

wire munoc_signal_04;
wire munoc_signal_26;
wire [`MUNOC_GDEF_31(MUNOC_GPARA_09)-1:0] munoc_signal_29;

wire munoc_signal_37;
wire munoc_signal_38;
wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_signal_17;
wire munoc_signal_20;
wire munoc_signal_25;
wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_signal_07;

wire [MUNOC_GPARA_04/`LLIMIT_OF_DATA_WIDTH-1:0] munoc_signal_13;
wire munoc_signal_31;
wire munoc_signal_05;
wire munoc_signal_34;
wire [`BW_RCHANNEL(MUNOC_LPARA_0,MUNOC_GPARA_04)-1:0] munoc_signal_01;

wire munoc_signal_10;
wire [`MUNOC_GDEF_60-1:0] munoc_signal_32;
wire munoc_signal_19;
wire [`BW_RCHANNEL(MUNOC_LPARA_0,MUNOC_GPARA_04)-1:0] munoc_signal_40;

MUNOC_MODULE_36
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_10),
	.MUNOC_GPARA_0(MUNOC_GPARA_05),
	.MUNOC_GPARA_4(MUNOC_GPARA_04),
	.MUNOC_GPARA_1(MUNOC_LPARA_2),
	.MUNOC_GPARA_3(MUNOC_LPARA_1)
)
i_munoc_instance_6
(
	.munoc_port_06(munoc_port_08),
	.munoc_port_14(munoc_port_12),

	.munoc_port_08(munoc_port_39),
	.munoc_port_02(munoc_port_21),
	.munoc_port_18(munoc_port_13),

	.munoc_port_03(munoc_signal_22),
	.munoc_port_16(munoc_signal_33),

	.munoc_port_01(munoc_signal_00),
	.munoc_port_04(munoc_signal_12),
	.munoc_port_15(munoc_signal_27),
	.munoc_port_09(munoc_signal_42),
	.munoc_port_07(munoc_signal_23),
	.munoc_port_11(munoc_signal_02),
	.munoc_port_19(munoc_signal_14),
	.munoc_port_05(munoc_signal_16),
	.munoc_port_20(munoc_signal_15),

	.munoc_port_12(munoc_signal_24),
	.munoc_port_13(munoc_signal_03),
	.munoc_port_17(munoc_signal_36),

	.munoc_port_10(munoc_signal_35),
	.munoc_port_00(munoc_signal_39)
);

MUNOC_MODULE_43
#(
	.MUNOC_GPARA_7(MUNOC_GPARA_02),
	.MUNOC_GPARA_4(MUNOC_GPARA_10),
	.MUNOC_GPARA_5(MUNOC_GPARA_05),
	.MUNOC_GPARA_3(MUNOC_GPARA_09),
	.MUNOC_GPARA_6(MUNOC_LPARA_0),
	.MUNOC_GPARA_0(MUNOC_GPARA_04),
	.MUNOC_GPARA_2(MUNOC_GPARA_07),
	.MUNOC_GPARA_1(MUNOC_GPARA_12)
)
i_munoc_instance_7
(
	.munoc_port_30(munoc_port_08),
	.munoc_port_00(munoc_port_12),

	.munoc_port_47(munoc_signal_22),
	.munoc_port_32(munoc_signal_33),
	.munoc_port_11(munoc_signal_00),
	.munoc_port_17(munoc_signal_12),
	.munoc_port_08(munoc_signal_27),
	.munoc_port_03(munoc_signal_42),
	.munoc_port_04(munoc_signal_23),
	.munoc_port_18(munoc_signal_02),
	.munoc_port_33(munoc_signal_14),
	.munoc_port_36(munoc_signal_16),
	.munoc_port_46(munoc_signal_15),
	.munoc_port_13(munoc_signal_24),
	.munoc_port_41(munoc_signal_03),
	.munoc_port_14(munoc_signal_36),
	.munoc_port_29(munoc_signal_35),
	.munoc_port_26(munoc_signal_39),

	.munoc_port_23(munoc_signal_41),
	.munoc_port_10(munoc_signal_28),
	.munoc_port_24(munoc_signal_06),
	.munoc_port_43(munoc_signal_30),
	.munoc_port_38(munoc_signal_21),
	.munoc_port_19(munoc_signal_11),
	.munoc_port_22(munoc_signal_29),
	.munoc_port_15(munoc_signal_04),
	.munoc_port_34(munoc_signal_26),

	.munoc_port_12(munoc_port_28),
	.munoc_port_01(munoc_port_09),
	.munoc_port_31(munoc_port_27),
	.munoc_port_27(munoc_port_11),
	.munoc_port_02(munoc_port_01),
	.munoc_port_06(munoc_port_33),
	.munoc_port_44(munoc_port_07),

	.munoc_port_40(munoc_port_14),
	.munoc_port_37(munoc_port_03),
	.munoc_port_35(munoc_port_15),
	.munoc_port_21(munoc_port_16),
	.munoc_port_07(munoc_port_36),
	.munoc_port_25(munoc_port_32),

	.munoc_port_20(munoc_port_38),
	.munoc_port_16(munoc_port_18),
	.munoc_port_28(munoc_port_30),
	.munoc_port_09(munoc_port_26),
	.munoc_port_05(munoc_port_04),
	.munoc_port_45(munoc_port_34),
	.munoc_port_42(munoc_port_02),

	.munoc_port_39(munoc_port_06),
	.munoc_port_48(munoc_port_00)
);

MUNOC_MODULE_00
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_07),
	.MUNOC_GPARA_2(MUNOC_GPARA_09),
	.MUNOC_GPARA_3(MUNOC_LPARA_0),
	.MUNOC_GPARA_1(MUNOC_GPARA_08)
)
i_munoc_instance_1
(
	.munoc_port_10(munoc_port_08),
	.munoc_port_11(munoc_port_12),

	.munoc_port_08(munoc_signal_04),
	.munoc_port_02(munoc_signal_26),
	.munoc_port_03(munoc_signal_29),

	.munoc_port_05(munoc_port_22),
	.munoc_port_01(munoc_port_31),
	.munoc_port_00(munoc_port_29),
	.munoc_port_06(munoc_port_19),

	.munoc_port_09(munoc_signal_37),
	.munoc_port_07(munoc_signal_38),
	.munoc_port_04(munoc_signal_17)
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)),
	.DEPTH(MUNOC_GPARA_03)
)
i_munoc_instance_2
(
	.clk(munoc_port_08),
	.rstnn(munoc_port_12),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_37),
	.wrequest(munoc_signal_38),
	.wdata(munoc_signal_17),
	.rready(munoc_signal_20),
	.rrequest(munoc_signal_25),
	.rdata(munoc_signal_07),
	.wfull(),
	.rempty()
);

MUNOC_MODULE_03
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_09),
	.MUNOC_GPARA_1(MUNOC_LPARA_0),
	.MUNOC_GPARA_0(`LLIMIT_OF_DATA_WIDTH),
	.MUNOC_GPARA_4(MUNOC_GPARA_04),
	.MUNOC_GPARA_3(MUNOC_GPARA_00)
)
i_munoc_instance_5
(
	.munoc_port_05(munoc_port_08),
	.munoc_port_02(munoc_port_12),

	.munoc_port_08(munoc_signal_28),
	.munoc_port_06(munoc_signal_06),
	.munoc_port_03(munoc_signal_41),

	.munoc_port_15(munoc_port_20),
	.munoc_port_14(munoc_port_17),
	.munoc_port_01(munoc_port_24),
	.munoc_port_09(munoc_port_10),
	.munoc_port_00(munoc_port_37),
	.munoc_port_07(munoc_port_25),
	
	.munoc_port_11(munoc_signal_13),
	.munoc_port_12(munoc_signal_31),
	.munoc_port_04(munoc_signal_05),
	.munoc_port_10(munoc_signal_34),
	.munoc_port_13(munoc_signal_01)
);

MUNOC_MODULE_15
#(
	.MUNOC_GPARA_0(MUNOC_LPARA_0),
	.MUNOC_GPARA_2(MUNOC_GPARA_04),
	.MUNOC_GPARA_1(`LLIMIT_OF_DATA_WIDTH),
	.MUNOC_GPARA_3(MUNOC_GPARA_06)
)
i_munoc_instance_3
(
	.munoc_port_08(munoc_port_08),
	.munoc_port_01(munoc_port_12),
	
	.munoc_port_04(munoc_signal_13),
	.munoc_port_05(munoc_signal_31),
	.munoc_port_03(munoc_signal_05),
	.munoc_port_02(munoc_signal_34),
	.munoc_port_07(munoc_signal_01),

	.munoc_port_06(munoc_signal_10),
	.munoc_port_00(munoc_signal_32),
	.munoc_port_10(munoc_signal_19),
	.munoc_port_09(munoc_signal_40)
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_27),
	.DEPTH(MUNOC_GPARA_00)
)
i_munoc_instance_0
(
	.clk(munoc_port_08),
	.rstnn(munoc_port_12),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_30),
	.wrequest(munoc_signal_21),
	.wdata(munoc_signal_11),
	.rready(munoc_signal_18),
	.rrequest(munoc_signal_09),
	.rdata(munoc_signal_08),
	.wfull(),
	.rempty()
);

MUNOC_MODULE_08
#(
	.MUNOC_GPARA_5(MUNOC_GPARA_02),
	.MUNOC_GPARA_1(MUNOC_LPARA_0),
	.MUNOC_GPARA_0(MUNOC_GPARA_13),
	.MUNOC_GPARA_4(MUNOC_GPARA_05),
	.MUNOC_GPARA_2(MUNOC_GPARA_04),
	.MUNOC_GPARA_3(MUNOC_GPARA_07)
)
i_munoc_instance_4
(
	.munoc_port_08(munoc_port_08),
	.munoc_port_05(munoc_port_12),
	.munoc_port_07(munoc_signal_20),
	.munoc_port_03(munoc_signal_25),
	.munoc_port_12(munoc_signal_07),
	.munoc_port_11(munoc_signal_18),
	.munoc_port_00(munoc_signal_09),
	.munoc_port_04(munoc_signal_08),
	.munoc_port_09(munoc_signal_10),
	.munoc_port_15(munoc_signal_32),
	.munoc_port_06(munoc_signal_19),
	.munoc_port_10(munoc_signal_40),
	.munoc_port_13(munoc_port_05),
	.munoc_port_14(munoc_port_23),
	.munoc_port_02(munoc_port_13),
	.munoc_port_01(munoc_port_35)
);

endmodule
