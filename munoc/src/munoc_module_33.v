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
`include "munoc_include_01.vh"





module MUNOC_MODULE_33
(
	munoc_port_15,
	munoc_port_13,

	munoc_port_10,
	munoc_port_01,
	munoc_port_08,

	munoc_port_07,
	munoc_port_14,
	munoc_port_09,

	munoc_port_03,
	munoc_port_12,
	munoc_port_05,

	munoc_port_04,
	munoc_port_02,
	munoc_port_11,

	munoc_port_06,
	munoc_port_00
);





parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = 1;

parameter MUNOC_GPARA_5 = 1;
parameter MUNOC_GPARA_3 = 1;

input wire munoc_port_15, munoc_port_13;

input wire [`BW_BNI_LINK(MUNOC_GPARA_4)-1:0] munoc_port_10;
output wire munoc_port_01;
input wire munoc_port_08;

output reg munoc_port_07;
output reg munoc_port_14;
output wire munoc_port_09;

output wire [`BW_MASTER_NODE_ID-1:0] munoc_port_03;
output wire [MUNOC_GPARA_1-1:0] munoc_port_12;
output wire [`BW_AXI_BRESP-1:0] munoc_port_05;

output wire munoc_port_04;
output wire [`BW_AXI_RRESP-1:0] munoc_port_02;
output wire [MUNOC_GPARA_0-1:0] munoc_port_11;

input wire munoc_port_06;
input wire munoc_port_00;

genvar i;

wire munoc_signal_11;
wire munoc_signal_17;
wire munoc_signal_12;
wire [MUNOC_GPARA_4-1:0] munoc_signal_10;

wire munoc_signal_14;
wire munoc_signal_09;
wire munoc_signal_00;
wire [`MUNOC_GDEF_97(MUNOC_GPARA_4)-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_97(MUNOC_GPARA_4)-1:0] munoc_signal_08;
wire [`MUNOC_GDEF_41(MUNOC_GPARA_4)-1:0] munoc_signal_15;

wire munoc_signal_18;
wire munoc_signal_05;
wire munoc_signal_03;
wire [`MUNOC_GDEF_01(MUNOC_GPARA_0,MUNOC_GPARA_4)-1:0] munoc_signal_16;
wire [`MUNOC_GDEF_01(MUNOC_GPARA_0,MUNOC_GPARA_4)-1:0] munoc_signal_19;
wire [`MUNOC_GDEF_72(MUNOC_GPARA_0,MUNOC_GPARA_4)-1:0] munoc_signal_07;

wire munoc_signal_01;
wire [`MUNOC_GDEF_52-1:0] munoc_signal_13;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_06;
wire [MUNOC_GPARA_0-1:0] munoc_signal_04;

assign {munoc_signal_11,munoc_signal_17,munoc_signal_12,munoc_signal_10} = munoc_port_10;

MUNOC_MODULE_19
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_1(MUNOC_GPARA_2),
	.MUNOC_GPARA_0(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_06(munoc_port_15),
	.munoc_port_16(munoc_port_13),

	.munoc_port_00(munoc_port_10),
	.munoc_port_05(munoc_port_01),
	.munoc_port_17(munoc_port_08),

	.munoc_port_03(munoc_signal_14),
	.munoc_port_08(munoc_signal_09),
	.munoc_port_01(munoc_signal_00),	
	.munoc_port_11(munoc_signal_18),
	.munoc_port_14(munoc_signal_05),
	.munoc_port_13(munoc_signal_03),

	.munoc_port_07(munoc_signal_02),
	.munoc_port_18(munoc_signal_08),
	.munoc_port_02(munoc_signal_16),
	.munoc_port_15(munoc_signal_19),

	.munoc_port_10(munoc_signal_01),
	.munoc_port_04(munoc_port_09),
	.munoc_port_09(munoc_port_06),
	.munoc_port_12(munoc_port_00)
);

MUNOC_MODULE_48
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`MUNOC_GDEF_97(MUNOC_GPARA_4)),
	.MUNOC_GPARA_1(MUNOC_GPARA_5)
)
i_munoc_instance_2
(
	.munoc_port_6(munoc_port_15),
	.munoc_port_0(munoc_port_13),
	.munoc_port_3(munoc_signal_14),
	.munoc_port_8(munoc_signal_09),
	.munoc_port_7(munoc_signal_10),
	.munoc_port_4(munoc_signal_00),
	.munoc_port_1(munoc_signal_02),
	.munoc_port_2(munoc_signal_08),
	.munoc_port_5(munoc_signal_15)
);

assign `MUNOC_GDEF_09(munoc_port_03,munoc_signal_13,munoc_signal_06,munoc_port_05) = munoc_signal_15[`MUNOC_GDEF_41(MUNOC_GPARA_4)-1-:`MUNOC_GDEF_93];
assign munoc_port_12 = munoc_signal_06;

always@(posedge munoc_port_15, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
	begin
		munoc_port_07 <= 0;
		munoc_port_14 <= 0;
	end
	else
	begin
		munoc_port_07 <= munoc_signal_01 & (munoc_signal_13==`MUNOC_GDEF_26);
		munoc_port_14 <= munoc_signal_01 & (munoc_signal_13==`MUNOC_GDEF_14);
	end
end

MUNOC_MODULE_48
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`MUNOC_GDEF_01(MUNOC_GPARA_0,MUNOC_GPARA_4)),
	.MUNOC_GPARA_1(MUNOC_GPARA_3)
)
i_munoc_instance_0
(
	.munoc_port_6(munoc_port_15),
	.munoc_port_0(munoc_port_13),
	.munoc_port_3(munoc_signal_18),
	.munoc_port_8(munoc_signal_05),
	.munoc_port_7(munoc_signal_10),
	.munoc_port_4(munoc_signal_03),
	.munoc_port_1(munoc_signal_16),
	.munoc_port_2(munoc_signal_19),
	.munoc_port_5(munoc_signal_07)
);

assign `MUNOC_GDEF_11(munoc_port_04,munoc_port_02,munoc_signal_04) = munoc_signal_07[`MUNOC_GDEF_72(MUNOC_GPARA_0,MUNOC_GPARA_4)-1-:`MUNOC_GDEF_77(MUNOC_GPARA_0)];

generate
	for(i=0; i<MUNOC_GPARA_0/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_port_11[MUNOC_GPARA_0-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_04[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

endmodule

