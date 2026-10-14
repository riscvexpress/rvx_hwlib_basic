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

`include "ervp_axi_define.vh"
`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "munoc_include_03.vh"
`include "munoc_control.vh"
`include "munoc_memorymap_offset.vh"





module MUNOC_MODULE_29
(
	munoc_port_09,
	munoc_port_13,

	munoc_port_01,
	munoc_port_12,
	munoc_port_14,
	munoc_port_08,

	munoc_port_10,
	munoc_port_11,
	munoc_port_02,
	munoc_port_06,
	munoc_port_05,
	munoc_port_03,	
	munoc_port_07,
	munoc_port_00,	
	munoc_port_04
);





parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_1 = 32;
parameter [MUNOC_GPARA_0-1:0] NOC_CONTROLLER_BASEADDR = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_1 = 8;
localparam  MUNOC_LPARA_4 = 1+1+MUNOC_GPARA_0+`BW_MASTER_NODE_ID;
localparam  MUNOC_LPARA_2 = 8;
localparam  MUNOC_LPARA_0 = 8;
localparam  MUNOC_LPARA_3 = MUNOC_GPARA_1;

input wire munoc_port_09, munoc_port_13;

output wire [`BW_SVRING_LINK-1:0] munoc_port_01;
input wire munoc_port_12;
input wire [`BW_SVRING_LINK-1:0] munoc_port_14;
output wire munoc_port_08;

input wire munoc_port_10;
input wire [MUNOC_GPARA_0-1:0] munoc_port_11;
input wire munoc_port_02;
input wire [MUNOC_GPARA_1-1:0] munoc_port_06;
output wire munoc_port_05;
output wire [MUNOC_GPARA_1-1:0] munoc_port_03;
output reg munoc_port_07;
input wire munoc_port_00;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_04;

genvar i;
integer j;

wire [MUNOC_GPARA_0-1:0] munoc_signal_12;

`define MUNOC_LDEF_5 3
`define MUNOC_LDEF_3 0
`define MUNOC_LDEF_4 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_1 3
`define MUNOC_LDEF_2 4

reg [`MUNOC_LDEF_5-1:0] munoc_signal_20;
reg munoc_signal_07;
wire munoc_signal_25;
wire munoc_signal_05;
wire munoc_signal_08;

wire [`BW_SEL_MUNOC_SUBMODULE-1:0] munoc_signal_27;
wire [`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_11;
wire [MUNOC_GPARA_1-1:0] munoc_signal_22 [`NUM_MUNOC_SUBMODULE-1:0];
wire [MUNOC_GPARA_1*`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_18;

wire [`BW_MMAP_OFFSET_MUNOC-`BW_SEL_MUNOC_SUBMODULE-2-1:0] munoc_signal_21;
wire [16-1:0] munoc_signal_30;

wire [`BW_MMAP_SUBOFFSET_INFO-1:0] munoc_signal_09;
reg [MUNOC_GPARA_1-1:0] munoc_signal_34;
wire [`MUNOC_GDEF_65-1:0] munoc_signal_16;
wire [MUNOC_GPARA_1-1:0] munoc_signal_10;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_65/MUNOC_GPARA_1)-1:0] munoc_signal_13;
wire [`MUNOC_GDEF_69-1:0] munoc_signal_02;
wire [MUNOC_GPARA_1-1:0] munoc_signal_14;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_69/MUNOC_GPARA_1)-1:0] munoc_signal_00;

`ifdef __MUNOC_INCLUDE_CONTROLLER
wire munoc_signal_01;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_03;
wire [`MUNOC_GDEF_39-1:0] munoc_signal_26;
wire munoc_signal_38;
wire [`MUNOC_GDEF_12-1:0] munoc_signal_04;

wire [`MUNOC_GDEF_71-1:0] munoc_signal_15;
wire [`MUNOC_GDEF_35-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_86-1:0] munoc_signal_37;
`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
wire [`BW_MMAP_SUBOFFSET_ELOG-1:0] munoc_signal_23;
reg [MUNOC_GPARA_1-1:0] munoc_signal_35;
wire munoc_signal_24;
wire [MUNOC_LPARA_4-1:0] munoc_signal_33;
wire munoc_signal_19;
wire [MUNOC_LPARA_2-1:0] munoc_signal_31;
wire [MUNOC_LPARA_4-1:0] munoc_signal_32;
wire [MUNOC_LPARA_0-1:0] munoc_signal_17;

wire munoc_signal_39;
wire munoc_signal_36;
wire [MUNOC_GPARA_0-1:0] munoc_signal_29;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_28;
`endif

assign munoc_signal_12 = NOC_CONTROLLER_BASEADDR;
assign {munoc_signal_30,munoc_signal_27,munoc_signal_21} = $unsigned(munoc_port_11[MUNOC_GPARA_0-1:2]);

generate
	for(i=0; i<`NUM_MUNOC_SUBMODULE; i=i+1)
	begin : i_gen_module
		assign munoc_signal_11[i] = (munoc_signal_27==i);
		assign munoc_signal_18[MUNOC_GPARA_1*(i+1)-1-:MUNOC_GPARA_1] = munoc_signal_22[i];
	end
