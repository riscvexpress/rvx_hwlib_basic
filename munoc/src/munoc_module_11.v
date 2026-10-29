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

`include "ervp_axi_define.vh"
`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "munoc_include_04.vh"
`include "munoc_control.vh"
`include "munoc_memorymap_offset.vh"





module MUNOC_MODULE_11
(
	munoc_port_05,
	munoc_port_13,

	munoc_port_00,
	munoc_port_11,
	munoc_port_04,
	munoc_port_01,

	munoc_port_09,
	munoc_port_07,
	munoc_port_06,
	munoc_port_02,
	munoc_port_14,
	munoc_port_12,	
	munoc_port_03,
	munoc_port_08,	
	munoc_port_10
);





parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_1 = 32;
parameter [MUNOC_GPARA_0-1:0] NOC_CONTROLLER_BASEADDR = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_2 = 8;
localparam  MUNOC_LPARA_3 = 1+1+MUNOC_GPARA_0+`BW_MASTER_NODE_ID;
localparam  MUNOC_LPARA_0 = 8;
localparam  MUNOC_LPARA_1 = 8;
localparam  MUNOC_LPARA_4 = MUNOC_GPARA_1;

input wire munoc_port_05, munoc_port_13;

output wire [`BW_SVRING_LINK-1:0] munoc_port_00;
input wire munoc_port_11;
input wire [`BW_SVRING_LINK-1:0] munoc_port_04;
output wire munoc_port_01;

input wire munoc_port_09;
input wire [MUNOC_GPARA_0-1:0] munoc_port_07;
input wire munoc_port_06;
input wire [MUNOC_GPARA_1-1:0] munoc_port_02;
output wire munoc_port_14;
output wire [MUNOC_GPARA_1-1:0] munoc_port_12;
output reg munoc_port_03;
input wire munoc_port_08;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_10;

genvar i;
integer j;

wire [MUNOC_GPARA_0-1:0] munoc_signal_26;

`define MUNOC_LDEF_4 3
`define MUNOC_LDEF_5 0
`define MUNOC_LDEF_3 1
`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_0 3
`define MUNOC_LDEF_1 4

reg [`MUNOC_LDEF_4-1:0] munoc_signal_14;
reg munoc_signal_15;
wire munoc_signal_27;
wire munoc_signal_07;
wire munoc_signal_13;

wire [`BW_SEL_MUNOC_SUBMODULE-1:0] munoc_signal_24;
wire [`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_19;
wire [MUNOC_GPARA_1-1:0] munoc_signal_01 [`NUM_MUNOC_SUBMODULE-1:0];
wire [MUNOC_GPARA_1*`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_28;

wire [`BW_MMAP_OFFSET_MUNOC-`BW_SEL_MUNOC_SUBMODULE-2-1:0] munoc_signal_11;
wire [16-1:0] munoc_signal_31;

wire [`BW_MMAP_SUBOFFSET_INFO-1:0] munoc_signal_09;
reg [MUNOC_GPARA_1-1:0] munoc_signal_03;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_36;
wire [MUNOC_GPARA_1-1:0] munoc_signal_12;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_53/MUNOC_GPARA_1)-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_39-1:0] munoc_signal_38;
wire [MUNOC_GPARA_1-1:0] munoc_signal_37;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_39/MUNOC_GPARA_1)-1:0] munoc_signal_30;

`ifdef __MUNOC_INCLUDE_CONTROLLER
wire munoc_signal_21;
wire [`MUNOC_GDEF_62-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_87-1:0] munoc_signal_35;
wire munoc_signal_04;
wire [`MUNOC_GDEF_82-1:0] munoc_signal_10;

wire [`MUNOC_GDEF_51-1:0] munoc_signal_05;
wire [`MUNOC_GDEF_07-1:0] munoc_signal_17;
wire [`MUNOC_GDEF_40-1:0] munoc_signal_32;
`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
wire [`BW_MMAP_SUBOFFSET_ELOG-1:0] munoc_signal_18;
reg [MUNOC_GPARA_1-1:0] munoc_signal_39;
wire munoc_signal_16;
wire [MUNOC_LPARA_3-1:0] munoc_signal_08;
wire munoc_signal_33;
wire [MUNOC_LPARA_0-1:0] munoc_signal_20;
wire [MUNOC_LPARA_3-1:0] munoc_signal_25;
wire [MUNOC_LPARA_1-1:0] munoc_signal_34;

