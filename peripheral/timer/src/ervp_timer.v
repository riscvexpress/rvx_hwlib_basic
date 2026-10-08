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
`include "rvx_include_17.vh"
`include "ervp_endian.vh"



module ERVP_TIMER
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	tick_1us,
	delay_notice,
	timer_interrupt
);



parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;

localparam  RVX_LPARA_0 = 32;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire clk, rstnn;
input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

input wire tick_1us;

output reg delay_notice;
output wire timer_interrupt;

reg rvx_signal_14; 

wire rvx_signal_11;
wire [5-1:0] rvx_signal_03;
wire rvx_signal_07;
wire [5-1:0] rvx_signal_13;

wire rvx_signal_19;

wire [32-1:0] rvx_signal_04;

wire [32-1:0] rvx_signal_09;

wire [32-1:0] rvx_signal_16;

wire rvx_signal_17;
reg rvx_signal_18;
reg rvx_signal_00;
reg rvx_signal_05;

wire [RVX_LPARA_0-1:0] rvx_signal_02;
reg [RVX_LPARA_0-1:0] rvx_signal_15, rvx_signal_20;

reg rvx_signal_08;
wire rvx_signal_12;
wire rvx_signal_06;

reg rvx_signal_01;
wire rvx_signal_10;

RVX_MODULE_100
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_2(ENDIAN_TYPE)
)
i_rvx_instance_1
(
	.rvx_port_16(clk),
	.rvx_port_08(rstnn),

	.rvx_port_12(rpsel),
	.rvx_port_02(rpenable),
	.rvx_port_17(rpaddr),
	.rvx_port_13(rpwrite),
	.rvx_port_14(rpwdata),
	.rvx_port_05(rprdata),
	.rvx_port_00(rpready),
	.rvx_port_10(rpslverr),

	.rvx_port_09(1'b 0),
	.rvx_port_18(rvx_signal_11),
	.rvx_port_06(rvx_signal_03),
	.rvx_port_03(rvx_signal_07),
	.rvx_port_04(rvx_signal_13),
	.rvx_port_15(rvx_signal_19),
	.rvx_port_11(rvx_signal_04),
	.rvx_port_01(rvx_signal_09),
	.rvx_port_07(rvx_signal_16)
);

assign rvx_signal_03 = {rvx_signal_05,rvx_signal_18};

assign rvx_signal_17 = rvx_signal_18 | rvx_signal_05;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_18 <= 0;
	else if(rvx_signal_07 && rvx_signal_13[0])
		rvx_signal_18 <= rvx_signal_13[1];
	else if(rvx_signal_12 && (rvx_signal_00==0))
		rvx_signal_18 <= 0;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_00 <= 0;
	else if(rvx_signal_07 && rvx_signal_13[0])
		rvx_signal_00 <= rvx_signal_13[2];
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_05 <= 0;
	else if(rvx_signal_07 && rvx_signal_13[3])
		rvx_signal_05 <= rvx_signal_13[4];
	else if(rvx_signal_10)
		rvx_signal_05 <= 0;
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
  .CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_17),
	.init(1'b 0),
	.count(tick_1us),
	.value(rvx_signal_02),
	.is_first_count(),
	.is_last_count()
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_15 <= 0;
	else if(rvx_signal_08)
		rvx_signal_15 <= rvx_signal_02 + rvx_signal_04;
end

always@(*)
begin
	rvx_signal_08 = 0;
	if(rvx_signal_07 && rvx_signal_13[0])
		rvx_signal_08 = 1;
	else if(rvx_signal_12)
		rvx_signal_08 = 1;
end

assign rvx_signal_12 = rvx_signal_18 & (rvx_signal_02==rvx_signal_15);
assign rvx_signal_06 = rvx_signal_18 & rvx_signal_12;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_14 <= 0;
	else if(rvx_signal_19)
		rvx_signal_14 <= 0;
	else if(rvx_signal_06)
		rvx_signal_14 <= 1;
end

assign timer_interrupt = rvx_signal_14;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_20 <= 0;
	else if(rvx_signal_01)
		rvx_signal_20 <= rvx_signal_02 + rvx_signal_09;
end

always@(*)
begin
	rvx_signal_01 = 0;
	if(rvx_signal_07 && rvx_signal_13[3])
		rvx_signal_01 = 1;
end

assign rvx_signal_10 = rvx_signal_05 & (rvx_signal_02==rvx_signal_20);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		delay_notice <= 0;
	else if(rvx_signal_07)
		delay_notice <= 0;
	else if(delay_notice)
		delay_notice <= 0;
	else if(rvx_signal_10)
		delay_notice <= 1;
end

endmodule
