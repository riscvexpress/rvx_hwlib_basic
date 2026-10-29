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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_02.vh"





module MUNOC_MODULE_41
(
	munoc_port_11,
	munoc_port_00,

	munoc_port_13,
	munoc_port_15,
	munoc_port_10,
	munoc_port_09,
	munoc_port_04,
	munoc_port_02,
	munoc_port_22,
	munoc_port_07,

	munoc_port_06,
	munoc_port_21,
	munoc_port_12,
	munoc_port_20,
	munoc_port_14,
	munoc_port_19,

	munoc_port_03,
	munoc_port_18,
	munoc_port_05,
	munoc_port_16,
	munoc_port_01,
	munoc_port_08,
	munoc_port_17
);





parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_0 = `BW_LONGEST_MASTER_DATA;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_25(MUNOC_GPARA_1);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_1);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_11, munoc_port_00;

input wire [`MUNOC_GDEF_75-1:0] munoc_port_13;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_15;
input wire munoc_port_10;
input wire munoc_port_09;
input wire [MUNOC_GPARA_0-1:0] munoc_port_04;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_02;

input wire [`BW_ADDR_OFFSET-1:0] munoc_port_22;
input wire [`BW_AXI_ALEN-1:0] munoc_port_07;

input wire munoc_port_06;
input wire munoc_port_21;
input wire munoc_port_12;
input wire munoc_port_20;
input wire munoc_port_14;
output wire munoc_port_19;

output wire [MUNOC_GPARA_1-1:0] munoc_port_03;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_18;
output wire munoc_port_05;
output wire munoc_port_16;
input wire munoc_port_01;
output reg munoc_port_08;
output wire munoc_port_17;

genvar i;
integer j,k;

wire [`BW_BYTE-1:0] munoc_signal_03 [`NUM_BYTE(MUNOC_GPARA_0)-1:0];

`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_0 2

reg [`MUNOC_LDEF_2-1:0] munoc_signal_10;
reg [`BW_AXI_ALEN-1:0] munoc_signal_05;

reg [MUNOC_GPARA_1-1:0] munoc_signal_07;
reg [`NUM_BYTE(MUNOC_GPARA_1)-1:0] munoc_signal_00;

`define MUNOC_LDEF_5 REQUIRED_BITWIDTH_INDEX(MUNOC_GPARA_0/MUNOC_GPARA_1)

reg [`MUNOC_LDEF_5-1:0] munoc_signal_02;
reg [`MUNOC_LDEF_5-1:0] munoc_signal_13, munoc_signal_19;

wire [MUNOC_GPARA_0-1:0] munoc_signal_20;
wire [MUNOC_GPARA_1-1:0] munoc_signal_18;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_06;

reg [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_21;

reg [`BW_AXI_WSTRB(128*8)-1:0] munoc_signal_14;
wire [`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0] munoc_signal_15;
reg [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_04;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_17;

`define MUNOC_LDEF_4 4
reg [`MUNOC_LDEF_4-1:0] munoc_signal_22;

wire munoc_signal_09;

`define MUNOC_LDEF_6 7
reg [`MUNOC_LDEF_6-1:0] munoc_signal_08;
reg [`MUNOC_LDEF_6-1:0] munoc_signal_16;
reg [`MUNOC_LDEF_6-1:0] munoc_signal_12, munoc_signal_11;
reg [`MUNOC_LDEF_6-1:0] munoc_signal_01;

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_0); i=i+1)
	begin : i_unpack_data
		assign munoc_signal_03[i] = munoc_port_04[(i+1)*`BW_BYTE-1-:`BW_BYTE];
	end
