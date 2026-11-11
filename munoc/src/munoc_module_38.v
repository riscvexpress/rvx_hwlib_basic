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
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"
`include "munoc_include_03.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_38
(
	munoc_port_21,
	munoc_port_05,

	munoc_port_07,
	munoc_port_06,
	munoc_port_00,
	munoc_port_08,
	munoc_port_15,
	munoc_port_17,
  munoc_port_20,

	munoc_port_09,
	munoc_port_13,
	
	munoc_port_11,
	munoc_port_03,
	munoc_port_18,
	munoc_port_01,
	munoc_port_10,
	munoc_port_14,

  munoc_port_02,
	munoc_port_12,
  munoc_port_04,

	munoc_port_19,
  munoc_port_16
);





parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_0 = 1;

localparam  MUNOC_LPARA_1 = `MUNOC_GDEF_72(MUNOC_GPARA_1);
localparam  MUNOC_LPARA_2 = `GET_AXI_SIZE(MUNOC_GPARA_1);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_21, munoc_port_05;

input wire munoc_port_07;
input wire [`MUNOC_GDEF_77-1:0] munoc_port_06;
input wire [MUNOC_GPARA_2-1:0] munoc_port_00;
input wire [`BW_AXI_ALEN-1:0] munoc_port_08;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_15;
input wire [`BW_AXI_ABURST-1:0] munoc_port_17;
output wire munoc_port_20;

input wire munoc_port_09;
input wire munoc_port_13;

output reg [`MUNOC_GDEF_90-1:0] munoc_port_11; 
output reg [`MUNOC_GDEF_12(MUNOC_GPARA_1)-1:0] munoc_port_03;
output reg [MUNOC_GPARA_2-1:0] munoc_port_18;
output reg [`BW_AXI_ALEN-1:0] munoc_port_01;
output reg [`BW_AXI_ASIZE-1:0] munoc_port_10;
output reg [`BW_AXI_ABURST-1:0] munoc_port_14;

output wire munoc_port_02;
output wire munoc_port_12;
input wire munoc_port_04;

output wire munoc_port_19;
output reg [`MUNOC_GDEF_37-1:0] munoc_port_16;

genvar i;
integer j,k;

localparam  MUNOC_LPARA_3 = 0;
localparam  MUNOC_LPARA_0 = 1;

wire munoc_signal_22;
wire munoc_signal_04;
wire munoc_signal_28;

reg munoc_signal_26;
reg [`BW_AXI_ABURST-1:0] munoc_signal_15;
reg [`BW_AXI_ALEN-1:0] munoc_signal_05;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_29, munoc_signal_10;

wire [`BW_AXI_ASIZE+1-1:0] munoc_signal_20; 
wire munoc_signal_07;

wire [`MUNOC_GDEF_90-1:0] munoc_signal_16;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_24;
wire [`MUNOC_GDEF_90-1:0] munoc_signal_06;

reg [`MUNOC_GDEF_90-1:0] munoc_signal_19; 
reg [`MUNOC_GDEF_90-1:0] munoc_signal_09;
wire [`MUNOC_GDEF_90-1:0] munoc_signal_14;
reg [`MUNOC_GDEF_12(MUNOC_GPARA_1)-1:0] munoc_signal_01, munoc_signal_27;
wire munoc_signal_17;

reg [MUNOC_GPARA_2-1:0] munoc_signal_25;
reg [MUNOC_GPARA_2-1:0] munoc_signal_23;
wire [MUNOC_GPARA_2-1:0] munoc_signal_18;
wire [MUNOC_GPARA_2-1:0] munoc_signal_21, munoc_signal_12;
reg [MUNOC_GPARA_2-1:0] munoc_signal_08;

reg [MUNOC_GPARA_2-1:0] munoc_signal_13;

wire [MUNOC_GPARA_2-1:0] munoc_signal_02;
wire [`BW_AXI_ASIZE+1-1:0] munoc_signal_00;
wire [MUNOC_GPARA_2-1:0] munoc_signal_11;
wire [MUNOC_GPARA_2-1:0] munoc_signal_03;

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_16 <= 0;
	else
		case(munoc_port_16)
			MUNOC_LPARA_3:
				if(munoc_port_02)
					munoc_port_16 <= MUNOC_LPARA_0;
			MUNOC_LPARA_0:
				if(munoc_signal_28)
					munoc_port_16 <= MUNOC_LPARA_3;
		endcase
end

assign munoc_port_02 = (munoc_port_16==MUNOC_LPARA_3) & munoc_port_07 & munoc_port_13;
assign munoc_port_12 = (munoc_port_16==MUNOC_LPARA_0);
assign munoc_port_19 = munoc_port_12 & munoc_port_04;
assign munoc_signal_28 = munoc_port_19 & munoc_signal_22;

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_11 <= 0;
	else if(munoc_port_02)
		munoc_port_11 <= munoc_signal_19;
end

