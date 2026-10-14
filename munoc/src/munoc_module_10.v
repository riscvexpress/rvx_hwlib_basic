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





module MUNOC_MODULE_10
(
	munoc_port_13,
	munoc_port_20,

	munoc_port_16,
	munoc_port_12,
	munoc_port_17,
	munoc_port_07,
	munoc_port_09,
	munoc_port_11,	
	munoc_port_00,
	munoc_port_18,
	munoc_port_03,
	munoc_port_15,
	munoc_port_22,
	munoc_port_19,

	munoc_port_01,
	munoc_port_08,
	munoc_port_05,
	munoc_port_06,
	munoc_port_04,
	munoc_port_10,
	munoc_port_02,
	munoc_port_14,

	munoc_port_21
);





parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_3 = 1;

localparam  MUNOC_LPARA_2 = 1;
localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_51(MUNOC_GPARA_1);
localparam  MUNOC_LPARA_1 = MUNOC_GPARA_1;

input wire munoc_port_13, munoc_port_20;

input wire munoc_port_16;
input wire [`BW_ARCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_port_17;
output wire munoc_port_12;

input wire munoc_port_07;
input wire [`BW_AWCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_port_11;
output wire munoc_port_09;

input wire munoc_port_00;
input wire [`BW_WCHANNEL(0,MUNOC_GPARA_1)-1:0] munoc_port_03;
output wire munoc_port_18;

output wire [`BW_FNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_15;
input wire munoc_port_22;
input wire munoc_port_19;

output wire [MUNOC_GPARA_3-1:0] munoc_port_01;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_08;
output wire munoc_port_05;
input wire munoc_port_06;

output wire [MUNOC_GPARA_3-1:0] munoc_port_04;
output wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_10;
output wire munoc_port_02;
input wire munoc_port_14;

output reg [`MUNOC_GDEF_55-1:0] munoc_port_21;

genvar i;

wire [MUNOC_GPARA_3-1:0] munoc_signal_33;
wire [MUNOC_GPARA_4-1:0] munoc_signal_24;
wire [`BW_AXI_ALEN-1:0] munoc_signal_11;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_27;
wire [`BW_AXI_ABURST-1:0] munoc_signal_28;

wire [MUNOC_GPARA_3-1:0] munoc_signal_22;
wire [MUNOC_GPARA_4-1:0] munoc_signal_14;
wire [`BW_AXI_ALEN-1:0] munoc_signal_26;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_02;
wire [`BW_AXI_ABURST-1:0] munoc_signal_04;

wire [MUNOC_GPARA_1-1:0] munoc_signal_18;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_32;
wire munoc_signal_35;
wire [MUNOC_GPARA_1+`BW_AXI_WSTRB(MUNOC_GPARA_1)-1:0] munoc_signal_16;

wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_36;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_13;

reg munoc_signal_38, munoc_signal_12;
wire [`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_signal_19;

`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_4 1
`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_0 3
`define MUNOC_LDEF_1 4

wire munoc_signal_31;
wire munoc_signal_37;
wire munoc_signal_20;
wire munoc_signal_03;
wire munoc_signal_08;
wire munoc_signal_07;
reg munoc_signal_17;
reg munoc_signal_10;

wire [MUNOC_GPARA_4-1:0] munoc_signal_05;
wire [`BW_SLAVE_NODE_ID-1:0] munoc_signal_09;
reg [`BW_SLAVE_NODE_ID-1:0] munoc_signal_30;
wire [`MUNOC_GDEF_60-1:0] datatype = MUNOC_LPARA_0;
wire [`BW_MASTER_NODE_ID-1:0] source_node = MUNOC_GPARA_2;
wire [`MUNOC_GDEF_64-1:0] munoc_signal_06;
reg [`MUNOC_GDEF_47(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0 ] munoc_signal_01;
wire [`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_signal_25;

reg munoc_signal_23;
reg munoc_signal_21;
reg munoc_signal_00;
wire [MUNOC_GPARA_0-1:0] munoc_signal_29;

assign {munoc_signal_33,munoc_signal_24,munoc_signal_11,munoc_signal_27,munoc_signal_28} = munoc_port_17;
assign {munoc_signal_22,munoc_signal_14,munoc_signal_26,munoc_signal_02,munoc_signal_04} = munoc_port_11;
assign {munoc_signal_18,munoc_signal_32,munoc_signal_35} = munoc_port_03;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0))
)
i_munoc_instance_2
(
	.clk(munoc_port_13),
	.rstnn(munoc_port_20),
	.enable(1'b 1),
	.init(munoc_signal_38),
	.count(munoc_signal_12),
	.value(munoc_signal_19),
	.is_first_count(),
	.is_last_count()
);

always@(posedge munoc_port_13, negedge munoc_port_20)
begin
	if(munoc_port_20==0)
		munoc_port_21 <= `MUNOC_LDEF_3;
	else
		case(munoc_port_21)
			`MUNOC_LDEF_3:
				if(munoc_signal_31)
					munoc_port_21 <= `MUNOC_LDEF_4;
				else if(munoc_signal_37)
				begin
					if(MUNOC_LPARA_2)
						munoc_port_21 <= `MUNOC_LDEF_0;
					else
						munoc_port_21 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_4:
				if(munoc_signal_03)
					munoc_port_21 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_2:
				if(munoc_port_00)
					munoc_port_21 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_03)
					munoc_port_21 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_07)
					munoc_port_21 <= `MUNOC_LDEF_3;
		endcase
end

assign munoc_signal_31 = (munoc_port_21==`MUNOC_LDEF_3) & munoc_port_16;
assign munoc_signal_37 = (munoc_port_21==`MUNOC_LDEF_3) & munoc_port_07 & (~munoc_port_16);

assign munoc_port_01 = munoc_signal_33;
assign munoc_port_08 = munoc_signal_30;
assign munoc_port_05 = (munoc_port_21==`MUNOC_LDEF_4) & munoc_signal_03;

assign munoc_port_04 = munoc_signal_22;
assign munoc_port_10 = munoc_signal_30;
assign munoc_port_02 = (munoc_port_21==`MUNOC_LDEF_1) & munoc_signal_07;

assign munoc_signal_20 = munoc_port_22 & munoc_signal_23;
always@(*)
begin
	munoc_signal_17 = 0;
	case(munoc_port_21)
		`MUNOC_LDEF_4,
		`MUNOC_LDEF_0:
			if(`MUNOC_GDEF_59(MUNOC_GPARA_4,MUNOC_GPARA_0)==1)
				munoc_signal_17 = 1;
			else if(munoc_signal_19[`MUNOC_GDEF_59(MUNOC_GPARA_4,MUNOC_GPARA_0)-1])
				munoc_signal_17 = 1;
	endcase
end
assign munoc_signal_03 = munoc_signal_20 & munoc_signal_17;

always@(*)
begin
	munoc_signal_10 = 0;
	if(munoc_port_21==`MUNOC_LDEF_1)
	begin
		if(`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_0)==1)
			munoc_signal_10 = 1;
		else if(munoc_signal_19[`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_0)-1])
			munoc_signal_10 = 1;
	end
end

assign munoc_signal_08 = munoc_signal_20 & munoc_signal_10;
assign munoc_signal_07 = munoc_signal_08 & munoc_signal_35;

always@(*)
begin
	munoc_signal_38 = 0;
	munoc_signal_12 = 0;
	if(munoc_signal_20)
	begin
		case(munoc_port_21)
			`MUNOC_LDEF_4,
			`MUNOC_LDEF_0:
				if(`MUNOC_GDEF_59(MUNOC_GPARA_4,MUNOC_GPARA_0)==1)
					;
				else if(munoc_signal_17)
					munoc_signal_38 = 1;
				else
					munoc_signal_12 = 1;
			`MUNOC_LDEF_1:
				if(`MUNOC_GDEF_46(MUNOC_GPARA_1,MUNOC_GPARA_0)==1)
					;
				else if(munoc_signal_10)
					munoc_signal_38 = 1;
				else
					munoc_signal_12 = 1;
		endcase
	end
end

assign munoc_port_12 = (munoc_port_21==`MUNOC_LDEF_4) & munoc_signal_03;
assign munoc_port_09 = (munoc_port_21==`MUNOC_LDEF_1) & munoc_signal_07;
assign munoc_port_18 = munoc_signal_08;

MUNOC_MODULE_40
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(`BW_SLAVE_NODE_ID)
)
i_munoc_instance_0
(
	.addr(munoc_signal_05),
	.target_node(munoc_signal_09)
);

assign munoc_signal_05 = (munoc_signal_31)? munoc_signal_24 : munoc_signal_14;

always@(posedge munoc_port_13, negedge munoc_port_20)
begin
	if(munoc_port_20==0)
		munoc_signal_30 <= 0;
	else if(munoc_signal_31 || munoc_signal_37)
		munoc_signal_30 <= munoc_signal_09;
end

generate
	for(i=0; i<`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0); i=i+1)
	begin : i_gen_mux_select
		assign munoc_signal_25[i] = munoc_signal_19[`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1-i];
	end
endgenerate

assign munoc_signal_06 = (munoc_port_21==`MUNOC_LDEF_4)? $unsigned(`MUNOC_GDEF_25) : $unsigned(`MUNOC_GDEF_66);

generate
	for(i=0; i<`BW_AXI_WSTRB(MUNOC_GPARA_1); i=i+1)
	begin : i_pack_data_and_strb
		assign munoc_signal_16[MUNOC_GPARA_1+`BW_AXI_WSTRB(MUNOC_GPARA_1)-1-i*(`BW_BYTE+1)-:(`BW_BYTE+1)] = {munoc_signal_32[i],munoc_signal_18[(i+1)*`BW_BYTE-1-:`BW_BYTE]}; 
	end
endgenerate

assign munoc_signal_36 = $unsigned(munoc_signal_33);
assign munoc_signal_13 = $unsigned(munoc_signal_22);

always@(*)
begin
	munoc_signal_01 = 0;
	case(munoc_port_21)
		`MUNOC_LDEF_4:
			munoc_signal_01[`MUNOC_GDEF_47(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_88(MUNOC_GPARA_4)] = `MUNOC_GDEF_13(munoc_signal_30,munoc_signal_06,datatype,source_node,munoc_signal_36,munoc_signal_24,munoc_signal_11,munoc_signal_27,munoc_signal_28);
		`MUNOC_LDEF_0:
			munoc_signal_01[`MUNOC_GDEF_47(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_88(MUNOC_GPARA_4)] = `MUNOC_GDEF_13(munoc_signal_30,munoc_signal_06,datatype,source_node,munoc_signal_13,munoc_signal_14,munoc_signal_26,munoc_signal_02,munoc_signal_04);
		`MUNOC_LDEF_1:
			munoc_signal_01[`MUNOC_GDEF_47(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0)-1-:`MUNOC_GDEF_96(MUNOC_GPARA_1)] = `MUNOC_GDEF_57(munoc_signal_35,munoc_signal_16);
	endcase
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_0),
	.NUM_DATA(`MUNOC_GDEF_38(MUNOC_GPARA_4,MUNOC_GPARA_1,MUNOC_GPARA_0))
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_01),
	.select(munoc_signal_25),
	.data_output(munoc_signal_29)
);

always@(*)
begin
	munoc_signal_23 = 0;
	munoc_signal_21 = 0;
	munoc_signal_00 = 0;
	if(munoc_port_19==1)
		munoc_signal_23 = 0;
	else
		case(munoc_port_21)
			`MUNOC_LDEF_4:
			begin
				munoc_signal_23 = munoc_port_06;
				if(munoc_signal_17)
				begin
					munoc_signal_00 = 1;
					munoc_signal_21 = 1;
				end
			end
			`MUNOC_LDEF_0:
			begin
				munoc_signal_23 = munoc_port_14;
				if(munoc_signal_17)
					munoc_signal_00 = 1;
			end
			`MUNOC_LDEF_1:
			begin
				munoc_signal_23 = munoc_port_00;
				if(munoc_signal_10)
				begin
					munoc_signal_00 = 1;
					if(munoc_signal_35)
						munoc_signal_21 = 1;
				end
			end
		endcase
end

assign munoc_port_15 = {munoc_signal_23, munoc_signal_21, munoc_signal_00, munoc_signal_29};

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_4
endmodule
