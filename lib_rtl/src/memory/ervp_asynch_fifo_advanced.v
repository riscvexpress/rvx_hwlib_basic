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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"



module ERVP_ASYNCH_FIFO_ADVANCED
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

localparam  RVX_LPARA_01 = `DIVIDERU(BW_DATA, BW_PARTIAL_WRITE);
localparam  RVX_LPARA_06 = RVX_LPARA_01 * BW_PARTIAL_WRITE;
localparam  RVX_LPARA_09 = `DIVIDERU(BW_DATA, BW_PARTIAL_READ);
localparam  RVX_LPARA_07 = RVX_LPARA_09 * BW_PARTIAL_READ;

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

wire [RVX_LPARA_01-1:0] rvx_signal_39;
wire [RVX_LPARA_01-1:0] rvx_signal_42;
wire [RVX_LPARA_01-1:0] rvx_signal_02;

wire [RVX_LPARA_01-1:0] rvx_signal_06;
wire [RVX_LPARA_01-1:0] rvx_signal_22;
wire [RVX_LPARA_01-1:0] rvx_signal_47;

wire [BW_PARTIAL_WRITE-1:0] rvx_signal_27 [RVX_LPARA_01-1:0];
wire [BW_PARTIAL_WRITE-1:0] rvx_signal_28 [RVX_LPARA_01-1:0];
wire [RVX_LPARA_06-1:0] rvx_signal_24;
wire [RVX_LPARA_07-1:0] rvx_signal_34;

wire [RVX_LPARA_01-1:0] rvx_signal_09;
wire [RVX_LPARA_01-1:0] rvx_signal_43;
wire rvx_signal_19;

wire [RVX_LPARA_09-1:0] rvx_signal_45;
wire [RVX_LPARA_09-1:0] rvx_signal_04;
wire rvx_signal_00;

localparam  RVX_LPARA_11 = REQUIRED_BITWIDTH_SIGNED(DEPTH)+1;
localparam  RVX_LPARA_08 = 0;

wire rvx_signal_11;
wire rvx_signal_16;
wire [RVX_LPARA_11-1:0] rvx_signal_36;
wire [RVX_LPARA_11-1:0] rvx_signal_32;

localparam  RVX_LPARA_10 = 1;
localparam  RVX_LPARA_05 = DEPTH;

wire rvx_signal_29;
wire rvx_signal_15;
wire rvx_signal_14;
wire rvx_signal_46;
wire rvx_signal_23;
wire [RVX_LPARA_10-1:0] rvx_signal_44;

wire rvx_signal_38;
wire rvx_signal_07;
wire rvx_signal_05;
wire rvx_signal_25;
wire rvx_signal_03;
wire [RVX_LPARA_10-1:0] rvx_signal_13;

localparam  RVX_LPARA_03 = REQUIRED_BITWIDTH_SIGNED(DEPTH)+1;
localparam  RVX_LPARA_02 = DEPTH;

wire rvx_signal_01;
wire rvx_signal_17;
wire [RVX_LPARA_03-1:0] rvx_signal_10;
wire [RVX_LPARA_03-1:0] rvx_signal_35;

localparam  RVX_LPARA_00 = 1;
localparam  RVX_LPARA_04 = DEPTH;

wire rvx_signal_41;
wire rvx_signal_33;
wire rvx_signal_12;
wire rvx_signal_21;
wire rvx_signal_40;
wire [RVX_LPARA_00-1:0] rvx_signal_18;

wire rvx_signal_08;
wire rvx_signal_26;
wire rvx_signal_31;
wire rvx_signal_37;
wire rvx_signal_20;
wire [RVX_LPARA_00-1:0] rvx_signal_30;

generate
for(i=0; i<RVX_LPARA_01; i=i+1)
begin : i_generate_fifo
	ERVP_ASYNCH_FIFO
	#(
		.BW_DATA(BW_PARTIAL_WRITE),
		.DEPTH(DEPTH)
	)
	i_rvx_instance_1
	(
		.wclk(wclk),
		.wrstnn(wrstnn),
		.wready(rvx_signal_39[i]),		
		.wrequest(rvx_signal_42[i]),
		.wdata(rvx_signal_27[i]),
		.wfull(rvx_signal_02[i]),

		.rclk(rclk),
		.rrstnn(rrstnn),
		.rready(rvx_signal_06[i]),
		.rrequest(rvx_signal_22[i]),
		.rdata(rvx_signal_28[i]),
		.rempty(rvx_signal_47[i])
	);
	assign rvx_signal_27[i] = wdata;
	assign rvx_signal_24[(i+1)*BW_PARTIAL_WRITE-1-:BW_PARTIAL_WRITE] = rvx_signal_28[i];
