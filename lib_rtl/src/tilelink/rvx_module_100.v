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
`include "rvx_include_22.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_100 (
	rvx_port_29,
	rvx_port_06,

	rvx_port_47,
	rvx_port_19,
	rvx_port_40,
	rvx_port_30,
	rvx_port_28,
	rvx_port_35,
	rvx_port_13,
	rvx_port_26,
	rvx_port_21,
	rvx_port_39,

	rvx_port_46,
	rvx_port_11,
	rvx_port_43,
	rvx_port_22,
	rvx_port_18,
	rvx_port_44,
	rvx_port_32,
	rvx_port_07,
	rvx_port_24,
	rvx_port_03,

	rvx_port_02,
	rvx_port_01,
	rvx_port_33,
	rvx_port_34,
	rvx_port_38,
	rvx_port_10,

	rvx_port_17,
	rvx_port_41,
	rvx_port_31,
	rvx_port_16,
	rvx_port_04,
	rvx_port_14,
	rvx_port_09,

	rvx_port_08,
	rvx_port_42,
	rvx_port_45,
	rvx_port_23,
	rvx_port_36,
	rvx_port_05,

	rvx_port_25,
	rvx_port_37,
	rvx_port_12,
	rvx_port_15,
	rvx_port_00,
	rvx_port_20,
	rvx_port_27
);





parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 
parameter RVX_GPARA_5 = 1; 

localparam  RVX_LPARA_0 = (RVX_GPARA_0/8); 
localparam  RVX_LPARA_3 = `RVX_GDEF_475(RVX_GPARA_4,RVX_GPARA_1);

parameter RVX_GPARA_2 = 4;

localparam  RVX_LPARA_1 = RVX_GPARA_3;
localparam  RVX_LPARA_2 = RVX_GPARA_0;

input wire rvx_port_29, rvx_port_06;

output wire rvx_port_47;
input wire rvx_port_19;
input wire [`RVX_GDEF_419-1:0] rvx_port_40;
input wire [`RVX_GDEF_222-1:0] rvx_port_30;
input wire [RVX_GPARA_1-1:0] rvx_port_28;
input wire [RVX_GPARA_4-1:0] rvx_port_35;
input wire [RVX_GPARA_3-1:0] rvx_port_13;
input wire [RVX_LPARA_0-1:0] rvx_port_26;
input wire [RVX_GPARA_0-1:0] rvx_port_21;
input wire rvx_port_39;

output wire rvx_port_46;
input wire rvx_port_11;
input wire [`RVX_GDEF_419-1:0] rvx_port_43;
input wire [`RVX_GDEF_222-1:0] rvx_port_22;
input wire [RVX_GPARA_1-1:0] rvx_port_18;
input wire [RVX_GPARA_4-1:0] rvx_port_44;
input wire [RVX_GPARA_3-1:0] rvx_port_32;
input wire [RVX_LPARA_0-1:0] rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_24;
input wire rvx_port_03;

input wire rvx_port_02;
output wire rvx_port_01;
output wire [RVX_LPARA_3-1:0] rvx_port_33;
input wire rvx_port_34;
output wire rvx_port_38;
output wire [RVX_LPARA_3-1:0] rvx_port_10;

output wire [RVX_GPARA_2-1:0] rvx_port_17;
output wire [RVX_LPARA_1-1:0] rvx_port_41;
output wire [`BW_AXI_ALEN-1:0] rvx_port_31;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_16;
output wire [`BW_AXI_ABURST-1:0] rvx_port_04;
output wire rvx_port_14;
input wire rvx_port_09;

output wire [RVX_GPARA_2-1:0] rvx_port_08;
output wire [RVX_LPARA_2-1:0] rvx_port_42;
output wire [`BW_AXI_WSTRB(RVX_LPARA_2)-1:0] rvx_port_45;
output wire rvx_port_23;
output wire rvx_port_36;
input wire rvx_port_05;

output wire [RVX_GPARA_2-1:0] rvx_port_25;
output wire [RVX_LPARA_1-1:0] rvx_port_37;
output wire [`BW_AXI_ALEN-1:0] rvx_port_12;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_15;
output wire [`BW_AXI_ABURST-1:0] rvx_port_00;
output wire rvx_port_20;
input wire rvx_port_27;

wire [`RVX_GDEF_336-1:0] rvx_signal_31;
wire rvx_signal_02;
wire [`RVX_GDEF_419-1:0] rvx_signal_11;
wire [`RVX_GDEF_222-1:0] rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_06;
wire [RVX_GPARA_4-1:0] rvx_signal_01;
wire [RVX_GPARA_3-1:0] rvx_signal_12;
wire [RVX_LPARA_0-1:0] rvx_signal_04;
wire [RVX_GPARA_0-1:0] rvx_signal_19;
wire rvx_signal_23;
wire rvx_signal_14;
wire rvx_signal_05;
wire rvx_signal_03;

