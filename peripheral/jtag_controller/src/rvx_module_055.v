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




module RVX_MODULE_055
(
	rvx_port_05,
	rvx_port_08,
	rvx_port_09,
	
	rvx_port_03,
	rvx_port_04,
	rvx_port_02,
	rvx_port_06,

	rvx_port_01,
	rvx_port_07,
	rvx_port_00
);




parameter RVX_GPARA_1 = 16;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 0;

input	wire rvx_port_05;
input wire rvx_port_08;
input wire rvx_port_09;

input wire rvx_port_03;
input wire rvx_port_04;
input wire rvx_port_02;
input wire rvx_port_06;

input wire [RVX_GPARA_1-1:0] rvx_port_01;
output wire [RVX_GPARA_1-1:0] rvx_port_07;
output wire rvx_port_00;

reg [RVX_GPARA_1-1:0]	rvx_signal_1;
reg [RVX_GPARA_1-1:0]	rvx_signal_0;

always@(posedge rvx_port_08 or negedge rvx_port_05)
begin : clock_scan_reg_master
	if(~rvx_port_05)
		rvx_signal_1 <= RVX_GPARA_0;
	else if(rvx_port_03)
		rvx_signal_1 <= RVX_GPARA_0;
	else if(rvx_port_04)
		rvx_signal_1 <= rvx_port_01;
	else if(rvx_port_06)
	begin
		if(RVX_GPARA_2==1)
			rvx_signal_1 <= {rvx_port_09,rvx_signal_1[RVX_GPARA_1-1:1]};
		else
			rvx_signal_1 <= {rvx_signal_1[RVX_GPARA_1-2:0],rvx_port_09};
	end
end

assign rvx_port_00 = (RVX_GPARA_2==1)? rvx_signal_1[0] : rvx_signal_1[RVX_GPARA_1-1];

always@(negedge rvx_port_08 or negedge rvx_port_05)
begin : clock_scan_reg_slave
	if(~rvx_port_05)
		rvx_signal_0 <= RVX_GPARA_0;
	else if(rvx_port_03)
		rvx_signal_0 <= RVX_GPARA_0;
	else if(rvx_port_02)
		rvx_signal_0 <= rvx_signal_1;
end

assign rvx_port_07 = rvx_signal_0;

endmodule
