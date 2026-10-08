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
`include "ervp_jtag_memorymap_offset.vh"





module RVX_MODULE_011
(
	rvx_port_04,
	rvx_port_11,
	rvx_port_10,
	rvx_port_08,
	rvx_port_03,
	rvx_port_12,

	rvx_port_06,
	rvx_port_09,
	rvx_port_07,
	rvx_port_05,

	rvx_port_13,
	rvx_port_00,
	rvx_port_02,
	rvx_port_01
);





parameter RVX_GPARA_2 = 8;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 1;

input wire rvx_port_04;
input wire rvx_port_11;
input wire rvx_port_10;
input wire rvx_port_08;
output reg rvx_port_03;
output wire rvx_port_12;

input wire [RVX_GPARA_2-1:0] rvx_port_06;
output wire rvx_port_09;
output wire [RVX_GPARA_2-1:0] rvx_port_07;
output wire rvx_port_05;

input wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire rvx_port_01;

`define RVX_LDEF_15 4'b0000 
`define RVX_LDEF_12 4'b0001 
`define RVX_LDEF_07 4'b0010 
`define RVX_LDEF_08 4'b0011 
`define RVX_LDEF_05 4'b0100 
`define RVX_LDEF_11 4'b0101 
`define RVX_LDEF_04 4'b0110 
`define RVX_LDEF_09 4'b0111 
`define RVX_LDEF_03 4'b1000 
`define RVX_LDEF_13 4'b1001 
`define RVX_LDEF_01 4'b1010 
`define RVX_LDEF_06 4'b1011 
`define RVX_LDEF_17 4'b1100 
`define RVX_LDEF_10 4'b1101 
`define RVX_LDEF_18 4'b1110 
`define RVX_LDEF_00 4'b1111 

`define RVX_LDEF_14 4
reg [`RVX_LDEF_14-1:0] rvx_signal_23, rvx_signal_03;
reg rvx_signal_18;

wire rvx_signal_14;
wire rvx_signal_06;
wire rvx_signal_07;

wire rvx_signal_22;
wire rvx_signal_19;
wire rvx_signal_09;

wire rvx_signal_01;
wire rvx_signal_17;
wire rvx_signal_04;

wire rvx_signal_15;
wire rvx_signal_12;
wire rvx_signal_24;

wire rvx_signal_21;
wire rvx_signal_02;
wire rvx_signal_20;

wire rvx_signal_05;
wire rvx_signal_13;
wire rvx_signal_10;

`define RVX_LDEF_02 32
`define RVX_LDEF_16  32'h C47F80A1
reg [`RVX_LDEF_02-1:0] rvx_signal_16;
wire rvx_signal_00;

wire rvx_signal_11;
wire rvx_signal_08;

always@(posedge rvx_port_04 or negedge rvx_port_11)
begin : state_update_proc
	if (!rvx_port_11)
		rvx_signal_23 <= `RVX_LDEF_15;
	else
		rvx_signal_23 <= rvx_signal_03;
end

always@(*)
begin : next_state_proc
	rvx_signal_03 = `RVX_LDEF_15;
	rvx_signal_18 = 0;
	case(rvx_signal_23)
		`RVX_LDEF_15:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_15;
			else
			begin
				rvx_signal_03 = `RVX_LDEF_12;
				rvx_signal_18 = 1;
			end
		`RVX_LDEF_12:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_07;
			else
				rvx_signal_03 = `RVX_LDEF_12;
		`RVX_LDEF_07:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_13;
			else
				rvx_signal_03 = `RVX_LDEF_08;
		`RVX_LDEF_08:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_11;
			else
				rvx_signal_03 = `RVX_LDEF_05;
		`RVX_LDEF_05:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_11;
			else
				rvx_signal_03 = `RVX_LDEF_05;
		`RVX_LDEF_11:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_03;
			else
				rvx_signal_03 = `RVX_LDEF_04;
		`RVX_LDEF_04:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_09;
			else
				rvx_signal_03 = `RVX_LDEF_04;
		`RVX_LDEF_09:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_03;
			else
				rvx_signal_03 = `RVX_LDEF_05;
		`RVX_LDEF_03:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_07;
			else
				rvx_signal_03 = `RVX_LDEF_12;
		`RVX_LDEF_13:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_15;
			else
				rvx_signal_03 = `RVX_LDEF_01;
		`RVX_LDEF_01:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_17;
			else
				rvx_signal_03 = `RVX_LDEF_06;
		`RVX_LDEF_06:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_17;
			else
				rvx_signal_03 = `RVX_LDEF_06;
		`RVX_LDEF_17:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_00;
			else
				rvx_signal_03 = `RVX_LDEF_10;
		`RVX_LDEF_10:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_18;
			else
				rvx_signal_03 = `RVX_LDEF_10;
		`RVX_LDEF_18:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_00;
			else
				rvx_signal_03 = `RVX_LDEF_06;
		`RVX_LDEF_00:
			if (rvx_port_10)
				rvx_signal_03 = `RVX_LDEF_07;
			else
				rvx_signal_03 = `RVX_LDEF_12;
	endcase
end

assign rvx_signal_22 = (rvx_signal_23 == `RVX_LDEF_01);
assign rvx_signal_19 = (rvx_signal_23 == `RVX_LDEF_00);
assign rvx_signal_09 = (rvx_signal_23 == `RVX_LDEF_06);

