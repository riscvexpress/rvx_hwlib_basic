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





module MUNOC_MODULE_39
(
	munoc_port_6,
	munoc_port_4,
	munoc_port_3,

	munoc_port_1,
	munoc_port_0,

	munoc_port_2,
	munoc_port_5,
	munoc_port_7,
	munoc_port_8
);





parameter MUNOC_GPARA_0 = 4;
parameter MUNOC_GPARA_2 = 16;
parameter MUNOC_GPARA_1 = 500;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_4 = 0;

input wire munoc_port_6, munoc_port_4;
input wire munoc_port_3;

input wire munoc_port_1;
input wire munoc_port_0;

output wire munoc_port_2;
output wire munoc_port_5;
output wire [MUNOC_GPARA_2-1:0] munoc_port_7;
output wire [MUNOC_GPARA_3-1:0] munoc_port_8;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

wire [MUNOC_GPARA_0-1:0] munoc_signal_3;

wire munoc_signal_2;
wire munoc_signal_5;
wire munoc_signal_1, munoc_signal_4, munoc_signal_7;
reg munoc_signal_0;
wire munoc_signal_6;

ERVP_UPDOWN_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_0),
	.BW_COUNT_AMOUNT(2),
	.RESET_NUMBER(0),
	.UNSIGNED(((MUNOC_GPARA_4==1)? 0 : 1))
)
i_munoc_instance_1
(
	.clk(munoc_port_6),
	.rstnn(munoc_port_4),
	.enable(munoc_port_3),
	.init(1'b 0),
	.up(munoc_port_1),
	.down(munoc_port_0),
	.count_amount(2'd 1),
	.value(munoc_signal_3),
	.is_upper_limit(),
	.is_lower_limit()
);

assign munoc_signal_1 = (munoc_signal_3==0);
assign munoc_signal_4 = (MUNOC_GPARA_4==1)? ($signed(munoc_signal_3)>0) : (munoc_signal_3!=0);
assign munoc_signal_7 = (MUNOC_GPARA_4==1)? ($signed(munoc_signal_3)<0) : 0;

assign munoc_port_2 = munoc_signal_1;

always @(posedge munoc_port_6 or negedge munoc_port_4)
begin
	if(munoc_port_4==0)
		munoc_signal_0 <= 0;
	else if((MUNOC_GPARA_4==0) && munoc_port_3)
	begin
		if(munoc_signal_1 && munoc_port_0 && (~munoc_port_1))
			munoc_signal_0 <= 1;
	end
end

RVX_MODULE_065
#(
	.RVX_GPARA_0(MUNOC_GPARA_2),
	.RVX_GPARA_1(MUNOC_GPARA_1),
	.RVX_GPARA_2(MUNOC_GPARA_3)
)
i_munoc_instance_0
(
	.rvx_port_3(munoc_port_6),
	.rvx_port_0(munoc_port_4),
	.rvx_port_6(munoc_port_3),
	.rvx_port_7(munoc_signal_2),
	.rvx_port_1(munoc_signal_5),
	.rvx_port_5(munoc_signal_6),
	.rvx_port_4(munoc_port_7),
	.rvx_port_2(munoc_port_8)
);

assign munoc_signal_2 = munoc_port_0 | munoc_port_1;

assign munoc_signal_5 = ~munoc_port_2;
assign munoc_port_5 = (MUNOC_GPARA_4==1)? munoc_signal_6 : (munoc_signal_0 | munoc_signal_6);

endmodule

