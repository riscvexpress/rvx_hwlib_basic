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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "rvx_include_05.vh"
`include "ervp_axi_define.vh"




module RVX_MODULE_017 (
	rvx_port_16,
	rvx_port_09,

	rvx_port_13,
	rvx_port_04,
	rvx_port_18,
	rvx_port_00,
	rvx_port_07,
	rvx_port_02,

	rvx_port_01,
	rvx_port_03,
	rvx_port_10,
	rvx_port_24,

	rvx_port_21,
	rvx_port_14,
	rvx_port_20,
	rvx_port_15,
	rvx_port_22,
	rvx_port_11,

	rvx_port_05,
	rvx_port_19,
	rvx_port_27,
	rvx_port_25,
	rvx_port_17,
	rvx_port_12,
	rvx_port_23,
	rvx_port_08,
	rvx_port_06,
	rvx_port_26
);




parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_1 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_5 = 1; 

localparam  RVX_LPARA_1 = (RVX_GPARA_2/8); 
localparam  RVX_LPARA_2 = `RVX_GDEF_191(RVX_GPARA_3,RVX_GPARA_4);

parameter RVX_GPARA_0 = 4;

localparam  RVX_LPARA_4 = RVX_GPARA_1;
localparam  RVX_LPARA_5 = RVX_GPARA_2;

input wire rvx_port_16, rvx_port_09;

input wire rvx_port_13;
input wire [RVX_LPARA_2-1:0] rvx_port_04;
output wire rvx_port_18;
input wire rvx_port_00;
input wire [RVX_LPARA_2-1:0] rvx_port_07;
output wire rvx_port_02;

input wire [RVX_GPARA_0-1:0] rvx_port_01;
input wire [`BW_AXI_BRESP-1:0] rvx_port_03;
input wire rvx_port_10;
output wire rvx_port_24;

input wire [RVX_GPARA_0-1:0] rvx_port_21;
input wire [RVX_LPARA_5-1:0] rvx_port_14;
input wire [`BW_AXI_RRESP-1:0] rvx_port_20;
input wire rvx_port_15;
input wire rvx_port_22;
output wire rvx_port_11;

input wire rvx_port_05;
output reg rvx_port_19;
output reg [`RVX_GDEF_144-1:0] rvx_port_27;
output wire [`RVX_GDEF_440-1:0] rvx_port_25;
output wire [RVX_GPARA_4-1:0] rvx_port_17;
output wire [RVX_GPARA_3-1:0] rvx_port_12;
output wire [RVX_GPARA_5-1:0] rvx_port_23;
output wire rvx_port_08;
output wire [RVX_GPARA_2-1:0] rvx_port_06;
output reg rvx_port_26;

wire [`RVX_GDEF_376-1:0] rvx_signal_1;
wire [`RVX_GDEF_144-1:0] rvx_signal_4;
wire [RVX_GPARA_4-1:0] rvx_signal_2;
wire [RVX_GPARA_3-1:0] rvx_signal_5;

localparam  RVX_LPARA_3 = 2;
localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_6 = 1;
localparam  RVX_LPARA_7 = 2;

reg [RVX_LPARA_3-1:0] rvx_signal_3;

wire rvx_signal_6;
wire rvx_signal_7;
wire rvx_signal_8;

wire [`BW_AXI_RRESP-1:0] rvx_signal_0;

assign {rvx_signal_1,rvx_signal_4,rvx_signal_5,rvx_signal_2} = (rvx_signal_3==RVX_LPARA_6)? rvx_port_04 : rvx_port_07;

always@(posedge rvx_port_16, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
		rvx_signal_3 <= RVX_LPARA_0;
	else
		case(rvx_signal_3)
			RVX_LPARA_0:
				if(rvx_signal_6)
					rvx_signal_3 <= RVX_LPARA_6;
				else if(rvx_signal_7)
					rvx_signal_3 <= RVX_LPARA_7;
			RVX_LPARA_6:
				if(rvx_signal_8 & rvx_port_15)
					rvx_signal_3 <= RVX_LPARA_0;
			RVX_LPARA_7:
				if(rvx_signal_8)
					rvx_signal_3 <= RVX_LPARA_0;
		endcase
end

assign rvx_signal_6 = (rvx_signal_3==RVX_LPARA_0) & rvx_port_13 & rvx_port_22;
assign rvx_signal_7 = (rvx_signal_3==RVX_LPARA_0) & rvx_port_00 & rvx_port_10;
assign rvx_signal_8 = rvx_port_19 & rvx_port_05;

always@(*)
begin
	rvx_port_19 = 0;
	case(rvx_signal_3)
		RVX_LPARA_0: rvx_port_19 = 0;
		RVX_LPARA_6: rvx_port_19 = rvx_port_22;
		RVX_LPARA_7: rvx_port_19 = rvx_port_10;
	endcase
end

always@(*)
begin
	rvx_port_27 = 0;
	case(rvx_signal_1)
		`RVX_GDEF_486:
			case(rvx_signal_4)
				4: rvx_port_27 = 1;
				6: rvx_port_27 = 5;
			endcase
		`RVX_GDEF_474:
			case(rvx_signal_4)
				7: rvx_port_27 = 6;
			endcase
	endcase
end

assign rvx_port_25 = 0;
assign rvx_port_17 = rvx_signal_2;
assign rvx_port_12 = rvx_signal_5;
assign rvx_port_23 = 0;
assign rvx_port_08 = 0;
assign rvx_port_06 = rvx_port_14;

assign rvx_signal_0 = (rvx_signal_3==RVX_LPARA_7)? rvx_port_03 : rvx_port_20;

always@(*)
begin
	rvx_port_26 = 0;
	case(rvx_signal_0)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			rvx_port_26 = 0;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			rvx_port_26 = 1;
	endcase
end

assign rvx_port_18 = (rvx_signal_3==RVX_LPARA_6) & rvx_signal_8 & rvx_port_15;
assign rvx_port_02 = (rvx_signal_3==RVX_LPARA_7) & rvx_signal_8;

assign rvx_port_11 = (rvx_signal_3==RVX_LPARA_6) & rvx_port_05;
assign rvx_port_24 = (rvx_signal_3==RVX_LPARA_7) & rvx_port_05;

endmodule
