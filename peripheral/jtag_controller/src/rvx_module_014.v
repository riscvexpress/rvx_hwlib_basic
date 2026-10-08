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
`include "ervp_ahb_define.vh"
`include "ervp_endian.vh"
`include "ervp_jtag_memorymap_offset.vh"





module RVX_MODULE_014
(
	rvx_port_14,
	rvx_port_09,

	rvx_port_19,
	rvx_port_13,
	rvx_port_08,

	rvx_port_26,
	rvx_port_21,
	rvx_port_15,

	rvx_port_01,
	rvx_port_02,
	rvx_port_00,
	rvx_port_05,
	rvx_port_23,
	rvx_port_20,
	rvx_port_22,
	rvx_port_24,
	rvx_port_06,
	rvx_port_07,
	rvx_port_03,

	rvx_port_18,
	rvx_port_11,
	rvx_port_12,
	rvx_port_17,
	rvx_port_10,
	rvx_port_16,
	rvx_port_25,
	rvx_port_04
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_log_util.vf"
`include "ervp_endian.vf"

input wire rvx_port_14;
input wire rvx_port_09;

input wire rvx_port_19;
input wire [RVX_GPARA_0-1:0] rvx_port_13;
output reg rvx_port_08;

output reg rvx_port_26;
output wire [RVX_GPARA_0-1:0] rvx_port_21;
input wire rvx_port_15;

output wire [RVX_GPARA_2-1:0] rvx_port_01;
output wire [`BW_AHB_BURST-1:0] rvx_port_02;
output wire rvx_port_00;
output wire [`BW_AHB_PROT-1:0] rvx_port_05;
output wire [`BW_AHB_SIZE-1:0] rvx_port_23;
output wire [`BW_AHB_TRANS-1:0] rvx_port_20;
output wire [RVX_GPARA_0-1:0] rvx_port_22;
output wire rvx_port_24;

input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire rvx_port_07;
input wire rvx_port_03;

output wire rvx_port_18;
output wire rvx_port_11;
output wire [RVX_GPARA_2-1:0] rvx_port_12;
output wire rvx_port_17;
output wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_16;
input wire rvx_port_25;
input wire rvx_port_04;

`define RVX_LDEF_05 4

`define RVX_LDEF_06 0
`define RVX_LDEF_08 1
`define RVX_LDEF_11 2
`define RVX_LDEF_10 3
`define RVX_LDEF_00 4
`define RVX_LDEF_04 5
`define RVX_LDEF_02 6
`define RVX_LDEF_01 7
`define RVX_LDEF_03 8
`define RVX_LDEF_09 9

reg [`RVX_LDEF_05-1:0] rvx_signal_07;
wire rvx_signal_06;
wire rvx_signal_05;

