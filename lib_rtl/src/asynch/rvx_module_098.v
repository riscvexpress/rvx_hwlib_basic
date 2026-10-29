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





module RVX_MODULE_098
(
	rvx_port_5,
	rvx_port_6,
	rvx_port_0,
	rvx_port_7,
	rvx_port_3,
	rvx_port_1,
	rvx_port_2,
	rvx_port_4
);





parameter RVX_GPARA_3 = 4;
parameter RVX_GPARA_0 = 8;

parameter RVX_GPARA_1 = RVX_GPARA_3 + 1;
parameter RVX_GPARA_2 = RVX_GPARA_0 + 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_04 = `MAX(RVX_GPARA_3,1);
localparam  RVX_LPARA_05 = `MAX(RVX_GPARA_0,1);
localparam  RVX_LPARA_02 = `MIN(`MAX(RVX_GPARA_1-1,1),RVX_LPARA_04);
localparam  RVX_LPARA_08 = `MIN(`MAX(RVX_GPARA_1-1,1),RVX_LPARA_05);

localparam  RVX_LPARA_01 = RVX_LPARA_02 + 1;
localparam  RVX_LPARA_09 = RVX_LPARA_08 + 1;

localparam  RVX_LPARA_07 = `DIVIDERU(RVX_LPARA_04,RVX_LPARA_02);
localparam  RVX_LPARA_03 = `DIVIDERU(RVX_LPARA_05,RVX_LPARA_08);

localparam  RVX_LPARA_06 = `MAX(RVX_LPARA_07,RVX_LPARA_03);
localparam  RVX_LPARA_00 = LOG2RU(RVX_LPARA_06);

input wire rvx_port_5, rvx_port_6;
output wire rvx_port_0;
output wire [RVX_LPARA_04-1:0] rvx_port_7;
input wire rvx_port_3;
input wire [RVX_LPARA_05-1:0] rvx_port_1;

input wire [RVX_GPARA_1-1:0] rvx_port_2;
output wire [RVX_GPARA_2-1:0] rvx_port_4;

reg [RVX_LPARA_01-1:0] rvx_signal_02;
wire [RVX_LPARA_09-1:0] rvx_signal_12;

wire rvx_signal_20;
reg rvx_signal_00;

wire [RVX_LPARA_00-1:0] rvx_signal_06;
wire rvx_signal_14;
wire rvx_signal_18;

wire [RVX_LPARA_02-1:0] rvx_signal_04;
wire [RVX_LPARA_05-1:0] rvx_signal_15;

`define RVX_LDEF_4 3
`define RVX_LDEF_2 0
`define RVX_LDEF_3 1
`define RVX_LDEF_1 2
`define RVX_LDEF_5 3
`define RVX_LDEF_0 4

reg [`RVX_LDEF_4-1:0] rvx_signal_03;
wire rvx_signal_17;

wire rvx_signal_16;
wire rvx_signal_09;
wire rvx_signal_10;
wire rvx_signal_01;

wire [RVX_GPARA_3-1:0] rvx_signal_05;
wire [RVX_LPARA_02-1:0] rvx_signal_08;
wire [RVX_LPARA_02-1:0] rvx_signal_07;

wire [RVX_LPARA_05-1:0] rvx_signal_19;
wire [RVX_LPARA_08-1:0] rvx_signal_13;
wire [RVX_LPARA_08-1:0] rvx_signal_11;

always@(*)
begin
	rvx_signal_02 = 0;
	rvx_signal_02[RVX_LPARA_01-1 -:RVX_GPARA_1] = rvx_port_2;
end
assign rvx_port_4 = rvx_signal_12[RVX_LPARA_09-1 -:RVX_GPARA_2];

