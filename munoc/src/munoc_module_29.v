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

`include "ervp_axi_define.vh"
`include "munoc_include_10.vh"
`include "munoc_extended_config.vh"
`include "munoc_include_02.vh"
`include "munoc_control.vh"
`include "munoc_memorymap_offset.vh"





module MUNOC_MODULE_29
(
	munoc_port_07,
	munoc_port_01,

	munoc_port_11,
	munoc_port_05,
	munoc_port_06,
	munoc_port_03,

	munoc_port_13,
	munoc_port_08,
	munoc_port_12,
	munoc_port_09,
	munoc_port_04,
	munoc_port_00,	
	munoc_port_10,
	munoc_port_02,	
	munoc_port_14
);





parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_1 = 32;
parameter [MUNOC_GPARA_0-1:0] NOC_CONTROLLER_BASEADDR = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_3 = 8;
localparam  MUNOC_LPARA_4 = 1+1+MUNOC_GPARA_0+`BW_MASTER_NODE_ID;
localparam  MUNOC_LPARA_0 = 8;
localparam  MUNOC_LPARA_2 = 8;
localparam  MUNOC_LPARA_1 = MUNOC_GPARA_1;

input wire munoc_port_07, munoc_port_01;

output wire [`BW_SVRING_LINK-1:0] munoc_port_11;
input wire munoc_port_05;
input wire [`BW_SVRING_LINK-1:0] munoc_port_06;
output wire munoc_port_03;

input wire munoc_port_13;
input wire [MUNOC_GPARA_0-1:0] munoc_port_08;
input wire munoc_port_12;
input wire [MUNOC_GPARA_1-1:0] munoc_port_09;
output wire munoc_port_04;
output wire [MUNOC_GPARA_1-1:0] munoc_port_00;
output reg munoc_port_10;
input wire munoc_port_02;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_14;

genvar i;
integer j;

wire [MUNOC_GPARA_0-1:0] munoc_signal_23;

`define MUNOC_LDEF_5 3
`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_3 3
`define MUNOC_LDEF_4 4

reg [`MUNOC_LDEF_5-1:0] munoc_signal_16;
reg munoc_signal_25;
wire munoc_signal_10;
wire munoc_signal_28;
wire munoc_signal_08;

wire [`BW_SEL_MUNOC_SUBMODULE-1:0] munoc_signal_37;
wire [`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_14;
wire [MUNOC_GPARA_1-1:0] munoc_signal_22 [`NUM_MUNOC_SUBMODULE-1:0];
wire [MUNOC_GPARA_1*`NUM_MUNOC_SUBMODULE-1:0] munoc_signal_39;

wire [`BW_MMAP_OFFSET_MUNOC-`BW_SEL_MUNOC_SUBMODULE-2-1:0] munoc_signal_02;
wire [16-1:0] munoc_signal_30;

wire [`BW_MMAP_SUBOFFSET_INFO-1:0] munoc_signal_06;
reg [MUNOC_GPARA_1-1:0] munoc_signal_13;
wire [`MUNOC_GDEF_27-1:0] munoc_signal_32;
wire [MUNOC_GPARA_1-1:0] munoc_signal_09;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_27/MUNOC_GPARA_1)-1:0] munoc_signal_11;
wire [`MUNOC_GDEF_44-1:0] munoc_signal_19;
wire [MUNOC_GPARA_1-1:0] munoc_signal_00;
wire [REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_44/MUNOC_GPARA_1)-1:0] munoc_signal_15;

`ifdef __MUNOC_INCLUDE_CONTROLLER
wire munoc_signal_26;
wire [`MUNOC_GDEF_07-1:0] munoc_signal_27;
wire [`MUNOC_GDEF_36-1:0] munoc_signal_01;
wire munoc_signal_24;
wire [`MUNOC_GDEF_95-1:0] munoc_signal_05;

