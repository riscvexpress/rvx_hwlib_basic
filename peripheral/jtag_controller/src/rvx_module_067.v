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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"





module RVX_MODULE_067
(
	rvx_port_02,
	rvx_port_08,
	rvx_port_14,
	rvx_port_06,

	rvx_port_11,
	rvx_port_09,
	rvx_port_07,
	rvx_port_03,

	rvx_port_13,
	rvx_port_05,

	rvx_port_15,
	rvx_port_00,
	rvx_port_04,

	rvx_port_12,
	rvx_port_10,
	rvx_port_01
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;

localparam  RVX_LPARA_1 = RVX_GPARA_0;
localparam  RVX_LPARA_0 = RVX_GPARA_0;
localparam  RVX_LPARA_2 = 63;

output wire [RVX_GPARA_0-1:0] rvx_port_02;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
output wire rvx_port_06;

output wire [RVX_GPARA_0-1:0] rvx_port_11;
output wire rvx_port_09;
output wire [RVX_GPARA_0-1:0] rvx_port_07;
input wire rvx_port_03;

input wire rvx_port_13;
input wire rvx_port_05;

output wire rvx_port_15;
output wire [RVX_GPARA_1-1:0] rvx_port_00;
input wire rvx_port_04;

input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_10;
output wire rvx_port_01;

wire [RVX_GPARA_0-1:0] rvx_signal_02;
wire rvx_signal_09;
wire [RVX_GPARA_0-1:0] rvx_signal_24;
reg rvx_signal_13;

wire [RVX_GPARA_0-1:0] rvx_signal_22;
reg rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_20;
wire rvx_signal_10;

wire rvx_signal_06;
wire rvx_signal_12;
wire rvx_signal_05;
wire [RVX_LPARA_1-1:0] rvx_signal_19;

wire rvx_signal_16;
wire rvx_signal_01;
wire rvx_signal_23;
wire [RVX_LPARA_1-1:0] rvx_signal_14;

`define RVX_LDEF_5 2
`define RVX_LDEF_0 0
`define RVX_LDEF_1 1
`define RVX_LDEF_4 2
`define RVX_LDEF_3 3

reg [`RVX_LDEF_5-1:0] rvx_signal_07;

wire rvx_signal_00;

wire rvx_signal_18;
wire rvx_signal_03;
wire rvx_signal_04;
wire [RVX_LPARA_0-1:0] rvx_signal_08;

wire rvx_signal_27;
wire rvx_signal_25;
wire rvx_signal_21;
wire [RVX_LPARA_0-1:0] rvx_signal_26;

wire rvx_signal_15;

`define RVX_LDEF_0 0
`define RVX_LDEF_6 1

reg rvx_signal_17;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1+RVX_GPARA_0)
)
i_rvx_instance_2
(
	.clk(rvx_port_13),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
	.asynch_value({rvx_port_08,rvx_port_14}),
	.synch_value({rvx_signal_09,rvx_signal_24})
);

assign rvx_port_06 = rvx_signal_13;
assign rvx_port_09 = rvx_signal_11;
assign rvx_port_07 = rvx_signal_20;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_13),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
	.asynch_value(rvx_port_03),
	.synch_value(rvx_signal_10)
);

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_1),
	.DEPTH(RVX_LPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_13),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_06),
	.wfull(rvx_signal_05),
	.wrequest(rvx_signal_12),
	.wdata(rvx_signal_19),
	.wnum(rvx_signal_02),
	.rready(rvx_signal_16),
	.rempty(rvx_signal_23),
	.rrequest(rvx_signal_01),
	.rdata(rvx_signal_14),
	.rnum()
);

assign rvx_signal_12 = (rvx_signal_07==`RVX_LDEF_3);
assign rvx_signal_19 = $unsigned(rvx_signal_24);
assign rvx_signal_00 = rvx_signal_06 & rvx_signal_12;
assign rvx_port_02 = rvx_signal_02;

always@(posedge rvx_port_13, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
	begin
		rvx_signal_07 <= `RVX_LDEF_0;
		rvx_signal_13 <= 0;
	end
	else
		case(rvx_signal_07)
			`RVX_LDEF_0:
				if(rvx_signal_09 != rvx_signal_13)
					rvx_signal_07 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_09 != rvx_signal_13)
					rvx_signal_07 <= `RVX_LDEF_4;
				else
					rvx_signal_07 <= `RVX_LDEF_0;
			`RVX_LDEF_4:
				if(rvx_signal_09 != rvx_signal_13)
					rvx_signal_07 <= `RVX_LDEF_3;
				else
					rvx_signal_07 <= `RVX_LDEF_0;
			`RVX_LDEF_3:
				if(rvx_signal_00)
				begin
					rvx_signal_07 <= `RVX_LDEF_0;
					rvx_signal_13 <= ~rvx_signal_13;
				end
		endcase
end

assign rvx_port_15 = rvx_signal_16;
assign rvx_port_00 = $unsigned(rvx_signal_14);
assign rvx_signal_01 = rvx_port_04;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_LPARA_2),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_13),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_18),
	.wfull(rvx_signal_04),
	.wrequest(rvx_signal_03),
	.wdata(rvx_signal_08),
	.wnum(),
	.rready(rvx_signal_27),
	.rempty(rvx_signal_21),
	.rrequest(rvx_signal_25),
	.rdata(rvx_signal_26),
	.rnum(rvx_signal_22)
);

assign rvx_signal_03 = rvx_port_12;
assign rvx_signal_08 = $unsigned(rvx_port_10);
assign rvx_port_01 = rvx_signal_18;
assign rvx_port_11 = rvx_signal_22;

always@(posedge rvx_port_13, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
	begin
		rvx_signal_17 <= `RVX_LDEF_0;
		rvx_signal_11 <= 0;
	end
	else
		case(rvx_signal_17)
			`RVX_LDEF_0:
				if(rvx_signal_27)
				begin
					rvx_signal_17 <= `RVX_LDEF_6;
					rvx_signal_11 <= ~rvx_signal_11;
				end
			`RVX_LDEF_6:
				if(rvx_signal_15)
					rvx_signal_17 <= `RVX_LDEF_0;
		endcase
end

assign rvx_signal_15 = (rvx_signal_17==`RVX_LDEF_6) & (rvx_signal_11==rvx_signal_10);
assign rvx_signal_25 = rvx_signal_15;
assign rvx_signal_20 = $unsigned(rvx_signal_26);

`undef RVX_LDEF_0
`undef RVX_LDEF_6
endmodule
