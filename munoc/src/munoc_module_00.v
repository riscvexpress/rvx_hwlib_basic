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
`include "munoc_include_01.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_00
(
	munoc_port_10,
	munoc_port_11,

	munoc_port_08,
	munoc_port_02,
	munoc_port_03,

	munoc_port_05,
	munoc_port_01,
	munoc_port_00,
	munoc_port_06,

	munoc_port_09,
	munoc_port_07,
	munoc_port_04
);





parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_3 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_1 = 1;

parameter MUNOC_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_10, munoc_port_11;

output wire munoc_port_08;
input wire munoc_port_02;
input wire [`MUNOC_GDEF_31(MUNOC_GPARA_2)-1:0] munoc_port_03;

input wire [MUNOC_GPARA_3-1:0] munoc_port_05;
input wire [`BW_AXI_BRESP-1:0] munoc_port_01;
input wire munoc_port_00;
output wire munoc_port_06;

input wire munoc_port_09;
output wire munoc_port_07;
output wire [`BW_BCHANNEL(`REQUIRED_BW_OF_SLAVE_TID)-1:0] munoc_port_04;

wire munoc_signal_06;
wire munoc_signal_08;
wire munoc_signal_16;
wire [`MUNOC_GDEF_31(MUNOC_GPARA_2)-1:0] munoc_signal_14;
wire munoc_signal_02;
wire munoc_signal_07;
wire [`MUNOC_GDEF_31(MUNOC_GPARA_2)-1:0] munoc_signal_00;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_17;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_03;
wire [`MUNOC_GDEF_19(MUNOC_GPARA_2)-1:0] munoc_signal_09;

reg [`BW_AXI_BRESP-1:0] munoc_signal_05, munoc_signal_10;
reg [`MUNOC_GDEF_19(MUNOC_GPARA_2)-1:0] munoc_signal_15;
wire munoc_signal_13;
wire munoc_signal_11;
wire munoc_signal_04;

wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_12;
wire [`BW_LONGEST_AXI_TID-1:0] munoc_signal_01;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_31(MUNOC_GPARA_2)),
	.DEPTH(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.clk(munoc_port_10),
	.rstnn(munoc_port_11),
	.enable(munoc_signal_06),
  .clear(1'b 0),
	.wready(munoc_signal_08),
	.wrequest(munoc_signal_16),
	.wdata(munoc_signal_14),
	.rready(munoc_signal_02),
	.rrequest(munoc_signal_07),	
	.rdata(munoc_signal_00),
	.wfull(),
	.rempty()
);

assign munoc_signal_16 = munoc_port_02;
assign munoc_signal_14 = munoc_port_03;
assign {munoc_signal_17,munoc_signal_03,munoc_signal_09} = munoc_signal_00;
assign munoc_signal_07 = munoc_signal_04;

assign munoc_signal_11 = munoc_port_06 & munoc_port_00;
assign munoc_signal_04 = munoc_signal_11 & munoc_signal_13;
assign munoc_port_07 = munoc_signal_04;

assign {munoc_signal_12,munoc_signal_01} = (MUNOC_GPARA_0==1)? {munoc_signal_17,munoc_signal_03} : munoc_port_05;

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

always@(posedge munoc_port_10, negedge munoc_port_11)
begin
	if(munoc_port_11==0)
	begin
		munoc_signal_05 <= `AXI_RESPONSE_OKAY;
		munoc_signal_15 <= 0;
	end
	else if(munoc_signal_11)
	begin
		if(munoc_signal_13)
		begin
			munoc_signal_05 <= `AXI_RESPONSE_OKAY;
			munoc_signal_15 <= 0;
		end
		else
		begin
			munoc_signal_05 <= munoc_signal_10;
			munoc_signal_15 <= munoc_signal_15 + 1'b 1;
		end
	end
end

always@(*)
begin
	munoc_signal_10 = munoc_port_01;
	case(munoc_signal_05)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_10 = munoc_port_01;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_10 = munoc_signal_05;
	endcase
end

assign munoc_signal_06 = 1;
assign munoc_signal_13 = ($unsigned(munoc_signal_15)==$unsigned(munoc_signal_09));
assign munoc_port_08 = munoc_signal_08;
assign munoc_port_06 = munoc_port_09 & munoc_signal_02;
assign munoc_port_04 = {munoc_signal_12,munoc_signal_01,munoc_signal_10};

`else

assign munoc_signal_06 = (MUNOC_GPARA_0==1)? 1 : 0;
assign munoc_signal_13 = 1;
assign munoc_port_08 = (MUNOC_GPARA_0==1)? munoc_signal_08 : 1;
assign munoc_port_06 = (MUNOC_GPARA_0==1)? (munoc_port_09 & munoc_signal_02) : munoc_port_09;
assign munoc_port_04 = {munoc_signal_12,munoc_signal_01,munoc_port_01};

`endif

endmodule
