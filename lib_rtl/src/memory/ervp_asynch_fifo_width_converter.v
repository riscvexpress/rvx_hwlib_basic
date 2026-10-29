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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"



module ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
(
	wclk,
	wrstnn,
	wready,
  wfull,
  wstartindex,
  wlastindex,
	wrequest,
	wdata,
  wnum,

	rclk,
	rrstnn,
	rready,
	rempty,
  rstartindex,
  rlastindex,
	rrequest,
	rdata,
  rnum
);



parameter BW_DATA = 32;
parameter BW_PARTIAL_WRITE = 32;
parameter BW_PARTIAL_READ = 32;
parameter DEPTH = 4;
parameter BW_NUM_DATA = 32;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_2 = `DIVIDERU(BW_DATA, BW_PARTIAL_WRITE);
localparam  RVX_LPARA_4 = RVX_LPARA_2 * BW_PARTIAL_WRITE;
localparam  RVX_LPARA_1 = `DIVIDERU(BW_DATA, BW_PARTIAL_READ);
localparam  RVX_LPARA_0 = RVX_LPARA_1 * BW_PARTIAL_READ;

input wire wclk;
input wire wrstnn;
output wire wready;
output wire wfull;
output wire wstartindex;
output wire wlastindex;
input wire wrequest;
input wire [BW_PARTIAL_WRITE-1:0] wdata;
output wire [BW_NUM_DATA-1:0] wnum;

input wire rclk;
input wire rrstnn;
output wire rready;
output wire rempty;
output wire rstartindex;
output wire rlastindex;
input wire rrequest;
output wire [BW_PARTIAL_READ-1:0] rdata;
output wire [BW_NUM_DATA-1:0] rnum;

genvar i;

wire [RVX_LPARA_2-1:0] rvx_signal_06;
wire [RVX_LPARA_2-1:0] rvx_signal_03;
wire [RVX_LPARA_2-1:0] rvx_signal_04;

wire [RVX_LPARA_2-1:0] rvx_signal_17;
wire [RVX_LPARA_2-1:0] rvx_signal_02;
wire [RVX_LPARA_2-1:0] rvx_signal_11;

wire [BW_PARTIAL_WRITE-1:0] rvx_signal_15 [RVX_LPARA_2-1:0];
wire [BW_PARTIAL_WRITE-1:0] rvx_signal_16 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_4-1:0] rvx_signal_13;
wire [RVX_LPARA_0-1:0] rvx_signal_08;

wire [RVX_LPARA_2-1:0] rvx_signal_14;
wire [RVX_LPARA_2-1:0] rvx_signal_05;
wire rvx_signal_10;

wire [RVX_LPARA_1-1:0] rvx_signal_12;
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire rvx_signal_09;

localparam  RVX_LPARA_3 = REQUIRED_BITWIDTH_INDEX(DEPTH)+1;

wire [RVX_LPARA_3-1:0] rvx_signal_00 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_01 [RVX_LPARA_2-1:0];

generate
for(i=0; i<RVX_LPARA_2; i=i+1)
begin : i_generate_fifo
	ERVP_ASYNCH_FIFO
	#(
		.BW_DATA(BW_PARTIAL_WRITE),
		.DEPTH(DEPTH)
	)
	i_rvx_instance_0
	(
		.wclk(wclk),
		.wrstnn(wrstnn),
		.wready(rvx_signal_06[i]),		
		.wrequest(rvx_signal_03[i]),
		.wdata(rvx_signal_15[i]),
		.wnum(rvx_signal_00[i]),
		.wfull(rvx_signal_04[i]),

		.rclk(rclk),
		.rrstnn(rrstnn),
		.rready(rvx_signal_17[i]),
		.rrequest(rvx_signal_02[i]),
		.rdata(rvx_signal_16[i]),
		.rnum(rvx_signal_01[i]),
		.rempty(rvx_signal_11[i])
	);
	assign rvx_signal_15[i] = wdata;
	assign rvx_signal_13[(i+1)*BW_PARTIAL_WRITE-1-:BW_PARTIAL_WRITE] = rvx_signal_16[i];
end
endgenerate
assign rvx_signal_08 = $unsigned(rvx_signal_13);

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_2),
	.CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(wclk),
	.rstnn(wrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_10),
	.value(rvx_signal_14),
	.is_first_count(wstartindex),
	.is_last_count(wlastindex)
);

assign rvx_signal_05 = (RVX_LPARA_2==1)? 1 : rvx_signal_14;
assign wready = ((rvx_signal_05 & rvx_signal_06)!=0);
assign wfull = ((rvx_signal_05 & rvx_signal_04)!=0);
assign rvx_signal_03 = wrequest? rvx_signal_05 : 0;
assign rvx_signal_10 = wready & wrequest;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_1),
	.CIRCULAR(1)
)
i_rvx_instance_2
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_09),
	.value(rvx_signal_12),
	.is_first_count(rstartindex),
	.is_last_count(rlastindex)
);

assign rvx_signal_07 = (RVX_LPARA_1==1)? 1 : rvx_signal_12;
assign rready = `IS_ALL_ONE(rvx_signal_17);
assign rempty = (rvx_signal_11!=0);
assign rvx_signal_02 = (rvx_signal_09 & rvx_signal_07[RVX_LPARA_1-1])? `ALL_ONE : 0;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_PARTIAL_READ),
  .NUM_DATA(RVX_LPARA_1),
  .ACTIVE_HIGH(1)
)
i_rvx_instance_3
(
	.data_input_list(rvx_signal_08),
	.select(rvx_signal_07),
	.data_output(rdata)
);

assign rvx_signal_09 = rready & rrequest;

assign wnum = rvx_signal_00[0];
assign rnum = rvx_signal_01[RVX_LPARA_2-1] - (rvx_signal_07[0]? 0 : 1);

endmodule
