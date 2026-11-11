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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_10.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_04.vh"





module MUNOC_MODULE_00
(
	munoc_port_03,
	munoc_port_19,

	munoc_port_14,
	munoc_port_01,
	munoc_port_15,
	munoc_port_09,
	munoc_port_13,
	munoc_port_20,
	munoc_port_10,
	munoc_port_04,

	munoc_port_05,
	munoc_port_06,
	munoc_port_16,
	munoc_port_17,
	munoc_port_12,
	munoc_port_18,

	munoc_port_21,
	munoc_port_08,
	munoc_port_00,
	munoc_port_22,
	munoc_port_11,
	munoc_port_02,
	munoc_port_07
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = `BW_LONGEST_MASTER_DATA;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_72(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_03, munoc_port_19;

input wire [`MUNOC_GDEF_77-1:0] munoc_port_14;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_01;
input wire munoc_port_15;
input wire munoc_port_09;
input wire [MUNOC_GPARA_1-1:0] munoc_port_13;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_port_20;

input wire [`BW_ADDR_OFFSET-1:0] munoc_port_10;
input wire [`BW_AXI_ALEN-1:0] munoc_port_04;

input wire munoc_port_05;
input wire munoc_port_06;
input wire munoc_port_16;
input wire munoc_port_17;
input wire munoc_port_12;
output wire munoc_port_18;

output wire [MUNOC_GPARA_0-1:0] munoc_port_21;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_08;
output wire munoc_port_00;
output wire munoc_port_22;
input wire munoc_port_11;
output reg munoc_port_02;
output wire munoc_port_07;

genvar i;
integer j,k;

wire [`BW_BYTE-1:0] munoc_signal_12 [`NUM_BYTE(MUNOC_GPARA_1)-1:0];

`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_5 0
`define MUNOC_LDEF_6 1
`define MUNOC_LDEF_2 2

reg [`MUNOC_LDEF_0-1:0] munoc_signal_01;
reg [`BW_AXI_ALEN-1:0] munoc_signal_17;

reg [MUNOC_GPARA_0-1:0] munoc_signal_21;
reg [`NUM_BYTE(MUNOC_GPARA_0)-1:0] munoc_signal_11;

`define MUNOC_LDEF_4 REQUIRED_BITWIDTH_INDEX(MUNOC_GPARA_1/MUNOC_GPARA_0)

reg [`MUNOC_LDEF_4-1:0] munoc_signal_00;
reg [`MUNOC_LDEF_4-1:0] munoc_signal_10, munoc_signal_05;

wire [MUNOC_GPARA_1-1:0] munoc_signal_07;
wire [MUNOC_GPARA_0-1:0] munoc_signal_22;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_02;

reg [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_23;

reg [`BW_AXI_WSTRB(128*8)-1:0] munoc_signal_03;
wire [`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0] munoc_signal_13;
reg [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_19;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_04;

`define MUNOC_LDEF_3 `BW_ADDR_OFFSET
reg [`MUNOC_LDEF_3-1:0] munoc_signal_18;

wire munoc_signal_15;

