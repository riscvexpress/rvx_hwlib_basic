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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "ervp_axi_define.vh"
`include "ervp_ahb_define.vh"





module MUNOC_MODULE_21 (
	munoc_port_27,
	munoc_port_07,

	munoc_port_38,
	munoc_port_36,
	munoc_port_44,
	munoc_port_18,
	munoc_port_24,
	munoc_port_13,
	munoc_port_34,

	munoc_port_42,
	munoc_port_39,
	munoc_port_25,
	munoc_port_01,
	munoc_port_20,
	munoc_port_22,

	munoc_port_37,
	munoc_port_35,
	munoc_port_33,
	munoc_port_31,

	munoc_port_11,
	munoc_port_10,
	munoc_port_23,
	munoc_port_16,
	munoc_port_32,
	munoc_port_05,
	munoc_port_08,

	munoc_port_06,
	munoc_port_15,
	munoc_port_17,
	munoc_port_30,
	munoc_port_04,
	munoc_port_02,

	munoc_port_09,
	munoc_port_19,
	munoc_port_28,
	munoc_port_03,
	munoc_port_41,
	munoc_port_14,
	munoc_port_29,
	munoc_port_43,
	munoc_port_21,
	munoc_port_26,
	munoc_port_12,
	munoc_port_00,
	munoc_port_40
);





parameter MUNOC_GPARA_2 = 1;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_0 = 8;

input wire munoc_port_27, munoc_port_07;

input wire [MUNOC_GPARA_2-1:0] munoc_port_38;
input wire [MUNOC_GPARA_1-1:0] munoc_port_36;
input wire [`BW_AXI_ALEN-1:0] munoc_port_44;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_18;
input wire [`BW_AXI_ABURST-1:0] munoc_port_24;
input wire munoc_port_13;
output wire munoc_port_34;

input wire [MUNOC_GPARA_2-1:0] munoc_port_42;
input wire [MUNOC_GPARA_0-1:0] munoc_port_39;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_25;
input wire munoc_port_01;
input wire munoc_port_20;
output wire munoc_port_22;

output wire [MUNOC_GPARA_2-1:0] munoc_port_37;
output wire [`BW_AXI_BRESP-1:0] munoc_port_35;
output wire munoc_port_33;
input wire munoc_port_31;

input wire [MUNOC_GPARA_2-1:0] munoc_port_11;
input wire [MUNOC_GPARA_1-1:0] munoc_port_10;
input wire [`BW_AXI_ALEN-1:0] munoc_port_23;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_16;
input wire [`BW_AXI_ABURST-1:0] munoc_port_32;
input wire munoc_port_05;
output wire munoc_port_08;

