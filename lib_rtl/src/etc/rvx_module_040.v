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




module RVX_MODULE_040
(
	rvx_port_0,
	rvx_port_5,
	rvx_port_1,
	rvx_port_3,
	rvx_port_2,
	rvx_port_4
);




parameter RVX_GPARA_1 = 1;
parameter UNSIGNED = 1;
parameter RVX_GPARA_0 = 0;

input wire rvx_port_0;
input wire [RVX_GPARA_1-1:0] rvx_port_5;
input wire rvx_port_1;
input wire [RVX_GPARA_1-1:0] rvx_port_3;
output wire rvx_port_2;
output wire [RVX_GPARA_1-1:0] rvx_port_4;

wire [RVX_GPARA_1+1-1:0] rvx_signal_3, rvx_signal_0;
wire [RVX_GPARA_1+1-1:0] rvx_signal_1;
reg [RVX_GPARA_1+1-1:0] rvx_signal_2;

assign rvx_port_2 = (RVX_GPARA_0==1)? (rvx_port_0 & rvx_port_1) : (rvx_port_0 | rvx_port_1);

assign rvx_signal_3 = (UNSIGNED==1)? $unsigned(rvx_port_5) : $signed(rvx_port_5);
assign rvx_signal_0 = (UNSIGNED==1)? $unsigned(rvx_port_3) : $signed(rvx_port_3);

assign rvx_signal_1 = (UNSIGNED==1)? ($unsigned(rvx_signal_3) + $unsigned(rvx_signal_0)) : ($signed(rvx_signal_3) + $signed(rvx_signal_0));

always@(*)
begin
	rvx_signal_2 = rvx_signal_1;
	if(rvx_port_0 && rvx_port_1)
		rvx_signal_2 = rvx_signal_1;
	else if(RVX_GPARA_0==0)
	begin
		if(rvx_port_0)
			rvx_signal_2 = rvx_signal_3<<1;
		else if(rvx_port_1)
			rvx_signal_2 = rvx_signal_0<<1;
	end
end

assign rvx_port_4 = rvx_signal_2>>1;

endmodule
