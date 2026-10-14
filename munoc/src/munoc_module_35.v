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
`include "munoc_include_04.vh"
`include "munoc_control.vh"
`include "munoc_include_02.vh"
`include "munoc_memorymap_offset.vh"
`include "munoc_include_10.vh"
`include "munoc_include_00.vh"





module MUNOC_MODULE_35
(
	munoc_port_12,
	munoc_port_14,
	munoc_port_10,
	munoc_port_06,
	munoc_port_08,
	munoc_port_01,
	munoc_port_05,
	munoc_port_07,
	munoc_port_11,
	munoc_port_02,
	munoc_port_13,
	munoc_port_00,
	munoc_port_09,
	munoc_port_04,
	munoc_port_03
);





parameter MUNOC_GPARA_2 = "";
parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_1 = "NA";

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_0 = (`MUNOC_GDEF_58) + (MUNOC_GPARA_0<<`MUNOC_GDEF_70);

input wire munoc_port_12;
input wire munoc_port_14;
input wire [`MUNOC_GDEF_02-1:0] munoc_port_10;
input wire [`MUNOC_GDEF_49-1:0] munoc_port_06;
input wire munoc_port_08;
input wire [`MUNOC_GDEF_32-1:0] munoc_port_01;
input wire [`MUNOC_GDEF_32-1:0] munoc_port_05;
input wire [`MUNOC_GDEF_24-1:0] munoc_port_07;
input wire [`MUNOC_GDEF_78-1:0] munoc_port_11;
output reg munoc_port_02;
output reg munoc_port_13;

input wire [`BW_SVRING_LINK-1:0] munoc_port_00;
output wire munoc_port_09;
output wire [`BW_SVRING_LINK-1:0] munoc_port_04;
input wire munoc_port_03;

wire munoc_signal_09;
wire [`MUNOC_GDEF_39-1:0] munoc_signal_05;
wire munoc_signal_11;
wire [`MUNOC_GDEF_12-1:0] munoc_signal_15;
reg [`MUNOC_GDEF_12-1:0] munoc_signal_07;

wire [`MUNOC_GDEF_71-1:0] munoc_signal_14;
wire [`MUNOC_GDEF_35-1:0] munoc_signal_12;
wire [`MUNOC_GDEF_86-1:0] munoc_signal_00;

`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_5 0
`define MUNOC_LDEF_3 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_1 3

reg [`MUNOC_LDEF_2-1:0] munoc_signal_01;
wire munoc_signal_08;
wire munoc_signal_13;
wire munoc_signal_03;

`define MUNOC_LDEF_4 REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_92/`MUNOC_GDEF_12)

wire [`MUNOC_GDEF_92-1:0 ] munoc_signal_06;
wire [`MUNOC_GDEF_12-1:0] munoc_signal_04;
wire [`MUNOC_LDEF_4-1:0] munoc_signal_10;

wire [`MUNOC_GDEF_12-1:0] munoc_signal_02;

always@(posedge munoc_port_12, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_signal_01 <= `MUNOC_LDEF_5;
	else
	begin
		case(munoc_signal_01)
			`MUNOC_LDEF_5:
				if(munoc_signal_08)
				begin
					if(munoc_signal_14==`MUNOC_GDEF_29)
						munoc_signal_01 <= `MUNOC_LDEF_1;
					else if(munoc_signal_14==`MUNOC_GDEF_16)
						munoc_signal_01 <= `MUNOC_LDEF_3;
				end
			`MUNOC_LDEF_3:
				munoc_signal_01 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_0:
				munoc_signal_01 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_13)
					munoc_signal_01 <= `MUNOC_LDEF_5;
		endcase
	end
end

assign munoc_signal_08 = (munoc_signal_01==`MUNOC_LDEF_5) & munoc_signal_09;
assign munoc_signal_13 = (munoc_signal_01==`MUNOC_LDEF_1);
assign munoc_signal_03 = munoc_signal_13 & (munoc_signal_14==`MUNOC_GDEF_29);