endgenerate

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_10 <= `MUNOC_LDEF_3;
	else
		case(munoc_signal_10)
			`MUNOC_LDEF_3:
				if(munoc_port_14)
				begin
					if(munoc_port_12)
						munoc_signal_10 <= `MUNOC_LDEF_0;
					else
						munoc_signal_10 <= `MUNOC_LDEF_1;
				end
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_1:
				if(munoc_port_17)
					munoc_signal_10 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_port_19 = (munoc_signal_10!=`MUNOC_LDEF_3);

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_05 <= 0;
	else if(munoc_signal_09)
		if(munoc_port_05)
			munoc_signal_05 <= 0;
		else
			munoc_signal_05 <= munoc_signal_05 + 1'b 1;
end
assign munoc_port_05 = (munoc_signal_05==munoc_port_07);

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_16 <= 0;
	else if(munoc_port_20)
	begin
		if(munoc_port_15 >= MUNOC_LPARA_1)
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_37: munoc_signal_16 <= 4;
				`MUNOC_GDEF_83: munoc_signal_16 <= 8;
				`MUNOC_GDEF_49: munoc_signal_16 <= 16;
			endcase
		else
			case(munoc_port_15)
				`AXI_SIZE_001BYTE: munoc_signal_16 <= 1;
				`AXI_SIZE_002BYTE: munoc_signal_16 <= 2;
				`AXI_SIZE_004BYTE: munoc_signal_16 <= 4;
				`AXI_SIZE_008BYTE: munoc_signal_16 <= 8;
				`AXI_SIZE_016BYTE: munoc_signal_16 <= 16;
				`AXI_SIZE_032BYTE: munoc_signal_16 <= 32;
				`AXI_SIZE_064BYTE: munoc_signal_16 <= 64;
				`AXI_SIZE_128BYTE: munoc_signal_16 <= 128;
			endcase
	end
end

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_08 <= 0;
	else if(munoc_port_20)
		munoc_signal_08 <= 0;
	else if(munoc_signal_09)
		munoc_signal_08 <= munoc_signal_08 + munoc_signal_16;
end

always@(*)
begin
	munoc_signal_01 = 0;
	case(MUNOC_LPARA_0)
		`MUNOC_GDEF_37: munoc_signal_01 = $unsigned(munoc_signal_08[`MUNOC_LDEF_6-1:2]);
		`MUNOC_GDEF_83: munoc_signal_01 = $unsigned(munoc_signal_08[`MUNOC_LDEF_6-1:3]);
		`MUNOC_GDEF_49: munoc_signal_01 = $unsigned(munoc_signal_08[`MUNOC_LDEF_6-1:4]);
	endcase
end

always@(*)
begin
	munoc_signal_07 = 0;
	munoc_signal_00 = 0;
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_1); j=j+1)
	begin
		munoc_signal_07[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_03[j%4];
		munoc_signal_00[j] = munoc_port_02[j%4];
	end
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_1); j=j+1)
		case(munoc_port_13)
			`MUNOC_GDEF_37:
				if( (j%4) < `NUM_BYTE(MUNOC_GPARA_0))
				begin
					munoc_signal_07[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_03[j%4];
					munoc_signal_00[j] = munoc_port_02[j%4];
				end
			`MUNOC_GDEF_83:
				if( (j%8) < `NUM_BYTE(MUNOC_GPARA_0))
				begin
					munoc_signal_07[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_03[j%8];
					munoc_signal_00[j] = munoc_port_02[j%8];
				end
			`MUNOC_GDEF_49:
				if( (j%16) < `NUM_BYTE(MUNOC_GPARA_0))
				begin
					munoc_signal_07[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_03[j%16];
					munoc_signal_00[j] = munoc_port_02[j%16];
				end
	endcase
end

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_13 <= 0;
	else if(munoc_port_20)
		munoc_signal_13 <= munoc_signal_19;
end

always@(*)
begin
	munoc_signal_19 = 0;
	if($unsigned(munoc_port_13) <= MUNOC_LPARA_0)
		;
	else
		for(j=0; j<`MUNOC_LDEF_5; j=j+1)
			if(j<($unsigned(munoc_port_13)-MUNOC_LPARA_0))
				munoc_signal_19[j] = 1;
end

always@(*)
begin
	munoc_signal_02 = $unsigned(munoc_signal_01);
	munoc_signal_02 = munoc_signal_02 & munoc_signal_13;
end

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_0); i=i+1)
	begin : i_concatenate_data
		assign munoc_signal_20[(i+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_03[i];
	end
endgenerate

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(MUNOC_GPARA_0/MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_20),
	.select(munoc_signal_02),
	.data_output(munoc_signal_18)
);

ERVP_MUX
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_1)),
	.NUM_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_0)/`BW_AXI_WSTRB(MUNOC_GPARA_1))
)
i_munoc_instance_2
(
	.data_input_list(munoc_port_02),
	.select(munoc_signal_02),
	.data_output(munoc_signal_06)
);

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_21 <= 0;
	else if(munoc_port_20)
		munoc_signal_21 <= munoc_signal_04;
	else if(munoc_signal_09)
		munoc_signal_21 <= munoc_signal_17;
end

always@(*)
begin
	munoc_signal_14 = 0;
	case(munoc_port_15)
		`AXI_SIZE_001BYTE: munoc_signal_14[1-1:0] = -1;
		`AXI_SIZE_002BYTE: munoc_signal_14[2-1:0] = -1;
		`AXI_SIZE_004BYTE: munoc_signal_14[4-1:0] = -1;
		`AXI_SIZE_008BYTE: munoc_signal_14[8-1:0] = -1;
		`AXI_SIZE_016BYTE: munoc_signal_14[16-1:0] = -1;
		`AXI_SIZE_032BYTE: munoc_signal_14[32-1:0] = -1;
		`AXI_SIZE_064BYTE: munoc_signal_14[64-1:0] = -1;
		`AXI_SIZE_128BYTE: munoc_signal_14[128-1:0] = -1;
	endcase
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)),
	.BW_SHIFT_AMOUNT(`BW_ADDR_OFFSET),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(1)
)
i_munoc_instance_1
(
	.data_input(munoc_signal_14[`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0]),
	.shift_amount(munoc_port_22),
	.data_output(munoc_signal_15)
);

always@(*)
begin
	munoc_signal_04 = 0;
	for(j=0; j<(`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_1); j=j+1)
	begin
		if(j==0)
			munoc_signal_04 = munoc_signal_15[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_1)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_1)];
		else
			munoc_signal_04 = munoc_signal_04 | munoc_signal_15[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_1)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_1)];
	end
