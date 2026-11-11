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
`include "munoc_include_06.vh"





module MUNOC_MODULE_30
(
	munoc_port_09,
	munoc_port_01,
	munoc_port_03,
	munoc_port_12,
	munoc_port_10,
	munoc_port_04,
	munoc_port_02,
	munoc_port_07,
	munoc_port_13,
	munoc_port_05,
	munoc_port_15,
	munoc_port_11,
	munoc_port_06,
	munoc_port_08,
	munoc_port_00,
	munoc_port_14
);





parameter MUNOC_GPARA_4 = -1;
parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_5 = `BW_LONGEST_MASTER_DATA;

parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_09, munoc_port_01;

input wire munoc_port_03;
output wire munoc_port_12;
input wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_10;

input wire munoc_port_04;
output wire munoc_port_02;
input wire [`MUNOC_GDEF_18-1:0] munoc_port_07;

input wire munoc_port_13;
output wire [`MUNOC_GDEF_77-1:0] munoc_port_05;
output wire munoc_port_15;
input wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_5)-1:0] munoc_port_11;

output wire [`BW_BNI_LINK(MUNOC_GPARA_2)-1:0] munoc_port_06;
input wire munoc_port_08;
input wire munoc_port_00;

output reg [`MUNOC_GDEF_84-1:0] munoc_port_14;

genvar i;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_21;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_05;
wire [`BW_AXI_BRESP-1:0] munoc_signal_10;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_23;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_26;
wire [`MUNOC_GDEF_77-1:0] munoc_signal_28;

wire [MUNOC_GPARA_1-1:0] munoc_signal_16;
wire munoc_signal_24;
wire [`BW_AXI_RRESP-1:0] munoc_signal_12;
wire [MUNOC_GPARA_5-1:0] munoc_signal_22;
wire [MUNOC_GPARA_5-1:0] munoc_signal_15;

reg munoc_signal_17, munoc_signal_00;
wire [`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2)-1:0] munoc_signal_20;
wire [`MUNOC_GDEF_67(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_2)-1:0] munoc_signal_01;

`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_2 3

wire munoc_signal_25;
wire munoc_signal_03;
wire munoc_signal_04;
wire munoc_signal_14;
wire munoc_signal_11;
wire munoc_signal_07;
reg munoc_signal_06;
reg munoc_signal_27;

wire [`BW_MASTER_NODE_ID-1:0] source_node;
wire [`BW_LONGEST_AXI_TID-1:0] tid;
wire [`MUNOC_GDEF_13-1:0] packet_type;
reg [`MUNOC_GDEF_52(MUNOC_GPARA_5,MUNOC_GPARA_2)-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2)-1:0] munoc_signal_09;

reg munoc_signal_13;
reg munoc_signal_18;
reg munoc_signal_08;
wire [MUNOC_GPARA_2-1:0] munoc_signal_19;

assign {munoc_signal_21,munoc_signal_05,munoc_signal_10} = munoc_port_10;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign {munoc_signal_23,munoc_signal_26} = munoc_port_07;
assign munoc_signal_28 = `MUNOC_GDEF_74;
`else
assign {munoc_signal_23,munoc_signal_26,munoc_signal_28} = munoc_port_07;
`endif
assign {munoc_signal_16,munoc_signal_24,munoc_signal_12,munoc_signal_22} = munoc_port_11;

assign {source_node,tid} = (MUNOC_GPARA_0==1)? {munoc_signal_23,munoc_signal_26} : munoc_signal_16;

generate
	for(i=0; i<MUNOC_GPARA_5/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_signal_15[MUNOC_GPARA_5-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_22[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2))
)
i_munoc_instance_1
(
	.clk(munoc_port_09),
	.rstnn(munoc_port_01),
	.enable(1'b 1),
	.init(munoc_signal_17),
	.count(munoc_signal_00),
	.value(munoc_signal_20),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_01 = $unsigned(munoc_signal_20);

always@(posedge munoc_port_09, negedge munoc_port_01)
begin
	if(munoc_port_01==0)
		munoc_port_14 <= `MUNOC_LDEF_3;
	else
		case(munoc_port_14)
			`MUNOC_LDEF_3:
				if(munoc_signal_25)
					munoc_port_14 <= `MUNOC_LDEF_0;
				else if(munoc_signal_03)
					munoc_port_14 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_0:
				if(munoc_signal_14)
					munoc_port_14 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_1:
				if(munoc_signal_14)
					munoc_port_14 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_07)
					munoc_port_14 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_signal_04 = munoc_port_08 & munoc_signal_13;
assign munoc_signal_25 = munoc_port_03;
assign munoc_signal_03 = munoc_port_04 & munoc_port_13;

always@(*)
begin
	munoc_signal_06 = 0;
	case(munoc_port_14)
		`MUNOC_LDEF_0,
		`MUNOC_LDEF_1:
			if(`MUNOC_GDEF_32(MUNOC_GPARA_2)==1)
				munoc_signal_06 = 1;
			else if(munoc_signal_20[`MUNOC_GDEF_32(MUNOC_GPARA_2)-1])
				munoc_signal_06 = 1;
	endcase
