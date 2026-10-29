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




module RVX_MODULE_099 (
	rvx_port_12,
	rvx_port_11,

	rvx_port_19,
	rvx_port_04,
	rvx_port_01,
	rvx_port_06,
	rvx_port_14,
	rvx_port_17,

	rvx_port_21,
	rvx_port_13,
	rvx_port_16,
	rvx_port_20,

	rvx_port_26,
	rvx_port_27,
	rvx_port_02,
	rvx_port_05,
	rvx_port_25,
	rvx_port_15,

	rvx_port_24,
	rvx_port_07,
	rvx_port_03,
	rvx_port_23,
	rvx_port_22,
	rvx_port_09,
	rvx_port_08,
	rvx_port_10,
	rvx_port_18,
	rvx_port_00
);




parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 
parameter RVX_GPARA_5 = 1; 

localparam  RVX_LPARA_3 = (RVX_GPARA_0/8); 
localparam  RVX_LPARA_4 = `RVX_GDEF_475(RVX_GPARA_4,RVX_GPARA_1);

parameter RVX_GPARA_2 = 4;

localparam  RVX_LPARA_1 = RVX_GPARA_3;
localparam  RVX_LPARA_2 = RVX_GPARA_0;

input wire rvx_port_12, rvx_port_11;

input wire rvx_port_19;
input wire [RVX_LPARA_4-1:0] rvx_port_04;
output wire rvx_port_01;
input wire rvx_port_06;
input wire [RVX_LPARA_4-1:0] rvx_port_14;
output wire rvx_port_17;

input wire [RVX_GPARA_2-1:0] rvx_port_21;
input wire [`BW_AXI_BRESP-1:0] rvx_port_13;
input wire rvx_port_16;
output wire rvx_port_20;

input wire [RVX_GPARA_2-1:0] rvx_port_26;
input wire [RVX_LPARA_2-1:0] rvx_port_27;
input wire [`BW_AXI_RRESP-1:0] rvx_port_02;
input wire rvx_port_05;
input wire rvx_port_25;
output wire rvx_port_15;

input wire rvx_port_24;
output reg rvx_port_07;
output reg [`RVX_GDEF_419-1:0] rvx_port_03;
output wire [`RVX_GDEF_222-1:0] rvx_port_23;
output wire [RVX_GPARA_1-1:0] rvx_port_22;
output wire [RVX_GPARA_4-1:0] rvx_port_09;
output wire [RVX_GPARA_5-1:0] rvx_port_08;
output wire rvx_port_10;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
output reg rvx_port_00;

wire [`RVX_GDEF_336-1:0] rvx_signal_3;
wire [`RVX_GDEF_419-1:0] rvx_signal_7;
wire [RVX_GPARA_1-1:0] rvx_signal_1;
wire [RVX_GPARA_4-1:0] rvx_signal_8;

localparam  RVX_LPARA_5 = 2;
localparam  RVX_LPARA_7 = 0;
localparam  RVX_LPARA_6 = 1;
localparam  RVX_LPARA_0 = 2;

reg [RVX_LPARA_5-1:0] rvx_signal_0;

wire rvx_signal_4;
wire rvx_signal_2;
wire rvx_signal_6;

wire [`BW_AXI_RRESP-1:0] rvx_signal_5;

assign {rvx_signal_3,rvx_signal_7,rvx_signal_8,rvx_signal_1} = (rvx_signal_0==RVX_LPARA_6)? rvx_port_04 : rvx_port_14;

always@(posedge rvx_port_12, negedge rvx_port_11)
begin
	if(rvx_port_11==0)
		rvx_signal_0 <= RVX_LPARA_7;
	else
		case(rvx_signal_0)
			RVX_LPARA_7:
				if(rvx_signal_4)
					rvx_signal_0 <= RVX_LPARA_6;
				else if(rvx_signal_2)
					rvx_signal_0 <= RVX_LPARA_0;
			RVX_LPARA_6:
				if(rvx_signal_6 & rvx_port_05)
					rvx_signal_0 <= RVX_LPARA_7;
			RVX_LPARA_0:
				if(rvx_signal_6)
					rvx_signal_0 <= RVX_LPARA_7;
		endcase
end

assign rvx_signal_4 = (rvx_signal_0==RVX_LPARA_7) & rvx_port_19 & rvx_port_25;
assign rvx_signal_2 = (rvx_signal_0==RVX_LPARA_7) & rvx_port_06 & rvx_port_16;
assign rvx_signal_6 = rvx_port_07 & rvx_port_24;

always@(*)
begin
	rvx_port_07 = 0;
	case(rvx_signal_0)
		RVX_LPARA_7: rvx_port_07 = 0;
		RVX_LPARA_6: rvx_port_07 = rvx_port_25;
		RVX_LPARA_0: rvx_port_07 = rvx_port_16;
	endcase
end

always@(*)
begin
	rvx_port_03 = 0;
	case(rvx_signal_3)
		`RVX_GDEF_549:
			case(rvx_signal_7)
				4: rvx_port_03 = 1;
				6: rvx_port_03 = 5;
			endcase
		`RVX_GDEF_128:
			case(rvx_signal_7)
				7: rvx_port_03 = 6;
			endcase
	endcase
end

assign rvx_port_23 = 0;
assign rvx_port_22 = rvx_signal_1;
assign rvx_port_09 = rvx_signal_8;
assign rvx_port_08 = 0;
assign rvx_port_10 = 0;
assign rvx_port_18 = rvx_port_27;

assign rvx_signal_5 = (rvx_signal_0==RVX_LPARA_0)? rvx_port_13 : rvx_port_02;

always@(*)
begin
	rvx_port_00 = 0;
	case(rvx_signal_5)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			rvx_port_00 = 0;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			rvx_port_00 = 1;
	endcase
end

assign rvx_port_01 = (rvx_signal_0==RVX_LPARA_6) & rvx_signal_6 & rvx_port_05;
assign rvx_port_17 = (rvx_signal_0==RVX_LPARA_0) & rvx_signal_6;

assign rvx_port_15 = (rvx_signal_0==RVX_LPARA_6) & rvx_port_24;
assign rvx_port_20 = (rvx_signal_0==RVX_LPARA_0) & rvx_port_24;

endmodule
