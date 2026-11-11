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





module MUNOC_MODULE_26
(
	munoc_port_04,
	munoc_port_14,

	munoc_port_22,
	munoc_port_11,
	munoc_port_12,
	munoc_port_09,
	munoc_port_17,
	munoc_port_07,	
	munoc_port_19,
	munoc_port_02,
	munoc_port_15,
	munoc_port_01,
	munoc_port_08,
	munoc_port_06,

	munoc_port_00,
	munoc_port_21,
	munoc_port_16,
	munoc_port_18,
	munoc_port_13,
	munoc_port_10,
	munoc_port_05,
	munoc_port_03,

	munoc_port_20
);





parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_3 = 1;

localparam  MUNOC_LPARA_0 = 1;
localparam  MUNOC_LPARA_2 = `MUNOC_GDEF_72(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_1 = MUNOC_GPARA_0;

input wire munoc_port_04, munoc_port_14;

input wire munoc_port_22;
input wire [`BW_ARCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_port_12;
output wire munoc_port_11;

input wire munoc_port_09;
input wire [`BW_AWCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_port_07;
output wire munoc_port_17;

input wire munoc_port_19;
input wire [`BW_WCHANNEL(0,MUNOC_GPARA_0)-1:0] munoc_port_15;
output wire munoc_port_02;

output wire [`BW_FNI_LINK(MUNOC_GPARA_1)-1:0] munoc_port_01;
input wire munoc_port_08;
input wire munoc_port_06;

output wire [MUNOC_GPARA_3-1:0] munoc_port_00;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_21;
output wire munoc_port_16;
input wire munoc_port_18;

output wire [MUNOC_GPARA_3-1:0] munoc_port_13;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_10;
output wire munoc_port_05;
input wire munoc_port_03;

output reg [`MUNOC_GDEF_87-1:0] munoc_port_20;

genvar i;

wire [MUNOC_GPARA_3-1:0] munoc_signal_14;
wire [MUNOC_GPARA_4-1:0] munoc_signal_33;
wire [`BW_AXI_ALEN-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_08;
wire [`BW_AXI_ABURST-1:0] munoc_signal_17;

wire [MUNOC_GPARA_3-1:0] munoc_signal_23;
wire [MUNOC_GPARA_4-1:0] munoc_signal_20;
wire [`BW_AXI_ALEN-1:0] munoc_signal_15;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_00;
wire [`BW_AXI_ABURST-1:0] munoc_signal_36;

wire [MUNOC_GPARA_0-1:0] munoc_signal_07;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_29;
wire munoc_signal_22;
wire [MUNOC_GPARA_0+`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_signal_10;

wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_02;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_05;

reg munoc_signal_27, munoc_signal_28;
wire [`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1:0] munoc_signal_04;

`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_4 3
`define MUNOC_LDEF_0 4

wire munoc_signal_16;
wire munoc_signal_32;
wire munoc_signal_30;
wire munoc_signal_21;
wire munoc_signal_31;
wire munoc_signal_35;
reg munoc_signal_26;
reg munoc_signal_24;

wire [MUNOC_GPARA_4-1:0] munoc_signal_12;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_25;
reg [`BW_SLAVE_NODE_ID-1:0] target_node;
wire [`MUNOC_GDEF_77-1:0] datatype = MUNOC_LPARA_2;
wire [`BW_MASTER_NODE_ID-1:0] source_node = MUNOC_GPARA_2;
wire [`MUNOC_GDEF_16-1:0] packet_type;
reg [`MUNOC_GDEF_43(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1:0 ] munoc_signal_11;
wire [`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1:0] munoc_signal_06;

reg munoc_signal_03;
reg munoc_signal_13;
reg munoc_signal_09;
wire [MUNOC_GPARA_1-1:0] munoc_signal_18;

