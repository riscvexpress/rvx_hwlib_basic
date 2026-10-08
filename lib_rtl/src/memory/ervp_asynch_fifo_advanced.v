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

localparam  RVX_LPARA_03 = `DIVIDERU(BW_DATA, BW_PARTIAL_WRITE);
localparam  RVX_LPARA_10 = RVX_LPARA_03 * BW_PARTIAL_WRITE;
localparam  RVX_LPARA_05 = `DIVIDERU(BW_DATA, BW_PARTIAL_READ);
localparam  RVX_LPARA_08 = RVX_LPARA_05 * BW_PARTIAL_READ;

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

wire [RVX_LPARA_03-1:0] rvx_signal_37;
wire [RVX_LPARA_03-1:0] rvx_signal_42;
wire [RVX_LPARA_03-1:0] rvx_signal_32;

wire [RVX_LPARA_03-1:0] rvx_signal_47;
wire [RVX_LPARA_03-1:0] rvx_signal_16;
wire [RVX_LPARA_03-1:0] rvx_signal_02;

wire [BW_PARTIAL_WRITE-1:0] rvx_signal_35 [RVX_LPARA_03-1:0];
wire [BW_PARTIAL_WRITE-1:0] rvx_signal_30 [RVX_LPARA_03-1:0];
wire [RVX_LPARA_10-1:0] rvx_signal_33;
wire [RVX_LPARA_08-1:0] rvx_signal_03;

wire [RVX_LPARA_03-1:0] rvx_signal_45;
wire [RVX_LPARA_03-1:0] rvx_signal_29;
wire rvx_signal_20;

wire [RVX_LPARA_05-1:0] rvx_signal_13;
wire [RVX_LPARA_05-1:0] rvx_signal_44;
wire rvx_signal_06;

localparam  RVX_LPARA_00 = REQUIRED_BITWIDTH_SIGNED(DEPTH)+1;
localparam  RVX_LPARA_01 = 0;

wire rvx_signal_14;
wire rvx_signal_28;
wire [RVX_LPARA_00-1:0] rvx_signal_38;
wire [RVX_LPARA_00-1:0] rvx_signal_25;

localparam  RVX_LPARA_02 = 1;
localparam  RVX_LPARA_09 = DEPTH;

wire rvx_signal_34;
wire rvx_signal_21;
wire rvx_signal_40;
wire rvx_signal_04;
wire rvx_signal_11;
wire [RVX_LPARA_02-1:0] rvx_signal_07;

wire rvx_signal_43;
wire rvx_signal_41;
wire rvx_signal_24;
wire rvx_signal_01;
wire rvx_signal_26;
wire [RVX_LPARA_02-1:0] rvx_signal_15;

localparam  RVX_LPARA_04 = REQUIRED_BITWIDTH_SIGNED(DEPTH)+1;
localparam  RVX_LPARA_06 = DEPTH;

wire rvx_signal_22;
wire rvx_signal_00;
wire [RVX_LPARA_04-1:0] rvx_signal_10;
wire [RVX_LPARA_04-1:0] rvx_signal_19;

localparam  RVX_LPARA_11 = 1;
localparam  RVX_LPARA_07 = DEPTH;

wire rvx_signal_08;
wire rvx_signal_18;
wire rvx_signal_17;
wire rvx_signal_27;
wire rvx_signal_12;
wire [RVX_LPARA_11-1:0] rvx_signal_39;

wire rvx_signal_09;
wire rvx_signal_36;
wire rvx_signal_31;
wire rvx_signal_05;
wire rvx_signal_46;
wire [RVX_LPARA_11-1:0] rvx_signal_23;

generate
for(i=0; i<RVX_LPARA_03; i=i+1)
begin : i_generate_fifo
	ERVP_ASYNCH_FIFO
	#(
		.BW_DATA(BW_PARTIAL_WRITE),
		.DEPTH(DEPTH)
	)
	i_rvx_instance_2
	(
		.wclk(wclk),
		.wrstnn(wrstnn),
		.wready(rvx_signal_37[i]),		
		.wrequest(rvx_signal_42[i]),
		.wdata(rvx_signal_35[i]),
		.wfull(rvx_signal_32[i]),

		.rclk(rclk),
		.rrstnn(rrstnn),
		.rready(rvx_signal_47[i]),
		.rrequest(rvx_signal_16[i]),
		.rdata(rvx_signal_30[i]),
		.rempty(rvx_signal_02[i])
	);
	assign rvx_signal_35[i] = wdata;
	assign rvx_signal_33[(i+1)*BW_PARTIAL_WRITE-1-:BW_PARTIAL_WRITE] = rvx_signal_30[i];
