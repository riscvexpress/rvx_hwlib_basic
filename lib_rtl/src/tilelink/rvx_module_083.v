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





module RVX_MODULE_083 (
	rvx_port_22,
	rvx_port_31,

	rvx_port_20,
	rvx_port_33,
	rvx_port_00,
	rvx_port_15,
	rvx_port_21,
	rvx_port_14,
	rvx_port_28,
	rvx_port_06,
	rvx_port_10,
	rvx_port_04,

	rvx_port_24,
	rvx_port_02,
	rvx_port_19,
	rvx_port_29,
	rvx_port_25,
	rvx_port_17,
	rvx_port_07,
	rvx_port_27,
	rvx_port_05,
	rvx_port_12,

	rvx_port_01,
	rvx_port_23,
	rvx_port_26,
	rvx_port_32,
	rvx_port_30,
	rvx_port_13,
	rvx_port_11,
	rvx_port_09,
	rvx_port_03,
	rvx_port_34,
	rvx_port_18,
	rvx_port_16,
	rvx_port_08
);





parameter RVX_GPARA_0 = 1; 
parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 

localparam  RVX_LPARA_0 = (RVX_GPARA_0/8); 

localparam  RVX_LPARA_1 = `RVX_GDEF_419+`RVX_GDEF_222+RVX_GPARA_4+RVX_GPARA_2+RVX_GPARA_3+RVX_LPARA_0+RVX_GPARA_0+1;
input wire rvx_port_22, rvx_port_31;

output wire rvx_port_20;
input wire rvx_port_33;
input wire [`RVX_GDEF_419-1:0] rvx_port_00;
input wire [`RVX_GDEF_222-1:0] rvx_port_15;
input wire [RVX_GPARA_4-1:0] rvx_port_21;
input wire [RVX_GPARA_2-1:0] rvx_port_14;
input wire [RVX_GPARA_3-1:0] rvx_port_28;
input wire [RVX_LPARA_0-1:0] rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_04;

output wire rvx_port_24;
input wire rvx_port_02;
input wire [`RVX_GDEF_419-1:0] rvx_port_19;
input wire [`RVX_GDEF_222-1:0] rvx_port_29;
input wire [RVX_GPARA_4-1:0] rvx_port_25;
input wire [RVX_GPARA_2-1:0] rvx_port_17;
input wire [RVX_GPARA_3-1:0] rvx_port_07;
input wire [RVX_LPARA_0-1:0] rvx_port_27;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire rvx_port_12;