endgenerate

always@(posedge munoc_port_09, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_20 <= `MUNOC_LDEF_3;
	else
		case(munoc_signal_20)
			`MUNOC_LDEF_3:
				if(munoc_port_10)
				begin
					if(munoc_signal_07)
						munoc_signal_20 <= `MUNOC_LDEF_2;
					else if(munoc_signal_25)
						munoc_signal_20 <= `MUNOC_LDEF_4;
					else if(munoc_signal_05)
						munoc_signal_20 <= `MUNOC_LDEF_0;
					else
						munoc_signal_20 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_4:
				munoc_signal_20 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_0:
				munoc_signal_20 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_08)
					munoc_signal_20 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				munoc_signal_20 <= `MUNOC_LDEF_3;
		endcase
end

always@(*)
begin
	munoc_signal_07 = 0;
	if((munoc_signal_20==`MUNOC_LDEF_3)&&(munoc_port_00==0)&&munoc_port_10)
	begin
		if(munoc_port_11[MUNOC_GPARA_0-1-:MUNOC_LPARA_1]!=NOC_CONTROLLER_BASEADDR[MUNOC_GPARA_0-1-:MUNOC_LPARA_1])
			munoc_signal_07 = 1;
		else if((munoc_signal_25==0) && (munoc_signal_05==0))
			munoc_signal_07 = 1;
	end
end

`ifdef SIM_ENV
`ifndef IGNORE_UNMAPPED_ADDR
	always@(*)
	begin
		if(munoc_signal_07==1)
			$display("\n\n[NoC:WARNING] unmapped address 0x%x, from master %2d, @%d ns", munoc_port_11, munoc_port_04, $time);
	end
`endif
`endif

assign munoc_signal_25 = munoc_signal_11[`SUBMODULE_INDEX_MUNOC_INFO] | munoc_signal_11[`SUBMODULE_INDEX_MUNOC_ELOG];
assign munoc_signal_05 = munoc_signal_11[`SUBMODULE_INDEX_MUNOC_CONTROLLER];

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_08 = (munoc_signal_20==`MUNOC_LDEF_1) & munoc_signal_38;
`else
assign munoc_signal_08 = 1;
`endif

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`NUM_MUNOC_SUBMODULE)
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_18),
	.select(munoc_signal_11),
	.data_output(munoc_port_03)
);

