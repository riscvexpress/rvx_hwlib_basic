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





module MUNOC_MODULE_15
(
	munoc_port_18,
	munoc_port_03,

	munoc_port_08,
	munoc_port_11,
	munoc_port_16,
	munoc_port_01,
	munoc_port_12,
	munoc_port_20,	
	munoc_port_06,
	munoc_port_10,
	munoc_port_22,
	munoc_port_04,
	munoc_port_07,
	munoc_port_02,

	munoc_port_00,
	munoc_port_14,
	munoc_port_13,
	munoc_port_19,
	munoc_port_09,
	munoc_port_15,
	munoc_port_05,
	munoc_port_17,

	munoc_port_21
);





parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_0 = 1;

localparam  MUNOC_LPARA_0 = 1;
localparam  MUNOC_LPARA_1 = `MUNOC_GDEF_25(MUNOC_GPARA_3);
localparam  MUNOC_LPARA_2 = MUNOC_GPARA_3;

input wire munoc_port_18, munoc_port_03;

input wire munoc_port_08;
input wire [`BW_ARCHANNEL(MUNOC_GPARA_0,MUNOC_GPARA_4)-1:0] munoc_port_16;
output wire munoc_port_11;

input wire munoc_port_01;
input wire [`BW_AWCHANNEL(MUNOC_GPARA_0,MUNOC_GPARA_4)-1:0] munoc_port_20;
output wire munoc_port_12;

input wire munoc_port_06;
input wire [`BW_WCHANNEL(0,MUNOC_GPARA_3)-1:0] munoc_port_22;
output wire munoc_port_10;

output wire [`BW_FNI_LINK(MUNOC_GPARA_1)-1:0] munoc_port_04;
input wire munoc_port_07;
input wire munoc_port_02;

output wire [MUNOC_GPARA_0-1:0] munoc_port_00;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_14;
output wire munoc_port_13;
input wire munoc_port_19;

output wire [MUNOC_GPARA_0-1:0] munoc_port_09;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_15;
output wire munoc_port_05;
input wire munoc_port_17;

output reg [`MUNOC_GDEF_86-1:0] munoc_port_21;

genvar i;

wire [MUNOC_GPARA_0-1:0] munoc_signal_26;
wire [MUNOC_GPARA_4-1:0] munoc_signal_24;
wire [`BW_AXI_ALEN-1:0] munoc_signal_27;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_17;
wire [`BW_AXI_ABURST-1:0] munoc_signal_31;

wire [MUNOC_GPARA_0-1:0] munoc_signal_36;
wire [MUNOC_GPARA_4-1:0] munoc_signal_12;
wire [`BW_AXI_ALEN-1:0] munoc_signal_30;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_04;
wire [`BW_AXI_ABURST-1:0] munoc_signal_34;

wire [MUNOC_GPARA_3-1:0] munoc_signal_35;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_08;
wire munoc_signal_14;
wire [MUNOC_GPARA_3+`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_20;

wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_23;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_25;

reg munoc_signal_28, munoc_signal_16;
wire [`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1:0] munoc_signal_07;

