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





module RVX_MODULE_124
(
	rvx_port_07,
	rvx_port_02,
	rvx_port_10,
	rvx_port_09,
	rvx_port_01,
	rvx_port_05,

	rvx_port_04,
	rvx_port_03,
	rvx_port_06,
	rvx_port_11,
	rvx_port_08,
	rvx_port_00
);





parameter RVX_GPARA_1 = 8;
parameter RVX_GPARA_0 = 8;

localparam  RVX_LPARA_0 = RVX_GPARA_1+1;
localparam  RVX_LPARA_1 = RVX_GPARA_0+1;

input wire rvx_port_07;
input wire rvx_port_02;
input wire rvx_port_10;
input wire [RVX_GPARA_1-1:0] rvx_port_09;
output wire rvx_port_01;
output wire [RVX_GPARA_0-1:0] rvx_port_05;

input wire rvx_port_04;
input wire rvx_port_03;
output wire rvx_port_06;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
input wire rvx_port_08;
input wire [RVX_GPARA_0-1:0] rvx_port_00;

wire rvx_signal_2;
wire [RVX_LPARA_0-1:0] rvx_signal_0;
wire [RVX_LPARA_1-1:0] rvx_signal_1;

assign rvx_signal_2 = rvx_port_02 & rvx_port_03;

RVX_MODULE_112
#(
	.RVX_GPARA_1(RVX_GPARA_1),
	.RVX_GPARA_0(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.rvx_port_01(rvx_port_07),
	.rvx_port_06(rvx_signal_2),	
	.rvx_port_05(rvx_port_10),
	.rvx_port_09(rvx_port_09),
	.rvx_port_08(rvx_port_01),
	.rvx_port_04(rvx_port_05),
	.rvx_port_07(rvx_signal_0),
	.rvx_port_03(rvx_signal_1),
	.rvx_port_00(),
	.rvx_port_02()
);

RVX_MODULE_113
#(
	.RVX_GPARA_1(RVX_GPARA_1),
	.RVX_GPARA_0(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_09(rvx_port_04),
	.rvx_port_08(rvx_signal_2),
	.rvx_port_07(rvx_port_06),
	.rvx_port_03(rvx_port_11),
	.rvx_port_00(rvx_port_08),
	.rvx_port_02(rvx_port_00),
	.rvx_port_04(rvx_signal_0),
	.rvx_port_05(rvx_signal_1),
	.rvx_port_06(),
	.rvx_port_01()
);

endmodule