`define MUNOC_LDEF_1 (`BW_ADDR_OFFSET+3)
reg [`MUNOC_LDEF_1-1:0] munoc_signal_16;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_14;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_09, munoc_signal_06;
reg [`MUNOC_LDEF_1-1:0] munoc_signal_08;
reg [`BW_ADDR_OFFSET-1:0] munoc_signal_20;

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_1); i=i+1)
	begin : i_unpack_data
		assign munoc_signal_12[i] = munoc_port_13[(i+1)*`BW_BYTE-1-:`BW_BYTE];
	end
endgenerate

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_01 <= `MUNOC_LDEF_5;
	else
		case(munoc_signal_01)
			`MUNOC_LDEF_5:
				if(munoc_port_12)
				begin
					if(munoc_port_16)
						munoc_signal_01 <= `MUNOC_LDEF_2;
					else
						munoc_signal_01 <= `MUNOC_LDEF_6;
				end
			`MUNOC_LDEF_2,
			`MUNOC_LDEF_6:
				if(munoc_port_07)
					munoc_signal_01 <= `MUNOC_LDEF_5;
		endcase
end

assign munoc_port_18 = (munoc_signal_01!=`MUNOC_LDEF_5);

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_17 <= 0;
	else if(munoc_signal_15)
		if(munoc_port_00)
			munoc_signal_17 <= 0;
		else
			munoc_signal_17 <= munoc_signal_17 + 1'b 1;
end
assign munoc_port_00 = (munoc_signal_17==munoc_port_04);

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_14 <= 0;
	else if(munoc_port_17)
	begin
		if(munoc_port_01 >= MUNOC_LPARA_1)
			munoc_signal_14 <= `NUM_BYTE(MUNOC_GPARA_0);
		else
			munoc_signal_14 <= (1<<munoc_port_01);
	end
end

always@(*)
begin
	munoc_signal_20 = munoc_port_10;
	for(j=0; j<`BW_ADDR_OFFSET; j=j+1)
		if(j<$unsigned(munoc_port_01))
			munoc_signal_20[j] = 0;
end

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_16 <= 0;
	else if(munoc_port_17)
		munoc_signal_16 <= munoc_port_16? $unsigned(munoc_signal_20) : 0;
	else if(munoc_signal_15)
		munoc_signal_16 <= munoc_signal_16 + munoc_signal_14;
end

always@(*)
begin
	munoc_signal_08 = munoc_signal_16 >> MUNOC_LPARA_1;
end

always@(*)
begin
	munoc_signal_21 = 0;
	munoc_signal_11 = 0;
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_0); j=j+1)
	begin
		munoc_signal_21[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_12[j%4];
		munoc_signal_11[j] = munoc_port_20[j%4];
	end
	for(j=0;j<`NUM_BYTE(MUNOC_GPARA_0); j=j+1)
	begin
		k = j & ((4<<munoc_port_14)-1);
		if(k < `NUM_BYTE(MUNOC_GPARA_1))
		begin
			munoc_signal_21[(j+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_12[k];
			munoc_signal_11[j] = munoc_port_20[k];
		end
	end
end

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_10 <= 0;
	else if(munoc_port_17)
		munoc_signal_10 <= munoc_signal_05;
end

always@(*)
begin
	munoc_signal_05 = 0;
	if($unsigned(munoc_port_14) <= MUNOC_LPARA_0)
		;
	else
		for(j=0; j<`MUNOC_LDEF_4; j=j+1)
			if(j<($unsigned(munoc_port_14)-MUNOC_LPARA_0))
				munoc_signal_05[j] = 1;
end

always@(*)
begin
	munoc_signal_00 = $unsigned(munoc_signal_08);
	munoc_signal_00 = munoc_signal_00 & munoc_signal_10;
end

generate
	for(i=0; i<`NUM_BYTE(MUNOC_GPARA_1); i=i+1)
	begin : i_concatenate_data
		assign munoc_signal_07[(i+1)*`BW_BYTE-1-:`BW_BYTE] = munoc_signal_12[i];
	end
endgenerate

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_0),
	.NUM_DATA(MUNOC_GPARA_1/MUNOC_GPARA_0)
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_07),
	.select(munoc_signal_00),
	.data_output(munoc_signal_22)
);

ERVP_MUX
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_0)),
	.NUM_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_1)/`BW_AXI_WSTRB(MUNOC_GPARA_0))
)
i_munoc_instance_3
(
	.data_input_list(munoc_port_20),
	.select(munoc_signal_00),
	.data_output(munoc_signal_02)
);

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_23 <= 0;
	else if(munoc_port_17)
		munoc_signal_23 <= munoc_signal_19;
	else if(munoc_signal_15)
		munoc_signal_23 <= munoc_signal_04;
end

always@(*)
begin
	munoc_signal_03 = 0;
	for(j=0; j<`BW_AXI_WSTRB(128*8); j=j+1)
		if(j<(1<<munoc_port_01))
			munoc_signal_03[j] = 1;
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
	.data_input(munoc_signal_03[`BW_AXI_WSTRB(`ULIMIT_OF_DATA_WIDTH)-1:0]),
	.shift_amount(munoc_port_10),
	.data_output(munoc_signal_13)
);

always@(*)
begin
	munoc_signal_19 = 0;
	for(j=0; j<(`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_0); j=j+1)
	begin
		if(j==0)
			munoc_signal_19 = munoc_signal_13[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_0)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_0)];
		else
			munoc_signal_19 = munoc_signal_19 | munoc_signal_13[(j+1)*`BW_AXI_WSTRB(MUNOC_GPARA_0)-1 -:`BW_AXI_WSTRB(MUNOC_GPARA_0)];
	end
end

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_18 <= 0;
	else if(munoc_port_17)
	begin
		
		if(munoc_port_01 < MUNOC_LPARA_1)
			munoc_signal_18 <= (1<<munoc_port_01);
		else
			munoc_signal_18 <= 0;
	end
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`BW_AXI_WSTRB(MUNOC_GPARA_0)),
	.BW_SHIFT_AMOUNT(`MUNOC_LDEF_3),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(1)
)
i_munoc_instance_2
(
	.data_input(munoc_signal_23),
	.shift_amount(munoc_signal_18),
	.data_output(munoc_signal_04)
);

assign munoc_port_21 = (munoc_signal_01==`MUNOC_LDEF_2)? munoc_signal_22 : munoc_signal_21;
assign munoc_port_08 = (munoc_signal_01==`MUNOC_LDEF_2)? munoc_signal_02 : (munoc_signal_23 & munoc_signal_11);

always@(posedge munoc_port_03, negedge munoc_port_19)
begin
	if(munoc_port_19==0)
		munoc_signal_09 <= 0;
	else if(munoc_port_17)
		munoc_signal_09 <= munoc_signal_06;
end

always@(*)
begin
	munoc_signal_06 = -1;
	if(munoc_port_01 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_LDEF_1; j=j+1)
			if(j<($unsigned(munoc_port_01)-MUNOC_LPARA_1))
				munoc_signal_06[j] = 0;
end

always@(*)
begin
	munoc_port_02 = 0;
	if(munoc_signal_15)
		munoc_port_02 = ($signed((munoc_signal_08|munoc_signal_09))==(-1));
end

assign munoc_port_22 = (munoc_signal_01!=`MUNOC_LDEF_5) & munoc_port_15;

assign munoc_signal_15 = munoc_port_22 & munoc_port_11;
assign munoc_port_07 = munoc_signal_15 & munoc_port_00;

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_6
`undef MUNOC_LDEF_0
endmodule
