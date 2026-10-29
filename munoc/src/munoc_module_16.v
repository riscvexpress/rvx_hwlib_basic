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
`include "munoc_include_08.vh"
`include "munoc_include_06.vh"





module MUNOC_MODULE_16
(
	munoc_port_04,
	munoc_port_10,

	munoc_port_00,
	munoc_port_05,
	munoc_port_09,

	munoc_port_02,
	munoc_port_01,
	munoc_port_03,
	munoc_port_11,

	munoc_port_06,
	munoc_port_08,
	munoc_port_07
);





parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_1 = 1;

parameter MUNOC_GPARA_2 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_04, munoc_port_10;

output wire munoc_port_00;
input wire munoc_port_05;
input wire [`MUNOC_GDEF_12(MUNOC_GPARA_3)-1:0] munoc_port_09;

input wire [MUNOC_GPARA_0-1:0] munoc_port_02;
input wire [`BW_AXI_BRESP-1:0] munoc_port_01;
input wire munoc_port_03;
output wire munoc_port_11;

input wire munoc_port_06;
output wire munoc_port_08;
output wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_07;

wire munoc_signal_14;
wire munoc_signal_12;
wire munoc_signal_03;
wire [`MUNOC_GDEF_12(MUNOC_GPARA_3)-1:0] munoc_signal_10;
wire munoc_signal_00;
wire munoc_signal_08;
wire [`MUNOC_GDEF_12(MUNOC_GPARA_3)-1:0] munoc_signal_01;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_09;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_04;
wire [`MUNOC_GDEF_31(MUNOC_GPARA_3)-1:0] munoc_signal_15;

reg [`BW_AXI_BRESP-1:0] munoc_signal_13, munoc_signal_05;
reg [`MUNOC_GDEF_31(MUNOC_GPARA_3)-1:0] munoc_signal_02;
wire munoc_signal_11;
wire munoc_signal_06;
wire munoc_signal_07;

wire [`BW_MASTER_NODE_ID-1:0] source_node;
wire [`BW_LONGEST_AXI_TID-1:0] tid;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_12(MUNOC_GPARA_3)),
	.DEPTH(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.clk(munoc_port_04),
	.rstnn(munoc_port_10),
	.enable(munoc_signal_14),
  .clear(1'b 0),
	.wready(munoc_signal_12),
	.wrequest(munoc_signal_03),
	.wdata(munoc_signal_10),
	.rready(munoc_signal_00),
	.rrequest(munoc_signal_08),	
	.rdata(munoc_signal_01),
	.wfull(),
	.rempty()
);

assign munoc_signal_03 = munoc_port_05;
assign munoc_signal_10 = munoc_port_09;
assign {munoc_signal_09,munoc_signal_04,munoc_signal_15} = munoc_signal_01;
assign munoc_signal_08 = munoc_signal_07;

assign munoc_signal_06 = munoc_port_11 & munoc_port_03;
assign munoc_signal_07 = munoc_signal_06 & munoc_signal_11;
assign munoc_port_08 = munoc_signal_07;

assign {source_node,tid} = (MUNOC_GPARA_2==1)? {munoc_signal_09,munoc_signal_04} : munoc_port_02;

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

always@(posedge munoc_port_04, negedge munoc_port_10)
begin
	if(munoc_port_10==0)
	begin
		munoc_signal_13 <= `AXI_RESPONSE_OKAY;
		munoc_signal_02 <= 0;
	end
	else if(munoc_signal_06)
	begin
		if(munoc_signal_11)
		begin
			munoc_signal_13 <= `AXI_RESPONSE_OKAY;
			munoc_signal_02 <= 0;
		end
		else
		begin
			munoc_signal_13 <= munoc_signal_05;
			munoc_signal_02 <= munoc_signal_02 + 1'b 1;
		end
	end
end

always@(*)
begin
	munoc_signal_05 = munoc_port_01;
	case(munoc_signal_13)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_05 = munoc_port_01;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_05 = munoc_signal_13;
	endcase
end

assign munoc_signal_14 = 1;
assign munoc_signal_11 = ($unsigned(munoc_signal_02)==$unsigned(munoc_signal_15));
assign munoc_port_00 = munoc_signal_12;
assign munoc_port_11 = munoc_port_06 & munoc_signal_00;
assign munoc_port_07 = {source_node,tid,munoc_signal_05};

`else

assign munoc_signal_14 = (MUNOC_GPARA_2==1)? 1 : 0;
assign munoc_signal_11 = 1;
assign munoc_port_00 = (MUNOC_GPARA_2==1)? munoc_signal_12 : 1;
assign munoc_port_11 = (MUNOC_GPARA_2==1)? (munoc_port_06 & munoc_signal_00) : munoc_port_06;
assign munoc_port_07 = {source_node,tid,munoc_port_01};

`endif

endmodule
