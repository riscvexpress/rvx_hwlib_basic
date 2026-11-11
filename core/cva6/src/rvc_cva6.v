// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reserved.
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
// 2026-11-07
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_09.vh"
`include "platform_info.vh"

module RVC_CVA6
(
	clk,
	rstnn,

	data_sx4awready,
	data_sx4awvalid,
	data_sx4awaddr,
	data_sx4awid,
	data_sx4awlen,
	data_sx4awsize,
	data_sx4awburst,
	data_sx4wready,
	data_sx4wvalid,
	data_sx4wdata,
	data_sx4wstrb,
	data_sx4wlast,
	data_sx4bready,
	data_sx4bvalid,
	data_sx4bid,
	data_sx4bresp,
	data_sx4arready,
	data_sx4arvalid,
	data_sx4araddr,
	data_sx4arid,
	data_sx4arlen,
	data_sx4arsize,
	data_sx4arburst,
	data_sx4rready,
	data_sx4rvalid,
	data_sx4rid,
	data_sx4rdata,
	data_sx4rlast,
	data_sx4rresp,

	interrupt_vector,
	interrupt_out,

	spc,
	sinst
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter RESET_VECTOR = 32'h 0;
parameter ENABLE_EXCEPTIONS = 1;
parameter ENABLE_INTERRUPTS = 1;
parameter NUM_INTERRUPTS = 1;

localparam BW_ADDR = 32;
localparam BW_DATA = 64;
localparam BW_TID = 4;

input wire clk;
input wire rstnn;

input wire data_sx4awready;
output wire data_sx4awvalid;
output wire [BW_ADDR-1:0] data_sx4awaddr;
output wire [BW_TID-1:0] data_sx4awid;
output wire [`BW_AXI_ALEN-1:0] data_sx4awlen;
output wire [`BW_AXI_ASIZE-1:0] data_sx4awsize;
output wire [`BW_AXI_ABURST-1:0] data_sx4awburst;
input wire data_sx4wready;
output wire data_sx4wvalid;
output wire [BW_DATA-1:0] data_sx4wdata;
output wire [`BW_AXI_WSTRB(BW_DATA)-1:0] data_sx4wstrb;
output wire data_sx4wlast;
output wire data_sx4bready;
input wire data_sx4bvalid;
input wire [BW_TID-1:0] data_sx4bid;
input wire [`BW_AXI_BRESP-1:0] data_sx4bresp;
input wire data_sx4arready;
output wire data_sx4arvalid;
output wire [BW_ADDR-1:0] data_sx4araddr;
output wire [BW_TID-1:0] data_sx4arid;
output wire [`BW_AXI_ALEN-1:0] data_sx4arlen;
output wire [`BW_AXI_ASIZE-1:0] data_sx4arsize;
output wire [`BW_AXI_ABURST-1:0] data_sx4arburst;
output wire data_sx4rready;
input wire data_sx4rvalid;
input wire [BW_TID-1:0] data_sx4rid;
input wire [BW_DATA-1:0] data_sx4rdata;
input wire data_sx4rlast;
input wire [`BW_AXI_RRESP-1:0] data_sx4rresp;

input wire [NUM_INTERRUPTS-1:0] interrupt_vector;
output wire interrupt_out;

output reg [32-1:0] spc;
output wire [32-1:0] sinst;

/////////////
/* signals */
/////////////

wire [32-1:0] interrupts_extended;
wire commit_valid;
wire [32-1:0] commit_pc;

////////////
/* logics */
////////////

rvc_cva6_core
#(
	.CACHEABLE_START(`FIXED_CACHEABLE_START),
	.CACHEABLE_LAST(`FIXED_CACHEABLE_LAST)
)
i_core
(
	.clk_i(clk),
	.rst_ni(rstnn),
	.boot_addr_i(RESET_VECTOR),
	.irq_external_i(interrupts_extended[`RVX_GDEF_289]),
	.irq_timer_i(interrupts_extended[`RVX_GDEF_543]),
	.irq_software_i(interrupts_extended[`RVX_GDEF_141]),

	.awid_o(data_sx4awid),
	.awaddr_o(data_sx4awaddr),
	.awlen_o(data_sx4awlen),
	.awsize_o(data_sx4awsize),
	.awburst_o(data_sx4awburst),
	.awvalid_o(data_sx4awvalid),
	.awready_i(data_sx4awready),

	.wdata_o(data_sx4wdata),
	.wstrb_o(data_sx4wstrb),
	.wlast_o(data_sx4wlast),
	.wvalid_o(data_sx4wvalid),
	.wready_i(data_sx4wready),

	.bid_i(data_sx4bid),
	.bresp_i(data_sx4bresp),
	.bvalid_i(data_sx4bvalid),
	.bready_o(data_sx4bready),

	.arid_o(data_sx4arid),
	.araddr_o(data_sx4araddr),
	.arlen_o(data_sx4arlen),
	.arsize_o(data_sx4arsize),
	.arburst_o(data_sx4arburst),
	.arvalid_o(data_sx4arvalid),
	.arready_i(data_sx4arready),

	.rid_i(data_sx4rid),
	.rdata_i(data_sx4rdata),
	.rresp_i(data_sx4rresp),
	.rlast_i(data_sx4rlast),
	.rvalid_i(data_sx4rvalid),
	.rready_o(data_sx4rready),

	.commit_valid_o(commit_valid),
	.commit_pc_o(commit_pc)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		spc <= 0;
	else if(commit_valid)
		spc <= commit_pc;
end

assign sinst = 0;

assign interrupts_extended = (ENABLE_INTERRUPTS==1)? $unsigned(interrupt_vector) : 0;
assign interrupt_out = (interrupts_extended!=0);

endmodule
