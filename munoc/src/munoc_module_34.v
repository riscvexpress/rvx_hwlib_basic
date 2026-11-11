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
`include "munoc_include_08.vh"
`include "munoc_control.vh"
`include "munoc_include_09.vh"
`include "munoc_memorymap_offset.vh"
`include "munoc_include_00.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_34
(
	munoc_port_14,
	munoc_port_13,
	munoc_port_03,
	munoc_port_01,
	munoc_port_06,
	munoc_port_08,
	munoc_port_05,
	munoc_port_07,
	munoc_port_02,
	munoc_port_12,
	munoc_port_09,
	munoc_port_04,
	munoc_port_10,
	munoc_port_11,
	munoc_port_00
);





parameter MUNOC_GPARA_2 = "";
parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_1 = "NA";

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  MUNOC_LPARA_0 = (`MUNOC_GDEF_04) + (MUNOC_GPARA_0<<`MUNOC_GDEF_89);

input wire munoc_port_14;
input wire munoc_port_13;
input wire [`MUNOC_GDEF_87-1:0] munoc_port_03;
input wire [`MUNOC_GDEF_59-1:0] munoc_port_01;
input wire munoc_port_06;
input wire [`MUNOC_GDEF_64-1:0] munoc_port_08;
input wire [`MUNOC_GDEF_64-1:0] munoc_port_05;
input wire [`MUNOC_GDEF_00-1:0] munoc_port_07;
input wire [`MUNOC_GDEF_51-1:0] munoc_port_02;
output reg munoc_port_12;
output reg munoc_port_09;

input wire [`BW_SVRING_LINK-1:0] munoc_port_04;
output wire munoc_port_10;
output wire [`BW_SVRING_LINK-1:0] munoc_port_11;
input wire munoc_port_00;

wire munoc_signal_13;
wire [`MUNOC_GDEF_36-1:0] munoc_signal_00;
wire munoc_signal_07;
wire [`MUNOC_GDEF_95-1:0] munoc_signal_04;
reg [`MUNOC_GDEF_95-1:0] munoc_signal_09;

wire [`MUNOC_GDEF_40-1:0] munoc_signal_02;
wire [`MUNOC_GDEF_68-1:0] munoc_signal_06;
wire [`MUNOC_GDEF_11-1:0] munoc_signal_05;

`define MUNOC_LDEF_5 2
`define MUNOC_LDEF_4 0
`define MUNOC_LDEF_3 1
`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_2 3

reg [`MUNOC_LDEF_5-1:0] munoc_signal_10;
wire munoc_signal_15;
wire munoc_signal_03;
wire munoc_signal_08;

`define MUNOC_LDEF_0 REQUIRED_BITWIDTH_INDEX(`MUNOC_GDEF_41/`MUNOC_GDEF_95)

wire [`MUNOC_GDEF_41-1:0 ] munoc_signal_11;
wire [`MUNOC_GDEF_95-1:0] munoc_signal_01;
wire [`MUNOC_LDEF_0-1:0] munoc_signal_12;

wire [`MUNOC_GDEF_95-1:0] munoc_signal_14;

always@(posedge munoc_port_14, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_10 <= `MUNOC_LDEF_4;
	else
	begin
		case(munoc_signal_10)
			`MUNOC_LDEF_4:
				if(munoc_signal_15)
				begin
					if(munoc_signal_02==`MUNOC_GDEF_20)
						munoc_signal_10 <= `MUNOC_LDEF_2;
					else if(munoc_signal_02==`MUNOC_GDEF_66)
						munoc_signal_10 <= `MUNOC_LDEF_3;
				end
			`MUNOC_LDEF_3:
				munoc_signal_10 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				munoc_signal_10 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_03)
					munoc_signal_10 <= `MUNOC_LDEF_4;
		endcase
	end
end

assign munoc_signal_15 = (munoc_signal_10==`MUNOC_LDEF_4) & munoc_signal_13;
assign munoc_signal_03 = (munoc_signal_10==`MUNOC_LDEF_2);
assign munoc_signal_08 = munoc_signal_03 & (munoc_signal_02==`MUNOC_GDEF_20);