assign munoc_signal_20 = $signed({1'b 0,munoc_port_15}) - $signed(MUNOC_LPARA_2);
assign munoc_signal_07 = ($signed(munoc_signal_20) < 0);

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(`MUNOC_GDEF_90),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
	.SIGNED_AMOUNT(0),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(1)
)
i_munoc_instance_1
(
	.data_input(munoc_signal_16),
	.shift_amount(munoc_signal_24),
	.data_output(munoc_signal_06)
);

assign munoc_signal_16 = $unsigned(munoc_port_08);
assign munoc_signal_24 = $unsigned(munoc_signal_20[`BW_AXI_ASIZE-1:0]);

always@(*)
begin
	munoc_signal_19 = munoc_port_08;
  if(munoc_signal_07)
		munoc_signal_19 = munoc_port_08;
	else
		munoc_signal_19 = munoc_signal_06;
end

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_10 <= 0;
	else if(munoc_port_02)
		munoc_port_10 <= munoc_signal_29;
end

RVX_MODULE_099
#(
	.RVX_GPARA_0(`BW_AXI_ASIZE),
	.RVX_GPARA_1(1),
	.SIGNED(0)
)
i_munoc_instance_3
(
	.rvx_port_0(munoc_port_15),
	.rvx_port_2(munoc_signal_10),
	.rvx_port_1(munoc_signal_29)
);

assign munoc_signal_10 = MUNOC_LPARA_2;

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_14 <= 0;
	else if(munoc_port_02)
		munoc_port_14 <= munoc_signal_15;
end

always@(*)
begin
	munoc_signal_15 = munoc_port_17;
	if(munoc_signal_26)
	begin
		munoc_signal_15 = `AXI_BURST_INCR;
	end
	else if(munoc_port_09&&(munoc_port_17==`AXI_BURST_FIXED))
		munoc_signal_15 = `AXI_BURST_INCR;
end

assign munoc_signal_17 = ($unsigned(munoc_signal_19) > (`MAX_BURST_LENGTH-1));

always@(*)
begin
	munoc_signal_26 = 0;
	if(munoc_port_17==`AXI_BURST_WRAP)
	begin
		if(munoc_signal_17)
			munoc_signal_26 = 1;
	end
end

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_01 <= 0;
	else if(munoc_port_02||munoc_port_19)
		munoc_port_01 <= munoc_signal_05;
end

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_03 <= 0;
	else if(munoc_port_02)
		munoc_port_03 <= munoc_signal_27;
end

always@(*)
begin
	munoc_signal_27 = 0;
	if(munoc_port_02)
	begin
		if(munoc_signal_26)
			munoc_signal_27 = $unsigned(munoc_signal_19[`MUNOC_GDEF_90-1:1]);
		else
			munoc_signal_27 = $unsigned(munoc_signal_19>>(LOG2RU(`MAX_BURST_LENGTH)));
	end
end

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_01 <= 0;
	else if(munoc_port_02)
		munoc_signal_01 <= munoc_signal_27;
	else if(munoc_port_19)
	begin
		if(!munoc_signal_22)
			munoc_signal_01 <= munoc_signal_01-1;
	end
end

assign munoc_signal_22 = (munoc_signal_01==0);
assign munoc_signal_04 = (munoc_signal_01==1);

always@(*)
begin
	munoc_signal_05 = `MAX_BURST_LENGTH-1;
	if(munoc_signal_26)
	begin
		munoc_signal_05 = 2-1;
	end
	else if(munoc_port_02)
	begin
		if(munoc_signal_17)
			munoc_signal_05 = `MAX_BURST_LENGTH-1;
		else
			munoc_signal_05 = munoc_signal_19;
	end
	else
	begin
		if(munoc_signal_04)
			munoc_signal_05 = munoc_signal_14[LOG2RU(`MAX_BURST_LENGTH)-1:0];
		else
			munoc_signal_05 = `MAX_BURST_LENGTH-1;
	end
end

assign munoc_signal_14 = $unsigned(munoc_port_11) - $unsigned(munoc_signal_09); 

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_09 <= 0;
	else if(munoc_port_19)
	begin
		if(munoc_signal_22)
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
i_munoc_instance_2
(
	.data_input(munoc_signal_21),
	.shift_amount(munoc_port_15),
	.data_output(munoc_signal_12)
);

assign munoc_signal_21 = $unsigned(munoc_port_08);
assign munoc_signal_18 = (munoc_port_17==`AXI_BURST_WRAP)? munoc_signal_12 : $signed(-1);

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_23 <= $signed(-1);
	else if(munoc_port_02)
		munoc_signal_23 <= munoc_signal_18;
end

always@(*)
begin
	munoc_signal_13 = $unsigned(munoc_port_00);
	case(munoc_port_15)
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
	munoc_signal_08 = munoc_port_18 + munoc_signal_25;
	munoc_signal_08 = (munoc_port_18 & (~munoc_signal_23) ) | (munoc_signal_08 & munoc_signal_23);
end

always@(posedge munoc_port_21, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
	begin
		munoc_port_18 <= 0;
		munoc_signal_25 <= 0;
	end
	else if(munoc_port_02)
	begin
		munoc_port_18 <= munoc_signal_13;
		if(munoc_signal_26)
		begin
			munoc_signal_25 <= 2*`NUM_BYTE(MUNOC_GPARA_1);
		end
		else
			munoc_signal_25 <= munoc_signal_03;
	end
	else if(munoc_port_19)
		if(!munoc_signal_22)
			munoc_port_18 <= munoc_signal_08;
end

ERVP_BARREL_SHIFTER
#(
	.BW_DATA(MUNOC_GPARA_2),
	.BW_SHIFT_AMOUNT(`BW_AXI_ASIZE+1),
	.SIGNED_AMOUNT(1),
	.PLUS_TO_LEFT(1),
	.ARITHMETIC_SHIFT(0),
	.CIRCULAR_SHIFT(0),
	.LSB_FILL_VALUE(0)
)
i_munoc_instance_0
(
	.data_input(munoc_signal_02),
	.shift_amount(munoc_signal_00),
	.data_output(munoc_signal_11)
);

assign munoc_signal_02 = $unsigned(`NUM_BYTE(MUNOC_GPARA_1)*`MAX_BURST_LENGTH);
assign munoc_signal_00 = $signed(munoc_signal_20);
assign munoc_signal_03 = munoc_signal_07? munoc_signal_11 : munoc_signal_02;

assign munoc_port_20 = munoc_signal_28;

endmodule
