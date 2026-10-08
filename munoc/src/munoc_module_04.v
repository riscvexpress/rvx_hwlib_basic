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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_00.vh"
`include "munoc_include_09.vh"





module MUNOC_MODULE_04
(
	munoc_port_04,
	munoc_port_11,
	munoc_port_14,
	munoc_port_02,

	munoc_port_12,
	munoc_port_00,
	munoc_port_16,

	munoc_port_05,
	munoc_port_10,
	munoc_port_08,

	munoc_port_01,
	munoc_port_17,
	munoc_port_13,

	munoc_port_03,
	munoc_port_15,
	munoc_port_09,

	munoc_port_06,
	munoc_port_07
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_5 = 8;
parameter MUNOC_GPARA_4 = 1;

parameter MUNOC_GPARA_3 = 1;
parameter MUNOC_GPARA_1 = 1;

input wire munoc_port_04, munoc_port_11;
input wire munoc_port_14, munoc_port_02;

input wire [`BW_BNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_12;
output wire munoc_port_00;
input wire munoc_port_16;

output reg munoc_port_05;
output reg munoc_port_10;
output wire munoc_port_08;

output wire [`BW_MASTER_NODE_ID-1:0] munoc_port_01;
output wire [MUNOC_GPARA_4-1:0] munoc_port_17;
output wire [`BW_AXI_BRESP-1:0] munoc_port_13;

output wire munoc_port_03;
output wire [`BW_AXI_RRESP-1:0] munoc_port_15;
output wire [MUNOC_GPARA_5-1:0] munoc_port_09;

input wire munoc_port_06;
input wire munoc_port_07;

genvar i;

wire munoc_signal_07;
wire munoc_signal_16;
wire munoc_signal_09;
wire [MUNOC_GPARA_0-1:0] munoc_signal_11;

wire munoc_signal_05;
wire munoc_signal_10;
wire munoc_signal_15;
wire [`MUNOC_GDEF_23(MUNOC_GPARA_0)-1:0] munoc_signal_08;
wire [`MUNOC_GDEF_23(MUNOC_GPARA_0)-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_40(MUNOC_GPARA_0)-1:0] munoc_signal_04;

wire munoc_signal_13;
wire munoc_signal_19;
wire munoc_signal_12;
wire [`MUNOC_GDEF_13(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_00;
wire [`MUNOC_GDEF_13(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_17;
wire [`MUNOC_GDEF_42(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_03;

wire munoc_signal_01;
wire [`MUNOC_GDEF_19-1:0] munoc_signal_18;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_06;
wire [MUNOC_GPARA_5-1:0] munoc_signal_14;

assign {munoc_signal_07,munoc_signal_16,munoc_signal_09,munoc_signal_11} = munoc_port_12;

MUNOC_MODULE_20
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_0),
	.MUNOC_GPARA_1(MUNOC_GPARA_2),
	.MUNOC_GPARA_2(MUNOC_GPARA_5)
)
i_munoc_instance_1
(
	.munoc_port_11(munoc_port_14),
	.munoc_port_03(munoc_port_02),

	.munoc_port_07(munoc_port_12),
	.munoc_port_18(munoc_port_00),
	.munoc_port_13(munoc_port_16),

	.munoc_port_14(munoc_signal_05),
	.munoc_port_00(munoc_signal_10),
	.munoc_port_17(munoc_signal_15),	
	.munoc_port_06(munoc_signal_13),
	.munoc_port_08(munoc_signal_19),
	.munoc_port_05(munoc_signal_12),

	.munoc_port_16(munoc_signal_08),
	.munoc_port_01(munoc_signal_02),
	.munoc_port_12(munoc_signal_00),
	.munoc_port_09(munoc_signal_17),

	.munoc_port_02(munoc_signal_01),
	.munoc_port_15(munoc_port_08),
	.munoc_port_10(munoc_port_06),
	.munoc_port_04(munoc_port_07)
);

MUNOC_MODULE_45
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_0),
	.MUNOC_GPARA_0(`MUNOC_GDEF_23(MUNOC_GPARA_0)),
	.MUNOC_GPARA_2(MUNOC_GPARA_3)
)
i_munoc_instance_0
(
	.munoc_port_05(munoc_port_14),
	.munoc_port_10(munoc_port_02),
	.munoc_port_03(munoc_signal_05),
	.munoc_port_04(munoc_signal_10),
	.munoc_port_06(munoc_signal_11),
	.munoc_port_00(munoc_signal_15),
	.munoc_port_07(munoc_port_04),
	.munoc_port_01(munoc_port_11),
	.munoc_port_02(munoc_signal_08),
	.munoc_port_09(munoc_signal_02),
	.munoc_port_08(munoc_signal_04)
);

assign `MUNOC_GDEF_04(munoc_port_01,munoc_signal_18,munoc_signal_06,munoc_port_13) = munoc_signal_04[`MUNOC_GDEF_40(MUNOC_GPARA_0)-1-:`MUNOC_GDEF_65];
assign munoc_port_17 = munoc_signal_06;

always@(posedge munoc_port_04, negedge munoc_port_11)
begin
	if(munoc_port_11==0)
	begin
		munoc_port_05 <= 0;
		munoc_port_10 <= 0;
	end
	else
	begin
		munoc_port_05 <= munoc_signal_01 & (munoc_signal_18==`MUNOC_GDEF_21);
		munoc_port_10 <= munoc_signal_01 & (munoc_signal_18==`MUNOC_GDEF_82);
	end
end

MUNOC_MODULE_45
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_0),
	.MUNOC_GPARA_0(`MUNOC_GDEF_13(MUNOC_GPARA_5,MUNOC_GPARA_0)),
	.MUNOC_GPARA_2(MUNOC_GPARA_1)
)
i_munoc_instance_2
(
	.munoc_port_05(munoc_port_14),
	.munoc_port_10(munoc_port_02),
	.munoc_port_03(munoc_signal_13),
	.munoc_port_04(munoc_signal_19),
	.munoc_port_06(munoc_signal_11),
	.munoc_port_00(munoc_signal_12),

	.munoc_port_07(munoc_port_04),
	.munoc_port_01(munoc_port_11),
	.munoc_port_02(munoc_signal_00),
	.munoc_port_09(munoc_signal_17),
	.munoc_port_08(munoc_signal_03)
);

assign `MUNOC_GDEF_38(munoc_port_03,munoc_port_15,munoc_signal_14) = munoc_signal_03[`MUNOC_GDEF_42(MUNOC_GPARA_5,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_95(MUNOC_GPARA_5)];

generate
	for(i=0; i<MUNOC_GPARA_5/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_port_09[MUNOC_GPARA_5-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_14[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

endmodule