output wire [MUNOC_GPARA_2-1:0] munoc_port_06;
output wire [MUNOC_GPARA_0-1:0] munoc_port_15;
output wire [`BW_AXI_RRESP-1:0] munoc_port_17;
output wire munoc_port_30;
output wire munoc_port_04;
input wire munoc_port_02;

output wire munoc_port_09;
output wire [MUNOC_GPARA_1-1:0] munoc_port_19;
output reg [`BW_AHB_BURST-1:0] munoc_port_28;
output wire munoc_port_03;
output wire [`BW_AHB_PROT-1:0] munoc_port_41;
output wire [`BW_AHB_SIZE-1:0] munoc_port_14;
output reg [`BW_AHB_TRANS-1:0] munoc_port_29;
output wire munoc_port_43;
output wire [MUNOC_GPARA_0-1:0] munoc_port_21;
output reg [MUNOC_GPARA_2-1:0] munoc_port_26;

input wire munoc_port_12;
input wire munoc_port_00;
input wire [MUNOC_GPARA_0-1:0] munoc_port_40;

wire munoc_signal_04;
wire munoc_signal_37;
wire [MUNOC_GPARA_0-1:0] munoc_signal_23;
wire [1:0] munoc_signal_26;
wire munoc_signal_03;
wire [MUNOC_GPARA_0-1:0] munoc_signal_33;

wire [1:0] munoc_signal_22;
wire munoc_signal_05;
wire [`BW_RCHANNEL(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_signal_38;
wire munoc_signal_13;
wire munoc_signal_11;
wire [`BW_RCHANNEL(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_signal_07;
wire [`BW_AXI_RRESP-1:0] munoc_signal_28;

reg [MUNOC_GPARA_2-1:0] munoc_signal_08;
reg [MUNOC_GPARA_1-1:0] munoc_signal_19;
reg [`BW_AXI_ALEN-1:0] munoc_signal_32;
reg [`BW_AXI_ASIZE-1:0] munoc_signal_36;
reg [`BW_AXI_ABURST-1:0] munoc_signal_15;

wire munoc_signal_39;
wire munoc_signal_29;
wire munoc_signal_30;
wire munoc_signal_02;

`define MUNOC_LDEF_1 3
`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_7 2
`define MUNOC_LDEF_6 3

reg [`MUNOC_LDEF_1-1:0] munoc_signal_16;
wire munoc_signal_21;
wire munoc_signal_34;
reg munoc_signal_17;
reg munoc_signal_09;
wire munoc_signal_01;
wire munoc_signal_06;

reg munoc_signal_24;
reg munoc_signal_12;
wire munoc_signal_35;

`define MUNOC_LDEF_4 3
`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_2 1
`define MUNOC_LDEF_5 2

reg [`MUNOC_LDEF_4-1:0] munoc_signal_20;
wire munoc_signal_00;
wire munoc_signal_27;
wire munoc_signal_10;

reg [MUNOC_GPARA_2-1:0] munoc_signal_25;

wire munoc_signal_18;
wire munoc_signal_14;
wire munoc_signal_31;

ERVP_SMALL_FIFO
#(
	.BW_DATA(MUNOC_GPARA_0),
	.DEPTH(4),	
	.READ_READY_SIZE(2)
)
i_munoc_instance_3
(
	.clk(munoc_port_27),
	.rstnn(munoc_port_07),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_04),
	.wfull(),
	.wrequest(munoc_signal_37),
	.wdata(munoc_signal_23),
	.rready(munoc_signal_26),
	.rempty(),
	.rrequest(munoc_signal_03),
	.rdata(munoc_signal_33)
);

assign munoc_port_22 = munoc_signal_04;
assign munoc_signal_37 = munoc_port_20;
assign munoc_signal_23 = munoc_port_39;
assign munoc_signal_03 = munoc_signal_20[`MUNOC_LDEF_2] & munoc_port_12;
assign munoc_port_21 = munoc_signal_33;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`BW_RCHANNEL(MUNOC_GPARA_2,MUNOC_GPARA_0)),
	.DEPTH(4),
	.WRITE_READY_SIZE(2)
)
i_munoc_instance_0
(
	.clk(munoc_port_27),
	.rstnn(munoc_port_07),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_22),
	.wfull(),
	.wrequest(munoc_signal_05),
	.wdata(munoc_signal_38),
	.rready(munoc_signal_13),
	.rempty(),
	.rrequest(munoc_signal_11),
	.rdata(munoc_signal_07)
);

assign munoc_signal_05 = munoc_signal_20[`MUNOC_LDEF_0] & munoc_port_12;
assign munoc_signal_38 = {munoc_signal_25,munoc_port_40,munoc_signal_28,munoc_signal_20[`MUNOC_LDEF_5]};
assign munoc_port_04 = munoc_signal_13;
assign munoc_signal_11 = munoc_port_02;
assign {munoc_port_06,munoc_port_15,munoc_port_17,munoc_port_30} = munoc_signal_07;
assign munoc_signal_28 = (munoc_port_00==`AHB_RESPONSE_OKAY)? `AXI_RESPONSE_OKAY : `AXI_RESPONSE_SLVERR;

always@(*)
begin
	{munoc_signal_08,munoc_signal_19,munoc_signal_32,munoc_signal_36,munoc_signal_15} = {munoc_port_11,munoc_port_10,munoc_port_23,munoc_port_16,munoc_port_32};
	case(munoc_signal_16)
		`MUNOC_LDEF_3:
			if(munoc_signal_01)
				{munoc_signal_08,munoc_signal_19,munoc_signal_32,munoc_signal_36,munoc_signal_15} = {munoc_port_11,munoc_port_10,munoc_port_23,munoc_port_16,munoc_port_32};
			else if(munoc_signal_06)
				{munoc_signal_08,munoc_signal_19,munoc_signal_32,munoc_signal_36,munoc_signal_15} = {munoc_port_38,munoc_port_36,munoc_port_44,munoc_port_18,munoc_port_24};
		`MUNOC_LDEF_7:
			{munoc_signal_08,munoc_signal_19,munoc_signal_32,munoc_signal_36,munoc_signal_15} = {munoc_port_11,munoc_port_10,munoc_port_23,munoc_port_16,munoc_port_32};
		`MUNOC_LDEF_6:
			{munoc_signal_08,munoc_signal_19,munoc_signal_32,munoc_signal_36,munoc_signal_15} = {munoc_port_38,munoc_port_36,munoc_port_44,munoc_port_18,munoc_port_24};
	endcase
end

MUNOC_MODULE_28
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_1)
)
i_munoc_instance_1
(
	.munoc_port_11(munoc_port_27),
	.munoc_port_02(munoc_port_07),
	.munoc_port_10(munoc_signal_19),
	.munoc_port_09(munoc_signal_32),
	.munoc_port_00(munoc_signal_36),
	.munoc_port_03(munoc_signal_15),
	.munoc_port_06(munoc_signal_39),
	.munoc_port_05(munoc_signal_29),
	.munoc_port_01(munoc_port_19),
	.munoc_port_04(),
	.munoc_port_07(munoc_signal_30),
	.munoc_port_08(munoc_signal_02)
);

assign munoc_signal_39 = munoc_signal_01 | munoc_signal_06;
assign munoc_signal_29 = munoc_signal_24;

always@(posedge munoc_port_27, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_16 <= `MUNOC_LDEF_3;
	else
		case(munoc_signal_16)
			`MUNOC_LDEF_3:
				if(munoc_signal_01)
					munoc_signal_16 <= `MUNOC_LDEF_7;
				else if(munoc_signal_06)
					munoc_signal_16 <= `MUNOC_LDEF_6;
			`MUNOC_LDEF_7,
			`MUNOC_LDEF_6:
				if(munoc_signal_35)
					munoc_signal_16 <= `MUNOC_LDEF_3;
		endcase
end

always@(posedge munoc_port_27, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_port_26 <= 0;
	else if(munoc_signal_01||munoc_signal_06)
		munoc_port_26 <= munoc_signal_08;
end

assign munoc_signal_34 = (munoc_signal_16==`MUNOC_LDEF_3) & (~munoc_signal_21);
assign munoc_signal_01 = munoc_signal_34 & munoc_port_05;
assign munoc_signal_06 = munoc_signal_34 & munoc_port_13 & munoc_port_31 & (~munoc_signal_01);
assign munoc_signal_35 = munoc_signal_24 & munoc_signal_02;

always@(*)
begin
	munoc_port_29 = `AHB_TRANS_IDLE;
	case(munoc_signal_16)
		`MUNOC_LDEF_7:
			if(munoc_signal_30)
			begin
				if(munoc_signal_17)
					munoc_port_29 = `AHB_TRANS_NONSEQ;
				else
					munoc_port_29 = `AHB_TRANS_IDLE;
			end
			else
			begin
				if(munoc_signal_17)
					munoc_port_29 = `AHB_TRANS_SEQ;
				else
					munoc_port_29 = `AHB_TRANS_BUSY;
			end
		`MUNOC_LDEF_6:
			if(munoc_signal_30)
			begin
				if(munoc_signal_09)
					munoc_port_29 = `AHB_TRANS_NONSEQ;
				else
					munoc_port_29 = `AHB_TRANS_IDLE;
			end
			else
			begin
				if(munoc_signal_09)
					munoc_port_29 = `AHB_TRANS_SEQ;
				else
					munoc_port_29 = `AHB_TRANS_BUSY;
			end
	endcase
end

always@(*)
begin
	munoc_signal_17 = 0;
	case(munoc_signal_16)
		`MUNOC_LDEF_7:
			if(munoc_signal_20[`MUNOC_LDEF_0])
			begin
				if(munoc_signal_22[1])
					munoc_signal_17 = 1;
			end
			else if(munoc_signal_22[0])
				munoc_signal_17 = 1;
	endcase
end

always@(*)
begin
	munoc_signal_09 = 0;
	case(munoc_signal_16)
		`MUNOC_LDEF_6:
			if(munoc_signal_20[`MUNOC_LDEF_2])
			begin
				if(munoc_signal_26[1])
					munoc_signal_09 = 1;
			end
			else if(munoc_signal_26[0])
				munoc_signal_09 = 1;
	endcase
end

always@(*)
begin
	munoc_signal_24 = 0;
	case(munoc_port_29)
		 `AHB_TRANS_NONSEQ,
		 `AHB_TRANS_SEQ:
			 if(munoc_port_12)
				 munoc_signal_24 = 1;
	endcase
end

always@(*)
begin
	munoc_signal_12 = 0;
	case(munoc_signal_16)
		`MUNOC_LDEF_7,
		`MUNOC_LDEF_6:
			if(munoc_signal_35)
				munoc_signal_12 = 1;
	endcase
end

always@(posedge munoc_port_27, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_port_28 <= `AHB_BURST_SINGLE;
	else if(munoc_signal_01||munoc_signal_06)
		case(munoc_signal_15)
			`AXI_BURST_FIXED:
				munoc_port_28 <= `AHB_BURST_SINGLE;
			`AXI_BURST_INCR:
				case(munoc_signal_32)
					`AXI_LENGTH_01: munoc_port_28 <= `AHB_BURST_SINGLE;
					`AXI_LENGTH_04: munoc_port_28 <= `AHB_BURST_INCR4;
					`AXI_LENGTH_08: munoc_port_28 <= `AHB_BURST_INCR8;
					`AXI_LENGTH_16: munoc_port_28 <= `AHB_BURST_INCR16;
					default: munoc_port_28 <= `AHB_BURST_INCR;
				endcase
			`AXI_BURST_WRAP:
				case(munoc_signal_32)
					`AXI_LENGTH_01: munoc_port_28 <= `AHB_BURST_SINGLE;
					`AXI_LENGTH_04: munoc_port_28 <= `AHB_BURST_WRAP4;
					`AXI_LENGTH_08: munoc_port_28 <= `AHB_BURST_WRAP8;
					`AXI_LENGTH_16: munoc_port_28 <= `AHB_BURST_WRAP16;
					default: munoc_port_28 <= `AHB_BURST_SINGLE;
				endcase
		endcase
end

assign munoc_port_09 = 1;
assign munoc_port_03 = 0;
assign munoc_port_41 = 0;
assign munoc_port_14 = munoc_signal_36;

assign munoc_port_43 = (munoc_signal_16==`MUNOC_LDEF_6);

assign munoc_port_08 = munoc_signal_12 & (munoc_signal_16==`MUNOC_LDEF_7);
assign munoc_port_34 = munoc_signal_12 & (munoc_signal_16==`MUNOC_LDEF_6);

always@(posedge munoc_port_27, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_20 <= 0;
	else if(munoc_signal_21)
		;
	else if(munoc_signal_24)
	begin
		if(munoc_signal_16==`MUNOC_LDEF_7)
			munoc_signal_20[`MUNOC_LDEF_0] <= 1;
		else
			munoc_signal_20[`MUNOC_LDEF_0] <= 0;

		if(munoc_signal_16==`MUNOC_LDEF_6)
			munoc_signal_20[`MUNOC_LDEF_2] <= 1;
		else
			munoc_signal_20[`MUNOC_LDEF_2] <= 0;

		if(munoc_signal_35)
			munoc_signal_20[`MUNOC_LDEF_5] <= 1;
		else
			munoc_signal_20[`MUNOC_LDEF_5] <= 0;
	end
	else if(munoc_signal_27)
		munoc_signal_20 <= 0;
end

assign munoc_signal_00 = (munoc_signal_20!=0);
assign munoc_signal_27 = munoc_signal_00 & munoc_port_12;
assign munoc_signal_10 = munoc_signal_27 & munoc_signal_20[`MUNOC_LDEF_5];
assign munoc_signal_21 = munoc_signal_00 & (~munoc_signal_27);

always@(posedge munoc_port_27, negedge munoc_port_07)
begin
	if(munoc_port_07==0)
		munoc_signal_25 <= 0;
	else if(munoc_signal_24 && munoc_signal_30)
		case(munoc_signal_16)
			`MUNOC_LDEF_7:
				munoc_signal_25 <= munoc_port_11;
			`MUNOC_LDEF_6:
				munoc_signal_25 <= munoc_port_38;
		endcase
end

MUNOC_MODULE_25
i_munoc_instance_2
(
	.munoc_port_3(munoc_port_27),
	.munoc_port_6(munoc_port_07),
	.munoc_port_0(munoc_signal_18),
	.munoc_port_2(munoc_signal_14),
	.munoc_port_5(munoc_port_00),
	.munoc_port_1(),
	.munoc_port_4(munoc_signal_31)
);

assign munoc_signal_18 = munoc_signal_20[`MUNOC_LDEF_2] & munoc_signal_10;
assign munoc_signal_14 = munoc_signal_20[`MUNOC_LDEF_2] & munoc_signal_27; 

assign munoc_port_37 = munoc_signal_25;
assign munoc_port_35 = (munoc_signal_31==1)? `AXI_RESPONSE_SLVERR : `AXI_RESPONSE_OKAY;
assign munoc_port_33 = munoc_signal_20[`MUNOC_LDEF_2] & munoc_signal_10;

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_7
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_6
`undef MUNOC_LDEF_2
endmodule
