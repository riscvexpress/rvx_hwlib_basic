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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_09.vh"



module ERVP_DMA
(
	clk_axi,
	rstnn_axi,
	clk_system,
	tick_1us,

	control_rmx_core_config,
	control_rmx_core_status,
	control_rmx_clear_request,
	control_rmx_clear_finish,
	control_rmx_log_fifo_wready,
	control_rmx_log_fifo_wrequest,
	control_rmx_log_fifo_wdata,
	control_rmx_inst_fifo_rready,
	control_rmx_inst_fifo_rdata,
	control_rmx_inst_fifo_rrequest,
	control_rmx_operation_finish,
	control_rmx_input_fifo_rready,
	control_rmx_input_fifo_rdata,
	control_rmx_input_fifo_rrequest,
	control_rmx_output_fifo_wready,
	control_rmx_output_fifo_wrequest,
	control_rmx_output_fifo_wdata,

	sxawid,
	sxawaddr,
	sxawlen,
	sxawsize,
	sxawburst,
	sxawvalid,
	sxawready,
	
	sxwid,
	sxwdata,
	sxwstrb,
	sxwlast,
	sxwvalid,
	sxwready,
	
	sxbid,
	sxbresp,
	sxbvalid,
	sxbready,
	
	sxarid,
	sxaraddr,
	sxarlen,
	sxarsize,
	sxarburst,
	sxarvalid,
	sxarready,
	
	sxrid,
	sxrdata,
	sxrresp,
	sxrlast,
	sxrvalid,
	sxrready
);



parameter BW_ADDR = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID = 4;
parameter NUM_TXN_BUFFER = 2;
parameter MAX_BURST_LENGTH_M1 = 15;

localparam  RVX_LPARA_08 = 1;
localparam  RVX_LPARA_00 = 1;
localparam  RVX_LPARA_01 = 1;
localparam  RVX_LPARA_05 = `RVX_GDEF_456;
localparam  RVX_LPARA_06 = 1;
localparam  RVX_LPARA_03 = 1;
localparam  RVX_LPARA_10 = `RVX_GDEF_539;
localparam  RVX_LPARA_07 = `RVX_GDEF_132;
localparam  RVX_LPARA_09 = `RVX_GDEF_391;
localparam  RVX_LPARA_04 = (MAX_BURST_LENGTH_M1+1)*NUM_TXN_BUFFER;

input wire clk_axi;
input wire rstnn_axi;
input wire clk_system;
input wire tick_1us;

input wire [(RVX_LPARA_08)-1:0] control_rmx_core_config;
output wire [(RVX_LPARA_00)-1:0] control_rmx_core_status;
input wire control_rmx_clear_request;
output wire control_rmx_clear_finish;
input wire control_rmx_log_fifo_wready;
output wire control_rmx_log_fifo_wrequest;
output wire [(RVX_LPARA_01)-1:0] control_rmx_log_fifo_wdata;
input wire control_rmx_inst_fifo_rready;
input wire [(RVX_LPARA_05)-1:0] control_rmx_inst_fifo_rdata;
output wire control_rmx_inst_fifo_rrequest;
output wire control_rmx_operation_finish;
input wire control_rmx_input_fifo_rready;
input wire [(RVX_LPARA_06)-1:0] control_rmx_input_fifo_rdata;
output wire control_rmx_input_fifo_rrequest;
input wire control_rmx_output_fifo_wready;
output wire control_rmx_output_fifo_wrequest;
output wire [(RVX_LPARA_03)-1:0] control_rmx_output_fifo_wdata;

output wire [BW_AXI_TID-1:0] sxawid;
output wire [BW_ADDR-1:0] sxawaddr;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire sxawvalid;
input wire sxawready;

output wire [BW_AXI_TID-1:0] sxwid;
output wire [BW_AXI_DATA-1:0] sxwdata;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] sxwstrb;
output wire sxwlast;
output wire sxwvalid;
input wire sxwready;

input wire [BW_AXI_TID-1:0] sxbid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire sxbvalid;
output wire sxbready;