RVX_MODULE_131
#(
	.RVX_GPARA_1(RVX_LPARA_02),
	.RVX_GPARA_0(RVX_LPARA_08)
)
i_rvx_instance_0
(
	.rvx_port_02(rvx_port_5),
	.rvx_port_08(rvx_port_6),
	.rvx_port_06(rvx_signal_20),
	.rvx_port_07(rvx_signal_04),
	.rvx_port_00(rvx_signal_00),
	.rvx_port_04(rvx_signal_15[RVX_LPARA_08-1:0]),
	.rvx_port_03(rvx_signal_02),
	.rvx_port_01(rvx_signal_12),
	.rvx_port_09(),
	.rvx_port_05()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_00)
)
i_rvx_instance_1
(
	.clk(rvx_port_5),
	.rstnn(rvx_port_6),
	.enable(1'b 1),
	.init(rvx_signal_14),
	.count(rvx_signal_18),
	.value(rvx_signal_06),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_14 = rvx_signal_10 | rvx_signal_01;
assign rvx_signal_18 = rvx_signal_16 | rvx_signal_09;

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_GPARA_3),
	.SHIFT_AMOUNT(RVX_LPARA_02)
)
i_rvx_instance_3
(
	.clk(rvx_port_5),
	.rstnn(rvx_port_6),
  .enable(1'b 1),
	.set_value(rvx_signal_05),
	.right_insertion(rvx_signal_08),
	.left_insertion(rvx_signal_07),
	.clear(1'b 0),
	.set(1'b 0),
	.left_shift(1'b 0),
	.right_shift(rvx_signal_16),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_port_7)
);

assign rvx_signal_05 = 0;
assign rvx_signal_08 = 0;
assign rvx_signal_07 = $unsigned(rvx_signal_04);

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_LPARA_05),
	.SHIFT_AMOUNT(RVX_LPARA_08)
)
i_rvx_instance_2
(
	.clk(rvx_port_5),
	.rstnn(rvx_port_6),
  .enable(1'b 1),
	.set_value(rvx_signal_19),
	.right_insertion(rvx_signal_13),
	.left_insertion(rvx_signal_11),
	.clear(1'b 0),
	.set(rvx_signal_17),
	.left_shift(1'b 0),
	.right_shift((rvx_signal_09&(!rvx_signal_01))),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_signal_15)
);

assign rvx_signal_19 = rvx_port_1;
assign rvx_signal_13 = 0;
assign rvx_signal_11 = 0;

always@(posedge rvx_port_5, negedge rvx_port_6)
begin
	if(rvx_port_6==0)
		rvx_signal_03 <= `RVX_LDEF_2;
	else
		case(rvx_signal_03)
			`RVX_LDEF_2:
				if(rvx_signal_20)
					rvx_signal_03 <= `RVX_LDEF_3;
			`RVX_LDEF_3:
				if(rvx_signal_10)
					rvx_signal_03 <= `RVX_LDEF_1;
				else if(rvx_signal_16)
					rvx_signal_03 <= `RVX_LDEF_2;
			`RVX_LDEF_1:
				if(rvx_signal_17)
				begin
					if(RVX_GPARA_0==0)
						rvx_signal_03 <= `RVX_LDEF_2;
					else
						rvx_signal_03 <= `RVX_LDEF_5;
				end
			`RVX_LDEF_5:
				if(rvx_signal_20)
					rvx_signal_03 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_signal_01)
					rvx_signal_03 <= `RVX_LDEF_2;
				else if(rvx_signal_09)
					rvx_signal_03 <= `RVX_LDEF_5;
		endcase
end

assign rvx_port_0 = (rvx_signal_03==`RVX_LDEF_1);
assign rvx_signal_17 = rvx_port_0 & rvx_port_3;

always@(*)
begin
	rvx_signal_00 = 0;
	case(rvx_signal_03)
		`RVX_LDEF_3,
		`RVX_LDEF_0:
			rvx_signal_00 = 1;
	endcase
end

assign rvx_signal_16 = (rvx_signal_03==`RVX_LDEF_3);
assign rvx_signal_10 = (RVX_GPARA_3==0)? rvx_signal_16 : (rvx_signal_16 & (rvx_signal_06==(RVX_LPARA_07-1)));
assign rvx_signal_09 = (RVX_GPARA_0==0)? 0: (rvx_signal_03==`RVX_LDEF_0);
assign rvx_signal_01 = rvx_signal_09 & (rvx_signal_06==(RVX_LPARA_03-1));

`undef RVX_LDEF_5
`undef RVX_LDEF_3
`undef RVX_LDEF_1
`undef RVX_LDEF_4
`undef RVX_LDEF_0
`undef RVX_LDEF_2
endmodule

