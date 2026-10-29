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
`include "munoc_include_08.vh"





module MUNOC_MODULE_42
(
	munoc_port_00,
	munoc_port_13,
	munoc_port_04,
	munoc_port_03,
	munoc_port_08,
	munoc_port_14,
	munoc_port_12,
	munoc_port_10,
	munoc_port_06,
	munoc_port_15,
	munoc_port_11,
	munoc_port_01,
	munoc_port_02,
	munoc_port_05,
	munoc_port_09,
	munoc_port_07
);





parameter MUNOC_GPARA_1 = -1;
parameter MUNOC_GPARA_2 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_5 = `BW_LONGEST_MASTER_DATA;

parameter MUNOC_GPARA_3 = 1;

input wire munoc_port_00, munoc_port_13;

input wire munoc_port_04;
output wire munoc_port_03;
input wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_08;

input wire munoc_port_14;
output wire munoc_port_12;
input wire [`MUNOC_GDEF_91-1:0] munoc_port_10;

input wire munoc_port_06;
output wire [`MUNOC_GDEF_75-1:0] munoc_port_15;
output wire munoc_port_11;
input wire [`BW_RCHANNEL(MUNOC_GPARA_2,MUNOC_GPARA_5)-1:0] munoc_port_01;

output wire [`BW_BNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_02;
input wire munoc_port_05;
input wire munoc_port_09;

output reg [`MUNOC_GDEF_93-1:0] munoc_port_07;

genvar i;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_19;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_23;
wire [`BW_AXI_BRESP-1:0] munoc_signal_25;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_01;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_03;
wire [`MUNOC_GDEF_75-1:0] munoc_signal_26;

wire [MUNOC_GPARA_2-1:0] munoc_signal_07;
wire munoc_signal_14;
wire [`BW_AXI_RRESP-1:0] munoc_signal_22;
wire [MUNOC_GPARA_5-1:0] munoc_signal_04;
wire [MUNOC_GPARA_5-1:0] munoc_signal_16;

reg munoc_signal_11, munoc_signal_09;
wire [`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_41(`ULIMIT_OF_DATA_WIDTH,MUNOC_GPARA_0)-1:0] munoc_signal_06;

`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_2 1
`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_0 3

wire munoc_signal_21;
wire munoc_signal_10;
wire munoc_signal_15;
wire munoc_signal_20;
wire munoc_signal_12;
wire munoc_signal_17;
reg munoc_signal_27;
reg munoc_signal_18;