end

assign munoc_signal_14 = munoc_signal_04 & munoc_signal_06;

always@(*)
begin
	munoc_signal_27 = 0;
	if(munoc_port_14==`MUNOC_LDEF_2)
	begin
		case(munoc_signal_28)
			`MUNOC_GDEF_74:
				munoc_signal_27 = munoc_signal_01[`MUNOC_GDEF_30(32,MUNOC_GPARA_2)-1];
			`MUNOC_GDEF_03:
				munoc_signal_27 = munoc_signal_01[`MUNOC_GDEF_30(64,MUNOC_GPARA_2)-1];
			`MUNOC_GDEF_38:
				munoc_signal_27 = munoc_signal_01[`MUNOC_GDEF_30(128,MUNOC_GPARA_2)-1];
			`MUNOC_GDEF_33:
				munoc_signal_27 = munoc_signal_01[`MUNOC_GDEF_30(256,MUNOC_GPARA_2)-1];
			`MUNOC_GDEF_85:
				munoc_signal_27 = munoc_signal_01[`MUNOC_GDEF_30(512,MUNOC_GPARA_2)-1];
		endcase
	end
end

assign munoc_signal_11 = munoc_signal_04 & munoc_signal_27;
assign munoc_signal_07 = munoc_signal_11 & munoc_signal_24;

always@(*)
begin
	munoc_signal_17 = 0;
	munoc_signal_00 = 0;
	if(munoc_signal_04)
	begin
		case(munoc_port_14)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_1:
				if(`MUNOC_GDEF_32(MUNOC_GPARA_2)==1)
					;
				else if(munoc_signal_06)
					munoc_signal_17 = 1;
				else
					munoc_signal_00 = 1;
			`MUNOC_LDEF_2:
				if(munoc_signal_27)
					munoc_signal_17 = 1;
				else
					munoc_signal_00 = 1;
		endcase
	end
end

assign munoc_port_12 = (munoc_port_14==`MUNOC_LDEF_0) & munoc_signal_14;
assign munoc_port_02 = munoc_signal_07;
assign munoc_port_05 = munoc_signal_28;
assign munoc_port_15 = munoc_signal_11;

assign packet_type = (munoc_port_14==`MUNOC_LDEF_0)? `MUNOC_GDEF_80 : `MUNOC_GDEF_88;

always@(*)
begin
	munoc_signal_02 = 0;
	case(munoc_port_14)
		`MUNOC_LDEF_0:
			munoc_signal_02[`MUNOC_GDEF_52(MUNOC_GPARA_5,MUNOC_GPARA_2)-1-:`MUNOC_GDEF_60] = `MUNOC_GDEF_19(munoc_signal_21,packet_type,munoc_signal_05,munoc_signal_10);
		`MUNOC_LDEF_1:
			munoc_signal_02[`MUNOC_GDEF_52(MUNOC_GPARA_5,MUNOC_GPARA_2)-1-:`MUNOC_GDEF_83] = `MUNOC_GDEF_93(source_node,packet_type,tid,munoc_signal_28);
		`MUNOC_LDEF_2:
			munoc_signal_02[`MUNOC_GDEF_52(MUNOC_GPARA_5,MUNOC_GPARA_2)-1-:`MUNOC_GDEF_97(MUNOC_GPARA_5)] = `MUNOC_GDEF_56(munoc_signal_24,munoc_signal_12,munoc_signal_15);
	endcase
end

generate
	for(i=0; i<`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_09[i] = munoc_signal_20[`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2)-1-i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_2),
	.NUM_DATA(`MUNOC_GDEF_67(MUNOC_GPARA_5,MUNOC_GPARA_2))
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_02),
	.select(munoc_signal_09),
	.data_output(munoc_signal_19)
);

always@(*)
begin
	munoc_signal_13 = 0;
	munoc_signal_18 = 0;
	munoc_signal_08 = 0;
	if(munoc_port_00)
		munoc_signal_13 = 0;
	else
		case(munoc_port_14)
			`MUNOC_LDEF_0:
			begin
				munoc_signal_13 = 1;
				if(munoc_signal_06)
				begin
					munoc_signal_08 = 1;
					munoc_signal_18 = 1;
				end
			end
			`MUNOC_LDEF_1:
			begin
				munoc_signal_13 = munoc_port_13;
				if(munoc_signal_06)
					munoc_signal_08 = 1;
			end
			`MUNOC_LDEF_2:
			begin
				munoc_signal_13 = munoc_port_13;
				if(munoc_signal_27)
				begin
					munoc_signal_08 = 1;
					if(munoc_signal_24)
						munoc_signal_18 = 1;
				end
			end
		endcase
end

assign munoc_port_06 = {munoc_signal_13, munoc_signal_18, munoc_signal_08, munoc_signal_19};

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_2
endmodule
