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
`include "munoc_include_01.vh"





module MUNOC_MODULE_08
(
	munoc_port_08,
	munoc_port_05,
	munoc_port_07,
	munoc_port_03,
	munoc_port_12,
	munoc_port_11,
	munoc_port_00,
	munoc_port_04,
	munoc_port_09,
	munoc_port_15,
	munoc_port_06,
	munoc_port_10,
	munoc_port_13,
	munoc_port_14,
	munoc_port_02,
	munoc_port_01
);





parameter MUNOC_GPARA_5 = -1;
parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_2 = `BW_LONGEST_MASTER_DATA;

parameter MUNOC_GPARA_3 = 1;

input wire munoc_port_08, munoc_port_05;

input wire munoc_port_07;
output wire munoc_port_03;
input wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_12;

input wire munoc_port_11;
output wire munoc_port_00;
input wire [`MUNOC_GDEF_27-1:0] munoc_port_04;

input wire munoc_port_09;
output wire [`MUNOC_GDEF_60-1:0] munoc_port_15;
output wire munoc_port_06;
input wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_10;

output wire [`BW_BNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_13;
input wire munoc_port_14;
input wire munoc_port_02;

output reg [`MUNOC_GDEF_49-1:0] munoc_port_01;

genvar i;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_10;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_09;
wire [`BW_AXI_BRESP-1:0] munoc_signal_06;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_25;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_26;
wire [`MUNOC_GDEF_60-1:0] munoc_signal_15;

