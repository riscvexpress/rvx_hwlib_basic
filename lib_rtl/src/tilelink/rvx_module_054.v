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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "rvx_include_05.vh"
`include "ervp_axi_define.vh"




module RVX_MODULE_054 (
	rvx_port_27,
	rvx_port_20,

	rvx_port_00,
	rvx_port_11,
	rvx_port_25,
	rvx_port_06,
	rvx_port_18,
	rvx_port_10,

	rvx_port_05,
	rvx_port_22,
	rvx_port_04,
	rvx_port_02,

	rvx_port_19,
	rvx_port_14,
	rvx_port_03,
	rvx_port_01,
	rvx_port_26,
	rvx_port_12,

	rvx_port_23,
	rvx_port_17,
	rvx_port_24,
	rvx_port_21,
	rvx_port_08,
	rvx_port_07,
	rvx_port_09,
	rvx_port_13,
	rvx_port_15,
	rvx_port_16
);




parameter RVX_GPARA_5 = 1; 
parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 

localparam  RVX_LPARA_1 = (RVX_GPARA_5/8); 
localparam  RVX_LPARA_5 = `RVX_GDEF_393(RVX_GPARA_3,RVX_GPARA_4);

parameter RVX_GPARA_2 = 4;

localparam  RVX_LPARA_4 = RVX_GPARA_0;
localparam  RVX_LPARA_0 = RVX_GPARA_5;

input wire rvx_port_27, rvx_port_20;

input wire rvx_port_00;
input wire [RVX_LPARA_5-1:0] rvx_port_11;
output wire rvx_port_25;
input wire rvx_port_06;
input wire [RVX_LPARA_5-1:0] rvx_port_18;
output wire rvx_port_10;

input wire [RVX_GPARA_2-1:0] rvx_port_05;
input wire [`BW_AXI_BRESP-1:0] rvx_port_22;
input wire rvx_port_04;
output wire rvx_port_02;

input wire [RVX_GPARA_2-1:0] rvx_port_19;
input wire [RVX_LPARA_0-1:0] rvx_port_14;
input wire [`BW_AXI_RRESP-1:0] rvx_port_03;
input wire rvx_port_01;
input wire rvx_port_26;
output wire rvx_port_12;

input wire rvx_port_23;
output reg rvx_port_17;
output reg [`RVX_GDEF_260-1:0] rvx_port_24;
output wire [`RVX_GDEF_248-1:0] rvx_port_21;
output wire [RVX_GPARA_4-1:0] rvx_port_08;
output wire [RVX_GPARA_3-1:0] rvx_port_07;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
output wire rvx_port_13;
output wire [RVX_GPARA_5-1:0] rvx_port_15;
output reg rvx_port_16;

wire [`RVX_GDEF_321-1:0] rvx_signal_3;
wire [`RVX_GDEF_260-1:0] rvx_signal_0;
wire [RVX_GPARA_4-1:0] rvx_signal_1;
wire [RVX_GPARA_3-1:0] rvx_signal_6;

localparam  RVX_LPARA_6 = 2;
localparam  RVX_LPARA_3 = 0;
localparam  RVX_LPARA_2 = 1;
localparam  RVX_LPARA_7 = 2;

reg [RVX_LPARA_6-1:0] rvx_signal_8;

wire rvx_signal_5;
wire rvx_signal_2;
wire rvx_signal_7;

wire [`BW_AXI_RRESP-1:0] rvx_signal_4;

assign {rvx_signal_3,rvx_signal_0,rvx_signal_6,rvx_signal_1} = (rvx_signal_8==RVX_LPARA_2)? rvx_port_11 : rvx_port_18;

always@(posedge rvx_port_27, negedge rvx_port_20)
begin
	if(rvx_port_20==0)
		rvx_signal_8 <= RVX_LPARA_3;
	else
		case(rvx_signal_8)
			RVX_LPARA_3:
				if(rvx_signal_5)
					rvx_signal_8 <= RVX_LPARA_2;
				else if(rvx_signal_2)
					rvx_signal_8 <= RVX_LPARA_7;
			RVX_LPARA_2:
				if(rvx_signal_7 & rvx_port_01)
					rvx_signal_8 <= RVX_LPARA_3;
			RVX_LPARA_7:
				if(rvx_signal_7)
					rvx_signal_8 <= RVX_LPARA_3;
		endcase
end

assign rvx_signal_5 = (rvx_signal_8==RVX_LPARA_3) & rvx_port_00 & rvx_port_26;
assign rvx_signal_2 = (rvx_signal_8==RVX_LPARA_3) & rvx_port_06 & rvx_port_04;
assign rvx_signal_7 = rvx_port_17 & rvx_port_23;

always@(*)
begin
	rvx_port_17 = 0;
	case(rvx_signal_8)
		RVX_LPARA_3: rvx_port_17 = 0;
		RVX_LPARA_2: rvx_port_17 = rvx_port_26;
		RVX_LPARA_7: rvx_port_17 = rvx_port_04;
	endcase
end

always@(*)
begin
	rvx_port_24 = 0;
	case(rvx_signal_3)
		`RVX_GDEF_233:
			case(rvx_signal_0)
				4: rvx_port_24 = 1;
				6: rvx_port_24 = 5;
			endcase
		`RVX_GDEF_596:
			case(rvx_signal_0)
				7: rvx_port_24 = 6;
			endcase
	endcase
end

assign rvx_port_21 = 0;
assign rvx_port_08 = rvx_signal_1;
assign rvx_port_07 = rvx_signal_6;
assign rvx_port_09 = 0;
assign rvx_port_13 = 0;
assign rvx_port_15 = rvx_port_14;

assign rvx_signal_4 = (rvx_signal_8==RVX_LPARA_7)? rvx_port_22 : rvx_port_03;

always@(*)
begin
	rvx_port_16 = 0;
	case(rvx_signal_4)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			rvx_port_16 = 0;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			rvx_port_16 = 1;
	endcase
end

assign rvx_port_25 = (rvx_signal_8==RVX_LPARA_2) & rvx_signal_7 & rvx_port_01;
assign rvx_port_10 = (rvx_signal_8==RVX_LPARA_7) & rvx_signal_7;

assign rvx_port_12 = (rvx_signal_8==RVX_LPARA_2) & rvx_port_23;
assign rvx_port_02 = (rvx_signal_8==RVX_LPARA_7) & rvx_port_23;

endmodule
