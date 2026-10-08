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
`include "ervp_endian.vh"
`include "rvx_include_14.vh"





module RVX_MODULE_018
(
	rvx_port_12,
	rvx_port_10,

	rvx_port_06,
	rvx_port_08,
	rvx_port_01,
	rvx_port_00,
	rvx_port_02,
	rvx_port_09,
	rvx_port_07,
	rvx_port_04,

	rvx_port_03,
  rvx_port_05,
  rvx_port_11
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = `LITTLE_ENDIAN;
parameter RVX_GPARA_5 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_4 = 16;

input wire rvx_port_12, rvx_port_10;
input wire rvx_port_06;
input wire rvx_port_08;
input wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire rvx_port_00;
input wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire [RVX_GPARA_0-1:0] rvx_port_09;
output wire rvx_port_07;
output wire rvx_port_04;

input wire rvx_port_03;
output wire [RVX_GPARA_5-1:0] rvx_port_05;
input wire [RVX_GPARA_2-1:0] rvx_port_11;

wire rvx_signal_03;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_07;
wire [32-1:0] rvx_signal_02;
wire [32-1:0] rvx_signal_01;
wire [32-1:0] rvx_signal_10;
wire rvx_signal_04;
wire [32-1:0] rvx_signal_09;
wire rvx_signal_05;
wire [32-1:0] rvx_signal_00;

localparam  RVX_LPARA_1 = `DIVIDERU(RVX_GPARA_5,RVX_GPARA_0);
localparam  RVX_LPARA_0 = RVX_LPARA_1*RVX_GPARA_0;

reg [RVX_LPARA_0-1:0] rvx_signal_06;

RVX_MODULE_101
#(
  .RVX_GPARA_0(RVX_GPARA_1),
  .RVX_GPARA_1(RVX_GPARA_0),
  .RVX_GPARA_2(RVX_GPARA_3)
)
i_rvx_instance_0
(
	.rvx_port_19(rvx_port_12),
	.rvx_port_06(rvx_port_10),

	.rvx_port_13(rvx_port_06),
	.rvx_port_11(rvx_port_08),
	.rvx_port_08(rvx_port_01),
	.rvx_port_00(rvx_port_00),
	.rvx_port_09(rvx_port_02),
	.rvx_port_03(rvx_port_09),
	.rvx_port_20(rvx_port_07),
	.rvx_port_17(rvx_port_04),

	.rvx_port_10(1'b 0),
	.rvx_port_04(rvx_signal_03),
	.rvx_port_14(rvx_signal_08),
	.rvx_port_05(rvx_signal_07),
	.rvx_port_18(rvx_signal_02),
	.rvx_port_07(rvx_signal_01),
	.rvx_port_12(rvx_signal_10),
	.rvx_port_02(rvx_signal_04),
	.rvx_port_16(rvx_signal_09),
	.rvx_port_15(rvx_signal_05),
	.rvx_port_01(rvx_signal_00)
);

assign rvx_signal_08 = rvx_port_05;

always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_06 <= 0;
  else if(rvx_signal_07)
    rvx_signal_06 <= rvx_signal_02;
end

assign rvx_port_05 = rvx_signal_06;
assign rvx_signal_09 = rvx_port_11;
assign rvx_signal_00 = rvx_port_11;

endmodule