wire munoc_signal_22;
wire munoc_signal_29;
wire [MUNOC_GPARA_0-1:0] munoc_signal_23;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_00;
`endif

assign munoc_signal_26 = NOC_CONTROLLER_BASEADDR;
assign {munoc_signal_31,munoc_signal_24,munoc_signal_11} = $unsigned(munoc_port_07[MUNOC_GPARA_0-1:2]);

generate
	for(i=0; i<`NUM_MUNOC_SUBMODULE; i=i+1)
	begin : i_gen_module
		assign munoc_signal_19[i] = (munoc_signal_24==i);
		assign munoc_signal_28[MUNOC_GPARA_1*(i+1)-1-:MUNOC_GPARA_1] = munoc_signal_01[i];
	end
endgenerate

always@(posedge munoc_port_05, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_14 <= `MUNOC_LDEF_5;
	else
		case(munoc_signal_14)
			`MUNOC_LDEF_5:
				if(munoc_port_09)
				begin
					if(munoc_signal_15)
						munoc_signal_14 <= `MUNOC_LDEF_1;
					else if(munoc_signal_27)
						munoc_signal_14 <= `MUNOC_LDEF_3;
					else if(munoc_signal_07)
						munoc_signal_14 <= `MUNOC_LDEF_2;
					else
						munoc_signal_14 <= `MUNOC_LDEF_1;
				end
			`MUNOC_LDEF_3:
				munoc_signal_14 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_2:
				munoc_signal_14 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				if(munoc_signal_13)
					munoc_signal_14 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				munoc_signal_14 <= `MUNOC_LDEF_5;
		endcase
end

always@(*)
begin
	munoc_signal_15 = 0;
	if((munoc_signal_14==`MUNOC_LDEF_5)&&(munoc_port_08==0)&&munoc_port_09)
	begin
		if(munoc_port_07[MUNOC_GPARA_0-1-:MUNOC_LPARA_2]!=NOC_CONTROLLER_BASEADDR[MUNOC_GPARA_0-1-:MUNOC_LPARA_2])
			munoc_signal_15 = 1;
		else if((munoc_signal_27==0) && (munoc_signal_07==0))
			munoc_signal_15 = 1;
	end
end

`ifdef SIM_ENV
`ifndef IGNORE_UNMAPPED_ADDR
	always@(*)
	begin
		if(munoc_signal_15==1)
			$display("\n\n[NoC:WARNING] unmapped address 0x%x, from master %2d, @%d ns", munoc_port_07, munoc_port_10, $time);
	end
`endif
`endif

assign munoc_signal_27 = munoc_signal_19[`SUBMODULE_INDEX_MUNOC_INFO] | munoc_signal_19[`SUBMODULE_INDEX_MUNOC_ELOG];
assign munoc_signal_07 = munoc_signal_19[`SUBMODULE_INDEX_MUNOC_CONTROLLER];

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_13 = (munoc_signal_14==`MUNOC_LDEF_0) & munoc_signal_04;
`else
assign munoc_signal_13 = 1;
`endif

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`NUM_MUNOC_SUBMODULE)
)
i_munoc_instance_4
(
	.data_input_list(munoc_signal_28),
	.select(munoc_signal_19),
	.data_output(munoc_port_12)
);

always@(posedge munoc_port_05, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_03 <= 0;
	else if((munoc_signal_14==`MUNOC_LDEF_5)&&munoc_port_09)
		munoc_port_03 <= munoc_signal_15;
end

assign munoc_port_14 = (munoc_signal_14==`MUNOC_LDEF_1);

assign munoc_signal_09 = $unsigned({munoc_signal_11,2'b 00});
assign munoc_signal_01[`SUBMODULE_INDEX_MUNOC_INFO] = munoc_signal_03;

always@(*)
begin
	munoc_signal_03 = 0;
	case(munoc_signal_09)
		`MMAP_SUBOFFSET_INFO_VERSION0,
		`MMAP_SUBOFFSET_INFO_VERSION1,
		`MMAP_SUBOFFSET_INFO_VERSION2,
		`MMAP_SUBOFFSET_INFO_VERSION3:
			munoc_signal_03 = `CHANGE_ENDIAN32(munoc_signal_12);
		`MMAP_SUBOFFSET_INFO_CONFIG0,
		`MMAP_SUBOFFSET_INFO_CONFIG1:
			munoc_signal_03 = `CHANGE_ENDIAN32(munoc_signal_37);
		`MMAP_SUBOFFSET_INFO_NUM_MASTER: munoc_signal_03 = `NUM_MASTER;
		`MMAP_SUBOFFSET_INFO_NUM_SLAVE: munoc_signal_03 = `NUM_SLAVE;
		`MMAP_SUBOFFSET_INFO_SELF_ID: munoc_signal_03 = $unsigned(munoc_port_10);
	endcase
end

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_53/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_2
(
	.data_input_list(munoc_signal_36),
	.select(munoc_signal_06),
	.data_output(munoc_signal_12)
);

assign munoc_signal_36 = {`LONG_EMPTY_STRING,`MUNOC_GDEF_85,`END_OF_STRING};
assign munoc_signal_06 = $unsigned(munoc_signal_11 - (`MMAP_SUBOFFSET_INFO_VERSION0>>2));

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "U";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_CONTROLLER
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "C";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "T";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "R";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "V";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "B";
`else
	assign munoc_signal_38[`MUNOC_GDEF_39-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

assign munoc_signal_38[`MUNOC_GDEF_39-1-(6*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;
assign munoc_signal_38[`MUNOC_GDEF_39-1-(7*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_39/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_38),
	.select(munoc_signal_30),
	.data_output(munoc_signal_37)
);

assign munoc_signal_30 = $unsigned(munoc_signal_11 - (`MMAP_SUBOFFSET_INFO_CONFIG0>>2));

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_01[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = $unsigned(munoc_signal_10);

RVX_MODULE_025
#(
	.RVX_GPARA_4(`MUNOC_GDEF_52),
	.RVX_GPARA_0(`BW_SVRING_LINK),
	.RVX_GPARA_3(`MUNOC_GDEF_62),
	.RVX_GPARA_2(`MUNOC_GDEF_87),
	.RVX_GPARA_1(`MUNOC_GDEF_82)
)
i_munoc_instance_0
(
	.rvx_port_10(munoc_port_05),
	.rvx_port_09(munoc_port_13),
	.rvx_port_05(munoc_signal_21),
	.rvx_port_03(munoc_signal_02),
	.rvx_port_02(munoc_signal_35),
	.rvx_port_06(munoc_signal_04),
	.rvx_port_07(munoc_signal_10),
	.rvx_port_04(munoc_port_00),
	.rvx_port_08(munoc_port_11),
	.rvx_port_01(munoc_port_04),
	.rvx_port_00(munoc_port_01)
);

assign munoc_signal_21 = (munoc_signal_14==`MUNOC_LDEF_2);
assign munoc_signal_02 = $unsigned(munoc_signal_31);
assign munoc_signal_35 = {munoc_signal_05,munoc_signal_17,munoc_signal_32};
assign munoc_signal_05 = munoc_port_06;
assign munoc_signal_17 = $unsigned(munoc_port_07[`BW_MMAP_SUBOFFSET_CONTROLLER-1:2]);
assign munoc_signal_32 = $unsigned(munoc_port_02);
`else
assign munoc_signal_01[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = 0;
assign munoc_port_01 = 0;
assign munoc_port_00 = 0;

`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG

assign munoc_signal_18 = $unsigned({munoc_signal_11,2'b 00});
assign munoc_signal_01[`SUBMODULE_INDEX_MUNOC_ELOG] = $unsigned(munoc_signal_39);

RVX_MODULE_024
#(
	.RVX_GPARA_1(MUNOC_LPARA_3),
	.RVX_GPARA_3(MUNOC_LPARA_0),
	.RVX_GPARA_0(0),
	.RVX_GPARA_2(MUNOC_LPARA_1)
)
i_munoc_instance_3
(
	.rvx_port_1(munoc_port_05),
	.rvx_port_4(munoc_port_13),
	.rvx_port_3(),
	.rvx_port_7(munoc_signal_16),
	.rvx_port_5(munoc_signal_08),
	.rvx_port_8(munoc_signal_33),
	.rvx_port_6(munoc_signal_20),
	.rvx_port_2(munoc_signal_25),
	.rvx_port_0(munoc_signal_34)
);

assign munoc_signal_16 = munoc_signal_15;
assign munoc_signal_08 = {1'b 1,munoc_port_06,munoc_port_07,munoc_port_10};
assign munoc_signal_20 = $unsigned(munoc_signal_31);
assign {munoc_signal_22,munoc_signal_29,munoc_signal_23,munoc_signal_00} = munoc_signal_25;

always@(*)
begin
	munoc_signal_39 = 0;
	case(munoc_signal_18)
		`MMAP_SUBOFFSET_ELOG_COUNT: munoc_signal_39 = munoc_signal_34;
		`MMAP_SUBOFFSET_ELOG_VALID: munoc_signal_39 = $unsigned(munoc_signal_22);
		`MMAP_SUBOFFSET_ELOG_RW: munoc_signal_39 = $unsigned(munoc_signal_29);
		`MMAP_SUBOFFSET_ELOG_ADDR: munoc_signal_39 = $unsigned(munoc_signal_23);
		`MMAP_SUBOFFSET_ELOG_MASTER: munoc_signal_39 = $unsigned(munoc_signal_00);
	endcase
end

`else

assign munoc_signal_01[`SUBMODULE_INDEX_MUNOC_ELOG] = 0;

`endif

`ifdef SIM_ENV
initial
begin
	$display("\n\n[NoC:INFO] %s is used ", `MUNOC_GDEF_85);
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

`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_4
endmodule