output wire [BW_AXI_TID-1:0] sxarid;
output wire [BW_ADDR-1:0] sxaraddr;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire sxarvalid;
input wire sxarready;

input wire [BW_AXI_TID-1:0] sxrid;
input wire [BW_AXI_DATA-1:0] sxrdata;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire sxrlast;
input wire sxrvalid;
output wire sxrready;

wire [32-1:0] rvx_signal_13;
wire [32-1:0] rvx_signal_21;
wire [32-1:0] rvx_signal_06;
wire [32-1:0] rvx_signal_29;
wire [RVX_LPARA_07-1:0] rvx_signal_05;
wire [RVX_LPARA_09-1:0] rvx_signal_24;
wire [RVX_LPARA_10-1:0] rvx_signal_01;
wire rvx_signal_16;

wire rvx_signal_09;
reg [RVX_LPARA_10-1:0] rvx_signal_08;
wire rvx_signal_17;
reg rvx_signal_19;

reg rvx_signal_11;
reg rvx_signal_00;
wire rvx_signal_07;
wire rvx_signal_03;
wire rvx_signal_02;
wire rvx_signal_12;
wire rvx_signal_20;
wire rvx_signal_26;
wire rvx_signal_15;

localparam  RVX_LPARA_02 = NUM_TXN_BUFFER + 1;

wire rvx_signal_04;
wire rvx_signal_28;
wire rvx_signal_18;
wire rvx_signal_23;

wire [2-1:0] rvx_signal_14;
wire rvx_signal_25;
wire [BW_AXI_DATA-1:0] rvx_signal_30;
wire rvx_signal_10;
wire rvx_signal_22;
wire [BW_AXI_DATA-1:0] rvx_signal_27;

assign {rvx_signal_16,rvx_signal_01,rvx_signal_24,rvx_signal_05,rvx_signal_29,rvx_signal_06,rvx_signal_21,rvx_signal_13} = control_rmx_inst_fifo_rdata;

ERVP_ASYNCH_SINGLE_CYCLE
i_rvx_instance_0
(
	.wclk(clk_system),
	.wrstnn(rstnn_axi),
	.wcontrol(tick_1us),
	.rclk(clk_axi),
	.rrstnn(rstnn_axi),
	.rcontrol(rvx_signal_09)
);

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_08 <= 0;
	else if(rvx_signal_02)
		rvx_signal_08 <= rvx_signal_01;
	else if(rvx_signal_09 & (~rvx_signal_17))
		rvx_signal_08 <= rvx_signal_08 - 1;
end

assign rvx_signal_17 = (rvx_signal_08==0);

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_19 <= 0;
	else if(rvx_signal_02 | rvx_signal_15)
		rvx_signal_19 <= 0;
	else if(rvx_signal_20 & (~rvx_signal_26))
		rvx_signal_19 <= 1;
end

assign rvx_signal_07 = ~rvx_signal_11;
assign rvx_signal_03 = control_rmx_clear_request;
assign rvx_signal_02 = rvx_signal_07 & control_rmx_inst_fifo_rready & (~rvx_signal_03) & ((~rvx_signal_19) | rvx_signal_17);
assign rvx_signal_26 = rvx_signal_20 & ((~rvx_signal_16) | rvx_signal_03);
assign rvx_signal_15 = rvx_signal_07 & control_rmx_inst_fifo_rready & rvx_signal_03;

assign control_rmx_inst_fifo_rrequest = rvx_signal_26 | rvx_signal_15;
assign control_rmx_operation_finish = rvx_signal_26 | rvx_signal_15;
assign control_rmx_clear_finish = rvx_signal_03 & rvx_signal_07 & (~control_rmx_inst_fifo_rready);
assign control_rmx_core_status = rvx_signal_11;

assign control_rmx_log_fifo_wrequest = 0;
assign control_rmx_log_fifo_wdata = 0;
assign control_rmx_input_fifo_rrequest = 0;
assign control_rmx_output_fifo_wrequest = 0;
assign control_rmx_output_fifo_wdata = 0;

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_11 <= 0;
	else if(rvx_signal_02)
		rvx_signal_11 <= 1;
	else if(rvx_signal_20)
		rvx_signal_11 <= 0;