reg [`BW_JTAG_CMD-1:0] rvx_signal_08;
reg [RVX_GPARA_2-1:0] rvx_signal_03;
reg [RVX_GPARA_0-1:0] rvx_signal_10;
reg rvx_signal_09;
reg [RVX_GPARA_0-1:0] rvx_signal_02;

reg rvx_signal_01;
reg rvx_signal_04;

`define RVX_LDEF_07 16
wire rvx_signal_00;

always@(posedge rvx_port_14, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
	begin
		rvx_signal_07 <= `RVX_LDEF_06;
		rvx_signal_08 <= 0;
		rvx_signal_03 <= 0;
		rvx_signal_10 <= 0;
		rvx_signal_09 <= 0;
		rvx_signal_02 <= 0;
	end
	else
		case(rvx_signal_07)
			`RVX_LDEF_06:
				if(rvx_port_19)
				begin
					rvx_signal_07 <= `RVX_LDEF_08;
					rvx_signal_08 <= $unsigned(rvx_port_13);
				end
			`RVX_LDEF_08:
				if(rvx_port_19)
				begin
					if(rvx_signal_01)
						rvx_signal_07 <= `RVX_LDEF_11;
					else
					begin
						if(rvx_signal_04)
							rvx_signal_07 <= `RVX_LDEF_02;
						else
							rvx_signal_07 <= `RVX_LDEF_00;
					end
					rvx_signal_03 <= $unsigned(rvx_port_13);
				end
			`RVX_LDEF_11:
				if(rvx_port_19)
				begin
					if(rvx_signal_04)
						rvx_signal_07 <= `RVX_LDEF_02;
					else
						rvx_signal_07 <= `RVX_LDEF_00;
					rvx_signal_10 <= $unsigned(rvx_port_13);
				end				
			`RVX_LDEF_00:
				if(rvx_port_07)
					rvx_signal_07 <= `RVX_LDEF_04;
			`RVX_LDEF_04:
				if(rvx_signal_06)
				begin
					rvx_signal_07 <= `RVX_LDEF_03;
					rvx_signal_09 <= (rvx_port_03==`AHB_RESPONSE_ERROR);
					if(rvx_signal_01==0)
						rvx_signal_02 <= rvx_port_06;
				end
			`RVX_LDEF_02:
				rvx_signal_07 <= `RVX_LDEF_01;
			`RVX_LDEF_01:
				if(rvx_signal_05)
				begin
					rvx_signal_07 <= `RVX_LDEF_03;
					rvx_signal_09 <= rvx_port_04;
					if(rvx_signal_01==0)
						rvx_signal_02 <= rvx_port_16;
				end
			`RVX_LDEF_03:
				if(rvx_port_15)
				begin
					if(rvx_signal_01==0)
						rvx_signal_07 <= `RVX_LDEF_09;
					else
						rvx_signal_07 <= `RVX_LDEF_06;
				end
			`RVX_LDEF_09:
				if(rvx_port_15)
					rvx_signal_07 <= `RVX_LDEF_06;
		endcase
end

always@(*)
begin
	rvx_signal_01 = 0;
	rvx_signal_04 = 0;
	case(rvx_signal_08)
		`JTAG_CMD_SYSTEM_READ:
		begin
			rvx_signal_01 = 0;
			rvx_signal_04 = 1;
		end
		`JTAG_CMD_SYSTEM_WRITE:
		begin
			rvx_signal_01 = 1;
			rvx_signal_04 = 1;
		end
		`JTAG_CMD_MEMORY_READ:
		begin
			rvx_signal_01 = 0;
			rvx_signal_04 = 0;
		end
		`JTAG_CMD_MEMORY_WRITE:
		begin
			rvx_signal_01 = 1;
			rvx_signal_04 = 0;
		end
	endcase
end

assign rvx_signal_06 = ((rvx_signal_07==`RVX_LDEF_04) & rvx_port_07) | rvx_signal_00;
assign rvx_signal_05 = ((rvx_signal_07==`RVX_LDEF_01) & rvx_port_25) | rvx_signal_00;

ERVP_COUNTER
#(
	.BW_COUNTER(`RVX_LDEF_07),
	.CIRCULAR(0)
)
i_rvx_instance_0
(
	.clk(rvx_port_14),
	.rstnn(rvx_port_09),
	.enable((rvx_signal_07!=`RVX_LDEF_06)),
	.init(rvx_signal_06|rvx_signal_05),
	.count(1'b 1),
	.value(),
	.is_first_count(),
	.is_last_count(rvx_signal_00)
);

always@(*)
begin
	rvx_port_08 = 0;
	case(rvx_signal_07)
		`RVX_LDEF_06,
		`RVX_LDEF_08,
		`RVX_LDEF_11,
		`RVX_LDEF_10:
			rvx_port_08 = 1;
	endcase
end

always@(*)
begin
	rvx_port_26 = 0;
	case(rvx_signal_07)
		`RVX_LDEF_03,
		`RVX_LDEF_09:
			rvx_port_26 = 1;
	endcase
end

assign rvx_port_21 = (rvx_signal_07==`RVX_LDEF_09)? $unsigned(rvx_signal_02) : $unsigned(rvx_signal_09);

assign rvx_port_01 = rvx_signal_03;
assign rvx_port_02 = `AHB_BURST_SINGLE;
assign rvx_port_00 = 0;
assign rvx_port_05 = 0;
assign rvx_port_23 = `AHB_SIZE_004BYTE - LOG2RU_MIN1(32) + LOG2RU_MIN1(RVX_GPARA_0);
assign rvx_port_20 = (rvx_signal_07==`RVX_LDEF_00)? `AHB_TRANS_NONSEQ : `AHB_TRANS_IDLE;
assign rvx_port_22 = rvx_signal_10;
assign rvx_port_24 = rvx_signal_01;

assign rvx_port_18 = (rvx_signal_07==`RVX_LDEF_02) | (rvx_signal_07==`RVX_LDEF_01);
assign rvx_port_11 = (rvx_signal_07==`RVX_LDEF_01);
assign rvx_port_12 = rvx_signal_03;
assign rvx_port_17 = rvx_signal_01;
assign rvx_port_10 = rvx_signal_10;

`undef RVX_LDEF_03
`undef RVX_LDEF_02
`undef RVX_LDEF_09
`undef RVX_LDEF_10
`undef RVX_LDEF_07
`undef RVX_LDEF_04
`undef RVX_LDEF_06
`undef RVX_LDEF_00
`undef RVX_LDEF_01
`undef RVX_LDEF_08
`undef RVX_LDEF_11
`undef RVX_LDEF_05
endmodule
