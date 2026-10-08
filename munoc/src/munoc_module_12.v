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
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_00.vh"
`include "munoc_include_08.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_12
(
	munoc_port_18,
	munoc_port_15,

	munoc_port_20,
	munoc_port_14,
	munoc_port_00,
	munoc_port_16,
	munoc_port_08,
	munoc_port_07,
  munoc_port_09,

	munoc_port_12,
	munoc_port_06,
	
	munoc_port_05,
	munoc_port_10,
	munoc_port_04,
	munoc_port_01,
	munoc_port_19,
	munoc_port_21,

  munoc_port_11,
	munoc_port_17,
  munoc_port_02,

	munoc_port_03,
  munoc_port_13
);





parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_1 = 1;

localparam  MUNOC_LPARA_1 = `MUNOC_GDEF_34(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_2 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_18, munoc_port_15;

input wire munoc_port_20;
input wire [`MUNOC_GDEF_22-1:0] munoc_port_14;
input wire [MUNOC_GPARA_2-1:0] munoc_port_00;
input wire [`BW_AXI_ALEN-1:0] munoc_port_16;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_08;
input wire [`BW_AXI_ABURST-1:0] munoc_port_07;
output wire munoc_port_09;

input wire munoc_port_12;
input wire munoc_port_06;

output reg [`MUNOC_GDEF_53-1:0] munoc_port_05; 
output reg [`MUNOC_GDEF_88(MUNOC_GPARA_0)-1:0] munoc_port_10;
output reg [MUNOC_GPARA_2-1:0] munoc_port_04;
output reg [`BW_AXI_ALEN-1:0] munoc_port_01;
output reg [`BW_AXI_ASIZE-1:0] munoc_port_19;
output reg [`BW_AXI_ABURST-1:0] munoc_port_21;

output wire munoc_port_11;
output wire munoc_port_17;
input wire munoc_port_02;

output wire munoc_port_03;
output reg [`MUNOC_GDEF_72-1:0] munoc_port_13;

genvar i;
integer j,k;

localparam  MUNOC_LPARA_0 = 0;
localparam  MUNOC_LPARA_3 = 1;

wire munoc_signal_07;
wire munoc_signal_01;
wire munoc_signal_11;

reg munoc_signal_24;
reg [`BW_AXI_ABURST-1:0] munoc_signal_02;
reg [`BW_AXI_ALEN-1:0] munoc_signal_29;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_14, munoc_signal_17;

wire [`BW_AXI_ASIZE-1:0] munoc_signal_18;
wire munoc_signal_05;

wire [`MUNOC_GDEF_53-1:0] munoc_signal_23;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_12;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_26;

reg [`MUNOC_GDEF_53-1:0] munoc_signal_10; 
reg [`MUNOC_GDEF_53-1:0] munoc_signal_09;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_03;
reg [`MUNOC_GDEF_88(MUNOC_GPARA_0)-1:0] munoc_signal_00, munoc_signal_28;
wire munoc_signal_16;

reg [MUNOC_GPARA_2-1:0] munoc_signal_04;
reg [MUNOC_GPARA_2-1:0] munoc_signal_27;
wire [MUNOC_GPARA_2-1:0] munoc_signal_06;
wire [MUNOC_GPARA_2-1:0] munoc_signal_19, munoc_signal_20;
reg [MUNOC_GPARA_2-1:0] munoc_signal_15;

reg [MUNOC_GPARA_2-1:0] munoc_signal_08;

wire [MUNOC_GPARA_2-1:0] munoc_signal_13;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_22;
wire [MUNOC_GPARA_2-1:0] munoc_signal_25;
wire [MUNOC_GPARA_2-1:0] munoc_signal_21;

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_13 <= 0;
	else
		case(munoc_port_13)
			MUNOC_LPARA_0:
				if(munoc_port_11)
					munoc_port_13 <= MUNOC_LPARA_3;
			MUNOC_LPARA_3:
				if(munoc_signal_11)
					munoc_port_13 <= MUNOC_LPARA_0;
		endcase
end

assign munoc_port_11 = (munoc_port_13==MUNOC_LPARA_0) & munoc_port_20 & munoc_port_06;
assign munoc_port_17 = (munoc_port_13==MUNOC_LPARA_3);
assign munoc_port_03 = munoc_port_17 & munoc_port_02;
assign munoc_signal_11 = munoc_port_03 & munoc_signal_07;

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_05 <= 0;
	else if(munoc_port_11)
		munoc_port_05 <= munoc_signal_10;
end

assign munoc_signal_18 = $unsigned(munoc_port_08) - MUNOC_LPARA_2;
assign munoc_signal_05 = ($signed(munoc_signal_18) < 0);

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`MUNOC_GDEF_53),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_2
(
	.data_input(munoc_signal_23),
	.shift_amount(munoc_signal_12),
	.data_output(munoc_signal_26)
);

assign munoc_signal_23 = $unsigned(munoc_port_16);
assign munoc_signal_12 = $unsigned(munoc_signal_18[`BW_AXI_ASIZE-2:0]);

always@(*)
begin
	munoc_signal_10 = munoc_port_16;
  if(munoc_signal_05)
		munoc_signal_10 = munoc_port_16;
	else
		munoc_signal_10 = munoc_signal_26;
end

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_19 <= 0;
	else if(munoc_port_11)
		munoc_port_19 <= munoc_signal_14;
end

