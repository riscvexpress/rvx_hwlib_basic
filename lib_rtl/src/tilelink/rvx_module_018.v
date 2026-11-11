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





module RVX_MODULE_018 (
	rvx_port_14,
	rvx_port_03,

	rvx_port_29,
	rvx_port_01,
	rvx_port_27,
	rvx_port_20,
	rvx_port_00,
	rvx_port_09,
	rvx_port_12,
	rvx_port_11,
	rvx_port_31,
	rvx_port_08,

	rvx_port_02,
	rvx_port_05,
	rvx_port_32,
	rvx_port_17,
	rvx_port_30,
	rvx_port_25,
	rvx_port_34,
	rvx_port_04,
	rvx_port_24,
	rvx_port_15,

	rvx_port_18,
	rvx_port_33,
	rvx_port_16,
	rvx_port_19,
	rvx_port_26,
	rvx_port_07,
	rvx_port_10,
	rvx_port_06,
	rvx_port_23,
	rvx_port_21,
	rvx_port_28,
	rvx_port_13,
	rvx_port_22
);





parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 
parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_0 = 1; 

localparam  RVX_LPARA_1 = (RVX_GPARA_3/8); 

localparam  RVX_LPARA_0 = `RVX_GDEF_260+`RVX_GDEF_248+RVX_GPARA_2+RVX_GPARA_1+RVX_GPARA_4+RVX_LPARA_1+RVX_GPARA_3+1;
input wire rvx_port_14, rvx_port_03;

output wire rvx_port_29;
input wire rvx_port_01;
input wire [`RVX_GDEF_260-1:0] rvx_port_27;
input wire [`RVX_GDEF_248-1:0] rvx_port_20;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
input wire [RVX_GPARA_1-1:0] rvx_port_09;
input wire [RVX_GPARA_4-1:0] rvx_port_12;
input wire [RVX_LPARA_1-1:0] rvx_port_11;
input wire [RVX_GPARA_3-1:0] rvx_port_31;
input wire rvx_port_08;

output wire rvx_port_02;
input wire rvx_port_05;
input wire [`RVX_GDEF_260-1:0] rvx_port_32;
input wire [`RVX_GDEF_248-1:0] rvx_port_17;
input wire [RVX_GPARA_2-1:0] rvx_port_30;
input wire [RVX_GPARA_1-1:0] rvx_port_25;
input wire [RVX_GPARA_4-1:0] rvx_port_34;
input wire [RVX_LPARA_1-1:0] rvx_port_04;
input wire [RVX_GPARA_3-1:0] rvx_port_24;
input wire rvx_port_15;