assign {munoc_signal_14,munoc_signal_33,munoc_signal_01,munoc_signal_08,munoc_signal_17} = munoc_port_12;
assign {munoc_signal_23,munoc_signal_20,munoc_signal_15,munoc_signal_00,munoc_signal_36} = munoc_port_07;
assign {munoc_signal_07,munoc_signal_29,munoc_signal_22} = munoc_port_15;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1))
)
i_munoc_instance_0
(
	.clk(munoc_port_04),
	.rstnn(munoc_port_14),
	.enable(1'b 1),
	.init(munoc_signal_27),
	.count(munoc_signal_28),
	.value(munoc_signal_04),
	.is_first_count(),
	.is_last_count()
);

always@(posedge munoc_port_04, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_port_20 <= `MUNOC_LDEF_3;
	else
		case(munoc_port_20)
			`MUNOC_LDEF_3:
				if(munoc_signal_16)
					munoc_port_20 <= `MUNOC_LDEF_1;
				else if(munoc_signal_32)
				begin
					if(MUNOC_LPARA_0)
						munoc_port_20 <= `MUNOC_LDEF_4;
					else
						munoc_port_20 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_1:
				if(munoc_signal_21)
					munoc_port_20 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_2:
				if(munoc_port_19)
					munoc_port_20 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_4:
				if(munoc_signal_21)
					munoc_port_20 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_35)
					munoc_port_20 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_signal_16 = (munoc_port_20==`MUNOC_LDEF_3) & munoc_port_22;
assign munoc_signal_32 = (munoc_port_20==`MUNOC_LDEF_3) & munoc_port_09 & (~munoc_port_22);

assign munoc_port_00 = munoc_signal_14;
assign munoc_port_21 = target_node;
assign munoc_port_16 = (munoc_port_20==`MUNOC_LDEF_1) & munoc_signal_21;

assign munoc_port_13 = munoc_signal_23;
assign munoc_port_10 = target_node;
assign munoc_port_05 = (munoc_port_20==`MUNOC_LDEF_0) & munoc_signal_35;

assign munoc_signal_30 = munoc_port_08 & munoc_signal_03;
always@(*)
begin
	munoc_signal_26 = 0;
	case(munoc_port_20)
		`MUNOC_LDEF_1,
		`MUNOC_LDEF_4:
			if(`MUNOC_GDEF_65(MUNOC_GPARA_4,MUNOC_GPARA_1)==1)
				munoc_signal_26 = 1;
			else if(munoc_signal_04[`MUNOC_GDEF_65(MUNOC_GPARA_4,MUNOC_GPARA_1)-1])
				munoc_signal_26 = 1;
	endcase
end
assign munoc_signal_21 = munoc_signal_30 & munoc_signal_26;

always@(*)
begin
	munoc_signal_24 = 0;
	if(munoc_port_20==`MUNOC_LDEF_0)
	begin
		if(`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)==1)
			munoc_signal_24 = 1;
		else if(munoc_signal_04[`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)-1])
			munoc_signal_24 = 1;
	end
end

assign munoc_signal_31 = munoc_signal_30 & munoc_signal_24;
assign munoc_signal_35 = munoc_signal_31 & munoc_signal_22;

always@(*)
begin
	munoc_signal_27 = 0;
	munoc_signal_28 = 0;
	if(munoc_signal_30)
	begin
		case(munoc_port_20)
			`MUNOC_LDEF_1,
			`MUNOC_LDEF_4:
				if(`MUNOC_GDEF_65(MUNOC_GPARA_4,MUNOC_GPARA_1)==1)
					;
				else if(munoc_signal_26)
					munoc_signal_27 = 1;
				else
					munoc_signal_28 = 1;
			`MUNOC_LDEF_0:
				if(`MUNOC_GDEF_47(MUNOC_GPARA_0,MUNOC_GPARA_1)==1)
					;
				else if(munoc_signal_24)
					munoc_signal_27 = 1;
				else
					munoc_signal_28 = 1;
		endcase
	end
end

