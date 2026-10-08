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
`include "munoc_include_10.vh"
`include "ervp_axi_define.vh"





module MUNOC_MODULE_08
(
	munoc_port_27,
	munoc_port_23,
	munoc_port_02,

	munoc_port_30,
	munoc_port_11,
	munoc_port_15,
	munoc_port_16,
	munoc_port_32,
	munoc_port_13,
	munoc_port_24,

	munoc_port_19,
	munoc_port_05,
	munoc_port_18,
	munoc_port_29,
	munoc_port_00,
	munoc_port_09, 

	munoc_port_17,
	munoc_port_36,
	munoc_port_08,
	munoc_port_12,

	munoc_port_22,
	munoc_port_01,
	munoc_port_25,
	munoc_port_07,
	munoc_port_21,
	munoc_port_20,
	munoc_port_34,

	munoc_port_31,
	munoc_port_14,
	munoc_port_03,
	munoc_port_33,
	munoc_port_26,
	munoc_port_35,

	munoc_port_28,
	munoc_port_04,
	munoc_port_06,
	munoc_port_10
);





parameter MUNOC_GPARA_3 = 32;
parameter MUNOC_GPARA_1 = 32;
parameter MUNOC_GPARA_6 = 4;
parameter MUNOC_GPARA_5 = 0;
parameter MUNOC_GPARA_4 = 1;

parameter MUNOC_GPARA_7 = 16;
parameter MUNOC_GPARA_2 = 500;
parameter MUNOC_GPARA_0 = 1;

parameter MUNOC_GPARA_8 = -1;

input wire munoc_port_27, munoc_port_23;
input wire munoc_port_02;

input wire [MUNOC_GPARA_6-1:0] munoc_port_30;
input wire [MUNOC_GPARA_3-1:0] munoc_port_11;
input wire [`BW_AXI_ALEN-1:0] munoc_port_15;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_16;
input wire [`BW_AXI_ABURST-1:0] munoc_port_32;
input wire munoc_port_13;
input wire munoc_port_24;

input wire [MUNOC_GPARA_6-1:0] munoc_port_19;
input wire [MUNOC_GPARA_1-1:0] munoc_port_05;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_18;
input wire munoc_port_29;
input wire munoc_port_00;
input wire munoc_port_09;

input wire [MUNOC_GPARA_6-1:0] munoc_port_17;
input wire [`BW_AXI_BRESP-1:0] munoc_port_36;
input wire munoc_port_08;
input wire munoc_port_12;

input wire [MUNOC_GPARA_6-1:0] munoc_port_22;
input wire [MUNOC_GPARA_3-1:0] munoc_port_01;
input wire [`BW_AXI_ALEN-1:0] munoc_port_25;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_07;
input wire [`BW_AXI_ABURST-1:0] munoc_port_21;
input wire munoc_port_20;
input wire munoc_port_34;

input wire [MUNOC_GPARA_6-1:0] munoc_port_31;
input wire [MUNOC_GPARA_1-1:0] munoc_port_14;
input wire [`BW_AXI_RRESP-1:0] munoc_port_03;
input wire munoc_port_33;
input wire munoc_port_26;
input wire munoc_port_35;

output reg [`MUNOC_GDEF_67-1:0] munoc_port_28;
output reg [`MUNOC_GDEF_67-1:0] munoc_port_04;
output wire [`MUNOC_GDEF_84-1:0] munoc_port_06;
output wire [`MUNOC_GDEF_03-1:0] munoc_port_10;

reg [MUNOC_GPARA_6-1:0] munoc_signal_42;
reg [MUNOC_GPARA_3-1:0] munoc_signal_29;
reg [`BW_AXI_ALEN-1:0] munoc_signal_44;
reg [`BW_AXI_ASIZE-1:0] munoc_signal_43;
reg [`BW_AXI_ABURST-1:0] munoc_signal_13;
reg munoc_signal_36;
reg munoc_signal_20;

reg [MUNOC_GPARA_6-1:0] munoc_signal_23;
reg [MUNOC_GPARA_1-1:0] munoc_signal_45;
reg [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_07;
reg munoc_signal_15;
reg munoc_signal_32;
reg munoc_signal_03;

reg [MUNOC_GPARA_6-1:0] munoc_signal_39;
reg [`BW_AXI_BRESP-1:0] munoc_signal_33;
reg munoc_signal_22;
reg munoc_signal_21;