output reg rvx_port_01;
output reg [`RVX_GDEF_336-1:0] rvx_port_23;
output reg [`RVX_GDEF_419-1:0] rvx_port_26;
output reg [`RVX_GDEF_222-1:0] rvx_port_32;
output reg [RVX_GPARA_4-1:0] rvx_port_30;
output reg [RVX_GPARA_2-1:0] rvx_port_13;
output reg [RVX_GPARA_3-1:0] rvx_port_11;
output reg [RVX_LPARA_0-1:0] rvx_port_09;
output reg [RVX_GPARA_0-1:0] rvx_port_03;
output reg rvx_port_34;
input wire rvx_port_18;
input wire rvx_port_16;
input wire rvx_port_08;

wire rvx_signal_21;
wire rvx_signal_10;
wire [`RVX_GDEF_419-1:0] rvx_signal_03;
wire [`RVX_GDEF_222-1:0] rvx_signal_18;
wire [RVX_GPARA_4-1:0] rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_12;
wire [RVX_GPARA_3-1:0] rvx_signal_19;
wire [RVX_LPARA_0-1:0] rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_11;
wire rvx_signal_06;

wire rvx_signal_22;
wire rvx_signal_20;
wire [`RVX_GDEF_419-1:0] rvx_signal_05;
wire [`RVX_GDEF_222-1:0] rvx_signal_08;
wire [RVX_GPARA_4-1:0] rvx_signal_00;
wire [RVX_GPARA_2-1:0] rvx_signal_01;
wire [RVX_GPARA_3-1:0] rvx_signal_16;
wire [RVX_LPARA_0-1:0] rvx_signal_02;
wire [RVX_GPARA_0-1:0] rvx_signal_09;
wire rvx_signal_14;

`define RVX_LDEF_0 0
`define RVX_LDEF_1 1

reg rvx_signal_17;
wire rvx_signal_04;
wire rvx_signal_13;

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(2)
)
i_rvx_instance_0
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_20),
	.wrequest(rvx_port_33),
	.wdata({rvx_port_00,rvx_port_15,rvx_port_21,rvx_port_14,rvx_port_28,rvx_port_06,rvx_port_10,rvx_port_04}),
	.rready(rvx_signal_10),
	.rrequest(rvx_signal_21),
	.rdata({rvx_signal_03,rvx_signal_18,rvx_signal_15,rvx_signal_12,rvx_signal_19,rvx_signal_07,rvx_signal_11,rvx_signal_06}),
	.wfull(),
	.rempty()
);

ERVP_SMALL_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(2)
)
i_rvx_instance_1
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_31),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_port_24),
	.wrequest(rvx_port_02),
	.wdata({rvx_port_19,rvx_port_29,rvx_port_25,rvx_port_17,rvx_port_07,rvx_port_27,rvx_port_05,rvx_port_12}),
	.rready(rvx_signal_20),
	.rrequest(rvx_signal_22),
	.rdata({rvx_signal_05,rvx_signal_08,rvx_signal_00,rvx_signal_01,rvx_signal_16,rvx_signal_02,rvx_signal_09,rvx_signal_14}),
	.wfull(),
	.rempty()
);

always@(posedge rvx_port_22, negedge rvx_port_31)
begin
	if(rvx_port_31==0)
	begin
		rvx_signal_17 <= 0;
		rvx_port_23 <= `RVX_GDEF_549;
	end
	else if(rvx_signal_13)
	begin
		rvx_signal_17 <= 0;
		case(rvx_port_23)
			`RVX_GDEF_549:
				if(rvx_signal_20)
					rvx_port_23 <= `RVX_GDEF_128;
			`RVX_GDEF_128:
				if(rvx_signal_10)
					rvx_port_23 <= `RVX_GDEF_549;
		endcase
	end
	else if(rvx_signal_17==`RVX_LDEF_0)
	begin
		if(rvx_port_01 & rvx_port_18)
			rvx_signal_17 <= `RVX_LDEF_1;
	end
end

assign rvx_signal_04 = rvx_port_01 & rvx_port_16;
assign rvx_signal_13 = (rvx_signal_04 & rvx_port_08) | ((rvx_signal_17==`RVX_LDEF_0) & (~rvx_port_01));

always@(*)
begin
	rvx_port_01 = rvx_signal_10;
	rvx_port_26 = rvx_signal_03;
	rvx_port_32 = rvx_signal_18;
	rvx_port_30 = rvx_signal_15;
	rvx_port_13 = rvx_signal_12;
	rvx_port_11 = rvx_signal_19;
	rvx_port_09 = rvx_signal_07;
	rvx_port_03 = rvx_signal_11;
	rvx_port_34 = rvx_signal_06;
	case(rvx_port_23)
		`RVX_GDEF_549:
		begin
			rvx_port_01 = rvx_signal_10;
			rvx_port_26 = rvx_signal_03;
			rvx_port_32 = rvx_signal_18;
			rvx_port_30 = rvx_signal_15;
			rvx_port_13 = rvx_signal_12;
			rvx_port_11 = rvx_signal_19;
			rvx_port_09 = rvx_signal_07;
			rvx_port_03 = rvx_signal_11;
			rvx_port_34 = rvx_signal_06;
		end
		`RVX_GDEF_128:
		begin
			rvx_port_01 = rvx_signal_20;
			rvx_port_26 = rvx_signal_05;
			rvx_port_32 = rvx_signal_08;
			rvx_port_30 = rvx_signal_00;
			rvx_port_13 = rvx_signal_01;
			rvx_port_11 = rvx_signal_16;
			rvx_port_09 = rvx_signal_02;
			rvx_port_03 = rvx_signal_09;
			rvx_port_34 = rvx_signal_14;
		end
	endcase
end

assign rvx_signal_21 = (rvx_port_23==`RVX_GDEF_549) & rvx_port_16;
assign rvx_signal_22 = (rvx_port_23==`RVX_GDEF_128) & rvx_port_16;

`undef RVX_LDEF_0
`undef RVX_LDEF_1
endmodule
