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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_33
(
	munoc_port_03,
	munoc_port_04,

	munoc_port_05,
	munoc_port_06,
	munoc_port_00,
	munoc_port_01,
	munoc_port_09,
	munoc_port_11,
	munoc_port_08,
	munoc_port_02,
	munoc_port_10,
	munoc_port_07
);





parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_03;
input wire munoc_port_04;

input wire [MUNOC_GPARA_0-1:0] munoc_port_05;
input wire [`BW_AXI_ALEN-1:0] munoc_port_06;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_00;
input wire [`BW_AXI_ABURST-1:0] munoc_port_01;
input wire munoc_port_09;
input wire munoc_port_11;

output reg munoc_port_02;
output reg [MUNOC_GPARA_0-1:0] munoc_port_08;
output reg munoc_port_10;
output wire munoc_port_07;

reg munoc_signal_05;

reg [`BW_AXI_ALEN-1:0] munoc_signal_00;

reg [MUNOC_GPARA_0-1:0] munoc_signal_07;
reg [MUNOC_GPARA_0-1:0] munoc_signal_09;
wire [MUNOC_GPARA_0-1:0] munoc_signal_04;
wire [MUNOC_GPARA_0-1:0] munoc_signal_01, munoc_signal_02;
reg [MUNOC_GPARA_0-1:0] munoc_signal_03;

reg [MUNOC_GPARA_0-1:0] munoc_signal_06, munoc_signal_08;

always@(*)
begin
	munoc_signal_05 = 0;
	if(munoc_port_02==0)
		munoc_signal_05 = munoc_port_09;
	else if(munoc_port_11 & munoc_port_07)
		munoc_signal_05 = munoc_port_09;
end

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
	begin
		munoc_port_02 <= 0;
		munoc_port_08 <= 0;
		munoc_signal_00 <= 0;
	end
	else if(munoc_signal_05==1)
	begin
		munoc_port_02 <= 1;
		munoc_port_08 <= $unsigned(munoc_port_05);
		case(munoc_port_01)
			`AXI_BURST_FIXED:
				munoc_signal_00 <= 0;
			`AXI_BURST_INCR,
			`AXI_BURST_WRAP:
				munoc_signal_00 <= munoc_port_06;		
		endcase
	end
	else
		if(munoc_port_11)
		begin
			if(munoc_port_07)
			begin
				munoc_port_02 <= 0;
				munoc_port_08 <= munoc_signal_03;
				munoc_signal_00 <= munoc_signal_00 - 1;
			end
			else
			begin
				munoc_port_08 <= munoc_signal_03;
				munoc_signal_00 <= munoc_signal_00 - 1;
			end
		end
end

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_07 <= 0;
	else if(munoc_signal_05)
		case(munoc_port_00)
			`AXI_SIZE_001BYTE: munoc_signal_07 <= 1;
			`AXI_SIZE_002BYTE: munoc_signal_07 <= 2;
			`AXI_SIZE_004BYTE: munoc_signal_07 <= 4;
			`AXI_SIZE_008BYTE: munoc_signal_07 <= 8;
			`AXI_SIZE_016BYTE: munoc_signal_07 <= 16;
			`AXI_SIZE_032BYTE: munoc_signal_07 <= 32;
			`AXI_SIZE_064BYTE: munoc_signal_07 <= 64;
			`AXI_SIZE_128BYTE: munoc_signal_07 <= 128;
		endcase
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_0),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_01),
	.shift_amount(munoc_port_00),
	.data_output(munoc_signal_02)
);

assign munoc_signal_01 = $unsigned(munoc_port_06);
assign munoc_signal_04 = (munoc_port_01==`AXI_BURST_WRAP)? munoc_signal_02 : $signed(-1);

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_09 <= $signed(-1);
	else if(munoc_signal_05)
		munoc_signal_09 <= munoc_signal_04;
end

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_06 <= 0;
	else if(munoc_signal_05)
		munoc_signal_06 <= munoc_signal_08;
end

always@(*)
begin
	munoc_signal_08 = -1;
	case(munoc_port_00)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: munoc_signal_08[0] = 0;
		`AXI_SIZE_004BYTE: munoc_signal_08[1:0] = 0;
		`AXI_SIZE_008BYTE: munoc_signal_08[2:0] = 0;
		`AXI_SIZE_016BYTE: munoc_signal_08[3:0] = 0;
		`AXI_SIZE_032BYTE: munoc_signal_08[4:0] = 0;
		`AXI_SIZE_064BYTE: munoc_signal_08[5:0] = 0;
		`AXI_SIZE_128BYTE: munoc_signal_08[6:0] = 0;
	endcase
end

always@(*)
begin
	munoc_signal_03 = munoc_port_08 + munoc_signal_07;
	munoc_signal_03 = (munoc_port_08 & (~munoc_signal_09) ) | (munoc_signal_03 & munoc_signal_09);
	munoc_signal_03 = munoc_signal_03 & munoc_signal_06;
end

always@(posedge munoc_port_03, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_port_10 <= 0;
	else if(munoc_signal_05)
		munoc_port_10 <= 1;
	else if(munoc_port_10&&munoc_port_11)
		munoc_port_10 <= 0;
end

assign munoc_port_07 = (munoc_signal_00==0);

endmodule