assign rvx_signal_01 = (rvx_signal_23 == `RVX_LDEF_08);
assign rvx_signal_17 = (rvx_signal_23 == `RVX_LDEF_03);
assign rvx_signal_04 = (rvx_signal_23 == `RVX_LDEF_05);

assign rvx_signal_14 = (~rvx_signal_06) & (~rvx_signal_07);
assign rvx_signal_06 = (rvx_port_07==`JTAG_INST_IDCODE);
assign rvx_signal_07 = ($signed(rvx_port_07)==`JTAG_INST_BYPASS);

assign rvx_signal_15 = rvx_signal_01 & rvx_signal_06;
assign rvx_signal_12 = rvx_signal_17 & rvx_signal_06;
assign rvx_signal_24 = rvx_signal_04 & rvx_signal_06;

assign rvx_signal_21 = rvx_signal_01 & rvx_signal_07;
assign rvx_signal_02 = rvx_signal_17 & rvx_signal_07;
assign rvx_signal_20 = rvx_signal_04 & rvx_signal_07;

assign rvx_signal_05 = rvx_signal_01 & rvx_signal_14;
assign rvx_signal_13 = rvx_signal_17 & rvx_signal_14;
assign rvx_signal_10 = rvx_signal_04 & rvx_signal_14;

always@(posedge rvx_port_04 or negedge rvx_port_11)
begin : i_idcode
	if (~rvx_port_11)
		rvx_signal_16 <= `RVX_LDEF_16;
	else if(rvx_signal_18||rvx_signal_15)
		rvx_signal_16 <= `RVX_LDEF_16;
	else if(rvx_signal_24)
	begin
		if(RVX_GPARA_1==1)
			rvx_signal_16 <= {1'b 1,rvx_signal_16[`RVX_LDEF_02-1:1]};
		else
			rvx_signal_16 <= {rvx_signal_16[`RVX_LDEF_02-2:0],1'b 1};
	end
end

assign rvx_signal_00 = (RVX_GPARA_1==1)? rvx_signal_16[0] : rvx_signal_16[`RVX_LDEF_02-1];

RVX_MODULE_055
#(
	.RVX_GPARA_1(RVX_GPARA_2),
	.RVX_GPARA_2(RVX_GPARA_1),
	.RVX_GPARA_0(`JTAG_INST_IDCODE)
)
i_rvx_instance_0
(
	.rvx_port_05(rvx_port_11),
	.rvx_port_08(rvx_port_04),
	.rvx_port_09(rvx_port_08),
	
	.rvx_port_03(rvx_signal_18),
	.rvx_port_04(rvx_signal_22),
	.rvx_port_02(rvx_signal_19),
	.rvx_port_06(rvx_signal_09),

	.rvx_port_01(rvx_port_06),
	.rvx_port_07(rvx_port_07),
	.rvx_port_00(rvx_signal_11)
);

RVX_MODULE_055
#(
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_2(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_05(rvx_port_11),
	.rvx_port_08(rvx_port_04),
	.rvx_port_09(rvx_port_08),
	
	.rvx_port_03(1'b 0),
	.rvx_port_04(rvx_signal_05),
	.rvx_port_02(rvx_signal_13),
	.rvx_port_06(rvx_signal_10),

	.rvx_port_01(rvx_port_13),
	.rvx_port_07(rvx_port_02),
	.rvx_port_00(rvx_signal_08)
);

always@(negedge rvx_port_04 or negedge rvx_port_11)
begin : jtag_tdo_reg
	if(~rvx_port_11)
		rvx_port_03 <= 0;
	else if(rvx_signal_18)
		rvx_port_03 <= 0;
	else if(rvx_signal_20)
		rvx_port_03 <= rvx_port_08;
	else if(rvx_signal_24)
		rvx_port_03 <= rvx_signal_00;
	else if(rvx_signal_10)
		rvx_port_03 <= rvx_signal_08;
	else if(rvx_signal_09)
		rvx_port_03 <= rvx_signal_11;
end

assign rvx_port_12 = rvx_signal_09 | rvx_signal_04;

assign rvx_port_09 = rvx_signal_22;
assign rvx_port_05 = rvx_signal_19;

assign rvx_port_00 = rvx_signal_05;
assign rvx_port_01 = rvx_signal_13;

`undef RVX_LDEF_02
`undef RVX_LDEF_10
`undef RVX_LDEF_06
`undef RVX_LDEF_03
`undef RVX_LDEF_12
`undef RVX_LDEF_01
`undef RVX_LDEF_07
`undef RVX_LDEF_16
`undef RVX_LDEF_18
`undef RVX_LDEF_15
`undef RVX_LDEF_05
`undef RVX_LDEF_04
`undef RVX_LDEF_09
`undef RVX_LDEF_11
`undef RVX_LDEF_08
`undef RVX_LDEF_13
`undef RVX_LDEF_00
`undef RVX_LDEF_14
`undef RVX_LDEF_17
endmodule
