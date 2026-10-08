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





module RVX_MODULE_005
(
	rvx_port_6,
	rvx_port_5,
	rvx_port_7,
	rvx_port_4,
	rvx_port_2,
	rvx_port_3,
	rvx_port_0,
	rvx_port_1
);





parameter RVX_GPARA_2 = 4;
parameter RVX_GPARA_3 = 8;

parameter RVX_GPARA_0 = RVX_GPARA_2 + 1;
parameter RVX_GPARA_1 = RVX_GPARA_3 + 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_00 = `MAX(RVX_GPARA_2,1);
localparam  RVX_LPARA_09 = `MAX(RVX_GPARA_3,1);
localparam  RVX_LPARA_01 = `MIN(`MAX(RVX_GPARA_0-1,1),RVX_LPARA_00);
localparam  RVX_LPARA_06 = `MIN(`MAX(RVX_GPARA_0-1,1),RVX_LPARA_09);

localparam  RVX_LPARA_05 = RVX_LPARA_01 + 1;
localparam  RVX_LPARA_04 = RVX_LPARA_06 + 1;

localparam  RVX_LPARA_08 = `DIVIDERU(RVX_LPARA_00,RVX_LPARA_01);
localparam  RVX_LPARA_07 = `DIVIDERU(RVX_LPARA_09,RVX_LPARA_06);

localparam  RVX_LPARA_03 = `MAX(RVX_LPARA_08,RVX_LPARA_07);
localparam  RVX_LPARA_02 = LOG2RU(RVX_LPARA_03);

input wire rvx_port_6, rvx_port_5;
output wire rvx_port_7;
output wire [RVX_LPARA_00-1:0] rvx_port_4;
input wire rvx_port_2;
input wire [RVX_LPARA_09-1:0] rvx_port_3;

input wire [RVX_GPARA_0-1:0] rvx_port_0;
output wire [RVX_GPARA_1-1:0] rvx_port_1;

reg [RVX_LPARA_05-1:0] rvx_signal_01;
wire [RVX_LPARA_04-1:0] rvx_signal_03;

wire rvx_signal_05;
reg rvx_signal_19;

wire [RVX_LPARA_02-1:0] rvx_signal_15;
wire rvx_signal_09;
wire rvx_signal_17;

wire [RVX_LPARA_01-1:0] rvx_signal_20;
wire [RVX_LPARA_09-1:0] rvx_signal_10;

`define RVX_LDEF_5 3
`define RVX_LDEF_1 0
`define RVX_LDEF_0 1
`define RVX_LDEF_4 2
`define RVX_LDEF_3 3
`define RVX_LDEF_2 4

reg [`RVX_LDEF_5-1:0] rvx_signal_07;
wire rvx_signal_11;

wire rvx_signal_16;
wire rvx_signal_02;
wire rvx_signal_04;
wire rvx_signal_00;

wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire [RVX_LPARA_01-1:0] rvx_signal_14;
wire [RVX_LPARA_01-1:0] rvx_signal_18;

wire [RVX_LPARA_09-1:0] rvx_signal_13;
wire [RVX_LPARA_06-1:0] rvx_signal_12;
wire [RVX_LPARA_06-1:0] rvx_signal_08;

always@(*)
begin
	rvx_signal_01 = 0;
	rvx_signal_01[RVX_LPARA_05-1 -:RVX_GPARA_0] = rvx_port_0;
end
assign rvx_port_1 = rvx_signal_03[RVX_LPARA_04-1 -:RVX_GPARA_1];