end

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_00 <= 0;
	else if(rvx_signal_02)
		rvx_signal_00 <= 1;
	else if(rvx_signal_12)
		rvx_signal_00 <= 0;
end

ERVP_DMA_CORE
#(
	.BW_ADDR(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.BW_AXI_TID(BW_AXI_TID),
	.BW_LINE_SIZE(RVX_LPARA_07),
	.BW_NUM_LINES(RVX_LPARA_09),
	.MAX_BURST_LENGTH_M1(MAX_BURST_LENGTH_M1)
)
i_rvx_instance_1
(
	.clk(clk_axi),
	.rstnn(rstnn_axi),

	.read_inst_valid(rvx_signal_00),
	.read_inst_base_addr(rvx_signal_13),
	.read_inst_line_size(rvx_signal_05),
	.read_inst_num_lines(rvx_signal_24),
	.read_inst_stride(rvx_signal_21),
	.read_inst_finish(rvx_signal_12),
	.read_burst_wready(~rvx_signal_23),
	.read_burst_wrequest(rvx_signal_04),
	.read_data_buffer_wready(rvx_signal_14),
	.read_data_buffer_wrequest(rvx_signal_25),
	.read_data_buffer_wdata(rvx_signal_30),

	.write_inst_valid(rvx_signal_11),
	.write_inst_base_addr(rvx_signal_06),
	.write_inst_line_size(rvx_signal_05),
	.write_inst_num_lines(rvx_signal_24),
	.write_inst_stride(rvx_signal_29),
	.write_inst_finish(rvx_signal_20),
	.write_burst_rready(~rvx_signal_18),
	.write_burst_rrequest(rvx_signal_28),
	.write_data_buffer_rready(rvx_signal_10),
	.write_data_buffer_rdata(rvx_signal_27),
	.write_data_buffer_rrequest(rvx_signal_22),

	.sxawid(sxawid),
	.sxawaddr(sxawaddr),
	.sxawlen(sxawlen),
	.sxawsize(sxawsize),
	.sxawburst(sxawburst),
	.sxawvalid(sxawvalid),
	.sxawready(sxawready),

	.sxwid(sxwid),
	.sxwdata(sxwdata),
	.sxwstrb(sxwstrb),
	.sxwlast(sxwlast),
	.sxwvalid(sxwvalid),
	.sxwready(sxwready),

	.sxbid(sxbid),
	.sxbresp(sxbresp),
	.sxbvalid(sxbvalid),
	.sxbready(sxbready),

	.sxarid(sxarid),
	.sxaraddr(sxaraddr),
	.sxarlen(sxarlen),
	.sxarsize(sxarsize),
	.sxarburst(sxarburst),
	.sxarvalid(sxarvalid),
	.sxarready(sxarready),

	.sxrid(sxrid),
	.sxrdata(sxrdata),
	.sxrresp(sxrresp),
	.sxrlast(sxrlast),
	.sxrvalid(sxrvalid),
	.sxrready(sxrready)
);

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_02)
)
i_rvx_instance_2
(
	.clk(clk_axi),
	.rstnn(rstnn_axi),
	.enable(1'b 1),
	.init(1'b 0),
	.up(rvx_signal_04),
	.down(rvx_signal_28),
	.value(),
	.is_first_count(rvx_signal_18),
	.is_last_count(rvx_signal_23)
);

ERVP_FIFO
#(
	.BW_DATA(BW_AXI_DATA),
	.DEPTH(RVX_LPARA_04),
	.WRITE_READY_SIZE(2)
)
i_rvx_instance_3
(
	.clk(clk_axi),
	.rstnn(rstnn_axi),
	.enable(1'b 1),
  .clear(1'b 0),

	.wready(rvx_signal_14),
	.wrequest(rvx_signal_25),
	.wfull(),
	.wdata(rvx_signal_30),
	.wnum(),

	.rready(rvx_signal_10),
	.rrequest(rvx_signal_22),
	.rempty(),
	.rdata(rvx_signal_27),
	.rnum()
);

endmodule
