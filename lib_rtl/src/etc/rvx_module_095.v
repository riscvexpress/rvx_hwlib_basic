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





module RVX_MODULE_095
(
	rvx_port_4,
	rvx_port_1,
	rvx_port_5,
	rvx_port_6,
	rvx_port_0,
	rvx_port_3,
	rvx_port_2
);





parameter RVX_GPARA_0 = 1;
parameter UNSIGNED = 1;
parameter RVX_GPARA_1 = 0;

localparam  RVX_LPARA_0 = 4;

input wire rvx_port_4, rvx_port_1;
input wire rvx_port_5;

input wire [RVX_LPARA_0-1:0] rvx_port_6;
input wire [RVX_LPARA_0*RVX_GPARA_0-1:0] rvx_port_0;
output reg rvx_port_3;
output reg [RVX_GPARA_0-1:0] rvx_port_2;

wire rvx_signal_3;
wire [RVX_GPARA_0-1:0] rvx_signal_1;
wire rvx_signal_0;
wire [RVX_GPARA_0-1:0] rvx_signal_2;
wire rvx_signal_4;
wire [RVX_GPARA_0-1:0] rvx_signal_5;

RVX_MODULE_010
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.UNSIGNED(UNSIGNED),
	.RVX_GPARA_1(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_2(rvx_port_6[0]),
	.rvx_port_0(rvx_port_0[RVX_GPARA_0*(1+0)-1-:RVX_GPARA_0]),
	.rvx_port_5(rvx_port_6[1]),
	.rvx_port_1(rvx_port_0[RVX_GPARA_0*(1+1)-1-:RVX_GPARA_0]),
	.rvx_port_3(rvx_signal_3),
	.rvx_port_4(rvx_signal_1)
);

RVX_MODULE_010
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.UNSIGNED(UNSIGNED),
	.RVX_GPARA_1(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_2(rvx_port_6[2]),
	.rvx_port_0(rvx_port_0[RVX_GPARA_0*(1+2)-1-:RVX_GPARA_0]),
	.rvx_port_5(rvx_port_6[3]),
	.rvx_port_1(rvx_port_0[RVX_GPARA_0*(1+3)-1-:RVX_GPARA_0]),
	.rvx_port_3(rvx_signal_0),
	.rvx_port_4(rvx_signal_2)
);

RVX_MODULE_010
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.UNSIGNED(UNSIGNED),
	.RVX_GPARA_1(RVX_GPARA_1)
)
i_rvx_instance_2
(
	.rvx_port_2(rvx_signal_3),
	.rvx_port_0(rvx_signal_1),
	.rvx_port_5(rvx_signal_0),
	.rvx_port_1(rvx_signal_2),
	.rvx_port_3(rvx_signal_4),
	.rvx_port_4(rvx_signal_5)
);

always@(posedge rvx_port_4, negedge rvx_port_1)
begin
	if(rvx_port_1==0)
	begin
		rvx_port_3 <= 0;
		rvx_port_2 <= 0;
	end
	else if(rvx_port_5)
	begin
		rvx_port_3 <= rvx_signal_4;
		rvx_port_2 <= rvx_signal_5;
	end
end

endmodule
