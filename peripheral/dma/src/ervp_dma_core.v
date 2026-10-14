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



module ERVP_DMA_CORE
(
	clk,
	rstnn,

	read_inst_valid,
	read_inst_base_addr,
	read_inst_line_size,
	read_inst_num_lines,
	read_inst_stride,
	read_inst_finish,
	read_burst_wready,
	read_burst_wrequest,
	read_data_buffer_wready,
	read_data_buffer_wrequest,
	read_data_buffer_wdata,

	write_inst_valid,
	write_inst_base_addr,
	write_inst_line_size,
	write_inst_num_lines,
	write_inst_stride,
	write_inst_finish,
	write_burst_rready,
	write_burst_rrequest,
	write_data_buffer_rready,
	write_data_buffer_rdata,
	write_data_buffer_rrequest,

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
parameter BW_LINE_SIZE = 32;
parameter BW_NUM_LINES = 32;
parameter BW_AXI_TID = 4;
parameter MAX_BURST_LENGTH_M1 = 15;

`include "rvx_include_10.vh"

localparam  RVX_LPARA_0 = 1;

input wire clk;
input wire rstnn;

input wire read_inst_valid;
input wire [BW_ADDR-1:0] read_inst_base_addr;
input wire [BW_LINE_SIZE-1:0] read_inst_line_size;
input wire [BW_NUM_LINES-1:0] read_inst_num_lines;
input wire [BW_ADDR-1:0] read_inst_stride;
output wire read_inst_finish;
input wire read_burst_wready;
output wire read_burst_wrequest;
input wire [(2)-1:0] read_data_buffer_wready;
output wire read_data_buffer_wrequest;
output wire [BW_AXI_DATA-1:0] read_data_buffer_wdata;

input wire write_inst_valid;
input wire [BW_ADDR-1:0] write_inst_base_addr;
input wire [BW_LINE_SIZE-1:0] write_inst_line_size;
input wire [BW_NUM_LINES-1:0] write_inst_num_lines;
input wire [BW_ADDR-1:0] write_inst_stride;
output wire write_inst_finish;
input wire write_burst_rready;
output wire write_burst_rrequest;
input wire write_data_buffer_rready;
input wire [BW_AXI_DATA-1:0] write_data_buffer_rdata;
output wire write_data_buffer_rrequest;

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

wire [(2)-1:0] rvx_signal_34;
wire rvx_signal_24;
wire rvx_signal_30;
wire rvx_signal_33;
wire [`BW_AXI_ALEN-1:0] rvx_signal_01;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_02;
wire [`BW_AXI_ABURST-1:0] rvx_signal_29;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_05;
wire [BW_AXI_DATA-1:0] rvx_signal_12;
wire [BW_ADDR-1:0] rvx_signal_10;
wire [RVX_LPARA_0-1:0] rvx_signal_32;
wire [(2)-1:0] rvx_signal_06;
wire rvx_signal_00;
wire rvx_signal_21;
wire rvx_signal_15;
wire [`BW_AXI_RESP-1:0] rvx_signal_07;
wire [BW_AXI_DATA-1:0] rvx_signal_14;
wire [RVX_LPARA_0-1:0] rvx_signal_19;