reg rvx_signal_13;
reg rvx_signal_21;
reg rvx_signal_08;

reg [`BW_AXI_ALEN-1:0] rvx_signal_24, rvx_signal_00;
reg [`BW_AXI_ASIZE-1:0] rvx_signal_22, rvx_signal_28;
reg [`BW_AXI_ABURST-1:0] rvx_signal_17, rvx_signal_18;
reg rvx_signal_07;

wire [RVX_GPARA_2-1:0] rvx_signal_27;

`define RVX_LDEF_2 3
`define RVX_LDEF_3 0
`define RVX_LDEF_1 1
`define RVX_LDEF_0 2
`define RVX_LDEF_5 3
`define RVX_LDEF_4 4

reg [`RVX_LDEF_2-1:0] rvx_signal_26;
wire rvx_signal_09;
wire rvx_signal_15, rvx_signal_29;
wire rvx_signal_10;
wire rvx_signal_30;
wire rvx_signal_25;
reg [`BW_AXI_ALEN-1:0] rvx_signal_20;

RVX_MODULE_083
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.RVX_GPARA_3(RVX_GPARA_3),
	.RVX_GPARA_2(RVX_GPARA_4),
	.RVX_GPARA_4(RVX_GPARA_1),
	.RVX_GPARA_1(RVX_GPARA_5)
)
i_rvx_instance_0
(
	.rvx_port_22(rvx_port_29),
	.rvx_port_31(rvx_port_06),

	.rvx_port_20(rvx_port_47),
	.rvx_port_33(rvx_port_19),
	.rvx_port_00(rvx_port_40),
	.rvx_port_15(rvx_port_30),
	.rvx_port_21(rvx_port_28),
	.rvx_port_14(rvx_port_35),
	.rvx_port_28(rvx_port_13),
	.rvx_port_06(rvx_port_26),
	.rvx_port_10(rvx_port_21),
	.rvx_port_04(rvx_port_39),

	.rvx_port_24(rvx_port_46),
	.rvx_port_02(rvx_port_11),
	.rvx_port_19(rvx_port_43),
	.rvx_port_29(rvx_port_22),
	.rvx_port_25(rvx_port_18),
	.rvx_port_17(rvx_port_44),
	.rvx_port_07(rvx_port_32),
	.rvx_port_27(rvx_port_07),
	.rvx_port_05(rvx_port_24),
	.rvx_port_12(rvx_port_03),

	.rvx_port_01(rvx_signal_02),
	.rvx_port_23(rvx_signal_31),
	.rvx_port_26(rvx_signal_11),
	.rvx_port_32(rvx_signal_16),
	.rvx_port_30(rvx_signal_06),
	.rvx_port_13(rvx_signal_01),
	.rvx_port_11(rvx_signal_12),
	.rvx_port_09(rvx_signal_04),
	.rvx_port_03(rvx_signal_19),
	.rvx_port_34(rvx_signal_23),
	.rvx_port_18(rvx_signal_14),
	.rvx_port_16(rvx_signal_05),
	.rvx_port_08(rvx_signal_03)
);

always@(*)
begin
	rvx_signal_13 = 0;
	rvx_signal_21 = 0;
	rvx_signal_08 = 0;
	case(rvx_signal_31)
		`RVX_GDEF_549:
			case(rvx_signal_11)
				4,6: rvx_signal_13 = 1;
				0,1: rvx_signal_21 = 1;
				default: rvx_signal_08 = 1;
			endcase
		`RVX_GDEF_128:
			case(rvx_signal_11)
				1: rvx_signal_13 = 1;
				0,7: rvx_signal_21 = 1;
				default: rvx_signal_08 = 1;
			endcase
		default: rvx_signal_08 = 1;
	endcase
end

always@(posedge rvx_port_29, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_26 <= `RVX_LDEF_3;
	else if(rvx_signal_09)
		rvx_signal_26 <= `RVX_LDEF_4;
	else
		case(rvx_signal_26)
			`RVX_LDEF_3:
				if(rvx_signal_15)
					rvx_signal_26 <= `RVX_LDEF_1;
				else if(rvx_signal_29)
					rvx_signal_26 <= `RVX_LDEF_0;
			`RVX_LDEF_1:
				if(rvx_signal_10)
					rvx_signal_26 <= `RVX_LDEF_3;
			`RVX_LDEF_0:
				if(rvx_signal_30)
					rvx_signal_26 <= `RVX_LDEF_5;
			`RVX_LDEF_5:
				if(rvx_signal_25 & rvx_port_23)
					rvx_signal_26 <= `RVX_LDEF_3;
		endcase
end

assign rvx_signal_09 = rvx_signal_02 & (rvx_signal_08|rvx_signal_07);
assign rvx_signal_15 = (rvx_signal_26==`RVX_LDEF_3) & rvx_port_02 & rvx_signal_02 & rvx_signal_13;
assign rvx_signal_29 = (rvx_signal_26==`RVX_LDEF_3) & rvx_port_34 & rvx_signal_02 & rvx_signal_21;

assign rvx_signal_10 = rvx_port_20 & rvx_port_27;
assign rvx_signal_30 = rvx_port_14 & rvx_port_09;
assign rvx_signal_25 = rvx_port_36 & rvx_port_05;

always@(*)
begin
	rvx_signal_24 = 0;
	rvx_signal_22 = 0;
	rvx_signal_17 = 0;
	rvx_signal_07 = 0;
	case(rvx_signal_06)
		0,1,2:
		begin
			rvx_signal_17 = `AXI_BURST_FIXED;
			rvx_signal_22 = rvx_signal_06;
		end
		3,4,5,6:
		begin
			rvx_signal_17 = `AXI_BURST_INCR;
			rvx_signal_22 = `AXI_SIZE_004BYTE;
		end
		default:
			rvx_signal_07 = 1;
	endcase
	case(rvx_signal_06)
		0,1,2: rvx_signal_24 = `AXI_LENGTH_01;
		3: rvx_signal_24 = `AXI_LENGTH_02;
		4: rvx_signal_24 = `AXI_LENGTH_04;
		5: rvx_signal_24 = `AXI_LENGTH_08;
		6: rvx_signal_24 = `AXI_LENGTH_16;
	endcase
end

always@(posedge rvx_port_29, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
	begin
		rvx_signal_00 <= 0;
		rvx_signal_28 <= 0;
		rvx_signal_18 <= 0;
	end
	else if(rvx_signal_15 | rvx_signal_29)
	begin
		rvx_signal_00 <= rvx_signal_24;
		rvx_signal_28 <= rvx_signal_22;
		rvx_signal_18 <= rvx_signal_17;
	end
end

always@(posedge rvx_port_29, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_20 <= 0;
	else if(rvx_signal_29)
		rvx_signal_20 <= rvx_signal_24;
	else if(rvx_signal_26==`RVX_LDEF_5)
	begin
		if(rvx_signal_25)
			rvx_signal_20 <= $unsigned(rvx_signal_20) - 1;
	end
end

assign rvx_signal_27 = 0;

assign rvx_port_25 = $unsigned(rvx_signal_27);
assign rvx_port_37 = rvx_signal_12;
assign rvx_port_12 = rvx_signal_00;
assign rvx_port_15 = rvx_signal_28;
assign rvx_port_00 = rvx_signal_18;
assign rvx_port_20 = (rvx_signal_26==`RVX_LDEF_1) & rvx_signal_02;

assign rvx_port_17 = $unsigned(rvx_signal_27);
assign rvx_port_41 = rvx_signal_12;
assign rvx_port_31 = rvx_signal_00;
assign rvx_port_16 = rvx_signal_28;
assign rvx_port_04 = rvx_signal_18;
assign rvx_port_14 = (rvx_signal_26==`RVX_LDEF_0) & rvx_signal_02;

assign rvx_port_08 = $unsigned(rvx_signal_27);
assign rvx_port_42 = rvx_signal_19;
assign rvx_port_45 = rvx_signal_04;
assign rvx_port_23 = (rvx_signal_20==0);
assign rvx_port_36 = (rvx_signal_26==`RVX_LDEF_5) & rvx_signal_02;

assign rvx_signal_14 = rvx_signal_15 | rvx_signal_29;
assign rvx_signal_05 = ((rvx_signal_26==`RVX_LDEF_1) & rvx_port_27) | ((rvx_signal_26==`RVX_LDEF_5) & rvx_port_05);
assign rvx_signal_03 = (rvx_signal_26==`RVX_LDEF_1) | ((rvx_signal_26==`RVX_LDEF_5) & rvx_port_23);

assign rvx_port_01 = rvx_signal_10;
assign rvx_port_33 = {rvx_signal_31,rvx_signal_11,rvx_signal_01,rvx_signal_06};

assign rvx_port_38 = rvx_signal_25 & rvx_port_23;
assign rvx_port_10 = {rvx_signal_31,rvx_signal_11,rvx_signal_01,rvx_signal_06};

`undef RVX_LDEF_5
`undef RVX_LDEF_4
`undef RVX_LDEF_2
`undef RVX_LDEF_3
`undef RVX_LDEF_0
`undef RVX_LDEF_1
endmodule