wire [`MUNOC_GDEF_40-1:0] munoc_signal_34;
wire [`MUNOC_GDEF_68-1:0] munoc_signal_18;
wire [`MUNOC_GDEF_11-1:0] munoc_signal_36;
`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
wire [`BW_MMAP_SUBOFFSET_ELOG-1:0] munoc_signal_03;
reg [MUNOC_GPARA_1-1:0] munoc_signal_07;
wire munoc_signal_38;
wire [MUNOC_LPARA_4-1:0] munoc_signal_31;
wire munoc_signal_17;
wire [MUNOC_LPARA_0-1:0] munoc_signal_29;
wire [MUNOC_LPARA_4-1:0] munoc_signal_35;
wire [MUNOC_LPARA_2-1:0] munoc_signal_12;

wire munoc_signal_04;
wire munoc_signal_21;
wire [MUNOC_GPARA_0-1:0] munoc_signal_33;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_20;
`endif

assign munoc_signal_23 = NOC_CONTROLLER_BASEADDR;
assign {munoc_signal_30,munoc_signal_37,munoc_signal_02} = $unsigned(munoc_port_08[MUNOC_GPARA_0-1:2]);

generate
	for(i=0; i<`NUM_MUNOC_SUBMODULE; i=i+1)
	begin : i_gen_module
		assign munoc_signal_14[i] = (munoc_signal_37==i);
		assign munoc_signal_39[MUNOC_GPARA_1*(i+1)-1-:MUNOC_GPARA_1] = munoc_signal_22[i];
	end
endgenerate

always@(posedge munoc_port_07, negedge munoc_port_01)
begin
	if(munoc_port_01==0)
		munoc_signal_16 <= `MUNOC_LDEF_2;
	else
		case(munoc_signal_16)
			`MUNOC_LDEF_2:
				if(munoc_port_13)
				begin
					if(munoc_signal_25)
						munoc_signal_16 <= `MUNOC_LDEF_4;
					else if(munoc_signal_10)
						munoc_signal_16 <= `MUNOC_LDEF_1;
					else if(munoc_signal_28)
						munoc_signal_16 <= `MUNOC_LDEF_0;
					else
						munoc_signal_16 <= `MUNOC_LDEF_4;
				end
			`MUNOC_LDEF_1:
				munoc_signal_16 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_0:
				munoc_signal_16 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_3:
				if(munoc_signal_08)
					munoc_signal_16 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_4:
				munoc_signal_16 <= `MUNOC_LDEF_2;
		endcase
end

always@(*)
begin
	munoc_signal_25 = 0;
	if((munoc_signal_16==`MUNOC_LDEF_2)&&(munoc_port_02==0)&&munoc_port_13)
	begin
		if(munoc_port_08[MUNOC_GPARA_0-1-:MUNOC_LPARA_3]!=NOC_CONTROLLER_BASEADDR[MUNOC_GPARA_0-1-:MUNOC_LPARA_3])
			munoc_signal_25 = 1;
		else if((munoc_signal_10==0) && (munoc_signal_28==0))
			munoc_signal_25 = 1;
	end
end

`ifdef SIM_ENV
`ifndef IGNORE_UNMAPPED_ADDR
	always@(*)
	begin
		if(munoc_signal_25==1)
			$display("\n\n[NoC:WARNING] unmapped address 0x%x, from master %2d, @%d ns", munoc_port_08, munoc_port_14, $time);
	end
`endif
`endif

assign munoc_signal_10 = munoc_signal_14[`SUBMODULE_INDEX_MUNOC_INFO] | munoc_signal_14[`SUBMODULE_INDEX_MUNOC_ELOG];
assign munoc_signal_28 = munoc_signal_14[`SUBMODULE_INDEX_MUNOC_CONTROLLER];

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_08 = (munoc_signal_16==`MUNOC_LDEF_3) & munoc_signal_24;
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
	.data_input_list(munoc_signal_39),
	.select(munoc_signal_14),
	.data_output(munoc_port_00)
);