RVX_MODULE_073
#(
	.RVX_GPARA_5(MUNOC_LPARA_0),
	.RVX_GPARA_1(`MUNOC_GDEF_61),
	.RVX_GPARA_4(`BW_SVRING_LINK),
	.RVX_GPARA_0(`MUNOC_GDEF_53),
	.RVX_GPARA_2(`MUNOC_GDEF_39),
	.RVX_GPARA_3(`MUNOC_GDEF_12)
)
i_munoc_instance_0
(
	.rvx_port_06(munoc_port_12),
	.rvx_port_00(munoc_port_14),
	.rvx_port_03(munoc_port_00),
	.rvx_port_07(munoc_port_09),
	.rvx_port_05(munoc_port_04),
	.rvx_port_09(munoc_port_03),	
	.rvx_port_04(munoc_signal_09),
	.rvx_port_08(munoc_signal_05),
	.rvx_port_02(munoc_signal_11),
	.rvx_port_01(munoc_signal_15)
);

assign {munoc_signal_14,munoc_signal_12,munoc_signal_00} = munoc_signal_05;
assign munoc_signal_11 = munoc_signal_13;

always@(*)
begin
	munoc_signal_07 = -1;
	case({munoc_signal_12,2'b 00})
		`MMAP_SUBOFFSET_CONTROLLER_IP_TIMEOUT:
			munoc_signal_07 = $unsigned(munoc_port_01);
		`MMAP_SUBOFFSET_CONTROLLER_NOC_TIMEOUT:
			munoc_signal_07 = $unsigned(munoc_port_05);
		`MMAP_SUBOFFSET_CONTROLLER_FNI_STATE:
			munoc_signal_07 = $unsigned(munoc_port_10);
		`MMAP_SUBOFFSET_CONTROLLER_BNI_STATE:
			munoc_signal_07 = $unsigned(munoc_port_06);
		`MMAP_SUBOFFSET_CONTROLLER_ROUTING_ERROR:
			munoc_signal_07 = $unsigned(munoc_port_08);
		`MMAP_SUBOFFSET_CONTROLLER_BANDWIDTH:
			munoc_signal_07 = $unsigned(munoc_port_07);
		`MMAP_SUBOFFSET_CONTROLLER_NAME0,
		`MMAP_SUBOFFSET_CONTROLLER_NAME1,
		`MMAP_SUBOFFSET_CONTROLLER_NAME2,
		`MMAP_SUBOFFSET_CONTROLLER_NAME3,
		`MMAP_SUBOFFSET_CONTROLLER_NAME4,
		`MMAP_SUBOFFSET_CONTROLLER_NAME5,
		`MMAP_SUBOFFSET_CONTROLLER_NAME6,
		`MMAP_SUBOFFSET_CONTROLLER_NAME7:
			munoc_signal_07 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_04));
		`MMAP_SUBOFFSET_CONTROLLER_NODEID:
			munoc_signal_07 = MUNOC_GPARA_0;
		`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
			munoc_signal_07 = $unsigned(munoc_port_02);
		`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
			munoc_signal_07 = $unsigned(munoc_port_13);
		`MMAP_SUBOFFSET_CONTROLLER_TYPE0,
		`MMAP_SUBOFFSET_CONTROLLER_TYPE1:
			munoc_signal_07 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_02));
		`MMAP_SUBOFFSET_CONTROLLER_PROTOCOL_VIOLATION:
			if(MUNOC_GPARA_1=="AXI")
				munoc_signal_07 = $unsigned(munoc_port_11);
			else
				munoc_signal_07 = 0;
	endcase
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(`MUNOC_GDEF_12)
)
i_munoc_instance_2
(
	.clk(munoc_port_12),
	.rstnn(munoc_port_14),
	.enable(1'b 1),
	.asynch_value(munoc_signal_07),
	.synch_value(munoc_signal_15)
);

assign munoc_signal_06 = `FORMAT_STRING(MUNOC_GPARA_2);

ERVP_MUX
#(
	.BW_DATA(`MUNOC_GDEF_12),
	.NUM_DATA(`DIVIDERU(`MUNOC_GDEF_92,`MUNOC_GDEF_12)),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_1
(
	.data_input_list(munoc_signal_06),
	.select(munoc_signal_10),
	.data_output(munoc_signal_04)
);

assign munoc_signal_10 = $unsigned(munoc_signal_12);

assign munoc_signal_02 = `FORMAT_STRING(MUNOC_GPARA_1);

always@(posedge munoc_port_12, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
	begin
		munoc_port_02 <= 1;
	end
	else if(munoc_signal_03)
		case({munoc_signal_12,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
				munoc_port_02 <= 0;
		endcase
end

always@(posedge munoc_port_12, negedge munoc_port_14)
begin
	if(munoc_port_14==0)
		munoc_port_13 <= 0;
	else if(munoc_signal_03)
		case({munoc_signal_12,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
				munoc_port_13 <= munoc_signal_00;
		endcase
end

`ifdef SIM_ENV

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(*)
begin
	if(munoc_port_08!=0)
		$display("\n\n[ERROR@NoC] %s: Routing Error %d", MUNOC_GPARA_2, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
always@(*)
begin
	if(munoc_port_01!=0)
		$display("\n\n[Warning@NoC] %s: IP Timeout %x %d", MUNOC_GPARA_2, munoc_port_01, $time);
	if(munoc_port_05!=0)
		$display("\n\n[Warning@NoC] %s: NoC Timeout %x %d", MUNOC_GPARA_2, munoc_port_05, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
always@(*)
begin
	if(munoc_port_11!=0)
		$display("\n\n[ERROR@NoC] %s: AXI violation %x %d", MUNOC_GPARA_2, munoc_port_11, $time);
end
`endif

`endif

`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_0
endmodule
