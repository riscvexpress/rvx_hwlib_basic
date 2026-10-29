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
`include "munoc_network_link.vh"
`include "munoc_include_03.vh"
`include "munoc_include_07.vh"
`include "munoc_include_06.vh"





module MUNOC_MODULE_28
(
	munoc_port_09,
	munoc_port_15,

	munoc_port_17,
	munoc_port_05,
	munoc_port_03,
	munoc_port_04,
	munoc_port_08,
	munoc_port_12,
  munoc_port_02,

	munoc_port_11,
	munoc_port_16,
	
	munoc_port_00,
	munoc_port_06,
	munoc_port_18,
	munoc_port_07,
	munoc_port_10,
	munoc_port_13,

  munoc_port_19,
	munoc_port_20,
  munoc_port_21,

	munoc_port_14,
  munoc_port_01
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 1;

localparam  MUNOC_LPARA_1 = `MUNOC_GDEF_25(MUNOC_GPARA_2);
localparam  MUNOC_LPARA_2 = `GET_AXI_SIZE(MUNOC_GPARA_2);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_09, munoc_port_15;

input wire munoc_port_17;
input wire [`MUNOC_GDEF_75-1:0] munoc_port_05;
input wire [MUNOC_GPARA_0-1:0] munoc_port_03;
input wire [`BW_AXI_ALEN-1:0] munoc_port_04;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_08;
input wire [`BW_AXI_ABURST-1:0] munoc_port_12;
output wire munoc_port_02;

input wire munoc_port_11;
input wire munoc_port_16;

output reg [`MUNOC_GDEF_45-1:0] munoc_port_00; 
output reg [`MUNOC_GDEF_31(MUNOC_GPARA_2)-1:0] munoc_port_06;
output reg [MUNOC_GPARA_0-1:0] munoc_port_18;
output reg [`BW_AXI_ALEN-1:0] munoc_port_07;
output reg [`BW_AXI_ASIZE-1:0] munoc_port_10;
output reg [`BW_AXI_ABURST-1:0] munoc_port_13;

output wire munoc_port_19;
output wire munoc_port_20;
input wire munoc_port_21;

output wire munoc_port_14;
output reg [`MUNOC_GDEF_81-1:0] munoc_port_01;

genvar i;
integer j,k;

localparam  MUNOC_LPARA_3 = 0;
localparam  MUNOC_LPARA_0 = 1;

wire munoc_signal_12;
wire munoc_signal_23;
wire munoc_signal_03;

reg munoc_signal_18;
reg [`BW_AXI_ABURST-1:0] munoc_signal_19;
reg [`BW_AXI_ALEN-1:0] munoc_signal_07;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29, munoc_signal_26;

wire [`BW_AXI_ASIZE-1:0] munoc_signal_00;
wire munoc_signal_17;

wire [`MUNOC_GDEF_45-1:0] munoc_signal_22;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_27;
wire [`MUNOC_GDEF_45-1:0] munoc_signal_25;

reg [`MUNOC_GDEF_45-1:0] munoc_signal_15; 
reg [`MUNOC_GDEF_45-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_45-1:0] munoc_signal_05;
reg [`MUNOC_GDEF_31(MUNOC_GPARA_2)-1:0] munoc_signal_14, munoc_signal_10;
wire munoc_signal_28;

reg [MUNOC_GPARA_0-1:0] munoc_signal_16;
reg [MUNOC_GPARA_0-1:0] munoc_signal_04;
wire [MUNOC_GPARA_0-1:0] munoc_signal_20;
wire [MUNOC_GPARA_0-1:0] munoc_signal_09, munoc_signal_06;
reg [MUNOC_GPARA_0-1:0] munoc_signal_24;

reg [MUNOC_GPARA_0-1:0] munoc_signal_13;

wire [MUNOC_GPARA_0-1:0] munoc_signal_11;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_01;
wire [MUNOC_GPARA_0-1:0] munoc_signal_08;
wire [MUNOC_GPARA_0-1:0] munoc_signal_21;

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_01 <= 0;
	else
		case(munoc_port_01)
			MUNOC_LPARA_3:
				if(munoc_port_19)
					munoc_port_01 <= MUNOC_LPARA_0;
			MUNOC_LPARA_0:
				if(munoc_signal_03)
					munoc_port_01 <= MUNOC_LPARA_3;
		endcase
end

assign munoc_port_19 = (munoc_port_01==MUNOC_LPARA_3) & munoc_port_17 & munoc_port_16;
assign munoc_port_20 = (munoc_port_01==MUNOC_LPARA_0);
assign munoc_port_14 = munoc_port_20 & munoc_port_21;
assign munoc_signal_03 = munoc_port_14 & munoc_signal_12;

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_00 <= 0;
	else if(munoc_port_19)
		munoc_port_00 <= munoc_signal_15;
end

assign munoc_signal_00 = $unsigned(munoc_port_08) - MUNOC_LPARA_2;
assign munoc_signal_17 = ($signed(munoc_signal_00) < 0);

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`MUNOC_GDEF_45),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_22),
	.shift_amount(munoc_signal_27),
	.data_output(munoc_signal_25)
);

