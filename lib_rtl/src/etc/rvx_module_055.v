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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"



module RVX_MODULE_055
(
	rvx_port_5, rvx_port_3,
	rvx_port_6,
	rvx_port_1,
	rvx_port_2,
	rvx_port_0,
	rvx_port_4
);



parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 0;

input wire rvx_port_5, rvx_port_3;

input wire rvx_port_6;
input wire rvx_port_1;
input wire [RVX_GPARA_1-1:0] rvx_port_2;
output reg rvx_port_0;
output reg [RVX_GPARA_1-1:0] rvx_port_4;

always@(posedge rvx_port_5, negedge rvx_port_3)
begin
	if(rvx_port_3==0)
	begin
		rvx_port_0 <= 0;
		rvx_port_4 <= RVX_GPARA_0;
	end
	else if(rvx_port_6)
	begin
		rvx_port_0 <= 1;
		rvx_port_4 <= rvx_port_2;
	end
	else if(rvx_port_1)
		rvx_port_0 <= 0;
end

endmodule
