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





module MUNOC_MODULE_24
(
	munoc_port_7,
	munoc_port_4,
	munoc_port_8,

	munoc_port_6,
	munoc_port_5,

	munoc_port_3,
	munoc_port_0,
	munoc_port_1,
	munoc_port_2
);





parameter MUNOC_GPARA_2 = 4;
parameter MUNOC_GPARA_0 = 16;
parameter MUNOC_GPARA_3 = 500;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_4 = 0;

input wire munoc_port_7, munoc_port_4;
input wire munoc_port_8;

input wire munoc_port_6;
input wire munoc_port_5;

output wire munoc_port_3;
output wire munoc_port_0;
output wire [MUNOC_GPARA_0-1:0] munoc_port_1;
output wire [MUNOC_GPARA_1-1:0] munoc_port_2;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

wire [MUNOC_GPARA_2-1:0] munoc_signal_6;

wire munoc_signal_2;
wire munoc_signal_7;
wire munoc_signal_4, munoc_signal_1, munoc_signal_3;
reg munoc_signal_5;
wire munoc_signal_0;

ERVP_UPDOWN_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_2),
	.BW_COUNT_AMOUNT(2),
	.RESET_NUMBER(0),
	.UNSIGNED(((MUNOC_GPARA_4==1)? 0 : 1))
)
i_munoc_instance_1
(
	.clk(munoc_port_7),
	.rstnn(munoc_port_4),
	.enable(munoc_port_8),
	.init(1'b 0),
	.up(munoc_port_6),
	.down(munoc_port_5),
	.count_amount(2'd 1),
	.value(munoc_signal_6),
	.is_upper_limit(),
	.is_lower_limit()
);

assign munoc_signal_4 = (munoc_signal_6==0);
assign munoc_signal_1 = (MUNOC_GPARA_4==1)? ($signed(munoc_signal_6)>0) : (munoc_signal_6!=0);
assign munoc_signal_3 = (MUNOC_GPARA_4==1)? ($signed(munoc_signal_6)<0) : 0;

assign munoc_port_3 = munoc_signal_4;

always @(posedge munoc_port_7 or negedge munoc_port_4)
begin
	if(munoc_port_4==0)
		munoc_signal_5 <= 0;
	else if((MUNOC_GPARA_4==0) && munoc_port_8)
	begin
		if(munoc_signal_4 && munoc_port_5 && (~munoc_port_6))
			munoc_signal_5 <= 1;
	end
end

RVX_MODULE_077
#(
	.RVX_GPARA_3(MUNOC_GPARA_0),
	.RVX_GPARA_2(MUNOC_GPARA_3),
	.RVX_GPARA_1(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.rvx_port_3(munoc_port_7),
	.rvx_port_0(munoc_port_4),
	.rvx_port_6(munoc_port_8),
	.rvx_port_5(munoc_signal_2),
	.rvx_port_2(munoc_signal_7),
	.rvx_port_1(munoc_signal_0),
	.rvx_port_4(munoc_port_1),
	.rvx_port_7(munoc_port_2)
);

assign munoc_signal_2 = munoc_port_5 | munoc_port_6;

assign munoc_signal_7 = ~munoc_port_3;
assign munoc_port_0 = (MUNOC_GPARA_4==1)? munoc_signal_0 : (munoc_signal_5 | munoc_signal_0);

endmodule