always@(posedge munoc_port_07, negedge munoc_port_01)
begin
	if(munoc_port_01==0)
		munoc_port_10 <= 0;
	else if((munoc_signal_16==`MUNOC_LDEF_2)&&munoc_port_13)
		munoc_port_10 <= munoc_signal_25;
end

assign munoc_port_04 = (munoc_signal_16==`MUNOC_LDEF_4);

assign munoc_signal_06 = $unsigned({munoc_signal_02,2'b 00});
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_INFO] = munoc_signal_13;

always@(*)
begin
	munoc_signal_13 = 0;
	case(munoc_signal_06)
		`MMAP_SUBOFFSET_INFO_VERSION0,
		`MMAP_SUBOFFSET_INFO_VERSION1,
		`MMAP_SUBOFFSET_INFO_VERSION2,
		`MMAP_SUBOFFSET_INFO_VERSION3:
			munoc_signal_13 = `CHANGE_ENDIAN32(munoc_signal_09);
		`MMAP_SUBOFFSET_INFO_CONFIG0,
		`MMAP_SUBOFFSET_INFO_CONFIG1:
			munoc_signal_13 = `CHANGE_ENDIAN32(munoc_signal_00);
		`MMAP_SUBOFFSET_INFO_NUM_MASTER: munoc_signal_13 = `NUM_MASTER;
		`MMAP_SUBOFFSET_INFO_NUM_SLAVE: munoc_signal_13 = `NUM_SLAVE;
		`MMAP_SUBOFFSET_INFO_SELF_ID: munoc_signal_13 = $unsigned(munoc_port_14);
	endcase
end

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_27/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_2
(
	.data_input_list(munoc_signal_32),
	.select(munoc_signal_11),
	.data_output(munoc_signal_09)
);

assign munoc_signal_32 = {`LONG_EMPTY_STRING,`MUNOC_GDEF_01,`END_OF_STRING};
assign munoc_signal_11 = $unsigned((munoc_signal_02 - (`MMAP_SUBOFFSET_INFO_VERSION0>>2)) / (`MUNOC_ADDR_INTERVAL>>2));

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "U";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(0*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_CONTROLLER
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "C";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(1*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "T";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(2*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "R";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(3*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "V";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(4*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "B";
`else
	assign munoc_signal_19[`MUNOC_GDEF_44-1-(5*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = "/";
`endif

assign munoc_signal_19[`MUNOC_GDEF_44-1-(6*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;
assign munoc_signal_19[`MUNOC_GDEF_44-1-(7*`BITS_PER_CHAR) -:`BITS_PER_CHAR] = 0;

ERVP_MUX
#(
	.BW_DATA(MUNOC_GPARA_1),
	.NUM_DATA(`MUNOC_GDEF_44/MUNOC_GPARA_1),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_19),
	.select(munoc_signal_15),
	.data_output(munoc_signal_00)
);

assign munoc_signal_15 = $unsigned((munoc_signal_02 - (`MMAP_SUBOFFSET_INFO_CONFIG0>>2)) / (`MUNOC_ADDR_INTERVAL>>2));

`ifdef __MUNOC_INCLUDE_CONTROLLER
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = $unsigned(munoc_signal_05);

RVX_MODULE_123
#(
	.RVX_GPARA_1(`MUNOC_GDEF_96),
	.RVX_GPARA_0(`BW_SVRING_LINK),
	.RVX_GPARA_3(`MUNOC_GDEF_07),
	.RVX_GPARA_2(`MUNOC_GDEF_36),
	.RVX_GPARA_4(`MUNOC_GDEF_95)
)
i_munoc_instance_3
(
	.rvx_port_04(munoc_port_07),
	.rvx_port_08(munoc_port_01),
	.rvx_port_03(munoc_signal_26),
	.rvx_port_06(munoc_signal_27),
	.rvx_port_01(munoc_signal_01),
	.rvx_port_07(munoc_signal_24),
	.rvx_port_09(munoc_signal_05),
	.rvx_port_05(munoc_port_11),
	.rvx_port_10(munoc_port_05),
	.rvx_port_00(munoc_port_06),
	.rvx_port_02(munoc_port_03)
);

assign munoc_signal_26 = (munoc_signal_16==`MUNOC_LDEF_0);
assign munoc_signal_27 = $unsigned(munoc_signal_30);
assign munoc_signal_01 = {munoc_signal_34,munoc_signal_18,munoc_signal_36};
assign munoc_signal_34 = munoc_port_12;
assign munoc_signal_18 = $unsigned(munoc_port_08[`BW_MMAP_SUBOFFSET_CONTROLLER-1:2]);
assign munoc_signal_36 = $unsigned(munoc_port_09);
`else
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_CONTROLLER] = 0;
assign munoc_port_03 = 0;
assign munoc_port_11 = 0;

`endif

`ifdef __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG

assign munoc_signal_03 = $unsigned({munoc_signal_02,2'b 00});
assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_ELOG] = $unsigned(munoc_signal_07);

RVX_MODULE_017
#(
	.RVX_GPARA_2(MUNOC_LPARA_4),
	.RVX_GPARA_0(MUNOC_LPARA_0),
	.RVX_GPARA_1(0),
	.RVX_GPARA_3(MUNOC_LPARA_2)
)
i_munoc_instance_4
(
	.rvx_port_4(munoc_port_07),
	.rvx_port_1(munoc_port_01),
	.rvx_port_5(),
	.rvx_port_2(munoc_signal_38),
	.rvx_port_0(munoc_signal_31),
	.rvx_port_3(munoc_signal_17),
	.rvx_port_6(munoc_signal_29),
	.rvx_port_8(munoc_signal_35),
	.rvx_port_7(munoc_signal_12)
);

assign munoc_signal_38 = munoc_signal_25;
assign munoc_signal_31 = {1'b 1,munoc_port_12,munoc_port_08,munoc_port_14};
assign munoc_signal_29 = $unsigned(munoc_signal_30);
assign {munoc_signal_04,munoc_signal_21,munoc_signal_33,munoc_signal_20} = munoc_signal_35;

always@(*)
begin
	munoc_signal_07 = 0;
	case(munoc_signal_03)
		`MMAP_SUBOFFSET_ELOG_COUNT: munoc_signal_07 = munoc_signal_12;
		`MMAP_SUBOFFSET_ELOG_VALID: munoc_signal_07 = $unsigned(munoc_signal_04);
		`MMAP_SUBOFFSET_ELOG_RW: munoc_signal_07 = $unsigned(munoc_signal_21);
		`MMAP_SUBOFFSET_ELOG_ADDR: munoc_signal_07 = $unsigned(munoc_signal_33);
		`MMAP_SUBOFFSET_ELOG_MASTER: munoc_signal_07 = $unsigned(munoc_signal_20);
	endcase
end

`else

assign munoc_signal_22[`SUBMODULE_INDEX_MUNOC_ELOG] = 0;

`endif

`ifdef SIM_ENV
initial
begin
	$display("\n\n[NoC:INFO] %s is used ", `MUNOC_GDEF_01);
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

`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_5
endmodule