end
endgenerate
assign rvx_signal_34 = $unsigned(rvx_signal_24);

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_01),
	.CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(wclk),
	.rstnn(wrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_19),
	.value(rvx_signal_09),
	.is_first_count(wstartindex),
	.is_last_count(wlastindex)
);

assign rvx_signal_43 = (RVX_LPARA_01==1)? 1 : rvx_signal_09;
assign wready = ((rvx_signal_43 & rvx_signal_39)!=0);
assign wfull = ((rvx_signal_43 & rvx_signal_02)!=0);
assign rvx_signal_42 = wrequest? rvx_signal_43 : 0;
assign rvx_signal_19 = wready & wrequest;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_09),
	.CIRCULAR(1)
)
i_rvx_instance_2
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_00),
	.value(rvx_signal_45),
	.is_first_count(rstartindex),
	.is_last_count(rlastindex)
);

assign rvx_signal_04 = (RVX_LPARA_09==1)? 1 : rvx_signal_45;
assign rready = `IS_ALL_ONE(rvx_signal_06);
assign rempty = (rvx_signal_47!=0);
assign rvx_signal_22 = (rvx_signal_00 & rvx_signal_04[RVX_LPARA_09-1])? `ALL_ONE : 0;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_PARTIAL_READ),
  .NUM_DATA(RVX_LPARA_09),
  .ACTIVE_HIGH(1)
)
i_rvx_instance_6
(
	.data_input_list(rvx_signal_34),
	.select(rvx_signal_04),
	.data_output(rdata)
);

assign rvx_signal_00 = rready & rrequest;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_11),
  .RESET_NUMBER(RVX_LPARA_08),
  .UNSIGNED(0)
)
i_rvx_instance_5
(
	.clk(rclk),
  .rstnn(rrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.up(rvx_signal_11),
	.down(rvx_signal_16),
	.count_amount(rvx_signal_36),
	.value(rvx_signal_32),
	.is_upper_limit(),
	.is_lower_limit()
);

assign rvx_signal_11 = rvx_signal_05;
assign rvx_signal_16 = rstartindex & rvx_signal_00;
assign rvx_signal_36 = 1;
assign rnum = rvx_signal_32;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_10),
  .DEPTH(RVX_LPARA_05)
)
i_rvx_instance_3
(
  .wclk(rvx_signal_29),
  .wrstnn(rvx_signal_15),
  .wready(rvx_signal_14),
  .wfull(rvx_signal_46),
  .wrequest(rvx_signal_23),
  .wdata(rvx_signal_44),  

  .rclk(rvx_signal_38),
  .rrstnn(rvx_signal_07),
  .rready(rvx_signal_05),
  .rempty(rvx_signal_25),
  .rrequest(rvx_signal_03),
  .rdata(rvx_signal_13)
);

assign rvx_signal_29 = wclk;
assign rvx_signal_15 = wrstnn;
assign rvx_signal_23 = wstartindex & rvx_signal_19;
assign rvx_signal_44 = 0;

assign rvx_signal_38 = rclk;
assign rvx_signal_07 = rrstnn;
assign rvx_signal_03 = rvx_signal_11;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_03),
  .RESET_NUMBER(RVX_LPARA_02),
  .UNSIGNED(0)
)
i_rvx_instance_4
(
	.clk(wclk),
  .rstnn(wrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.up(rvx_signal_01),
	.down(rvx_signal_17),
	.count_amount(rvx_signal_10),
	.value(rvx_signal_35),
	.is_upper_limit(),
	.is_lower_limit()
);

assign rvx_signal_01 = rvx_signal_31; 
assign rvx_signal_17 = wstartindex & rvx_signal_19;
assign rvx_signal_10 = 1;
assign wnum = rvx_signal_35;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_04)
)
i_rvx_instance_7
(
  .wclk(rvx_signal_41),
  .wrstnn(rvx_signal_33),
  .wready(rvx_signal_12),
  .wfull(rvx_signal_21),
  .wrequest(rvx_signal_40),
  .wdata(rvx_signal_18),  

  .rclk(rvx_signal_08),
  .rrstnn(rvx_signal_26),
  .rready(rvx_signal_31),
  .rempty(rvx_signal_37),
  .rrequest(rvx_signal_20),
  .rdata(rvx_signal_30)
);

assign rvx_signal_41 = rclk;
assign rvx_signal_33 = rrstnn;
assign rvx_signal_40 = rstartindex & rvx_signal_00;
assign rvx_signal_18 = 0;

assign rvx_signal_08 = wclk;
assign rvx_signal_26 = wrstnn;
assign rvx_signal_20 = rvx_signal_01;

endmodule