end
endgenerate
assign rvx_signal_03 = $unsigned(rvx_signal_33);

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_03),
	.CIRCULAR(1)
)
i_rvx_instance_3
(
	.clk(wclk),
	.rstnn(wrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_20),
	.value(rvx_signal_45),
	.is_first_count(wstartindex),
	.is_last_count(wlastindex)
);

assign rvx_signal_29 = (RVX_LPARA_03==1)? 1 : rvx_signal_45;
assign wready = ((rvx_signal_29 & rvx_signal_37)!=0);
assign wfull = ((rvx_signal_29 & rvx_signal_32)!=0);
assign rvx_signal_42 = wrequest? rvx_signal_29 : 0;
assign rvx_signal_20 = wready & wrequest;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(RVX_LPARA_05),
	.CIRCULAR(1)
)
i_rvx_instance_6
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_06),
	.value(rvx_signal_13),
	.is_first_count(rstartindex),
	.is_last_count(rlastindex)
);

assign rvx_signal_44 = (RVX_LPARA_05==1)? 1 : rvx_signal_13;
assign rready = `IS_ALL_ONE(rvx_signal_47);
assign rempty = (rvx_signal_02!=0);
assign rvx_signal_16 = (rvx_signal_06 & rvx_signal_44[RVX_LPARA_05-1])? `ALL_ONE : 0;

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_PARTIAL_READ),
  .NUM_DATA(RVX_LPARA_05),
  .ACTIVE_HIGH(1)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_03),
	.select(rvx_signal_44),
	.data_output(rdata)
);

assign rvx_signal_06 = rready & rrequest;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_00),
  .RESET_NUMBER(RVX_LPARA_01),
  .UNSIGNED(0)
)
i_rvx_instance_7
(
	.clk(rclk),
  .rstnn(rrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.up(rvx_signal_14),
	.down(rvx_signal_28),
	.count_amount(rvx_signal_38),
	.value(rvx_signal_25),
	.is_upper_limit(),
	.is_lower_limit()
);

assign rvx_signal_14 = rvx_signal_24;
assign rvx_signal_28 = rstartindex & rvx_signal_06;
assign rvx_signal_38 = 1;
assign rnum = rvx_signal_25;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_02),
  .DEPTH(RVX_LPARA_09)
)
i_rvx_instance_4
(
  .wclk(rvx_signal_34),
  .wrstnn(rvx_signal_21),
  .wready(rvx_signal_40),
  .wfull(rvx_signal_04),
  .wrequest(rvx_signal_11),
  .wdata(rvx_signal_07),  

  .rclk(rvx_signal_43),
  .rrstnn(rvx_signal_41),
  .rready(rvx_signal_24),
  .rempty(rvx_signal_01),
  .rrequest(rvx_signal_26),
  .rdata(rvx_signal_15)
);

assign rvx_signal_34 = wclk;
assign rvx_signal_21 = wrstnn;
assign rvx_signal_11 = wstartindex & rvx_signal_20;
assign rvx_signal_07 = 0;

assign rvx_signal_43 = rclk;
assign rvx_signal_41 = rrstnn;
assign rvx_signal_26 = rvx_signal_14;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_04),
  .RESET_NUMBER(RVX_LPARA_06),
  .UNSIGNED(0)
)
i_rvx_instance_0
(
	.clk(wclk),
  .rstnn(wrstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.up(rvx_signal_22),
	.down(rvx_signal_00),
	.count_amount(rvx_signal_10),
	.value(rvx_signal_19),
	.is_upper_limit(),
	.is_lower_limit()
);

assign rvx_signal_22 = rvx_signal_31; 
assign rvx_signal_00 = wstartindex & rvx_signal_20;
assign rvx_signal_10 = 1;
assign wnum = rvx_signal_19;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_11),
  .DEPTH(RVX_LPARA_07)
)
i_rvx_instance_5
(
  .wclk(rvx_signal_08),
  .wrstnn(rvx_signal_18),
  .wready(rvx_signal_17),
  .wfull(rvx_signal_27),
  .wrequest(rvx_signal_12),
  .wdata(rvx_signal_39),  

  .rclk(rvx_signal_09),
  .rrstnn(rvx_signal_36),
  .rready(rvx_signal_31),
  .rempty(rvx_signal_05),
  .rrequest(rvx_signal_46),
  .rdata(rvx_signal_23)
);

assign rvx_signal_08 = rclk;
assign rvx_signal_18 = rrstnn;
assign rvx_signal_12 = rstartindex & rvx_signal_06;
assign rvx_signal_39 = 0;

assign rvx_signal_09 = wclk;
assign rvx_signal_36 = wrstnn;
assign rvx_signal_46 = rvx_signal_22;

endmodule