end

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_22 <= 0;
	else if(munoc_port_20)
	begin
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_37:
				case(munoc_port_15)
					`AXI_SIZE_001BYTE: munoc_signal_22 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_22 <= 2;
					`AXI_SIZE_004BYTE,
					`AXI_SIZE_008BYTE,
					`AXI_SIZE_016BYTE: munoc_signal_22 <= 0;
				endcase
			`MUNOC_GDEF_83:
				case(munoc_port_15)
					`AXI_SIZE_001BYTE: munoc_signal_22 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_22 <= 2;
					`AXI_SIZE_004BYTE: munoc_signal_22 <= 4;
					`AXI_SIZE_008BYTE,
					`AXI_SIZE_016BYTE: munoc_signal_22 <= 0;
				endcase
			`MUNOC_GDEF_49:
				case(munoc_port_15)
					`AXI_SIZE_001BYTE: munoc_signal_22 <= 1;
					`AXI_SIZE_002BYTE: munoc_signal_22 <= 2;
					`AXI_SIZE_004BYTE: munoc_signal_22 <= 4;
					`AXI_SIZE_008BYTE: munoc_signal_22 <= 8;
					`AXI_SIZE_016BYTE: munoc_signal_22 <= 0; 
				endcase
		endcase
	end
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_1)),
	.BW_SHIFT_AMOUNT(`MUNOC_LDEF_4),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(1)
)
i_munoc_instance_3
(
	.data_input(munoc_signal_21),
	.shift_amount(munoc_signal_22),
	.data_output(munoc_signal_17)
);

assign munoc_port_03 = (munoc_signal_10==`MUNOC_LDEF_0)? munoc_signal_18 : munoc_signal_07;
assign munoc_port_18 = (munoc_signal_10==`MUNOC_LDEF_0)? munoc_signal_06 : (munoc_signal_21 & munoc_signal_00);

always@(posedge munoc_port_11, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_signal_12 <= 0;
	else if(munoc_port_20)
		munoc_signal_12 <= munoc_signal_11;
end

always@(*)
begin
	munoc_signal_11 = -1;
	if(munoc_port_15 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_LDEF_6; j=j+1)
			if(j<($unsigned(munoc_port_15)-MUNOC_LPARA_1))
				munoc_signal_11[j] = 0;
end

always@(*)
begin
	munoc_port_08 = 0;
	if(munoc_signal_09)
		munoc_port_08 = ($signed((munoc_signal_01|munoc_signal_12))==(-1));
end

assign munoc_port_16 = (munoc_signal_10!=`MUNOC_LDEF_3) & munoc_port_10;

assign munoc_signal_09 = munoc_port_16 & munoc_port_01;
assign munoc_port_17 = munoc_signal_09 & munoc_port_05;

`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_6
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
endmodule
