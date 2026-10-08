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





module RVX_MODULE_077
(
	rvx_port_3,
	rvx_port_0,
	rvx_port_6,

	rvx_port_5,
	rvx_port_2,

	rvx_port_1,
	rvx_port_7,
	rvx_port_4
);





parameter RVX_GPARA_3 = 16;
parameter RVX_GPARA_2 = 500;
parameter RVX_GPARA_1 = 16;
parameter RVX_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_UNSIGNED(RVX_GPARA_2);
localparam  RVX_LPARA_1 = `MAX(1,RVX_GPARA_3-RVX_LPARA_0);

input wire rvx_port_3, rvx_port_0;
input wire rvx_port_6;

input wire rvx_port_5;
input wire rvx_port_2;

output reg rvx_port_1;
output wire [RVX_GPARA_1-1:0] rvx_port_7;
output reg [RVX_GPARA_3-1:0] rvx_port_4;

wire [RVX_GPARA_3-1:0] rvx_signal_0;

wire rvx_signal_3;
wire [RVX_LPARA_1-1:0] rvx_signal_1;
reg [RVX_GPARA_3-1:0] rvx_signal_4;

reg rvx_signal_2;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_3),
	.CIRCULAR(0)
)
i_rvx_instance_1

(
	.clk(rvx_port_3),
	.rstnn(rvx_port_0),
	.enable(rvx_port_6),
	.init(rvx_port_5),
	.count(rvx_port_2),
	.value(rvx_signal_0),
	.is_first_count(),
	.is_last_count()
);

always@(posedge rvx_port_3, negedge rvx_port_0)
begin
	if(rvx_port_0==0)
		rvx_port_4 <= 0;
	else if(rvx_port_5)
		if($unsigned(rvx_port_4) < rvx_signal_0)
			rvx_port_4 <= rvx_signal_0;
end

RVX_MODULE_015
#(
	.RVX_GPARA_4(2),
	.RVX_GPARA_3(RVX_LPARA_1),
	.RVX_GPARA_2(0)
)
i_rvx_instance_0
(
	.rvx_port_4(rvx_port_3),
	.rvx_port_5(rvx_port_0),
	.rvx_port_1(rvx_port_6),
	.rvx_port_0(rvx_port_5),
	.rvx_port_2(rvx_signal_0[RVX_GPARA_3-1-:RVX_LPARA_1]),
	.rvx_port_3(rvx_signal_3),
	.rvx_port_6(rvx_signal_1)
);

always@(*)
begin
	rvx_signal_4 = 0;
	if(RVX_GPARA_3>RVX_LPARA_0)
		rvx_signal_4[RVX_GPARA_3-1-:RVX_LPARA_1] = rvx_signal_1;
end

always@(*)
begin
	rvx_signal_2 = 0;
	if(rvx_port_1==0)
		if($unsigned(rvx_signal_0)>=RVX_GPARA_2)
		begin
			if(RVX_GPARA_0==1)
				rvx_signal_2 = 1;
			else
			begin
				if($unsigned(rvx_signal_0>>1) > $unsigned(rvx_signal_4))
					rvx_signal_2 = 1;
			end
		end
end

always@(posedge rvx_port_3, negedge rvx_port_0)
begin
	if(rvx_port_0==0)
		rvx_port_1 <= 0;
	else if(rvx_port_6)
	begin
		if(rvx_port_5)
			rvx_port_1 <= 0;
		else if(rvx_signal_2)
			rvx_port_1 <= 1;
	end
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_1),
	.CIRCULAR(0)
)
i_rvx_instance_2
(
	.clk(rvx_port_3),
	.rstnn(rvx_port_0),
	.enable(rvx_port_5),
	.init(1'b 0),
	.count(rvx_port_1),
	.value(rvx_port_7),
	.is_first_count(),
	.is_last_count()
);

endmodule