always@(posedge munoc_port_09, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_07 <= 0;
	else if((munoc_signal_20==`MUNOC_LDEF_3)&&munoc_port_10)
		munoc_port_07 <= munoc_signal_07;
end

assign munoc_port_05 = (munoc_signal_20==`MUNOC_LDEF_2);

assign munoc_signal_09 = $unsigned({munoc_signal_21,2'b 00});
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_INFO] = munoc_signal_34;

always@(*)
begin
	munoc_signal_34 = 0;
	case(munoc_signal_09)
		`MMAP_SUBOFFSET_INFO_VERSION0,
		`MMAP_SUBOFFSET_INFO_VERSION1,
		`MMAP_SUBOFFSET_INFO_VERSION2,
		`MMAP_SUBOFFSET_INFO_VERSION3:
			munoc_signal_34 = `CHANGE_ENDIAN32(munoc_signal_10);
		`MMAP_SUBOFFSET_INFO_CONFIG0,
		`MMAP_SUBOFFSET_INFO_CONFIG1:
			munoc_signal_34 = `CHANGE_ENDIAN32(munoc_signal_14);
		`MMAP_SUBOFFSET_INFO_NUM_MASTER: munoc_signal_34 = `NUM_MASTER;
		`MMAP_SUBOFFSET_INFO_NUM_SLAVE: munoc_signal_34 = `NUM_SLAVE;
		`MMAP_SUBOFFSET_INFO_SELF_ID: munoc_signal_34 = $unsigned(munoc_port_04);
	endcase
end

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_65/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_3
(
	.data_input_list(munoc_signal_16),
	.select(munoc_signal_13),
	.data_output(munoc_signal_10)
);

assign munoc_signal_16 = {`LONG_EMPTY_STRING,`MUNOC_GDEF_15,`END_OF_STRING};
assign munoc_signal_13 = $unsigned(munoc_signal_21 - (`MMAP_SUBOFFSET_INFO_VERSION0>>2));

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "U";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_CONTROLLER
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "C";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "T";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "R";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "V";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "B";
`else
	assign munoc_signal_02[`MUNOC_GDEF_69-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

assign munoc_signal_02[`MUNOC_GDEF_69-1-(6*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;
assign munoc_signal_02[`MUNOC_GDEF_69-1-(7*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_69/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_2
(
	.data_input_list(munoc_signal_02),
	.select(munoc_signal_00),
	.data_output(munoc_signal_14)
);

assign munoc_signal_00 = $unsigned(munoc_signal_21 - (`MMAP_SUBOFFSET_INFO_CONFIG0>>2));

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = $unsigned(munoc_signal_04);

RVX_MODULE_001
#(
	.RVX_GPARA_3(`MUNOC_GDEF_61),
	.RVX_GPARA_4(`BW_SVRING_LINK),
	.RVX_GPARA_1(`MUNOC_GDEF_53),
	.RVX_GPARA_2(`MUNOC_GDEF_39),
	.RVX_GPARA_0(`MUNOC_GDEF_12)
)
i_munoc_instance_1
(
	.rvx_port_09(munoc_port_09),
	.rvx_port_10(munoc_port_13),
	.rvx_port_04(munoc_signal_01),
	.rvx_port_02(munoc_signal_03),
	.rvx_port_00(munoc_signal_26),
	.rvx_port_03(munoc_signal_38),
	.rvx_port_08(munoc_signal_04),
	.rvx_port_01(munoc_port_01),
	.rvx_port_06(munoc_port_12),
	.rvx_port_05(munoc_port_14),
	.rvx_port_07(munoc_port_08)
);

assign munoc_signal_01 = (munoc_signal_20==`MUNOC_LDEF_0);
assign munoc_signal_03 = $unsigned(munoc_signal_30);
assign munoc_signal_26 = {munoc_signal_15,munoc_signal_06,munoc_signal_37};
assign munoc_signal_15 = munoc_port_02;
assign munoc_signal_06 = $unsigned(munoc_port_11[`BW_MMAP_SUBOFFSET_CONTROLLER-1:2]);
assign munoc_signal_37 = $unsigned(munoc_port_06);
`else
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = 0;
assign munoc_port_08 = 0;
assign munoc_port_01 = 0;

`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG

assign munoc_signal_23 = $unsigned({munoc_signal_21,2'b 00});
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_ELOG] = $unsigned(munoc_signal_35);

RVX_MODULE_116
#(
	.RVX_GPARA_2(MUNOC_LPARA_4),
	.RVX_GPARA_0(MUNOC_LPARA_2),
	.RVX_GPARA_3(0),
	.RVX_GPARA_1(MUNOC_LPARA_0)
)
i_munoc_instance_4
(
	.rvx_port_2(munoc_port_09),
	.rvx_port_5(munoc_port_13),
	.rvx_port_6(),
	.rvx_port_0(munoc_signal_24),
	.rvx_port_4(munoc_signal_33),
	.rvx_port_7(munoc_signal_19),
	.rvx_port_1(munoc_signal_31),
	.rvx_port_8(munoc_signal_32),
	.rvx_port_3(munoc_signal_17)
);

assign munoc_signal_24 = munoc_signal_07;
assign munoc_signal_33 = {1'b 1,munoc_port_02,munoc_port_11,munoc_port_04};
assign munoc_signal_31 = $unsigned(munoc_signal_30);
assign {munoc_signal_39,munoc_signal_36,munoc_signal_29,munoc_signal_28} = munoc_signal_32;

always@(*)
begin
	munoc_signal_35 = 0;
	case(munoc_signal_23)
		`MMAP_SUBOFFSET_ELOG_COUNT: munoc_signal_35 = munoc_signal_17;
		`MMAP_SUBOFFSET_ELOG_VALID: munoc_signal_35 = $unsigned(munoc_signal_39);
		`MMAP_SUBOFFSET_ELOG_RW: munoc_signal_35 = $unsigned(munoc_signal_36);
		`MMAP_SUBOFFSET_ELOG_ADDR: munoc_signal_35 = $unsigned(munoc_signal_29);
		`MMAP_SUBOFFSET_ELOG_MASTER: munoc_signal_35 = $unsigned(munoc_signal_28);
	endcase
end

`else

assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_ELOG] = 0;

`endif

`ifdef SIM_ENV
initial
begin
	$display("\n\n[NoC:INFO] %s is used ", `MUNOC_GDEF_15);
	`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
		$display("[NoC:INFO] monitoring routing error");
	`else
		$display("[NoC:INFO] NOT monitoring routing error");
	`endif
	`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
		$display("[NoC:INFO] monitoring undefined region access");
	`else
		$display("[NoC:INFO] NOT monitoring undefined region access");
	`endif
	`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
		$display("[NoC:INFO] monitoring transaction timeout");
	`else
		$display("[NoC:INFO] NOT monitoring transaction timeout");
	`endif
	`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR
		$display("[NoC:INFO] monitoring the bandwidth of IPs");
	`else
		$display("[NoC:INFO] NOT monitoring the bandwidth of IPs");
	`endif
	`ifdef __MUNOC_INCLUDE_AXI_CHECKER
		$display("[NoC:INFO] monitoring the correctness of AXI protocol");
	`else
		$display("[NoC:INFO] NOT monitoring the correctness of AXI protocol");
	`endif
	$display("\n");
end
`endif

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_5
endmodule