wire [(2)-1:0] rvx_signal_03;
wire rvx_signal_25;
wire rvx_signal_16;
wire rvx_signal_09;
wire [`BW_AXI_ALEN-1:0] rvx_signal_23;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_08;
wire [`BW_AXI_ABURST-1:0] rvx_signal_04;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_signal_11;
wire [BW_AXI_DATA-1:0] rvx_signal_22;
wire [BW_ADDR-1:0] rvx_signal_31;
wire [RVX_LPARA_0-1:0] rvx_signal_26;
wire [(2)-1:0] rvx_signal_27;
wire rvx_signal_20;
wire rvx_signal_13;
wire rvx_signal_35;
wire [`BW_AXI_RESP-1:0] rvx_signal_17;
wire [BW_AXI_DATA-1:0] rvx_signal_28;
wire [RVX_LPARA_0-1:0] rvx_signal_18;

RVX_MODULE_129
#(
	.RVX_GPARA_0(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.BW_LINE_SIZE(BW_LINE_SIZE),
	.RVX_GPARA_1(BW_NUM_LINES),
	.MAX_BURST_LENGTH_M1(MAX_BURST_LENGTH_M1)
)
i_rvx_instance_2
(
	.rvx_port_23(clk),
	.rvx_port_05(rstnn),

	.rvx_port_19(read_inst_valid),
	.rvx_port_20(read_inst_base_addr),
	.rvx_port_10(read_inst_line_size),
	.rvx_port_25(read_inst_num_lines),
	.rvx_port_28(read_inst_stride),
	.rvx_port_24(read_inst_finish),

	.rvx_port_01(read_burst_wready),
	.rvx_port_09(read_burst_wrequest),

	.rvx_port_13(read_data_buffer_wready),
	.rvx_port_12(read_data_buffer_wrequest),
	.rvx_port_02(read_data_buffer_wdata),

	.rvx_port_00(rvx_signal_34),
	.rvx_port_22(rvx_signal_24),
	.rvx_port_08(rvx_signal_30),
	.rvx_port_06(rvx_signal_33),
	.rvx_port_18(rvx_signal_01),
	.rvx_port_07(rvx_signal_02),
	.rvx_port_21(rvx_signal_29),
	.rvx_port_03(rvx_signal_05),
	.rvx_port_26(rvx_signal_12),
	.rvx_port_14(rvx_signal_10),
	.rvx_port_29(rvx_signal_32),
	.rvx_port_16(rvx_signal_06),
	.rvx_port_17(rvx_signal_00),
	.rvx_port_15(rvx_signal_21),
	.rvx_port_04(rvx_signal_15),
	.rvx_port_30(rvx_signal_07),
	.rvx_port_27(rvx_signal_14),
	.rvx_port_11(rvx_signal_19)
);

RVX_MODULE_089
#(
	.RVX_GPARA_0(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.BW_LINE_SIZE(BW_LINE_SIZE),
	.RVX_GPARA_1(BW_NUM_LINES),
	.MAX_BURST_LENGTH_M1(MAX_BURST_LENGTH_M1)
)
i_rvx_instance_1
(
	.rvx_port_14(clk),
	.rvx_port_12(rstnn),

	.rvx_port_10(write_inst_valid),
	.rvx_port_23(write_inst_base_addr),
	.rvx_port_03(write_inst_line_size),
	.rvx_port_11(write_inst_num_lines),
	.rvx_port_07(write_inst_stride),
	.rvx_port_20(write_inst_finish),

	.rvx_port_26(write_burst_rready),
	.rvx_port_00(write_burst_rrequest),

	.rvx_port_18(write_data_buffer_rready),
	.rvx_port_01(write_data_buffer_rdata),
	.rvx_port_21(write_data_buffer_rrequest),

	.rvx_port_22(rvx_signal_03),
	.rvx_port_24(rvx_signal_25),
	.rvx_port_30(rvx_signal_16),
	.rvx_port_04(rvx_signal_09),
	.rvx_port_16(rvx_signal_23),
	.rvx_port_05(rvx_signal_08),
	.rvx_port_06(rvx_signal_04),
	.rvx_port_13(rvx_signal_11),
	.rvx_port_15(rvx_signal_22),
	.rvx_port_02(rvx_signal_31),
	.rvx_port_09(rvx_signal_26),
	.rvx_port_27(rvx_signal_27),
	.rvx_port_25(rvx_signal_20),
	.rvx_port_29(rvx_signal_13),
	.rvx_port_08(rvx_signal_35),
	.rvx_port_19(rvx_signal_17),
	.rvx_port_28(rvx_signal_28),
	.rvx_port_17(rvx_signal_18)
);

RVX_MODULE_131
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_1(BW_AXI_DATA),
	.RVX_GPARA_3(BW_AXI_TID),
	.HAS_BURDEN(0)
)
i_rvx_instance_0
(
	.rvx_port_51(clk),
	.rvx_port_30(rstnn),
	.rvx_port_33(1'b 0),
	.rvx_port_01(1'b 1),

	.rvx_port_63(rvx_signal_34),
	.rvx_port_41(rvx_signal_24),
	.rvx_port_57(rvx_signal_30),
	.rvx_port_42(rvx_signal_33),
	.rvx_port_50(rvx_signal_01),
	.rvx_port_69(rvx_signal_02),
	.rvx_port_52(rvx_signal_29),
	.rvx_port_62(rvx_signal_05),
	.rvx_port_06(rvx_signal_12),
	.rvx_port_09(rvx_signal_10),
	.rvx_port_65(rvx_signal_32),

	.rvx_port_44(rvx_signal_06),
	.rvx_port_68(rvx_signal_00),
	.rvx_port_64(rvx_signal_21),
	.rvx_port_14(rvx_signal_15),
	.rvx_port_13(rvx_signal_07),
	.rvx_port_15(rvx_signal_14),
	.rvx_port_21(rvx_signal_19),

	.rvx_port_58(rvx_signal_03),
	.rvx_port_25(rvx_signal_25),
	.rvx_port_23(rvx_signal_16),
	.rvx_port_03(rvx_signal_09),
	.rvx_port_38(rvx_signal_23),
	.rvx_port_32(rvx_signal_08),
	.rvx_port_43(rvx_signal_04),
	.rvx_port_29(rvx_signal_11),
	.rvx_port_49(rvx_signal_22),
	.rvx_port_05(rvx_signal_31),
	.rvx_port_37(rvx_signal_26),

	.rvx_port_08(rvx_signal_27),
	.rvx_port_11(rvx_signal_20),
	.rvx_port_22(rvx_signal_13),
	.rvx_port_36(rvx_signal_35),
	.rvx_port_53(rvx_signal_17),
	.rvx_port_61(rvx_signal_28),
	.rvx_port_07(rvx_signal_18),

	.rvx_port_28(sxawid),
	.rvx_port_27(sxawaddr),
	.rvx_port_48(sxawlen),
	.rvx_port_47(sxawsize),
	.rvx_port_56(sxawburst),
	.rvx_port_26(sxawvalid),
	.rvx_port_55(sxawready),

	.rvx_port_39(sxwid),
	.rvx_port_34(sxwdata),
	.rvx_port_16(sxwstrb),
	.rvx_port_46(sxwlast),
	.rvx_port_54(sxwvalid),
	.rvx_port_59(sxwready),

	.rvx_port_17(sxbid),
	.rvx_port_20(sxbresp),
	.rvx_port_00(sxbvalid),
	.rvx_port_19(sxbready),

	.rvx_port_35(sxarid),
	.rvx_port_67(sxaraddr),
	.rvx_port_10(sxarlen),
	.rvx_port_45(sxarsize),
	.rvx_port_60(sxarburst),
	.rvx_port_66(sxarvalid),
	.rvx_port_24(sxarready),

	.rvx_port_31(sxrid),
	.rvx_port_40(sxrdata),
	.rvx_port_12(sxrresp),
	.rvx_port_02(sxrlast),
	.rvx_port_18(sxrvalid),
	.rvx_port_04(sxrready)
);

endmodule