RVX_MODULE_046
#(
	.RVX_GPARA_0(RVX_LPARA_01),
	.RVX_GPARA_1(RVX_LPARA_06)
)
i_rvx_instance_3
(
	.rvx_port_05(rvx_port_6),
	.rvx_port_08(rvx_port_5),
	.rvx_port_04(rvx_signal_05),
	.rvx_port_00(rvx_signal_20),
	.rvx_port_03(rvx_signal_19),
	.rvx_port_06(rvx_signal_10[RVX_LPARA_06-1:0]),
	.rvx_port_09(rvx_signal_01),
	.rvx_port_02(rvx_signal_03),
	.rvx_port_01(),
	.rvx_port_07()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_02)
)
i_rvx_instance_0
(
	.clk(rvx_port_6),
	.rstnn(rvx_port_5),
	.enable(1'b 1),
	.init(rvx_signal_09),
	.count(rvx_signal_17),
	.value(rvx_signal_15),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_09 = rvx_signal_04 | rvx_signal_00;
assign rvx_signal_17 = rvx_signal_16 | rvx_signal_02;

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_GPARA_2),
	.SHIFT_AMOUNT(RVX_LPARA_01)
)
i_rvx_instance_1
(
	.clk(rvx_port_6),
	.rstnn(rvx_port_5),
  .enable(1'b 1),
	.set_value(rvx_signal_06),
	.right_insertion(rvx_signal_14),
	.left_insertion(rvx_signal_18),
	.init(1'b 0),
	.set(1'b 0),
	.left_shift(1'b 0),
	.right_shift(rvx_signal_16),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_port_4)
);

assign rvx_signal_06 = 0;
assign rvx_signal_14 = 0;
assign rvx_signal_18 = $unsigned(rvx_signal_20);

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_LPARA_09),
	.SHIFT_AMOUNT(RVX_LPARA_06)
)
i_rvx_instance_2
(
	.clk(rvx_port_6),
	.rstnn(rvx_port_5),
  .enable(1'b 1),
	.set_value(rvx_signal_13),
	.right_insertion(rvx_signal_12),
	.left_insertion(rvx_signal_08),
	.init(1'b 0),
	.set(rvx_signal_11),
	.left_shift(1'b 0),
	.right_shift((rvx_signal_02&(!rvx_signal_00))),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_signal_10)
);

assign rvx_signal_13 = rvx_port_3;
assign rvx_signal_12 = 0;
assign rvx_signal_08 = 0;

always@(posedge rvx_port_6, negedge rvx_port_5)
begin
	if(rvx_port_5==0)
		rvx_signal_07 <= `RVX_LDEF_1;
	else
		case(rvx_signal_07)
			`RVX_LDEF_1:
				if(rvx_signal_05)
					rvx_signal_07 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_signal_04)
					rvx_signal_07 <= `RVX_LDEF_4;
				else if(rvx_signal_16)
					rvx_signal_07 <= `RVX_LDEF_1;
			`RVX_LDEF_4:
				if(rvx_signal_11)
				begin
					if(RVX_GPARA_3==0)
						rvx_signal_07 <= `RVX_LDEF_1;
					else
						rvx_signal_07 <= `RVX_LDEF_3;
				end
			`RVX_LDEF_3:
				if(rvx_signal_05)
					rvx_signal_07 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_00)
					rvx_signal_07 <= `RVX_LDEF_1;
				else if(rvx_signal_02)
					rvx_signal_07 <= `RVX_LDEF_3;
		endcase
end

assign rvx_port_7 = (rvx_signal_07==`RVX_LDEF_4);
assign rvx_signal_11 = rvx_port_7 & rvx_port_2;

always@(*)
begin
	rvx_signal_19 = 0;
	case(rvx_signal_07)
		`RVX_LDEF_0,
		`RVX_LDEF_2:
			rvx_signal_19 = 1;
	endcase
end

assign rvx_signal_16 = (rvx_signal_07==`RVX_LDEF_0);
assign rvx_signal_04 = (RVX_GPARA_2==0)? rvx_signal_16 : (rvx_signal_16 & (rvx_signal_15==(RVX_LPARA_08-1)));
assign rvx_signal_02 = (RVX_GPARA_3==0)? 0: (rvx_signal_07==`RVX_LDEF_2);
assign rvx_signal_00 = rvx_signal_02 & (rvx_signal_15==(RVX_LPARA_07-1));

`undef RVX_LDEF_3
`undef RVX_LDEF_0
`undef RVX_LDEF_4
`undef RVX_LDEF_5
`undef RVX_LDEF_2
`undef RVX_LDEF_1
endmodule