RVX_MODULE_025
#(
	.RVX_GPARA_1(`BW_AXI_ASIZE),
	.RVX_GPARA_0(1),
	.SIGNED(0)
)
i_munoc_instance_1
(
	.rvx_port_2(munoc_port_08),
	.rvx_port_0(munoc_signal_17),
	.rvx_port_1(munoc_signal_14)
);

assign munoc_signal_17 = MUNOC_LPARA_2;

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_21 <= 0;
	else if(munoc_port_11)
		munoc_port_21 <= munoc_signal_02;
end

always@(*)
begin
	munoc_signal_02 = munoc_port_07;
	if(munoc_signal_24)
	begin
		munoc_signal_02 = `AXI_BURST_INCR;
	end
	else if(munoc_port_12&&(munoc_port_07==`AXI_BURST_FIXED))
		munoc_signal_02 = `AXI_BURST_INCR;
end

assign munoc_signal_16 = ($unsigned(munoc_signal_10) > (`MAX_BURST_LENGTH-1));

always@(*)
begin
	munoc_signal_24 = 0;
	if(munoc_port_07==`AXI_BURST_WRAP)
	begin
		if(munoc_signal_16)
			munoc_signal_24 = 1;
	end
end

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_01 <= 0;
	else if(munoc_port_11||munoc_port_03)
		munoc_port_01 <= munoc_signal_29;
end

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_10 <= 0;
	else if(munoc_port_11)
		munoc_port_10 <= munoc_signal_28;
end

always@(*)
begin
	munoc_signal_28 = 0;
	if(munoc_port_11)
	begin
		if(munoc_signal_24)
			munoc_signal_28 = $unsigned(munoc_signal_10[`MUNOC_GDEF_53-1:1]);
		else
			munoc_signal_28 = $unsigned(munoc_signal_10>>(LOG2RU(`MAX_BURST_LENGTH)));
	end
end

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_00 <= 0;
	else if(munoc_port_11)
		munoc_signal_00 <= munoc_signal_28;
	else if(munoc_port_03)
	begin
		if(!munoc_signal_07)
			munoc_signal_00 <= munoc_signal_00-1;
	end
end

assign munoc_signal_07 = (munoc_signal_00==0);
assign munoc_signal_01 = (munoc_signal_00==1);

always@(*)
begin
	munoc_signal_29 = `MAX_BURST_LENGTH-1;
	if(munoc_signal_24)
	begin
		munoc_signal_29 = 2-1;
	end
	else if(munoc_port_11)
	begin
		if(munoc_signal_16)
			munoc_signal_29 = `MAX_BURST_LENGTH-1;
		else
			munoc_signal_29 = munoc_signal_10;
	end
	else
	begin
		if(munoc_signal_01)
			munoc_signal_29 = munoc_signal_03[LOG2RU(`MAX_BURST_LENGTH)-1:0];
		else
			munoc_signal_29 = `MAX_BURST_LENGTH-1;
	end
end

assign munoc_signal_03 = $unsigned(munoc_port_05) - $unsigned(munoc_signal_09); 

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_09 <= 0;
	else if(munoc_port_03)
	begin
		if(munoc_signal_07)
			munoc_signal_09 <= 0;
		else
			munoc_signal_09 <= munoc_signal_09 + (munoc_port_01+1);
	end
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_2),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_19),
	.shift_amount(munoc_port_08),
	.data_output(munoc_signal_20)
);

assign munoc_signal_19 = $unsigned(munoc_port_16);
assign munoc_signal_06 = (munoc_port_07==`AXI_BURST_WRAP)? munoc_signal_20 : $signed(-1);

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_signal_27 <= $signed(-1);
	else if(munoc_port_11)
		munoc_signal_27 <= munoc_signal_06;
end

always@(*)
begin
	munoc_signal_08 = $unsigned(munoc_port_00);
	case(munoc_port_08)
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
	munoc_signal_15 = munoc_port_04 + munoc_signal_04;
	munoc_signal_15 = (munoc_port_04 & (~munoc_signal_27) ) | (munoc_signal_15 & munoc_signal_27);
end

always@(posedge munoc_port_18, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
	begin
		munoc_port_04 <= 0;
		munoc_signal_04 <= 0;
	end
	else if(munoc_port_11)
	begin
		munoc_port_04 <= munoc_signal_08;
		if(munoc_signal_24)
		begin
			case(MUNOC_LPARA_1)
				`MUNOC_GDEF_80: munoc_signal_04 <= 2*4;
				`MUNOC_GDEF_14: munoc_signal_04 <= 2*8;
				`MUNOC_GDEF_24: munoc_signal_04 <= 2*16;
			endcase
		end
		else
			munoc_signal_04 <= munoc_signal_21;
	end
	else if(munoc_port_03)
		if(!munoc_signal_07)
			munoc_port_04 <= munoc_signal_15;
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_2),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(1),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(0)
)
i_munoc_instance_3
(
	.data_input(munoc_signal_13),
	.shift_amount(munoc_signal_22),
	.data_output(munoc_signal_25)
);

assign munoc_signal_13 = $unsigned(`NUM_BYTE(MUNOC_GPARA_0)*`MAX_BURST_LENGTH);
assign munoc_signal_22 = $signed(munoc_signal_18);
assign munoc_signal_21 = munoc_signal_05? munoc_signal_25 : munoc_signal_13;

assign munoc_port_09 = munoc_signal_11;

endmodule
