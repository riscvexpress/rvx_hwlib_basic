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
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_04.vh"
`include "munoc_include_08.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_23
(
	munoc_port_21,
	munoc_port_16,

	munoc_port_04,
	munoc_port_01,
	munoc_port_00,
	munoc_port_17,
	munoc_port_02,
	munoc_port_11,
  munoc_port_05,

	munoc_port_10,
	munoc_port_19,
	
	munoc_port_06,
	munoc_port_09,
	munoc_port_20,
	munoc_port_18,
	munoc_port_14,
	munoc_port_07,

  munoc_port_13,
	munoc_port_08,
  munoc_port_03,

	munoc_port_12,
  munoc_port_15
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 1;

localparam  MUNOC_LPARA_2 = `MUNOC_GDEF_51(MUNOC_GPARA_2);
localparam  MUNOC_LPARA_0 = `GET_AXI_SIZE(MUNOC_GPARA_2);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_21, munoc_port_16;

input wire munoc_port_04;
input wire [`MUNOC_GDEF_60-1:0] munoc_port_01;
input wire [MUNOC_GPARA_0-1:0] munoc_port_00;
input wire [`BW_AXI_ALEN-1:0] munoc_port_17;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_02;
input wire [`BW_AXI_ABURST-1:0] munoc_port_11;
output wire munoc_port_05;

input wire munoc_port_10;
input wire munoc_port_19;

output reg [`MUNOC_GDEF_05-1:0] munoc_port_06; 
output reg [`MUNOC_GDEF_19(MUNOC_GPARA_2)-1:0] munoc_port_09;
output reg [MUNOC_GPARA_0-1:0] munoc_port_20;
output reg [`BW_AXI_ALEN-1:0] munoc_port_18;
output reg [`BW_AXI_ASIZE-1:0] munoc_port_14;
output reg [`BW_AXI_ABURST-1:0] munoc_port_07;

output wire munoc_port_13;
output wire munoc_port_08;
input wire munoc_port_03;

output wire munoc_port_12;
output reg [`MUNOC_GDEF_02-1:0] munoc_port_15;

genvar i;
integer j,k;

localparam  MUNOC_LPARA_3 = 0;
localparam  MUNOC_LPARA_1 = 1;

wire munoc_signal_28;
wire munoc_signal_07;
wire munoc_signal_12;

reg munoc_signal_20;
reg [`BW_AXI_ABURST-1:0] munoc_signal_04;
reg [`BW_AXI_ALEN-1:0] munoc_signal_02;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_11, munoc_signal_00;

wire [`BW_AXI_ASIZE-1:0] munoc_signal_19;
wire munoc_signal_08;

wire [`MUNOC_GDEF_05-1:0] munoc_signal_21;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_16;
wire [`MUNOC_GDEF_05-1:0] munoc_signal_17;

reg [`MUNOC_GDEF_05-1:0] munoc_signal_23; 
reg [`MUNOC_GDEF_05-1:0] munoc_signal_27;
wire [`MUNOC_GDEF_05-1:0] munoc_signal_26;
reg [`MUNOC_GDEF_19(MUNOC_GPARA_2)-1:0] munoc_signal_01, munoc_signal_10;
wire munoc_signal_06;

reg [MUNOC_GPARA_0-1:0] munoc_signal_25;
reg [MUNOC_GPARA_0-1:0] munoc_signal_05;
wire [MUNOC_GPARA_0-1:0] munoc_signal_24;
wire [MUNOC_GPARA_0-1:0] munoc_signal_22, munoc_signal_14;
reg [MUNOC_GPARA_0-1:0] munoc_signal_13;

reg [MUNOC_GPARA_0-1:0] munoc_signal_09;

wire [MUNOC_GPARA_0-1:0] munoc_signal_18;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29;
wire [MUNOC_GPARA_0-1:0] munoc_signal_15;
wire [MUNOC_GPARA_0-1:0] munoc_signal_03;

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_15 <= 0;
	else
		case(munoc_port_15)
			MUNOC_LPARA_3:
				if(munoc_port_13)
					munoc_port_15 <= MUNOC_LPARA_1;
			MUNOC_LPARA_1:
				if(munoc_signal_12)
					munoc_port_15 <= MUNOC_LPARA_3;
		endcase
end

assign munoc_port_13 = (munoc_port_15==MUNOC_LPARA_3) & munoc_port_04 & munoc_port_19;
assign munoc_port_08 = (munoc_port_15==MUNOC_LPARA_1);
assign munoc_port_12 = munoc_port_08 & munoc_port_03;
assign munoc_signal_12 = munoc_port_12 & munoc_signal_28;

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_06 <= 0;
	else if(munoc_port_13)
		munoc_port_06 <= munoc_signal_23;
end

assign munoc_signal_19 = $unsigned(munoc_port_02) - MUNOC_LPARA_0;
assign munoc_signal_08 = ($signed(munoc_signal_19) < 0);

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`MUNOC_GDEF_05),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_1
(
	.data_input(munoc_signal_21),
	.shift_amount(munoc_signal_16),
	.data_output(munoc_signal_17)
);