reg [MUNOC_GPARA_6-1:0] munoc_signal_35;
reg [MUNOC_GPARA_3-1:0] munoc_signal_24;
reg [`BW_AXI_ALEN-1:0] munoc_signal_06;
reg [`BW_AXI_ASIZE-1:0] munoc_signal_17;
reg [`BW_AXI_ABURST-1:0] munoc_signal_40;
reg munoc_signal_28;
reg munoc_signal_25;

reg [MUNOC_GPARA_6-1:0] munoc_signal_08;
reg [MUNOC_GPARA_1-1:0] munoc_signal_04;
reg [`BW_AXI_RRESP-1:0] munoc_signal_02;
reg munoc_signal_34;
reg munoc_signal_27;
reg munoc_signal_41;

wire munoc_signal_31;
wire munoc_signal_30;
wire munoc_signal_14;
wire munoc_signal_05;
wire munoc_signal_00;

wire munoc_signal_01;
wire munoc_signal_37;
wire munoc_signal_11;
reg munoc_signal_19;
reg munoc_signal_18;

wire munoc_signal_26, munoc_signal_09, munoc_signal_10;

wire munoc_signal_12, munoc_signal_38;
reg munoc_signal_16;

always @(posedge munoc_port_27 or negedge munoc_port_23)
begin
	if(munoc_port_23==0)
		{munoc_signal_42,
		munoc_signal_29,
		munoc_signal_44,
		munoc_signal_43,
		munoc_signal_13,
		munoc_signal_36,
		munoc_signal_20,

		munoc_signal_23,
		munoc_signal_45,
		munoc_signal_07,
		munoc_signal_15,
		munoc_signal_32,
		munoc_signal_03, 

		munoc_signal_39,
		munoc_signal_33,
		munoc_signal_22,
		munoc_signal_21,

		munoc_signal_35,
		munoc_signal_24,
		munoc_signal_06,
		munoc_signal_17,
		munoc_signal_40,
		munoc_signal_28,
		munoc_signal_25,

		munoc_signal_08,
		munoc_signal_04,
		munoc_signal_02,
		munoc_signal_34,
		munoc_signal_27,
		munoc_signal_41} <= 0;
	else if(munoc_port_02)
		{munoc_signal_42,
		munoc_signal_29,
		munoc_signal_44,
		munoc_signal_43,
		munoc_signal_13,
		munoc_signal_36,
		munoc_signal_20,

		munoc_signal_23,
		munoc_signal_45,
		munoc_signal_07,
		munoc_signal_15,
		munoc_signal_32,
		munoc_signal_03, 

		munoc_signal_39,
		munoc_signal_33,
		munoc_signal_22,
		munoc_signal_21,

		munoc_signal_35,
		munoc_signal_24,
		munoc_signal_06,
		munoc_signal_17,
		munoc_signal_40,
		munoc_signal_28,
		munoc_signal_25,

		munoc_signal_08,
		munoc_signal_04,
		munoc_signal_02,
		munoc_signal_34,
		munoc_signal_27,
		munoc_signal_41}
			<=
		{munoc_port_30,
		munoc_port_11,
		munoc_port_15,
		munoc_port_16,
		munoc_port_32,
		munoc_port_13,
		munoc_port_24,

		munoc_port_19,
		munoc_port_05,
		munoc_port_18,
		munoc_port_29,
		munoc_port_00,
		munoc_port_09, 

		munoc_port_17,
		munoc_port_36,
		munoc_port_08,
		munoc_port_12,

		munoc_port_22,
		munoc_port_01,
		munoc_port_25,
		munoc_port_07,
		munoc_port_21,
		munoc_port_20,
		munoc_port_34,

		munoc_port_31,
		munoc_port_14,
		munoc_port_03,
		munoc_port_33,
		munoc_port_26,
		munoc_port_35};
