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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_06.vh"





module MUNOC_MODULE_26
(
	munoc_port_5,
	munoc_port_0,
	munoc_port_6,

	munoc_port_4,
	munoc_port_3,
	munoc_port_7,

	munoc_port_1,
	munoc_port_2
);





parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_5, munoc_port_0;
input wire munoc_port_6;

input wire munoc_port_4;
input wire munoc_port_3;
input wire [MUNOC_GPARA_0-1:0] munoc_port_7;

output wire munoc_port_1;
output wire munoc_port_2;

localparam  MUNOC_LPARA_0 = `MIN(MUNOC_GPARA_0,16);
localparam  MUNOC_LPARA_1 = `MAX(1,(MUNOC_LPARA_0/2));

`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_3 1
`define MUNOC_LDEF_2 2

reg [`MUNOC_LDEF_0-1:0] munoc_signal_3;
wire munoc_signal_0;
wire munoc_signal_2;

reg [MUNOC_LPARA_0-1:0] munoc_signal_1;

always@(posedge munoc_port_5, negedge munoc_port_0)
begin
	if(munoc_port_0==0)
		munoc_signal_3 <= `MUNOC_LDEF_1;
	else if(munoc_port_6)
		case(munoc_signal_3)
			`MUNOC_LDEF_1:
				if(munoc_signal_0)
					munoc_signal_3 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_3:
				if(munoc_signal_2)
					munoc_signal_3 <= `MUNOC_LDEF_1;
				else if(munoc_port_4==0)
					munoc_signal_3 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				;
		endcase
end

assign munoc_signal_0 = (munoc_signal_3==`MUNOC_LDEF_1) & munoc_port_4 & (~munoc_port_3);
assign munoc_signal_2 = (munoc_signal_3==`MUNOC_LDEF_3) & munoc_port_4 & munoc_port_3;
assign munoc_port_1 = (munoc_signal_3==`MUNOC_LDEF_2);

MUNOC_MODULE_20
#(
	.MUNOC_GPARA_3(MUNOC_LPARA_0),
	.MUNOC_GPARA_2(4),
	.MUNOC_GPARA_5(0),
	.MUNOC_GPARA_1(0)
)
i_munoc_instance_0
(
	.munoc_port_03(munoc_port_5),
	.munoc_port_09(munoc_port_0),
	.munoc_port_02(munoc_port_6),

	.munoc_port_10(munoc_signal_1),
	.munoc_port_04(munoc_signal_0),
	.munoc_port_11(),
	.munoc_port_05(),

	.munoc_port_06(munoc_signal_1),
	.munoc_port_08(munoc_signal_2),
	.munoc_port_07(),
	.munoc_port_00(),

	.munoc_port_01(munoc_port_2)
);

always@(*)
begin
	munoc_signal_1 = munoc_port_7;
	if(MUNOC_LPARA_0 < MUNOC_GPARA_0)
		munoc_signal_1[MUNOC_LPARA_0-1-:MUNOC_LPARA_1] = munoc_port_7[MUNOC_GPARA_0-1-:MUNOC_LPARA_1];
end

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
endmodule