assign munoc_signal_21 = $unsigned(munoc_port_17);
assign munoc_signal_16 = $unsigned(munoc_signal_19[`BW_AXI_ASIZE-2:0]);

always@(*)
begin
	munoc_signal_23 = munoc_port_17;
  if(munoc_signal_08)
		munoc_signal_23 = munoc_port_17;
	else
		munoc_signal_23 = munoc_signal_17;
end

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_14 <= 0;
	else if(munoc_port_13)
		munoc_port_14 <= munoc_signal_11;
end

RVX_MODULE_130
#(
	.RVX_GPARA_1(`BW_AXI_ASIZE),
	.RVX_GPARA_0(1),
	.SIGNED(0)
)
i_munoc_instance_3
(
	.rvx_port_2(munoc_port_02),
	.rvx_port_0(munoc_signal_00),
	.rvx_port_1(munoc_signal_11)
);

assign munoc_signal_00 = MUNOC_LPARA_0;

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_07 <= 0;
	else if(munoc_port_13)
		munoc_port_07 <= munoc_signal_04;
end

always@(*)
begin
	munoc_signal_04 = munoc_port_11;
	if(munoc_signal_20)
	begin
		munoc_signal_04 = `AXI_BURST_INCR;
	end
	else if(munoc_port_10&&(munoc_port_11==`AXI_BURST_FIXED))
		munoc_signal_04 = `AXI_BURST_INCR;
end

assign munoc_signal_06 = ($unsigned(munoc_signal_23) > (`MAX_BURST_LENGTH-1));

