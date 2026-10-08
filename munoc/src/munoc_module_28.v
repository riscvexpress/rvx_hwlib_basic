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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_01.vh"



module MUNOC_MODULE_28 (
	munoc_port_3,
	munoc_port_2,
	munoc_port_6,
	munoc_port_4,
	munoc_port_0,
	munoc_port_5,
	munoc_port_1
);



parameter MUNOC_GPARA_0 = 0;

input wire munoc_port_3, munoc_port_2;
input wire munoc_port_6;
input wire munoc_port_4;
input wire munoc_port_0;
output reg munoc_port_5;
output reg munoc_port_1;

always@(*)
begin
	munoc_port_1 = munoc_port_5;
	if(munoc_port_5==MUNOC_GPARA_0)
		munoc_port_1 = munoc_port_0;
end

always@(posedge munoc_port_3, negedge munoc_port_2)
begin
	if(munoc_port_2==0)
		munoc_port_5 <= MUNOC_GPARA_0;
	else if(munoc_port_6==1)
		munoc_port_5 <= MUNOC_GPARA_0;
	else if(munoc_port_4)
		munoc_port_5 <= munoc_port_1;
end

endmodule