end

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_04
	(
		.munoc_port_2(munoc_port_27),
		.munoc_port_5(munoc_port_23),
		.munoc_port_1(munoc_port_02),
		.munoc_port_0(munoc_signal_36),
		.munoc_port_3(munoc_signal_20),
		.munoc_port_6(munoc_signal_31),
		.munoc_port_4(),
		.munoc_port_7()
	);

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_07
	(
		.munoc_port_2(munoc_port_27),
		.munoc_port_5(munoc_port_23),
		.munoc_port_1(munoc_port_02),
		.munoc_port_0(munoc_signal_32),
		.munoc_port_3(munoc_signal_03),
		.munoc_port_6(munoc_signal_30),
		.munoc_port_4(),
		.munoc_port_7()
	);

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_09
	(
		.munoc_port_2(munoc_port_27),
		.munoc_port_5(munoc_port_23),
		.munoc_port_1(munoc_port_02),
		.munoc_port_0(munoc_signal_22),
		.munoc_port_3(munoc_signal_21),
		.munoc_port_6(munoc_signal_14),
		.munoc_port_4(),
		.munoc_port_7()
	);

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_10
	(
		.munoc_port_2(munoc_port_27),
		.munoc_port_5(munoc_port_23),
		.munoc_port_1(munoc_port_02),
		.munoc_port_0(munoc_signal_28),
		.munoc_port_3(munoc_signal_25),
		.munoc_port_6(munoc_signal_05),
		.munoc_port_4(),
		.munoc_port_7()
	);

	MUNOC_MODULE_40
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_2(MUNOC_GPARA_2)
	)
	i_munoc_instance_08
	(
		.munoc_port_2(munoc_port_27),
		.munoc_port_5(munoc_port_23),
		.munoc_port_1(munoc_port_02),
		.munoc_port_0(munoc_signal_27),
		.munoc_port_3(munoc_signal_41),
		.munoc_port_6(munoc_signal_00),
		.munoc_port_4(),
		.munoc_port_7()
	);

	MUNOC_MODULE_24
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_2),
		.MUNOC_GPARA_2(6),
		.MUNOC_GPARA_4(1)
	)
	i_munoc_instance_06
	(
		.munoc_port_7(munoc_port_27),
		.munoc_port_4(munoc_port_23),
		.munoc_port_8(munoc_port_02),
		.munoc_port_6(munoc_signal_36 & munoc_signal_20),
		.munoc_port_5(munoc_signal_32 & munoc_signal_03 & munoc_signal_19),
		.munoc_port_3(munoc_signal_26),
		.munoc_port_0(munoc_signal_01),
		.munoc_port_1(),
		.munoc_port_2()
	);

	always @(posedge munoc_port_27 or negedge munoc_port_23)
	begin
		if(munoc_port_23==0)
			munoc_signal_19 <= 1;
		else if(munoc_port_02)
		begin
			if(munoc_signal_32 & munoc_signal_03)
			begin
				if(munoc_signal_15)
					munoc_signal_19 <= 1;
				else
					munoc_signal_19 <= 0;
			end
		end
	end

	MUNOC_MODULE_24
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_2),
		.MUNOC_GPARA_2(6)
	)
	i_munoc_instance_02
	(
		.munoc_port_7(munoc_port_27),
		.munoc_port_4(munoc_port_23),
		.munoc_port_8(munoc_port_02),
		.munoc_port_6((MUNOC_GPARA_0==1) & munoc_signal_32 & munoc_signal_03 & munoc_signal_15),
		.munoc_port_5((MUNOC_GPARA_0==1) & munoc_signal_22 & munoc_signal_21),
		.munoc_port_3(munoc_signal_09),
		.munoc_port_0(munoc_signal_37),
		.munoc_port_1(),
		.munoc_port_2()
	);

	always @(posedge munoc_port_27 or negedge munoc_port_23)
	begin
		if(munoc_port_23==0)
			munoc_signal_18 <= 1;
		else if(munoc_port_02)
		begin
			if(munoc_signal_27 & munoc_signal_41)
			begin
				if(munoc_signal_34)
					munoc_signal_18 <= 1;
				else
					munoc_signal_18 <= 0;
			end
		end
	end

	MUNOC_MODULE_24
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_2),
		.MUNOC_GPARA_2(6)
	)
	i_munoc_instance_00
	(
		.munoc_port_7(munoc_port_27),
		.munoc_port_4(munoc_port_23),
		.munoc_port_8(munoc_port_02),
		.munoc_port_6(munoc_signal_28 & munoc_signal_25),
		.munoc_port_5(munoc_signal_27 & munoc_signal_41 & munoc_signal_18),
		.munoc_port_3(munoc_signal_10),
		.munoc_port_0(munoc_signal_11),
		.munoc_port_1(),
		.munoc_port_2()
	);
`else
	assign {munoc_signal_31,munoc_signal_30,munoc_signal_14,munoc_signal_05,munoc_signal_00} = 0;
	assign {munoc_signal_01,munoc_signal_37,munoc_signal_11} = 0;
`endif

always@(*)
begin
	munoc_port_28 = 0;
	munoc_port_04 = 0;
	if(MUNOC_GPARA_8==1)
	begin
		munoc_port_28 = {munoc_signal_00,munoc_signal_14,munoc_signal_01};
		munoc_port_04 = {munoc_signal_31,munoc_signal_30,munoc_signal_05,munoc_signal_37,munoc_signal_11};
	end
	else
		munoc_port_28 = {munoc_signal_31,munoc_signal_30,munoc_signal_05,munoc_signal_37,munoc_signal_11};
		munoc_port_04 = {munoc_signal_00,munoc_signal_14,munoc_signal_01};
	begin
	end