always@(*)
begin
	munoc_signal_20 = 0;
	if(munoc_port_11==`AXI_BURST_WRAP)
	begin
		if(munoc_signal_06)
			munoc_signal_20 = 1;
	end
end

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_18 <= 0;
	else if(munoc_port_13||munoc_port_12)
		munoc_port_18 <= munoc_signal_02;
end

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_port_09 <= 0;
	else if(munoc_port_13)
		munoc_port_09 <= munoc_signal_10;
end

always@(*)
begin
	munoc_signal_10 = 0;
	if(munoc_port_13)
	begin
		if(munoc_signal_20)
			munoc_signal_10 = $unsigned(munoc_signal_23[`MUNOC_GDEF_05-1:1]);
		else
			munoc_signal_10 = $unsigned(munoc_signal_23>>(LOG2RU(`MAX_BURST_LENGTH)));
	end
end

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_signal_01 <= 0;
	else if(munoc_port_13)
		munoc_signal_01 <= munoc_signal_10;
	else if(munoc_port_12)
	begin
		if(!munoc_signal_28)
			munoc_signal_01 <= munoc_signal_01-1;
	end
end

assign munoc_signal_28 = (munoc_signal_01==0);
assign munoc_signal_07 = (munoc_signal_01==1);

always@(*)
begin
	munoc_signal_02 = `MAX_BURST_LENGTH-1;
	if(munoc_signal_20)
	begin
		munoc_signal_02 = 2-1;
	end
	else if(munoc_port_13)
	begin
		if(munoc_signal_06)
			munoc_signal_02 = `MAX_BURST_LENGTH-1;
		else
			munoc_signal_02 = munoc_signal_23;
	end
	else
	begin
		if(munoc_signal_07)
			munoc_signal_02 = munoc_signal_26[LOG2RU(`MAX_BURST_LENGTH)-1:0];
		else
			munoc_signal_02 = `MAX_BURST_LENGTH-1;
	end
end

assign munoc_signal_26 = $unsigned(munoc_port_06) - $unsigned(munoc_signal_27); 

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_signal_27 <= 0;
	else if(munoc_port_12)
	begin
		if(munoc_signal_28)
			munoc_signal_27 <= 0;
		else
			munoc_signal_27 <= munoc_signal_27 + (munoc_port_18+1);
	end
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
i_munoc_instance_2
(
	.data_input(munoc_signal_22),
	.shift_amount(munoc_port_02),
	.data_output(munoc_signal_14)
);

assign munoc_signal_22 = $unsigned(munoc_port_17);
assign munoc_signal_24 = (munoc_port_11==`AXI_BURST_WRAP)? munoc_signal_14 : $signed(-1);

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
		munoc_signal_05 <= $signed(-1);
	else if(munoc_port_13)
		munoc_signal_05 <= munoc_signal_24;
end

always@(*)
begin
	munoc_signal_09 = $unsigned(munoc_port_00);
	case(munoc_port_02)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: munoc_signal_09[0] = 0;
		`AXI_SIZE_004BYTE: munoc_signal_09[1:0] = 0;
		`AXI_SIZE_008BYTE: munoc_signal_09[2:0] = 0;
		`AXI_SIZE_016BYTE: munoc_signal_09[3:0] = 0;
		`AXI_SIZE_032BYTE: munoc_signal_09[4:0] = 0;
		`AXI_SIZE_064BYTE: munoc_signal_09[5:0] = 0;
		`AXI_SIZE_128BYTE: munoc_signal_09[6:0] = 0;
	endcase
end

always@(*)
begin
	munoc_signal_13 = munoc_port_20 + munoc_signal_25;
	munoc_signal_13 = (munoc_port_20 & (~munoc_signal_05) ) | (munoc_signal_13 & munoc_signal_05);
end

always@(posedge munoc_port_21, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
	begin
		munoc_port_20 <= 0;
		munoc_signal_25 <= 0;
	end
	else if(munoc_port_13)
	begin
		munoc_port_20 <= munoc_signal_09;
		if(munoc_signal_20)
		begin
			case(MUNOC_LPARA_2)
				`MUNOC_GDEF_34: munoc_signal_25 <= 2*4;
				`MUNOC_GDEF_79: munoc_signal_25 <= 2*8;
				`MUNOC_GDEF_95: munoc_signal_25 <= 2*16;
			endcase
		end
		else
			munoc_signal_25 <= munoc_signal_03;
	end
	else if(munoc_port_12)
		if(!munoc_signal_28)
			munoc_port_20 <= munoc_signal_13;
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_0),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(1),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(0)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_18),
	.shift_amount(munoc_signal_29),
	.data_output(munoc_signal_15)
);

assign munoc_signal_18 = $unsigned(`NUM_BYTE(MUNOC_GPARA_2)*`MAX_BURST_LENGTH);
assign munoc_signal_29 = $signed(munoc_signal_19);
assign munoc_signal_03 = munoc_signal_08? munoc_signal_15 : munoc_signal_18;

assign munoc_port_05 = munoc_signal_12;

endmodule
