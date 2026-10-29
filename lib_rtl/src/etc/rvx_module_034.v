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





module RVX_MODULE_034
(
	rvx_port_0,
	rvx_port_2,
	rvx_port_3,

	rvx_port_7,
	rvx_port_1,

	rvx_port_4,
	rvx_port_6,
	rvx_port_5
);





parameter RVX_GPARA_1 = 16;
parameter RVX_GPARA_0 = 500;
parameter RVX_GPARA_2 = 16;
parameter RVX_GPARA_3 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_UNSIGNED(RVX_GPARA_0);
localparam  RVX_LPARA_0 = `MAX(1,RVX_GPARA_1-RVX_LPARA_1);

input wire rvx_port_0, rvx_port_2;
input wire rvx_port_3;

input wire rvx_port_7;
input wire rvx_port_1;

output reg rvx_port_4;
output wire [RVX_GPARA_2-1:0] rvx_port_6;
output reg [RVX_GPARA_1-1:0] rvx_port_5;

wire [RVX_GPARA_1-1:0] value;

wire rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_1;
reg [RVX_GPARA_1-1:0] rvx_signal_2;

reg rvx_signal_3;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_1),
	.CIRCULAR(0)
)
i_rvx_instance_0

(
	.clk(rvx_port_0),
	.rstnn(rvx_port_2),
	.enable(rvx_port_3),
	.init(rvx_port_7),
	.count(rvx_port_1),
	.value(value),
	.is_first_count(),
	.is_last_count()
);

always@(posedge rvx_port_0, negedge rvx_port_2)
begin
	if(rvx_port_2==0)
		rvx_port_5 <= 0;
	else if(rvx_port_7)
		if($unsigned(rvx_port_5) < value)
			rvx_port_5 <= value;
end

RVX_MODULE_028
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_0(RVX_LPARA_0),
	.RVX_GPARA_3(0)
)
i_rvx_instance_2
(
	.rvx_port_1(rvx_port_0),
	.rvx_port_6(rvx_port_2),
	.rvx_port_3(rvx_port_3),
	.rvx_port_4(rvx_port_7),
	.rvx_port_5(value[RVX_GPARA_1-1-:RVX_LPARA_0]),
	.rvx_port_0(rvx_signal_0),
	.rvx_port_2(rvx_signal_1)
);

always@(*)
begin
	rvx_signal_2 = 0;
	if(RVX_GPARA_1>RVX_LPARA_1)
		rvx_signal_2[RVX_GPARA_1-1-:RVX_LPARA_0] = rvx_signal_1;
end

always@(*)
begin
	rvx_signal_3 = 0;
	if(rvx_port_4==0)
		if($unsigned(value)>=RVX_GPARA_0)
		begin
			if(RVX_GPARA_3==1)
				rvx_signal_3 = 1;
			else
			begin
				if($unsigned(value>>1) > $unsigned(rvx_signal_2))
					rvx_signal_3 = 1;
			end
		end
end

always@(posedge rvx_port_0, negedge rvx_port_2)
begin
	if(rvx_port_2==0)
		rvx_port_4 <= 0;
	else if(rvx_port_3)
	begin
		if(rvx_port_7)
			rvx_port_4 <= 0;
		else if(rvx_signal_3)
			rvx_port_4 <= 1;
	end
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_2),
	.CIRCULAR(0)
)
i_rvx_instance_1
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_2),
	.enable(rvx_port_7),
	.init(1'b 0),
	.count(rvx_port_4),
	.value(rvx_port_6),
	.is_first_count(),
	.is_last_count()
);

endmodule

