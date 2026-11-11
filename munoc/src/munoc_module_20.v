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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_10.vh"





module MUNOC_MODULE_20
(
	munoc_port_07,
	munoc_port_10,
	munoc_port_06,

	munoc_port_00,
	munoc_port_04,
	munoc_port_09,
	munoc_port_08,

	munoc_port_03,
	munoc_port_05,
	munoc_port_02,
	munoc_port_01,

	munoc_port_11
);





parameter MUNOC_GPARA_4 = 32;
parameter MUNOC_GPARA_5 = 1;
parameter MUNOC_GPARA_3 = 16;
parameter MUNOC_GPARA_0 = 0;
parameter MUNOC_GPARA_6 = 0;
parameter MUNOC_GPARA_2 = 0;
parameter MUNOC_GPARA_1 = 0;

input wire munoc_port_07, munoc_port_10;
input wire munoc_port_06;

input wire [MUNOC_GPARA_4-1:0] munoc_port_00;
input wire munoc_port_04;
output wire munoc_port_09;
input wire [MUNOC_GPARA_5-1:0] munoc_port_08;
input wire [MUNOC_GPARA_4-1:0] munoc_port_03;
input wire munoc_port_05;
output wire munoc_port_02;
input wire [MUNOC_GPARA_5-1:0] munoc_port_01;

output reg munoc_port_11;

wire munoc_signal_05;
wire munoc_signal_13;
wire [MUNOC_GPARA_4-1:0] munoc_signal_03;
wire [MUNOC_GPARA_5-1:0] munoc_signal_14;

wire munoc_signal_00;
wire munoc_signal_17;
wire [MUNOC_GPARA_5-1:0] munoc_signal_12;
wire munoc_signal_11;

wire munoc_signal_09;
wire munoc_signal_08;
wire [MUNOC_GPARA_4-1:0] munoc_signal_15;
wire [MUNOC_GPARA_5-1:0] munoc_signal_07;

wire munoc_signal_01;
wire munoc_signal_04;
wire [MUNOC_GPARA_5-1:0] munoc_signal_10;
wire munoc_signal_02;

wire munoc_signal_16;
wire munoc_signal_06;

ERVP_FIFO
#(
	.BW_DATA(MUNOC_GPARA_4+MUNOC_GPARA_5),
	.DEPTH(MUNOC_GPARA_3)
)
i_munoc_instance_1
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_10),
	.enable(munoc_port_06),
  .clear(1'b 0),
	.wready(munoc_port_09),
	.wfull(),
	.wrequest(munoc_port_04),
	.wdata({munoc_port_08,munoc_port_00}),
	.rready(munoc_signal_05),
	.rempty(),
	.rrequest(munoc_signal_13),
	.rdata({munoc_signal_14,munoc_signal_03}),
	.wnum(),
	.rnum()
);

ERVP_FIFO
#(
	.BW_DATA(MUNOC_GPARA_4+MUNOC_GPARA_5),
	.DEPTH(MUNOC_GPARA_3)
)
i_munoc_instance_3
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_10),
	.enable(munoc_port_06),
  .clear(1'b 0),
	.wready(munoc_port_02),
	.wfull(),
	.wrequest(munoc_port_05),
	.wdata({munoc_port_01,munoc_port_03}),
	.rready(munoc_signal_09),
	.rempty(),
	.rrequest(munoc_signal_08),
	.rdata({munoc_signal_07,munoc_signal_15}),
	.wnum(),
	.rnum()
);

assign munoc_signal_16 = munoc_port_06 & munoc_signal_05 & munoc_signal_09;
assign munoc_signal_06 = munoc_signal_16 & (munoc_signal_03==munoc_signal_15);

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_5),
	.RESET_NUMBER((MUNOC_GPARA_6==1)? 0 : 1),
	.CIRCULAR(0)
)
i_munoc_instance_2
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_10),
	.enable((MUNOC_GPARA_0==1)&munoc_port_06),
	.init(munoc_signal_00),
	.count(munoc_signal_17),
	.value(munoc_signal_12),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_11 = (MUNOC_GPARA_0==1)? (munoc_signal_12==munoc_signal_14) : 1;
assign munoc_signal_00 = munoc_signal_06 & munoc_signal_11;
assign munoc_signal_17 = munoc_signal_06 & (~munoc_signal_11);
assign munoc_signal_13 = munoc_signal_00;

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_5),
	.RESET_NUMBER((MUNOC_GPARA_1==1)? 0 : 1),
	.CIRCULAR(0)
)
i_munoc_instance_0
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_10),
	.enable((MUNOC_GPARA_2==1)&munoc_port_06),
	.init(munoc_signal_01),
	.count(munoc_signal_04),
	.value(munoc_signal_10),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_02 = (MUNOC_GPARA_2==1)? (munoc_signal_10==munoc_signal_07) : 1;
assign munoc_signal_01 = munoc_signal_06 & munoc_signal_02;
assign munoc_signal_04 = munoc_signal_06 & (~munoc_signal_02);
assign munoc_signal_08 = munoc_signal_01;

always@(posedge munoc_port_07, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
		munoc_port_11 <= 0;
	else if(munoc_signal_16 & (~munoc_signal_06))
		munoc_port_11 <= 1;
end

endmodule