RVX_MODULE_067
#(
	.RVX_GPARA_5(MUNOC_LPARA_0),
	.RVX_GPARA_2(`MUNOC_GDEF_96),
	.RVX_GPARA_1(`BW_SVRING_LINK),
	.RVX_GPARA_4(`MUNOC_GDEF_07),
	.RVX_GPARA_3(`MUNOC_GDEF_36),
	.RVX_GPARA_0(`MUNOC_GDEF_95)
)
i_munoc_instance_2
(
	.rvx_port_09(munoc_port_14),
	.rvx_port_04(munoc_port_13),
	.rvx_port_08(munoc_port_04),
	.rvx_port_07(munoc_port_10),
	.rvx_port_06(munoc_port_11),
	.rvx_port_05(munoc_port_00),	
	.rvx_port_01(munoc_signal_13),
	.rvx_port_02(munoc_signal_00),
	.rvx_port_03(munoc_signal_07),
	.rvx_port_00(munoc_signal_04)
);

assign {munoc_signal_02,munoc_signal_06,munoc_signal_05} = munoc_signal_00;
assign munoc_signal_07 = munoc_signal_03;

always@(*)
begin
	munoc_signal_09 = -1;
	case({munoc_signal_06,2'b 00})
		`MMAP_SUBOFFSET_CONTROLLER_IP_TIMEOUT:
			munoc_signal_09 = $unsigned(munoc_port_08);
		`MMAP_SUBOFFSET_CONTROLLER_NOC_TIMEOUT:
			munoc_signal_09 = $unsigned(munoc_port_05);
		`MMAP_SUBOFFSET_CONTROLLER_FNI_STATE:
			munoc_signal_09 = $unsigned(munoc_port_03);
		`MMAP_SUBOFFSET_CONTROLLER_BNI_STATE:
			munoc_signal_09 = $unsigned(munoc_port_01);
		`MMAP_SUBOFFSET_CONTROLLER_ROUTING_ERROR:
			munoc_signal_09 = $unsigned(munoc_port_06);
		`MMAP_SUBOFFSET_CONTROLLER_BANDWIDTH:
			munoc_signal_09 = $unsigned(munoc_port_07);
		`MMAP_SUBOFFSET_CONTROLLER_NAME0,
		`MMAP_SUBOFFSET_CONTROLLER_NAME1,
		`MMAP_SUBOFFSET_CONTROLLER_NAME2,
		`MMAP_SUBOFFSET_CONTROLLER_NAME3,
		`MMAP_SUBOFFSET_CONTROLLER_NAME4,
		`MMAP_SUBOFFSET_CONTROLLER_NAME5,
		`MMAP_SUBOFFSET_CONTROLLER_NAME6,
		`MMAP_SUBOFFSET_CONTROLLER_NAME7:
			munoc_signal_09 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_01));
		`MMAP_SUBOFFSET_CONTROLLER_NODEID:
			munoc_signal_09 = MUNOC_GPARA_0;
		`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
			munoc_signal_09 = $unsigned(munoc_port_12);
		`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
			munoc_signal_09 = $unsigned(munoc_port_09);
		`MMAP_SUBOFFSET_CONTROLLER_TYPE0,
		`MMAP_SUBOFFSET_CONTROLLER_TYPE1:
			munoc_signal_09 = $unsigned(`CHANGE_ENDIAN32(munoc_signal_14));
		`MMAP_SUBOFFSET_CONTROLLER_PROTOCOL_VIOLATION:
			if(MUNOC_GPARA_1=="AXI")
				munoc_signal_09 = $unsigned(munoc_port_02);
			else
				munoc_signal_09 = 0;
	endcase
end

ERVP_SYNCHRONIZER
#(
	.BW_DATA(`MUNOC_GDEF_95)
)
i_munoc_instance_1
(
	.clk(munoc_port_14),
	.rstnn(munoc_port_13),
	.enable(1'b 1),
	.asynch_value(munoc_signal_09),
	.synch_value(munoc_signal_04)
);

assign munoc_signal_11 = `FORMAT_STRING(MUNOC_GPARA_2);

ERVP_MUX
#(
	.BW_DATA(`MUNOC_GDEF_95),
	.NUM_DATA(`DIVIDERU(`MUNOC_GDEF_41,`MUNOC_GDEF_95)),
	.LOWER_INDEX_TO_UPPER_DATA(1)
)
i_munoc_instance_0
(
	.data_input_list(munoc_signal_11),
	.select(munoc_signal_12),
	.data_output(munoc_signal_01)
);

assign munoc_signal_12 = $unsigned(munoc_signal_06);

assign munoc_signal_14 = `FORMAT_STRING(MUNOC_GPARA_1);

always@(posedge munoc_port_14, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
	begin
		munoc_port_12 <= 1;
	end
	else if(munoc_signal_08)
		case({munoc_signal_06,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_MONITOR_ENABLE:
				munoc_port_12 <= 0;
		endcase
end

always@(posedge munoc_port_14, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_port_09 <= 0;
	else if(munoc_signal_08)
		case({munoc_signal_06,2'b 00})
			`MMAP_SUBOFFSET_CONTROLLER_EXCLUDE:
				munoc_port_09 <= munoc_signal_05;
		endcase
end

`ifdef SIM_ENV

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(*)
begin
	if(munoc_port_06!=0)
		$display("\n\n[ERROR@NoC] %s: Routing Error %d", MUNOC_GPARA_2, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR
always@(*)
begin
	if(munoc_port_08!=0)
		$display("\n\n[Warning@NoC] %s: IP Timeout %x %d", MUNOC_GPARA_2, munoc_port_08, $time);
	if(munoc_port_05!=0)
		$display("\n\n[Warning@NoC] %s: NoC Timeout %x %d", MUNOC_GPARA_2, munoc_port_05, $time);
end
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER
always@(*)
begin
	if(munoc_port_02!=0)
		$display("\n\n[ERROR@NoC] %s: AXI violation %x %d", MUNOC_GPARA_2, munoc_port_02, $time);
end
`endif

`endif

`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_4
endmodule
