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





module MUNOC_MODULE_22
(
	munoc_port_14,
	munoc_port_10,
	munoc_port_04,
	munoc_port_02,

	munoc_port_05,
	munoc_port_11,
	munoc_port_22,

	munoc_port_17,
	munoc_port_01,

	munoc_port_09,
	munoc_port_20,
	munoc_port_13,
	munoc_port_07,
	munoc_port_21,
	munoc_port_12,
	munoc_port_19,
	munoc_port_00,
	munoc_port_03,

	munoc_port_15,
	munoc_port_18,
	munoc_port_08,

	munoc_port_06,
	munoc_port_16
);





parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_1 = `BW_LONGEST_MASTER_DATA;

parameter MUNOC_GPARA_2 = 1;
parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_14, munoc_port_10;
input wire munoc_port_04, munoc_port_02;

input wire [`BW_FNI_LINK(MUNOC_GPARA_4)-1:0] munoc_port_05;
output wire munoc_port_11;
input wire munoc_port_22;

output wire munoc_port_17;
output wire munoc_port_01;

output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_09;
output wire [`MUNOC_GDEF_64-1:0] munoc_port_20;
output wire [`MUNOC_GDEF_60-1:0] munoc_port_13;
output wire [`BW_MASTER_NODE_ID-1:0] munoc_port_07;
output wire [`BW_LONGEST_AXI_TID-1:0] munoc_port_21;
output wire [MUNOC_GPARA_3-1:0] munoc_port_12;
output wire [`BW_AXI_ALEN-1:0] munoc_port_19;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_00;
output wire [`BW_AXI_ABURST-1:0] munoc_port_03;

output wire munoc_port_15;
output wire [MUNOC_GPARA_1-1:0] munoc_port_18;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_08;

input wire munoc_port_06;
input wire munoc_port_16;

genvar i;
integer j;

wire munoc_signal_11;
wire munoc_signal_08;
wire munoc_signal_02;
wire [MUNOC_GPARA_4-1:0] munoc_signal_10;

wire munoc_signal_05;
wire munoc_signal_01;
wire munoc_signal_15;
wire [`MUNOC_GDEF_59(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_signal_00;
wire [`MUNOC_GDEF_59(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_signal_07;
wire [`MUNOC_GDEF_63(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_signal_09;

wire munoc_signal_16;
wire munoc_signal_06;
wire munoc_signal_04;
wire [`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_4)-1:0] munoc_signal_03;
wire [`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_4)-1:0] munoc_signal_13;
wire [`MUNOC_GDEF_37(MUNOC_GPARA_1,MUNOC_GPARA_4)-1:0] munoc_signal_12;

wire [`MUNOC_GDEF_36(MUNOC_GPARA_1)-1:0] munoc_signal_14;

assign {munoc_signal_11,munoc_signal_08,munoc_signal_02,munoc_signal_10} = munoc_port_05;

MUNOC_MODULE_24
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_4),
	.MUNOC_GPARA_1(MUNOC_GPARA_3),
	.MUNOC_GPARA_2(MUNOC_GPARA_1)
)
i_munoc_instance_1
(
	.munoc_port_14(munoc_port_04),
	.munoc_port_11(munoc_port_02),

	.munoc_port_15(munoc_port_05),
	.munoc_port_06(munoc_port_11),
	.munoc_port_09(munoc_port_22),

	.munoc_port_05(munoc_signal_05),
	.munoc_port_12(munoc_signal_01),
	.munoc_port_18(munoc_signal_15),
	.munoc_port_00(munoc_signal_16),
	.munoc_port_01(munoc_signal_06),
	.munoc_port_13(munoc_signal_04),

	.munoc_port_16(munoc_signal_00),
	.munoc_port_04(munoc_signal_07),
	.munoc_port_03(munoc_signal_03),
	.munoc_port_07(munoc_signal_13),

	.munoc_port_17(munoc_port_13),
	.munoc_port_10(munoc_port_17),
	.munoc_port_08(munoc_port_01),
	.munoc_port_19(munoc_port_06),
	.munoc_port_02(munoc_port_16)
);

MUNOC_MODULE_46
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`MUNOC_GDEF_59(MUNOC_GPARA_3,MUNOC_GPARA_4)),
	.MUNOC_GPARA_2(MUNOC_GPARA_2)
)
i_munoc_instance_2
(
	.munoc_port_03(munoc_port_04),
	.munoc_port_10(munoc_port_02),
	.munoc_port_01(munoc_signal_05),
	.munoc_port_07(munoc_signal_01),
	.munoc_port_05(munoc_signal_10),
	.munoc_port_06(munoc_signal_15),

	.munoc_port_08(munoc_port_14),
	.munoc_port_00(munoc_port_10),
	.munoc_port_09(munoc_signal_00),
	.munoc_port_04(munoc_signal_07),
	.munoc_port_02(munoc_signal_09)
);

assign `MUNOC_GDEF_13(munoc_port_09,munoc_port_20,munoc_port_13,munoc_port_07,munoc_port_21,munoc_port_12,munoc_port_19,munoc_port_00,munoc_port_03) = munoc_signal_09[`MUNOC_GDEF_63(MUNOC_GPARA_3,MUNOC_GPARA_4)-1-:`MUNOC_GDEF_88(MUNOC_GPARA_3)];
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
	assign munoc_port_13 = `MUNOC_GDEF_34;
`endif

MUNOC_MODULE_46
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_4)),
	.MUNOC_GPARA_2(MUNOC_GPARA_0)
)
i_munoc_instance_0
(
	.munoc_port_03(munoc_port_04),
	.munoc_port_10(munoc_port_02),
	.munoc_port_01(munoc_signal_16),
	.munoc_port_07(munoc_signal_06),
	.munoc_port_05(munoc_signal_10),
	.munoc_port_06(munoc_signal_04),

	.munoc_port_08(munoc_port_14),
	.munoc_port_00(munoc_port_10),
	.munoc_port_09(munoc_signal_03),
	.munoc_port_04(munoc_signal_13),
	.munoc_port_02(munoc_signal_12)
);

assign `MUNOC_GDEF_57(munoc_port_15,munoc_signal_14) = munoc_signal_12[`MUNOC_GDEF_37(MUNOC_GPARA_1,MUNOC_GPARA_4)-1-:`MUNOC_GDEF_96(MUNOC_GPARA_1)];

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_1); i=i+1)
	begin : i_unpack_data_and_strb
		assign {munoc_port_08[i],munoc_port_18[(i+1)*`BW_BYTE-1-:`BW_BYTE]} = munoc_signal_14[`MUNOC_GDEF_36(MUNOC_GPARA_1)-1-i*(`BW_BYTE+1)-:(`BW_BYTE+1)]; 
	end
endgenerate

endmodule