wire [MUNOC_GPARA_1-1:0] munoc_signal_13;
wire munoc_signal_29;
wire [`BW_AXI_RRESP-1:0] munoc_signal_01;
wire [MUNOC_GPARA_2-1:0] munoc_signal_19;
wire [MUNOC_GPARA_2-1:0] munoc_signal_31;

reg munoc_signal_23, munoc_signal_18;
wire [`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_signal_21;
wire [`MUNOC_GDEF_18(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1:0] munoc_signal_14;

`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_2 3

wire munoc_signal_05;
wire munoc_signal_16;
wire munoc_signal_22;
wire munoc_signal_02;
wire munoc_signal_20;
wire munoc_signal_07;
reg munoc_signal_08;
reg munoc_signal_12;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_27;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_24;
wire [`MUNOC_GDEF_52-1:0] munoc_signal_00;
reg [`MUNOC_GDEF_44(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_signal_04;
wire [`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0)-1:0] munoc_signal_28;

reg munoc_signal_03;
reg munoc_signal_17;
reg munoc_signal_11;
wire [MUNOC_GPARA_0-1:0] munoc_signal_30;

assign {munoc_signal_10,munoc_signal_09,munoc_signal_06} = munoc_port_12;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign {munoc_signal_25,munoc_signal_26} = munoc_port_04;
assign munoc_signal_15 = `MUNOC_GDEF_34;
`else
assign {munoc_signal_25,munoc_signal_26,munoc_signal_15} = munoc_port_04;
`endif
assign {munoc_signal_13,munoc_signal_29,munoc_signal_01,munoc_signal_19} = munoc_port_10;

assign {munoc_signal_27,munoc_signal_24} = (MUNOC_GPARA_3==1)? {munoc_signal_25,munoc_signal_26} : munoc_signal_13;

generate
	for(i=0; i<MUNOC_GPARA_2/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_signal_31[MUNOC_GPARA_2-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_19[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0))
)
i_munoc_instance_0
(
	.clk(munoc_port_08),
	.rstnn(munoc_port_05),
	.enable(1'b 1),
	.init(munoc_signal_23),
	.count(munoc_signal_18),
	.value(munoc_signal_21),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_14 = $unsigned(munoc_signal_21);

always@(posedge munoc_port_08, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_port_01 <= `MUNOC_LDEF_3;
	else
		case(munoc_port_01)
			`MUNOC_LDEF_3:
				if(munoc_signal_05)
					munoc_port_01 <= `MUNOC_LDEF_1;
				else if(munoc_signal_16)
					munoc_port_01 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_1:
				if(munoc_signal_02)
					munoc_port_01 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_0:
				if(munoc_signal_02)
					munoc_port_01 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_07)
					munoc_port_01 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_signal_22 = munoc_port_14 & munoc_signal_03;
assign munoc_signal_05 = munoc_port_07;
assign munoc_signal_16 = munoc_port_11 & munoc_port_09;

always@(*)
begin
	munoc_signal_08 = 0;
	case(munoc_port_01)
		`MUNOC_LDEF_1,
		`MUNOC_LDEF_0:
			if(`MUNOC_GDEF_97(MUNOC_GPARA_0)==1)
				munoc_signal_08 = 1;
			else if(munoc_signal_21[`MUNOC_GDEF_97(MUNOC_GPARA_0)-1])
				munoc_signal_08 = 1;
	endcase
end

assign munoc_signal_02 = munoc_signal_22 & munoc_signal_08;

always@(*)
begin
	munoc_signal_12 = 0;
	if(munoc_port_01==`MUNOC_LDEF_2)
	begin
		case(munoc_signal_15)
			`MUNOC_GDEF_34:
				munoc_signal_12 = munoc_signal_14[`MUNOC_GDEF_01(32,MUNOC_GPARA_0)-1];
			`MUNOC_GDEF_79:
				munoc_signal_12 = munoc_signal_14[`MUNOC_GDEF_01(64,MUNOC_GPARA_0)-1];
			`MUNOC_GDEF_95:
				munoc_signal_12 = munoc_signal_14[`MUNOC_GDEF_01(128,MUNOC_GPARA_0)-1];
		endcase
	end
end

assign munoc_signal_20 = munoc_signal_22 & munoc_signal_12;
assign munoc_signal_07 = munoc_signal_20 & munoc_signal_29;

always@(*)
begin
	munoc_signal_23 = 0;
	munoc_signal_18 = 0;
	if(munoc_signal_22)
	begin
		case(munoc_port_01)
			`MUNOC_LDEF_1,
			`MUNOC_LDEF_0:
				if(`MUNOC_GDEF_97(MUNOC_GPARA_0)==1)
					;
				else if(munoc_signal_08)
					munoc_signal_23 = 1;
				else
					munoc_signal_18 = 1;
			`MUNOC_LDEF_2:
				if(munoc_signal_12)
					munoc_signal_23 = 1;
				else
					munoc_signal_18 = 1;
		endcase
	end
end

assign munoc_port_03 = (munoc_port_01==`MUNOC_LDEF_1) & munoc_signal_02;
assign munoc_port_00 = munoc_signal_07;
assign munoc_port_15 = munoc_signal_15;
assign munoc_port_06 = munoc_signal_20;

assign munoc_signal_00 = (munoc_port_01==`MUNOC_LDEF_1)? `MUNOC_GDEF_26 : `MUNOC_GDEF_14;

always@(*)
begin
	munoc_signal_04 = 0;
	case(munoc_port_01)
		`MUNOC_LDEF_1:
			munoc_signal_04[`MUNOC_GDEF_44(MUNOC_GPARA_2,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_93] = `MUNOC_GDEF_09(munoc_signal_10,munoc_signal_00,munoc_signal_09,munoc_signal_06);
		`MUNOC_LDEF_0:
			munoc_signal_04[`MUNOC_GDEF_44(MUNOC_GPARA_2,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_68] = `MUNOC_GDEF_04(munoc_signal_27,munoc_signal_00,munoc_signal_24,munoc_signal_15);
		`MUNOC_LDEF_2:
			munoc_signal_04[`MUNOC_GDEF_44(MUNOC_GPARA_2,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_77(MUNOC_GPARA_2)] = `MUNOC_GDEF_11(munoc_signal_29,munoc_signal_01,munoc_signal_31);
	endcase
end

generate
	for(i=0; i<`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_28[i] = munoc_signal_21[`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0)-1-i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_0),
	.NUM_DATA(`MUNOC_GDEF_18(MUNOC_GPARA_2,MUNOC_GPARA_0))
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_04),
	.select(munoc_signal_28),
	.data_output(munoc_signal_30)
);

always@(*)
begin
	munoc_signal_03 = 0;
	munoc_signal_17 = 0;
	munoc_signal_11 = 0;
	if(munoc_port_02)
		munoc_signal_03 = 0;
	else
		case(munoc_port_01)
			`MUNOC_LDEF_1:
			begin
				munoc_signal_03 = 1;
				if(munoc_signal_08)
				begin
					munoc_signal_11 = 1;
					munoc_signal_17 = 1;
				end
			end
			`MUNOC_LDEF_0:
			begin
				munoc_signal_03 = munoc_port_09;
				if(munoc_signal_08)
					munoc_signal_11 = 1;
			end
			`MUNOC_LDEF_2:
			begin
				munoc_signal_03 = munoc_port_09;
				if(munoc_signal_12)
				begin
					munoc_signal_11 = 1;
					if(munoc_signal_29)
						munoc_signal_17 = 1;
				end
			end
		endcase
end

assign munoc_port_13 = {munoc_signal_03, munoc_signal_17, munoc_signal_11, munoc_signal_30};

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
endmodule