output reg rvx_port_18;
output reg [`RVX_GDEF_321-1:0] rvx_port_33;
output reg [`RVX_GDEF_260-1:0] rvx_port_16;
output reg [`RVX_GDEF_248-1:0] rvx_port_19;
output reg [RVX_GPARA_2-1:0] rvx_port_26;
output reg [RVX_GPARA_1-1:0] rvx_port_07;
output reg [RVX_GPARA_4-1:0] rvx_port_10;
output reg [RVX_LPARA_1-1:0] rvx_port_06;
output reg [RVX_GPARA_3-1:0] rvx_port_23;
output reg rvx_port_21;
input wire rvx_port_28;
input wire rvx_port_13;
input wire rvx_port_22;

wire rvx_signal_12;
wire rvx_signal_02;
wire [`RVX_GDEF_260-1:0] rvx_signal_08;
wire [`RVX_GDEF_248-1:0] rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
wire [RVX_GPARA_4-1:0] rvx_signal_05;
wire [RVX_LPARA_1-1:0] rvx_signal_00;
wire [RVX_GPARA_3-1:0] rvx_signal_04;
wire rvx_signal_13;

wire rvx_signal_22;
wire rvx_signal_16;
wire [`RVX_GDEF_260-1:0] rvx_signal_18;
wire [`RVX_GDEF_248-1:0] rvx_signal_09;
wire [RVX_GPARA_2-1:0] rvx_signal_10;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
wire [RVX_GPARA_4-1:0] rvx_signal_21;
wire [RVX_LPARA_1-1:0] rvx_signal_03;
wire [RVX_GPARA_3-1:0] rvx_signal_19;
wire rvx_signal_11;

`define RVX_LDEF_0 0
`define RVX_LDEF_1 1

reg rvx_signal_17;
wire rvx_signal_20;
wire rvx_signal_14;

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(2)
)
i_rvx_instance_1
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_03),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_29),
	.wrequest(rvx_port_01),
	.wdata({rvx_port_27,rvx_port_20,rvx_port_00,rvx_port_09,rvx_port_12,rvx_port_11,rvx_port_31,rvx_port_08}),
	.rready(rvx_signal_02),
	.rrequest(rvx_signal_12),
	.rdata({rvx_signal_08,rvx_signal_15,rvx_signal_06,rvx_signal_01,rvx_signal_05,rvx_signal_00,rvx_signal_04,rvx_signal_13}),
	.wfull(),
	.rempty()
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_03),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_02),
	.wrequest(rvx_port_05),
	.wdata({rvx_port_32,rvx_port_17,rvx_port_30,rvx_port_25,rvx_port_34,rvx_port_04,rvx_port_24,rvx_port_15}),
	.rready(rvx_signal_16),
	.rrequest(rvx_signal_22),
	.rdata({rvx_signal_18,rvx_signal_09,rvx_signal_10,rvx_signal_07,rvx_signal_21,rvx_signal_03,rvx_signal_19,rvx_signal_11}),
	.wfull(),
	.rempty()
);

always@(posedge rvx_port_14, negedge rvx_port_03)
begin
	if(rvx_port_03==0)
	begin
		rvx_signal_17 <= 0;
		rvx_port_33 <= `RVX_GDEF_233;
	end
	else if(rvx_signal_14)
	begin
		rvx_signal_17 <= 0;
		case(rvx_port_33)
			`RVX_GDEF_233:
				if(rvx_signal_16)
					rvx_port_33 <= `RVX_GDEF_596;
			`RVX_GDEF_596:
				if(rvx_signal_02)
					rvx_port_33 <= `RVX_GDEF_233;
		endcase
	end
	else if(rvx_signal_17==`RVX_LDEF_0)
	begin
		if(rvx_port_18 & rvx_port_28)
			rvx_signal_17 <= `RVX_LDEF_1;
	end
end

assign rvx_signal_20 = rvx_port_18 & rvx_port_13;
assign rvx_signal_14 = (rvx_signal_20 & rvx_port_22) | ((rvx_signal_17==`RVX_LDEF_0) & (~rvx_port_18));

always@(*)
begin
	rvx_port_18 = rvx_signal_02;
	rvx_port_16 = rvx_signal_08;
	rvx_port_19 = rvx_signal_15;
	rvx_port_26 = rvx_signal_06;
	rvx_port_07 = rvx_signal_01;
	rvx_port_10 = rvx_signal_05;
	rvx_port_06 = rvx_signal_00;
	rvx_port_23 = rvx_signal_04;
	rvx_port_21 = rvx_signal_13;
	case(rvx_port_33)
		`RVX_GDEF_233:
		begin
			rvx_port_18 = rvx_signal_02;
			rvx_port_16 = rvx_signal_08;
			rvx_port_19 = rvx_signal_15;
			rvx_port_26 = rvx_signal_06;
			rvx_port_07 = rvx_signal_01;
			rvx_port_10 = rvx_signal_05;
			rvx_port_06 = rvx_signal_00;
			rvx_port_23 = rvx_signal_04;
			rvx_port_21 = rvx_signal_13;
		end
		`RVX_GDEF_596:
		begin
			rvx_port_18 = rvx_signal_16;
			rvx_port_16 = rvx_signal_18;
			rvx_port_19 = rvx_signal_09;
			rvx_port_26 = rvx_signal_10;
			rvx_port_07 = rvx_signal_07;
			rvx_port_10 = rvx_signal_21;
			rvx_port_06 = rvx_signal_03;
			rvx_port_23 = rvx_signal_19;
			rvx_port_21 = rvx_signal_11;
		end
	endcase
end

assign rvx_signal_12 = (rvx_port_33==`RVX_GDEF_233) & rvx_port_13;
assign rvx_signal_22 = (rvx_port_33==`RVX_GDEF_596) & rvx_port_13;

`undef RVX_LDEF_0
`undef RVX_LDEF_1
endmodule
