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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_01.vh"
`include "munoc_tid_control_type.vh"





module MUNOC_MODULE_25
(
	munoc_port_07,
	munoc_port_09,
	munoc_port_00,
	munoc_port_01,
	munoc_port_04,
	munoc_port_05,

	munoc_port_03,
	munoc_port_02,
	munoc_port_08,
	munoc_port_06
);





parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_2 = `SINGLE_TARGET_SLAVE;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_0 = 8;
localparam  MUNOC_LPARA_1 = `MAX(2,MUNOC_LPARA_0);
localparam  MUNOC_LPARA_2 = REQUIRED_BITWIDTH_UNSIGNED(MUNOC_LPARA_1);

input wire munoc_port_07;
input wire munoc_port_09;
input wire [MUNOC_GPARA_0-1:0] munoc_port_00;
input wire [MUNOC_GPARA_1-1:0] munoc_port_01;
input wire munoc_port_04;
output reg munoc_port_05;

input wire munoc_port_03;
input wire munoc_port_02;
input wire [MUNOC_GPARA_0-1:0] munoc_port_08;
input wire munoc_port_06;

genvar i;
integer j;

wire munoc_signal_6, munoc_signal_3;
wire munoc_signal_5, munoc_signal_2;

reg [MUNOC_GPARA_1-1:0] munoc_signal_0;
reg [MUNOC_GPARA_1-1:0] munoc_signal_4;

reg munoc_signal_1;

ERVP_UPDOWN_COUNTER
#(
	.BW_COUNTER(MUNOC_LPARA_2),
	.BW_COUNT_AMOUNT(2),
	.UNSIGNED(1)
)
i_munoc_instance_1
(
	.clk(munoc_port_07),
	.rstnn(munoc_port_09),
	.enable(1'b 1),
	.init(1'b 0),
	.up(munoc_signal_6),
	.down(munoc_signal_3),
	.count_amount(2'b 1),
	.value(),
	.is_upper_limit(munoc_signal_5),
	.is_lower_limit(munoc_signal_2)
);

assign munoc_signal_6 = (MUNOC_GPARA_2==`SINGLE_TARGET_SLAVE)? munoc_port_04 : 0;

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(1),
	.DEPTH(MUNOC_LPARA_1)
)
i_munoc_instance_0
(
	.wclk(munoc_port_03),
	.wrstnn(munoc_port_02),
	.wready(),
	.wrequest(munoc_port_06),
	.rclk(munoc_port_07),
	.rrstnn(munoc_port_09),
	.rready(munoc_signal_3),
	.rrequest(munoc_signal_3),
	.wdata(),
	.rdata(),
	.wfull(),
	.rempty()
);

always@(*)
begin
	munoc_signal_1 = 0;
	if(MUNOC_GPARA_2==`SINGLE_TARGET_SLAVE)
	begin
		if(munoc_signal_5)
			munoc_signal_1 = 0;
		else if(munoc_signal_2)
			munoc_signal_1 = 1;
		else if((~munoc_signal_2)&&(munoc_port_01==munoc_signal_0))
			munoc_signal_1 = 1;
	end
end

always@(posedge munoc_port_07, negedge munoc_port_09)
begin
	if(munoc_port_09==0)
		munoc_signal_0 <= 0;
	else if(munoc_port_04&&munoc_signal_2)
		munoc_signal_0 <= munoc_port_01;
end

always@(*)
begin
	munoc_port_05 = 0;
	case(MUNOC_GPARA_2)
		`SINGLE_TARGET_SLAVE:
			munoc_port_05 = munoc_signal_1;
	endcase
end

endmodule