`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_3 2
`define MUNOC_LDEF_0 3
`define MUNOC_LDEF_4 4

wire munoc_signal_13;
wire munoc_signal_06;
wire munoc_signal_02;
wire munoc_signal_09;
wire munoc_signal_33;
wire munoc_signal_32;
reg munoc_signal_01;
reg munoc_signal_10;

wire [MUNOC_GPARA_4-1:0] munoc_signal_15;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_21;
reg [`BW_SLAVE_NODE_ID-1:0] target_node;
wire [`MUNOC_GDEF_75-1:0] datatype = MUNOC_LPARA_1;
wire [`BW_MASTER_NODE_ID-1:0] source_node = MUNOC_GPARA_2;
wire [`MUNOC_GDEF_74-1:0] packet_type;
reg [`MUNOC_GDEF_44(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1:0 ] munoc_signal_03;
wire [`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1:0] munoc_signal_05;

reg munoc_signal_19;
reg munoc_signal_00;
reg munoc_signal_18;
wire [MUNOC_GPARA_1-1:0] munoc_signal_29;

assign {munoc_signal_26,munoc_signal_24,munoc_signal_27,munoc_signal_17,munoc_signal_31} = munoc_port_16;
assign {munoc_signal_36,munoc_signal_12,munoc_signal_30,munoc_signal_04,munoc_signal_34} = munoc_port_20;
assign {munoc_signal_35,munoc_signal_08,munoc_signal_14} = munoc_port_22;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1))
)
i_munoc_instance_2
(
	.clk(munoc_port_18),
	.rstnn(munoc_port_03),
	.enable(1'b 1),
	.init(munoc_signal_28),
	.count(munoc_signal_16),
	.value(munoc_signal_07),
	.is_first_count(),
	.is_last_count()
);

always@(posedge munoc_port_18, negedge munoc_port_03)
begin
	if(munoc_port_03==0)
		munoc_port_21 <= `MUNOC_LDEF_2;
	else
		case(munoc_port_21)
			`MUNOC_LDEF_2:
				if(munoc_signal_13)
					munoc_port_21 <= `MUNOC_LDEF_1;
				else if(munoc_signal_06)
				begin
					if(MUNOC_LPARA_0)
						munoc_port_21 <= `MUNOC_LDEF_0;
					else
						munoc_port_21 <= `MUNOC_LDEF_3;
				end
			`MUNOC_LDEF_1:
				if(munoc_signal_09)
					munoc_port_21 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_3:
				if(munoc_port_06)
					munoc_port_21 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_09)
					munoc_port_21 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_4:
				if(munoc_signal_32)
					munoc_port_21 <= `MUNOC_LDEF_2;
		endcase
end

assign munoc_signal_13 = (munoc_port_21==`MUNOC_LDEF_2) & munoc_port_08;
assign munoc_signal_06 = (munoc_port_21==`MUNOC_LDEF_2) & munoc_port_01 & (~munoc_port_08);

assign munoc_port_00 = munoc_signal_26;
assign munoc_port_14 = target_node;
assign munoc_port_13 = (munoc_port_21==`MUNOC_LDEF_1) & munoc_signal_09;

assign munoc_port_09 = munoc_signal_36;
assign munoc_port_15 = target_node;
assign munoc_port_05 = (munoc_port_21==`MUNOC_LDEF_4) & munoc_signal_32;

assign munoc_signal_02 = munoc_port_07 & munoc_signal_19;
always@(*)
begin
	munoc_signal_01 = 0;
	case(munoc_port_21)
		`MUNOC_LDEF_1,
		`MUNOC_LDEF_0:
			if(`MUNOC_GDEF_78(MUNOC_GPARA_4,MUNOC_GPARA_1)==1)
				munoc_signal_01 = 1;
			else if(munoc_signal_07[`MUNOC_GDEF_78(MUNOC_GPARA_4,MUNOC_GPARA_1)-1])
				munoc_signal_01 = 1;
	endcase
end
assign munoc_signal_09 = munoc_signal_02 & munoc_signal_01;

always@(*)
begin
	munoc_signal_10 = 0;
	if(munoc_port_21==`MUNOC_LDEF_4)
	begin
		if(`MUNOC_GDEF_56(MUNOC_GPARA_3,MUNOC_GPARA_1)==1)
			munoc_signal_10 = 1;
		else if(munoc_signal_07[`MUNOC_GDEF_56(MUNOC_GPARA_3,MUNOC_GPARA_1)-1])
			munoc_signal_10 = 1;
	end
end

assign munoc_signal_33 = munoc_signal_02 & munoc_signal_10;
assign munoc_signal_32 = munoc_signal_33 & munoc_signal_14;

always@(*)
begin
	munoc_signal_28 = 0;
	munoc_signal_16 = 0;
	if(munoc_signal_02)
	begin
		case(munoc_port_21)
			`MUNOC_LDEF_1,
			`MUNOC_LDEF_0:
				if(`MUNOC_GDEF_78(MUNOC_GPARA_4,MUNOC_GPARA_1)==1)
					;
				else if(munoc_signal_01)
					munoc_signal_28 = 1;
				else
					munoc_signal_16 = 1;
			`MUNOC_LDEF_4:
				if(`MUNOC_GDEF_56(MUNOC_GPARA_3,MUNOC_GPARA_1)==1)
					;
				else if(munoc_signal_10)
					munoc_signal_28 = 1;
				else
					munoc_signal_16 = 1;
		endcase
	end
end

assign munoc_port_11 = (munoc_port_21==`MUNOC_LDEF_1) & munoc_signal_09;
assign munoc_port_12 = (munoc_port_21==`MUNOC_LDEF_4) & munoc_signal_32;
assign munoc_port_10 = munoc_signal_33;

MUNOC_MODULE_26
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_4),
	.MUNOC_GPARA_1(`BW_SLAVE_NODE_ID)
)
i_munoc_instance_0
(
	.addr(munoc_signal_15),
	.target_node(munoc_signal_21)
);

assign munoc_signal_15 = (munoc_signal_13)? munoc_signal_24 : munoc_signal_12;

always@(posedge munoc_port_18, negedge munoc_port_03)
begin
	if(munoc_port_03==0)
		target_node <= 0;
	else if(munoc_signal_13 || munoc_signal_06)
		target_node <= munoc_signal_21;
end

generate
	for(i=0; i<`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_05[i] = munoc_signal_07[`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1-i];
	end
endgenerate

assign packet_type = (munoc_port_21==`MUNOC_LDEF_1)? $unsigned(`MUNOC_GDEF_26) : $unsigned(`MUNOC_GDEF_92);

generate
	for(i=0; i<`BW_AXI_WSTRB(MUNOC_GPARA_3); i=i+1)
	begin : i_pack_data_and_strb
		assign munoc_signal_20[MUNOC_GPARA_3+`BW_AXI_WSTRB(MUNOC_GPARA_3)-1-i*(`BW_BYTE+1)-:(`BW_BYTE+1)] = {munoc_signal_08[i],munoc_signal_35[(i+1)*`BW_BYTE-1-:`BW_BYTE]}; 
	end
endgenerate

assign munoc_signal_23 = $unsigned(munoc_signal_26);
assign munoc_signal_25 = $unsigned(munoc_signal_36);

always@(*)
begin
	munoc_signal_03 = 0;
	case(munoc_port_21)
		`MUNOC_LDEF_1:
			munoc_signal_03[`MUNOC_GDEF_44(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_67(MUNOC_GPARA_4)] = `MUNOC_GDEF_95(target_node,packet_type,datatype,source_node,munoc_signal_23,munoc_signal_24,munoc_signal_27,munoc_signal_17,munoc_signal_31);
		`MUNOC_LDEF_0:
			munoc_signal_03[`MUNOC_GDEF_44(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_67(MUNOC_GPARA_4)] = `MUNOC_GDEF_95(target_node,packet_type,datatype,source_node,munoc_signal_25,munoc_signal_12,munoc_signal_30,munoc_signal_04,munoc_signal_34);
		`MUNOC_LDEF_4:
			munoc_signal_03[`MUNOC_GDEF_44(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1)-1-:`MUNOC_GDEF_54(MUNOC_GPARA_3)] = `MUNOC_GDEF_29(munoc_signal_14,munoc_signal_20);
	endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_24(MUNOC_GPARA_4,MUNOC_GPARA_3,MUNOC_GPARA_1))
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_03),
	.select(munoc_signal_05),
	.data_output(munoc_signal_29)
);

always@(*)
begin
	munoc_signal_19 = 0;
	munoc_signal_00 = 0;
	munoc_signal_18 = 0;
	if(munoc_port_02==1)
		munoc_signal_19 = 0;
	else
		case(munoc_port_21)
			`MUNOC_LDEF_1:
			begin
				munoc_signal_19 = munoc_port_19;
				if(munoc_signal_01)
				begin
					munoc_signal_18 = 1;
					munoc_signal_00 = 1;
				end
			end
			`MUNOC_LDEF_0:
			begin
				munoc_signal_19 = munoc_port_17;
				if(munoc_signal_01)
					munoc_signal_18 = 1;
			end
			`MUNOC_LDEF_4:
			begin
				munoc_signal_19 = munoc_port_06;
				if(munoc_signal_10)
				begin
					munoc_signal_18 = 1;
					if(munoc_signal_14)
						munoc_signal_00 = 1;
				end
			end
		endcase
end

assign munoc_port_04 = {munoc_signal_19, munoc_signal_00, munoc_signal_18, munoc_signal_29};

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_1
endmodule