assign munoc_signal_22 = $unsigned(munoc_port_04);
assign munoc_signal_27 = $unsigned(munoc_signal_00[`BW_AXI_ASIZE-2:0]);

always@(*)
begin
	munoc_signal_15 = munoc_port_04;
  if(munoc_signal_17)
		munoc_signal_15 = munoc_port_04;
	else
		munoc_signal_15 = munoc_signal_25;
end

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_10 <= 0;
	else if(munoc_port_19)
		munoc_port_10 <= munoc_signal_29;
end

RVX_MODULE_088
#(
	.RVX_GPARA_1(`BW_AXI_ASIZE),
	.RVX_GPARA_0(1),
	.SIGNED(0)
)
i_munoc_instance_2
(
	.rvx_port_2(munoc_port_08),
	.rvx_port_1(munoc_signal_26),
	.rvx_port_0(munoc_signal_29)
);

assign munoc_signal_26 = MUNOC_LPARA_2;

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_13 <= 0;
	else if(munoc_port_19)
		munoc_port_13 <= munoc_signal_19;
end

always@(*)
begin
	munoc_signal_19 = munoc_port_12;
	if(munoc_signal_18)
	begin
		munoc_signal_19 = `AXI_BURST_INCR;
	end
	else if(munoc_port_11&&(munoc_port_12==`AXI_BURST_FIXED))
		munoc_signal_19 = `AXI_BURST_INCR;
end

assign munoc_signal_28 = ($unsigned(munoc_signal_15) > (`MAX_BURST_LENGTH-1));

always@(*)
begin
	munoc_signal_18 = 0;
	if(munoc_port_12==`AXI_BURST_WRAP)
	begin
		if(munoc_signal_28)
			munoc_signal_18 = 1;
	end
end

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_07 <= 0;
	else if(munoc_port_19||munoc_port_14)
		munoc_port_07 <= munoc_signal_07;
end

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_06 <= 0;
	else if(munoc_port_19)
		munoc_port_06 <= munoc_signal_10;
end

always@(*)
begin
	munoc_signal_10 = 0;
	if(munoc_port_19)
	begin
		if(munoc_signal_18)
			munoc_signal_10 = $unsigned(munoc_signal_15[`MUNOC_GDEF_45-1:1]);
		else
			munoc_signal_10 = $unsigned(munoc_signal_15>>(LOG2RU(`MAX_BURST_LENGTH)));
	end
end

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_14 <= 0;
	else if(munoc_port_19)
		munoc_signal_14 <= munoc_signal_10;
	else if(munoc_port_14)
	begin
		if(!munoc_signal_12)
			munoc_signal_14 <= munoc_signal_14-1;
	end
end

assign munoc_signal_12 = (munoc_signal_14==0);
assign munoc_signal_23 = (munoc_signal_14==1);

always@(*)
begin
	munoc_signal_07 = `MAX_BURST_LENGTH-1;
	if(munoc_signal_18)
	begin
		munoc_signal_07 = 2-1;
	end
	else if(munoc_port_19)
	begin
		if(munoc_signal_28)
			munoc_signal_07 = `MAX_BURST_LENGTH-1;
		else
			munoc_signal_07 = munoc_signal_15;
	end
	else
	begin
		if(munoc_signal_23)
			munoc_signal_07 = munoc_signal_05[LOG2RU(`MAX_BURST_LENGTH)-1:0];
		else
			munoc_signal_07 = `MAX_BURST_LENGTH-1;
	end
end

assign munoc_signal_05 = $unsigned(munoc_port_00) - $unsigned(munoc_signal_02); 

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_02 <= 0;
	else if(munoc_port_14)
	begin
		if(munoc_signal_12)
			munoc_signal_02 <= 0;
		else
			munoc_signal_02 <= munoc_signal_02 + (munoc_port_07+1);
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
i_munoc_instance_3
(
	.data_input(munoc_signal_09),
	.shift_amount(munoc_port_08),
	.data_output(munoc_signal_06)
);

assign munoc_signal_09 = $unsigned(munoc_port_04);
assign munoc_signal_20 = (munoc_port_12==`AXI_BURST_WRAP)? munoc_signal_06 : $signed(-1);

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_04 <= $signed(-1);
	else if(munoc_port_19)
		munoc_signal_04 <= munoc_signal_20;
end

always@(*)
begin
	munoc_signal_13 = $unsigned(munoc_port_03);
	case(munoc_port_08)
		`AXI_SIZE_001BYTE: ;
		`AXI_SIZE_002BYTE: munoc_signal_13[0] = 0;
		`AXI_SIZE_004BYTE: munoc_signal_13[1:0] = 0;
		`AXI_SIZE_008BYTE: munoc_signal_13[2:0] = 0;
		`AXI_SIZE_016BYTE: munoc_signal_13[3:0] = 0;
		`AXI_SIZE_032BYTE: munoc_signal_13[4:0] = 0;
		`AXI_SIZE_064BYTE: munoc_signal_13[5:0] = 0;
		`AXI_SIZE_128BYTE: munoc_signal_13[6:0] = 0;
	endcase
end

always@(*)
begin
	munoc_signal_24 = munoc_port_18 + munoc_signal_16;
	munoc_signal_24 = (munoc_port_18 & (~munoc_signal_04) ) | (munoc_signal_24 & munoc_signal_04);
end

always@(posedge munoc_port_09, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
	begin
		munoc_port_18 <= 0;
		munoc_signal_16 <= 0;
	end
	else if(munoc_port_19)
	begin
		munoc_port_18 <= munoc_signal_13;
		if(munoc_signal_18)
		begin
			case(MUNOC_LPARA_1)
				`MUNOC_GDEF_37: munoc_signal_16 <= 2*4;
				`MUNOC_GDEF_83: munoc_signal_16 <= 2*8;
				`MUNOC_GDEF_49: munoc_signal_16 <= 2*16;
			endcase
		end
		else
			munoc_signal_16 <= munoc_signal_21;
	end
	else if(munoc_port_14)
		if(!munoc_signal_12)
			munoc_port_18 <= munoc_signal_24;
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
i_munoc_instance_1
(
	.data_input(munoc_signal_11),
	.shift_amount(munoc_signal_01),
	.data_output(munoc_signal_08)
);

assign munoc_signal_11 = $unsigned(`NUM_BYTE(MUNOC_GPARA_2)*`MAX_BURST_LENGTH);
assign munoc_signal_01 = $signed(munoc_signal_00);
assign munoc_signal_21 = munoc_signal_17? munoc_signal_08 : munoc_signal_11;

assign munoc_port_02 = munoc_signal_03;

endmodule
