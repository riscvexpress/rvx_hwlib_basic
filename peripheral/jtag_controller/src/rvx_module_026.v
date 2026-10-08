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





module RVX_MODULE_026
(
	rvx_port_05,
	rvx_port_01,
	rvx_port_04,
	rvx_port_07,

	rvx_port_13,
	rvx_port_11,
	rvx_port_03,
	rvx_port_00,

	rvx_port_14,
	rvx_port_09,

	rvx_port_06,
	rvx_port_15,
	rvx_port_02,

	rvx_port_12,
	rvx_port_08,
	rvx_port_10
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;

localparam  RVX_LPARA_2 = RVX_GPARA_0;
localparam  RVX_LPARA_0 = RVX_GPARA_0;
localparam  RVX_LPARA_1 = 63;

output wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire rvx_port_01;
input wire [RVX_GPARA_0-1:0] rvx_port_04;
output wire rvx_port_07;

output wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire rvx_port_11;
output wire [RVX_GPARA_0-1:0] rvx_port_03;
input wire rvx_port_00;

input wire rvx_port_14;
input wire rvx_port_09;

output wire rvx_port_06;
output wire [RVX_GPARA_1-1:0] rvx_port_15;
input wire rvx_port_02;

input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_08;
output wire rvx_port_10;

wire [RVX_GPARA_0-1:0] rvx_signal_12;
wire rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
reg rvx_signal_02;

wire [RVX_GPARA_0-1:0] rvx_signal_06;
reg rvx_signal_08;
wire [RVX_GPARA_0-1:0] rvx_signal_03;
wire rvx_signal_00;

wire rvx_signal_26;
wire rvx_signal_11;
wire rvx_signal_20;
wire [RVX_LPARA_2-1:0] rvx_signal_14;

wire rvx_signal_19;
wire rvx_signal_13;
wire rvx_signal_15;
wire [RVX_LPARA_2-1:0] rvx_signal_05;

`define RVX_LDEF_1 2
`define RVX_LDEF_3 0
`define RVX_LDEF_6 1
`define RVX_LDEF_4 2
`define RVX_LDEF_5 3

reg [`RVX_LDEF_1-1:0] rvx_signal_09;

wire rvx_signal_23;

wire rvx_signal_07;
wire rvx_signal_17;
wire rvx_signal_21;
wire [RVX_LPARA_0-1:0] rvx_signal_18;

wire rvx_signal_01;
wire rvx_signal_04;
wire rvx_signal_25;
wire [RVX_LPARA_0-1:0] rvx_signal_16;

wire rvx_signal_22;

`define RVX_LDEF_3 0
`define RVX_LDEF_2 1

reg rvx_signal_24;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1+RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_09),
	.enable(1'b 1),
	.asynch_value({rvx_port_01,rvx_port_04}),
	.synch_value({rvx_signal_10,rvx_signal_27})
);

assign rvx_port_07 = rvx_signal_02;
assign rvx_port_11 = rvx_signal_08;
assign rvx_port_03 = rvx_signal_03;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_09),
	.enable(1'b 1),
	.asynch_value(rvx_port_00),
	.synch_value(rvx_signal_00)
);

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_2),
	.DEPTH(RVX_LPARA_1)
)
i_rvx_instance_2
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_09),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_26),
	.wfull(rvx_signal_20),
	.wrequest(rvx_signal_11),
	.wdata(rvx_signal_14),
	.wnum(rvx_signal_12),
	.rready(rvx_signal_19),
	.rempty(rvx_signal_15),
	.rrequest(rvx_signal_13),
	.rdata(rvx_signal_05),
	.rnum()
);

assign rvx_signal_11 = (rvx_signal_09==`RVX_LDEF_5);
assign rvx_signal_14 = $unsigned(rvx_signal_27);
assign rvx_signal_23 = rvx_signal_26 & rvx_signal_11;
assign rvx_port_05 = rvx_signal_12;

always@(posedge rvx_port_14, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
	begin
		rvx_signal_09 <= `RVX_LDEF_3;
		rvx_signal_02 <= 0;
	end
	else
		case(rvx_signal_09)
			`RVX_LDEF_3:
				if(rvx_signal_10 != rvx_signal_02)
					rvx_signal_09 <= `RVX_LDEF_6;
			`RVX_LDEF_6:
				if(rvx_signal_10 != rvx_signal_02)
					rvx_signal_09 <= `RVX_LDEF_4;
				else
					rvx_signal_09 <= `RVX_LDEF_3;
			`RVX_LDEF_4:
				if(rvx_signal_10 != rvx_signal_02)
					rvx_signal_09 <= `RVX_LDEF_5;
				else
					rvx_signal_09 <= `RVX_LDEF_3;
			`RVX_LDEF_5:
				if(rvx_signal_23)
				begin
					rvx_signal_09 <= `RVX_LDEF_3;
					rvx_signal_02 <= ~rvx_signal_02;
				end
		endcase
end

assign rvx_port_06 = rvx_signal_19;
assign rvx_port_15 = $unsigned(rvx_signal_05);
assign rvx_signal_13 = rvx_port_02;

ERVP_FIFO
#(
	.BW_DATA(RVX_LPARA_0),
	.DEPTH(RVX_LPARA_1),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_09),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rvx_signal_07),
	.wfull(rvx_signal_21),
	.wrequest(rvx_signal_17),
	.wdata(rvx_signal_18),
	.wnum(),
	.rready(rvx_signal_01),
	.rempty(rvx_signal_25),
	.rrequest(rvx_signal_04),
	.rdata(rvx_signal_16),
	.rnum(rvx_signal_06)
);

assign rvx_signal_17 = rvx_port_12;
assign rvx_signal_18 = $unsigned(rvx_port_08);
assign rvx_port_10 = rvx_signal_07;
assign rvx_port_13 = rvx_signal_06;

always@(posedge rvx_port_14, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
	begin
		rvx_signal_24 <= `RVX_LDEF_3;
		rvx_signal_08 <= 0;
	end
	else
		case(rvx_signal_24)
			`RVX_LDEF_3:
				if(rvx_signal_01)
				begin
					rvx_signal_24 <= `RVX_LDEF_2;
					rvx_signal_08 <= ~rvx_signal_08;
				end
			`RVX_LDEF_2:
				if(rvx_signal_22)
					rvx_signal_24 <= `RVX_LDEF_3;
		endcase
end

assign rvx_signal_22 = (rvx_signal_24==`RVX_LDEF_2) & (rvx_signal_08==rvx_signal_00);
assign rvx_signal_04 = rvx_signal_22;
assign rvx_signal_03 = $unsigned(rvx_signal_16);

`undef RVX_LDEF_3
`undef RVX_LDEF_2
endmodule