assign munoc_port_11 = (munoc_port_20==`MUNOC_LDEF_1) & munoc_signal_21;
assign munoc_port_17 = (munoc_port_20==`MUNOC_LDEF_0) & munoc_signal_35;
assign munoc_port_02 = munoc_signal_31;

MUNOC_MODULE_07
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID)
)
i_munoc_instance_1
(
	.addr(munoc_signal_12),
	.target_node(munoc_signal_25)
);

assign munoc_signal_12 = (munoc_signal_16)? munoc_signal_33 : munoc_signal_20;

always@(posedge munoc_port_04, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		target_node <= 0;
	else if(munoc_signal_16 || munoc_signal_32)
		target_node <= munoc_signal_25;
end

generate
	for(i=0; i<`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_06[i] = munoc_signal_04[`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1-i];
	end
endgenerate

assign packet_type = (munoc_port_20==`MUNOC_LDEF_1)? $unsigned(`MUNOC_GDEF_26) : $unsigned(`MUNOC_GDEF_45);

generate
	for(i=0; i<`BW_AXI_WSTRB(MUNOC_GPARA_0); i=i+1)
	begin : i_pack_data_and_strb
		assign munoc_signal_10[MUNOC_GPARA_0+`BW_AXI_WSTRB(MUNOC_GPARA_0)-1-i*(`BW_BYTE+1)-:(`BW_BYTE+1)] = {munoc_signal_29[i],munoc_signal_07[(i+1)*`BW_BYTE-1-:`BW_BYTE]}; 
	end
endgenerate

assign munoc_signal_02 = $unsigned(munoc_signal_14);
assign munoc_signal_05 = $unsigned(munoc_signal_23);

always@(*)
begin
	munoc_signal_11 = 0;
	case(munoc_port_20)
		`MUNOC_LDEF_1:
			munoc_signal_11[`MUNOC_GDEF_43(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_58(MUNOC_GPARA_4)] = `MUNOC_GDEF_92(target_node,packet_type,datatype,source_node,munoc_signal_02,munoc_signal_33,munoc_signal_01,munoc_signal_08,munoc_signal_17);
		`MUNOC_LDEF_4:
			munoc_signal_11[`MUNOC_GDEF_43(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_58(MUNOC_GPARA_4)] = `MUNOC_GDEF_92(target_node,packet_type,datatype,source_node,munoc_signal_05,munoc_signal_20,munoc_signal_15,munoc_signal_00,munoc_signal_36);
		`MUNOC_LDEF_0:
			munoc_signal_11[`MUNOC_GDEF_43(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_53(MUNOC_GPARA_0)] = `MUNOC_GDEF_34(munoc_signal_22,munoc_signal_10);
	endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_17(MUNOC_GPARA_4,MUNOC_GPARA_0,MUNOC_GPARA_1))
)
i_munoc_instance_2
(
	.data_input_list(munoc_signal_11),
	.select(munoc_signal_06),
	.data_output(munoc_signal_18)
);

always@(*)
begin
	munoc_signal_03 = 0;
	munoc_signal_13 = 0;
	munoc_signal_09 = 0;
	if(munoc_port_06==1)
		munoc_signal_03 = 0;
	else
		case(munoc_port_20)
			`MUNOC_LDEF_1:
			begin
				munoc_signal_03 = munoc_port_18;
				if(munoc_signal_26)
				begin
					munoc_signal_09 = 1;
					munoc_signal_13 = 1;
				end
			end
			`MUNOC_LDEF_4:
			begin
				munoc_signal_03 = munoc_port_03;
				if(munoc_signal_26)
					munoc_signal_09 = 1;
			end
			`MUNOC_LDEF_0:
			begin
				munoc_signal_03 = munoc_port_19;
				if(munoc_signal_24)
				begin
					munoc_signal_09 = 1;
					if(munoc_signal_22)
						munoc_signal_13 = 1;
				end
			end
		endcase
end

assign munoc_port_01 = {munoc_signal_03, munoc_signal_13, munoc_signal_09, munoc_signal_18};

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule
