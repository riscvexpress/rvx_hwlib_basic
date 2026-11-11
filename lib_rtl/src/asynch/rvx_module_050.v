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





module RVX_MODULE_050
(
	rvx_port_0,
	rvx_port_3,
	rvx_port_5,
	rvx_port_4,
	rvx_port_6,
	rvx_port_1,
	rvx_port_2,
	rvx_port_7
);





parameter RVX_GPARA_3 = 4;
parameter RVX_GPARA_1 = 8;

parameter RVX_GPARA_0 = RVX_GPARA_3 + 1;
parameter RVX_GPARA_2 = RVX_GPARA_1 + 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_06 = `MAX(RVX_GPARA_3,1);
localparam  RVX_LPARA_02 = `MAX(RVX_GPARA_1,1);
localparam  RVX_LPARA_00 = `MIN(`MAX(RVX_GPARA_0-1,1),RVX_LPARA_06);
localparam  RVX_LPARA_07 = `MIN(`MAX(RVX_GPARA_0-1,1),RVX_LPARA_02);

localparam  RVX_LPARA_09 = RVX_LPARA_00 + 1;
localparam  RVX_LPARA_01 = RVX_LPARA_07 + 1;

localparam  RVX_LPARA_05 = `DIVIDERU(RVX_LPARA_06,RVX_LPARA_00);
localparam  RVX_LPARA_03 = `DIVIDERU(RVX_LPARA_02,RVX_LPARA_07);

localparam  RVX_LPARA_04 = `MAX(RVX_LPARA_05,RVX_LPARA_03);
localparam  RVX_LPARA_08 = LOG2RU(RVX_LPARA_04);

input wire rvx_port_0, rvx_port_3;
output wire rvx_port_5;
output wire [RVX_LPARA_06-1:0] rvx_port_4;
input wire rvx_port_6;
input wire [RVX_LPARA_02-1:0] rvx_port_1;

input wire [RVX_GPARA_0-1:0] rvx_port_2;
output wire [RVX_GPARA_2-1:0] rvx_port_7;

reg [RVX_LPARA_09-1:0] rvx_signal_14;
wire [RVX_LPARA_01-1:0] rvx_signal_00;

wire rvx_signal_03;
reg rvx_signal_19;

wire [RVX_LPARA_08-1:0] rvx_signal_06;
wire rvx_signal_05;
wire rvx_signal_17;

wire [RVX_LPARA_00-1:0] rvx_signal_11;
wire [RVX_LPARA_02-1:0] rvx_signal_15;

`define RVX_LDEF_2 3
`define RVX_LDEF_0 0
`define RVX_LDEF_1 1
`define RVX_LDEF_5 2
`define RVX_LDEF_4 3
`define RVX_LDEF_3 4

reg [`RVX_LDEF_2-1:0] rvx_signal_04;
wire rvx_signal_12;

wire rvx_signal_16;
wire rvx_signal_18;
wire rvx_signal_02;
wire rvx_signal_09;

wire [RVX_GPARA_3-1:0] rvx_signal_08;
wire [RVX_LPARA_00-1:0] rvx_signal_13;
wire [RVX_LPARA_00-1:0] rvx_signal_20;

wire [RVX_LPARA_02-1:0] rvx_signal_01;
wire [RVX_LPARA_07-1:0] rvx_signal_07;
wire [RVX_LPARA_07-1:0] rvx_signal_10;

always@(*)
begin
	rvx_signal_14 = 0;
	rvx_signal_14[RVX_LPARA_09-1 -:RVX_GPARA_0] = rvx_port_2;
end
assign rvx_port_7 = rvx_signal_00[RVX_LPARA_01-1 -:RVX_GPARA_2];

RVX_MODULE_013
#(
	.RVX_GPARA_0(RVX_LPARA_00),
	.RVX_GPARA_1(RVX_LPARA_07)
)
i_rvx_instance_1
(
	.rvx_port_08(rvx_port_0),
	.rvx_port_01(rvx_port_3),
	.rvx_port_06(rvx_signal_03),
	.rvx_port_07(rvx_signal_11),
	.rvx_port_00(rvx_signal_19),
	.rvx_port_05(rvx_signal_15[RVX_LPARA_07-1:0]),
	.rvx_port_02(rvx_signal_14),
	.rvx_port_09(rvx_signal_00),
	.rvx_port_04(),
	.rvx_port_03()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_08)
)
i_rvx_instance_3
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_3),
	.enable(1'b 1),
	.init(rvx_signal_05),
	.count(rvx_signal_17),
	.value(rvx_signal_06),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_05 = rvx_signal_02 | rvx_signal_09;
assign rvx_signal_17 = rvx_signal_16 | rvx_signal_18;

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_GPARA_3),
	.SHIFT_AMOUNT(RVX_LPARA_00)
)
i_rvx_instance_2
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_3),
  .enable(1'b 1),
	.set_value(rvx_signal_08),
	.right_insertion(rvx_signal_13),
	.left_insertion(rvx_signal_20),
	.clear(1'b 0),
	.set(1'b 0),
	.left_shift(1'b 0),
	.right_shift(rvx_signal_16),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_port_4)
);

assign rvx_signal_08 = 0;
assign rvx_signal_13 = 0;
assign rvx_signal_20 = $unsigned(rvx_signal_11);

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_LPARA_02),
	.SHIFT_AMOUNT(RVX_LPARA_07)
)
i_rvx_instance_0
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_3),
  .enable(1'b 1),
	.set_value(rvx_signal_01),
	.right_insertion(rvx_signal_07),
	.left_insertion(rvx_signal_10),
	.clear(1'b 0),
	.set(rvx_signal_12),
	.left_shift(1'b 0),
	.right_shift((rvx_signal_18&(!rvx_signal_09))),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_signal_15)
);

assign rvx_signal_01 = rvx_port_1;
assign rvx_signal_07 = 0;
assign rvx_signal_10 = 0;

always@(posedge rvx_port_0, negedge rvx_port_3)
begin
	if(rvx_port_3==0)
		rvx_signal_04 <= `RVX_LDEF_0;
	else
		case(rvx_signal_04)
			`RVX_LDEF_0:
				if(rvx_signal_03)
					rvx_signal_04 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_02)
					rvx_signal_04 <= `RVX_LDEF_5;
				else if(rvx_signal_16)
					rvx_signal_04 <= `RVX_LDEF_0;
			`RVX_LDEF_5:
				if(rvx_signal_12)
				begin
					if(RVX_GPARA_1==0)
						rvx_signal_04 <= `RVX_LDEF_0;
					else
						rvx_signal_04 <= `RVX_LDEF_4;
				end
			`RVX_LDEF_4:
				if(rvx_signal_03)
					rvx_signal_04 <= `RVX_LDEF_3;
			`RVX_LDEF_3:
				if(rvx_signal_09)
					rvx_signal_04 <= `RVX_LDEF_0;
				else if(rvx_signal_18)
					rvx_signal_04 <= `RVX_LDEF_4;
		endcase
end

assign rvx_port_5 = (rvx_signal_04==`RVX_LDEF_5);
assign rvx_signal_12 = rvx_port_5 & rvx_port_6;

always@(*)
begin
	rvx_signal_19 = 0;
	case(rvx_signal_04)
		`RVX_LDEF_1,
		`RVX_LDEF_3:
			rvx_signal_19 = 1;
	endcase
end

assign rvx_signal_16 = (rvx_signal_04==`RVX_LDEF_1);
assign rvx_signal_02 = (RVX_GPARA_3==0)? rvx_signal_16 : (rvx_signal_16 & (rvx_signal_06==(RVX_LPARA_05-1)));
assign rvx_signal_18 = (RVX_GPARA_1==0)? 0: (rvx_signal_04==`RVX_LDEF_3);
assign rvx_signal_09 = rvx_signal_18 & (rvx_signal_06==(RVX_LPARA_03-1));

`undef RVX_LDEF_4
`undef RVX_LDEF_1
`undef RVX_LDEF_5
`undef RVX_LDEF_2
`undef RVX_LDEF_3
`undef RVX_LDEF_0
endmodule