end

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	MUNOC_MODULE_24
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_2),
		.MUNOC_GPARA_2(6)
	)
	i_munoc_instance_05
	(
		.munoc_port_7(munoc_port_27),
		.munoc_port_4(munoc_port_23),
		.munoc_port_8(munoc_port_02),
		.munoc_port_6(munoc_signal_36 & munoc_signal_20),
		.munoc_port_5((MUNOC_GPARA_0==1)? (munoc_signal_22 & munoc_signal_21) : (munoc_signal_32 & munoc_signal_03 & munoc_signal_15)),
		.munoc_port_3(munoc_signal_38),
		.munoc_port_0(),
		.munoc_port_1(),
		.munoc_port_2()
	);

	MUNOC_MODULE_24
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_2),
		.MUNOC_GPARA_2(6)
	)
	i_munoc_instance_03
	(
		.munoc_port_7(munoc_port_27),
		.munoc_port_4(munoc_port_23),
		.munoc_port_8(munoc_port_02),
		.munoc_port_6(munoc_signal_28 & munoc_signal_25),
		.munoc_port_5(munoc_signal_27 & munoc_signal_41 & munoc_signal_34),
		.munoc_port_3(munoc_signal_12),
		.munoc_port_0(),
		.munoc_port_1(),
		.munoc_port_2()
	);

	always@(*)
	begin
		munoc_signal_16 = 1;
		if(munoc_signal_28)
			munoc_signal_16 = 0;
		else if(munoc_signal_36)
			munoc_signal_16 = 0;
		else if(munoc_signal_32)
			munoc_signal_16 = 0;
		else if(~munoc_signal_38)
			munoc_signal_16 = 0;
		else if(~munoc_signal_12)
			munoc_signal_16 = 0;
	end

	MUNOC_MODULE_36
	#(
		.MUNOC_GPARA_0(`MUNOC_GDEF_84),
		.MUNOC_GPARA_1(`MUNOC_GDEF_45),
		.MUNOC_GPARA_2(`MUNOC_GDEF_75)
		)
	i_munoc_instance_11
	(
		.munoc_port_0(munoc_port_27),
		.munoc_port_1(munoc_port_23),
		.munoc_port_4(munoc_port_02),
		.munoc_port_2(munoc_signal_16),
		.munoc_port_3(munoc_port_06)
	);
`else
	assign munoc_port_06 = 0;
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER

	MUNOC_MODULE_30
	#(
		.MUNOC_GPARA_0(MUNOC_GPARA_3),
		.MUNOC_GPARA_3(MUNOC_GPARA_1),
		.MUNOC_GPARA_1(MUNOC_GPARA_6),
		.MUNOC_GPARA_2(MUNOC_GPARA_5)
	)
	i_munoc_instance_01
	(
		.munoc_port_08(munoc_port_27),
		.munoc_port_30(munoc_port_23),
		.munoc_port_04((MUNOC_GPARA_4==1) & munoc_port_02),

		.munoc_port_06(munoc_signal_42),
		.munoc_port_19(munoc_signal_29),
		.munoc_port_33(munoc_signal_44),
		.munoc_port_23(munoc_signal_43),
		.munoc_port_17(munoc_signal_13),
		.munoc_port_22(munoc_signal_36),
		.munoc_port_15(munoc_signal_20),

		.munoc_port_13(munoc_signal_23),
		.munoc_port_14(munoc_signal_45),
		.munoc_port_24(munoc_signal_07),
		.munoc_port_32(munoc_signal_15),
		.munoc_port_26(munoc_signal_32),
		.munoc_port_02(munoc_signal_03), 

		.munoc_port_21(munoc_signal_39),
		.munoc_port_00(munoc_signal_33),
		.munoc_port_27(munoc_signal_22),
		.munoc_port_20(munoc_signal_21),

		.munoc_port_29(munoc_signal_35),
		.munoc_port_07(munoc_signal_24),
		.munoc_port_03(munoc_signal_06),
		.munoc_port_11(munoc_signal_17),
		.munoc_port_10(munoc_signal_40),
		.munoc_port_25(munoc_signal_28),
		.munoc_port_28(munoc_signal_25),

		.munoc_port_16(munoc_signal_08),
		.munoc_port_31(munoc_signal_04),
		.munoc_port_12(munoc_signal_02),
		.munoc_port_09(munoc_signal_34),
		.munoc_port_01(munoc_signal_27),
		.munoc_port_05(munoc_signal_41),

		.munoc_port_18(munoc_port_10)
	);

`else
	assign munoc_port_10 = 0;
`endif

endmodule