wire [`BW_MASTER_NODE_ID-1:0] source_node;
wire [`BW_LONGEST_AXI_TID-1:0] tid;
wire [`MUNOC_GDEF_00-1:0] packet_type;
reg [`MUNOC_GDEF_71(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_24;
wire [`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0)-1:0] munoc_signal_05;

reg munoc_signal_00;
reg munoc_signal_08;
reg munoc_signal_28;
wire [MUNOC_GPARA_0-1:0] munoc_signal_13;

assign {munoc_signal_19,munoc_signal_23,munoc_signal_25} = munoc_port_08;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign {munoc_signal_01,munoc_signal_03} = munoc_port_10;
assign munoc_signal_26 = `MUNOC_GDEF_37;
`else
assign {munoc_signal_01,munoc_signal_03,munoc_signal_26} = munoc_port_10;
`endif
assign {munoc_signal_07,munoc_signal_14,munoc_signal_22,munoc_signal_04} = munoc_port_01;

assign {source_node,tid} = (MUNOC_GPARA_3==1)? {munoc_signal_01,munoc_signal_03} : munoc_signal_07;

generate
	for(i=0; i<MUNOC_GPARA_5/`LLIMIT_OF_DATA_WIDTH; i=i+1)
	begin : i_reverse_rdata
		assign munoc_signal_16[MUNOC_GPARA_5-1-i*`LLIMIT_OF_DATA_WIDTH-:`LLIMIT_OF_DATA_WIDTH] = munoc_signal_04[(i+1)*`LLIMIT_OF_DATA_WIDTH-1-:`LLIMIT_OF_DATA_WIDTH];
	end
endgenerate

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0))
)
i_munoc_instance_1
(
	.clk(munoc_port_00),
	.rstnn(munoc_port_13),
	.enable(1'b 1),
	.init(munoc_signal_11),
	.count(munoc_signal_09),
	.value(munoc_signal_02),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_06 = $unsigned(munoc_signal_02);

always@(posedge munoc_port_00, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_07 <= `MUNOC_LDEF_3;
	else
		case(munoc_port_07)
			`MUNOC_LDEF_3:
				if(munoc_signal_21)
					munoc_port_07 <= `MUNOC_LDEF_2;
				else if(munoc_signal_10)
					munoc_port_07 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_2:
				if(munoc_signal_20)
					munoc_port_07 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_1:
				if(munoc_signal_20)
					munoc_port_07 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_17)
					munoc_port_07 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_signal_15 = munoc_port_05 & munoc_signal_00;
assign munoc_signal_21 = munoc_port_04;
assign munoc_signal_10 = munoc_port_14 & munoc_port_06;

always@(*)
begin
	munoc_signal_27 = 0;
	case(munoc_port_07)
		`MUNOC_LDEF_2,
		`MUNOC_LDEF_1:
			if(`MUNOC_GDEF_35(MUNOC_GPARA_0)==1)
				munoc_signal_27 = 1;
			else if(munoc_signal_02[`MUNOC_GDEF_35(MUNOC_GPARA_0)-1])
				munoc_signal_27 = 1;
	endcase
end

assign munoc_signal_20 = munoc_signal_15 & munoc_signal_27;

always@(*)
begin
	munoc_signal_18 = 0;
	if(munoc_port_07==`MUNOC_LDEF_0)
	begin
		case(munoc_signal_26)
			`MUNOC_GDEF_37:
				munoc_signal_18 = munoc_signal_06[`MUNOC_GDEF_23(32,MUNOC_GPARA_0)-1];
			`MUNOC_GDEF_83:
				munoc_signal_18 = munoc_signal_06[`MUNOC_GDEF_23(64,MUNOC_GPARA_0)-1];
			`MUNOC_GDEF_49:
				munoc_signal_18 = munoc_signal_06[`MUNOC_GDEF_23(128,MUNOC_GPARA_0)-1];
		endcase
	end
end

assign munoc_signal_12 = munoc_signal_15 & munoc_signal_18;
assign munoc_signal_17 = munoc_signal_12 & munoc_signal_14;

always@(*)
begin
	munoc_signal_11 = 0;
	munoc_signal_09 = 0;
	if(munoc_signal_15)
	begin
		case(munoc_port_07)
			`MUNOC_LDEF_2,
			`MUNOC_LDEF_1:
				if(`MUNOC_GDEF_35(MUNOC_GPARA_0)==1)
					;
				else if(munoc_signal_27)
					munoc_signal_11 = 1;
				else
					munoc_signal_09 = 1;
			`MUNOC_LDEF_0:
				if(munoc_signal_18)
					munoc_signal_11 = 1;
				else
					munoc_signal_09 = 1;
		endcase
	end
end

assign munoc_port_03 = (munoc_port_07==`MUNOC_LDEF_2) & munoc_signal_20;
assign munoc_port_12 = munoc_signal_17;
assign munoc_port_15 = munoc_signal_26;
assign munoc_port_11 = munoc_signal_12;

assign packet_type = (munoc_port_07==`MUNOC_LDEF_2)? `MUNOC_GDEF_64 : `MUNOC_GDEF_03;

always@(*)
begin
	munoc_signal_24 = 0;
	case(munoc_port_07)
		`MUNOC_LDEF_2:
			munoc_signal_24[`MUNOC_GDEF_71(MUNOC_GPARA_5,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_84] = `MUNOC_GDEF_33(munoc_signal_19,packet_type,munoc_signal_23,munoc_signal_25);
		`MUNOC_LDEF_1:
			munoc_signal_24[`MUNOC_GDEF_71(MUNOC_GPARA_5,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_21] = `MUNOC_GDEF_09(source_node,packet_type,tid,munoc_signal_26);
		`MUNOC_LDEF_0:
			munoc_signal_24[`MUNOC_GDEF_71(MUNOC_GPARA_5,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_59(MUNOC_GPARA_5)] = `MUNOC_GDEF_20(munoc_signal_14,munoc_signal_22,munoc_signal_16);
	endcase
end

generate
	for(i=0; i<`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_05[i] = munoc_signal_02[`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0)-1-i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_0),
	.NUM_DATA(`MUNOC_GDEF_41(MUNOC_GPARA_5,MUNOC_GPARA_0))
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_24),
	.select(munoc_signal_05),
	.data_output(munoc_signal_13)
);

always@(*)
begin
	munoc_signal_00 = 0;
	munoc_signal_08 = 0;
	munoc_signal_28 = 0;
	if(munoc_port_09)
		munoc_signal_00 = 0;
	else
		case(munoc_port_07)
			`MUNOC_LDEF_2:
			begin
				munoc_signal_00 = 1;
				if(munoc_signal_27)
				begin
					munoc_signal_28 = 1;
					munoc_signal_08 = 1;
				end
			end
			`MUNOC_LDEF_1:
			begin
				munoc_signal_00 = munoc_port_06;
				if(munoc_signal_27)
					munoc_signal_28 = 1;
			end
			`MUNOC_LDEF_0:
			begin
				munoc_signal_00 = munoc_port_06;
				if(munoc_signal_18)
				begin
					munoc_signal_28 = 1;
					if(munoc_signal_14)
						munoc_signal_08 = 1;
				end
			end
		endcase
end

assign munoc_port_02 = {munoc_signal_00, munoc_signal_08, munoc_signal_28, munoc_signal_13};

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
endmodule
