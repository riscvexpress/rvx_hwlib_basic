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





module RVX_MODULE_117
(
	rvx_port_01,
	rvx_port_09,
	rvx_port_12,
	rvx_port_11,

	rvx_port_15,
	rvx_port_14,
	rvx_port_10,
	rvx_port_13,

	rvx_port_07,
	rvx_port_02,

	rvx_port_00,
	rvx_port_08,
	rvx_port_04,

	rvx_port_06,
	rvx_port_05,
	rvx_port_03
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;

localparam  RVX_LPARA_1 = RVX_GPARA_0;
localparam  RVX_LPARA_0 = RVX_GPARA_0;
localparam  RVX_LPARA_2 = 63;

output wire [RVX_GPARA_0-1:0] rvx_port_01;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_12;
output wire rvx_port_11;

output wire [RVX_GPARA_0-1:0] rvx_port_15;
output wire rvx_port_14;
output wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_13;

input wire rvx_port_07;
input wire rvx_port_02;

output wire rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire rvx_port_04;

input wire rvx_port_06;
input wire [RVX_GPARA_1-1:0] rvx_port_05;
output wire rvx_port_03;

wire [RVX_GPARA_0-1:0] rvx_signal_00;
wire rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_09;
reg rvx_signal_19;

wire [RVX_GPARA_0-1:0] rvx_signal_10;
reg rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_15;
wire rvx_signal_07;

wire rvx_signal_03;
wire rvx_signal_22;
wire rvx_signal_24;
wire [RVX_LPARA_1-1:0] rvx_signal_12;

wire rvx_signal_08;
wire rvx_signal_25;
wire rvx_signal_14;
wire [RVX_LPARA_1-1:0] rvx_signal_02;

`define RVX_LDEF_6 2
`define RVX_LDEF_4 0
`define RVX_LDEF_2 1
`define RVX_LDEF_5 2
`define RVX_LDEF_0 3

reg [`RVX_LDEF_6-1:0] rvx_signal_27;

wire rvx_signal_05;

wire rvx_signal_21;
wire rvx_signal_17;
wire rvx_signal_16;
wire [RVX_LPARA_0-1:0] rvx_signal_04;

wire rvx_signal_13;
wire rvx_signal_18;
wire rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_23;

wire rvx_signal_20;

`define RVX_LDEF_4 0
`define RVX_LDEF_3 1

reg rvx_signal_26;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1+RVX_GPARA_0)
)
i_rvx_instance_2
(
	.clk(rvx_port_07),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
	.asynch_value({rvx_port_09,rvx_port_12}),
	.synch_value({rvx_signal_11,rvx_signal_09})
);

assign rvx_port_11 = rvx_signal_19;
assign rvx_port_14 = rvx_signal_01;
assign rvx_port_10 = rvx_signal_15;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_07),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
	.asynch_value(rvx_port_13),
	.synch_value(rvx_signal_07)
);

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(RVX_LPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_07),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_03),
	.wfull(rvx_signal_24),
	.wrequest(rvx_signal_22),
	.wdata(rvx_signal_12),
	.wnum(rvx_signal_00),
	.rready(rvx_signal_08),
	.rempty(rvx_signal_14),
	.rrequest(rvx_signal_25),
	.rdata(rvx_signal_02),
	.rnum()
);

assign rvx_signal_22 = (rvx_signal_27==`RVX_LDEF_0);
assign rvx_signal_12 = $unsigned(rvx_signal_09);
assign rvx_signal_05 = rvx_signal_03 & rvx_signal_22;
assign rvx_port_01 = rvx_signal_00;

always@(posedge rvx_port_07, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
	begin
		rvx_signal_27 <= `RVX_LDEF_4;
		rvx_signal_19 <= 0;
	end
	else
		case(rvx_signal_27)
			`RVX_LDEF_4:
				if(rvx_signal_11 != rvx_signal_19)
					rvx_signal_27 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_11 != rvx_signal_19)
					rvx_signal_27 <= `RVX_LDEF_5;
				else
					rvx_signal_27 <= `RVX_LDEF_4;
			`RVX_LDEF_5:
				if(rvx_signal_11 != rvx_signal_19)
					rvx_signal_27 <= `RVX_LDEF_0;
				else
					rvx_signal_27 <= `RVX_LDEF_4;
			`RVX_LDEF_0:
				if(rvx_signal_05)
				begin
					rvx_signal_27 <= `RVX_LDEF_4;
					rvx_signal_19 <= ~rvx_signal_19;
				end
		endcase
end

assign rvx_port_00 = rvx_signal_08;
assign rvx_port_08 = $unsigned(rvx_signal_02);
assign rvx_signal_25 = rvx_port_04;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_LPARA_2),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_07),
	.rstnn(rvx_port_02),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_21),
	.wfull(rvx_signal_16),
	.wrequest(rvx_signal_17),
	.wdata(rvx_signal_04),
	.wnum(),
	.rready(rvx_signal_13),
	.rempty(rvx_signal_06),
	.rrequest(rvx_signal_18),
	.rdata(rvx_signal_23),
	.rnum(rvx_signal_10)
);

assign rvx_signal_17 = rvx_port_06;
assign rvx_signal_04 = $unsigned(rvx_port_05);
assign rvx_port_03 = rvx_signal_21;
assign rvx_port_15 = rvx_signal_10;

always@(posedge rvx_port_07, negedge rvx_port_02)
begin
	if(rvx_port_02==0)
	begin
		rvx_signal_26 <= `RVX_LDEF_4;
		rvx_signal_01 <= 0;
	end
	else
		case(rvx_signal_26)
			`RVX_LDEF_4:
				if(rvx_signal_13)
				begin
					rvx_signal_26 <= `RVX_LDEF_3;
					rvx_signal_01 <= ~rvx_signal_01;
				end
			`RVX_LDEF_3:
				if(rvx_signal_20)
					rvx_signal_26 <= `RVX_LDEF_4;
		endcase
end

assign rvx_signal_20 = (rvx_signal_26==`RVX_LDEF_3) & (rvx_signal_01==rvx_signal_07);
assign rvx_signal_18 = rvx_signal_20;
assign rvx_signal_15 = $unsigned(rvx_signal_23);

`undef RVX_LDEF_4
`undef RVX_LDEF_3
endmodule
