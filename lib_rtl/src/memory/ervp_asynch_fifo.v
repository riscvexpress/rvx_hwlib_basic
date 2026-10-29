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



module ERVP_ASYNCH_FIFO
(
	wclk,
	wrstnn,
	wready,
	wrequest,
	wfull,
	wdata,
	wnum,
	rclk,
	rrstnn,
	rready,
	rrequest,
	rempty,
	rdata,
	rnum
);



parameter BW_DATA = 1;
parameter DEPTH = 1;
parameter WRITE_READY_SIZE = 1;
parameter NO_DATA = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(DEPTH);
localparam  RVX_LPARA_0 = 1<<RVX_LPARA_1;

input wire wclk, wrstnn;
output wire [WRITE_READY_SIZE-1:0] wready;
input wire wrequest;
output wire wfull;
input wire [BW_DATA-1:0] wdata;
output reg [RVX_LPARA_1:0] wnum;

input wire rclk, rrstnn;
output wire rready;
output reg rempty;
input wire rrequest;
output wire [BW_DATA-1:0] rdata;
output wire [RVX_LPARA_1:0] rnum;

integer j, k, m;

reg [BW_DATA-1:0] rvx_signal_00 [0:RVX_LPARA_0-1];

wire [RVX_LPARA_1-1:0] rvx_signal_07, rvx_signal_08;
reg [RVX_LPARA_1:0] rvx_signal_04, rvx_signal_05;
reg [RVX_LPARA_1:0] rvx_signal_15, rvx_signal_09;

wire [RVX_LPARA_1:0] rvx_signal_12;
wire [RVX_LPARA_1:0] rvx_signal_10;

wire [RVX_LPARA_1:0] rvx_signal_06, rvx_signal_13;
wire [RVX_LPARA_1:0] rvx_signal_03, rvx_signal_11;
reg [RVX_LPARA_1:0] rvx_signal_14;
reg [WRITE_READY_SIZE-1:0] rvx_signal_01;
reg [RVX_LPARA_1:0] rvx_signal_02;

assign rdata = (NO_DATA==1)? 0 : rvx_signal_00 [rvx_signal_08];

always @(posedge wclk, negedge wrstnn)
begin
	if(wrstnn==0)
		for (j=0; j<RVX_LPARA_0; j=j+1)
			rvx_signal_00[j] <= 0;
	else if (wrequest && !wfull)
		rvx_signal_00[rvx_signal_07] <= wdata;
end
	
ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1+1)
)
i_rvx_instance_1
(
	.clk(wclk),
	.rstnn(wrstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_15),
	.synch_value(rvx_signal_12)
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1+1)
)
i_rvx_instance_0
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_04),
	.synch_value(rvx_signal_10)
);

always @(posedge rclk or negedge rrstnn)
begin
	if (!rrstnn)
		{rvx_signal_09, rvx_signal_15} <= 0;
	else
		{rvx_signal_09, rvx_signal_15} <= {rvx_signal_13, rvx_signal_06};
end

assign rvx_signal_08 = rvx_signal_09[RVX_LPARA_1-1:0];
assign rvx_signal_13 = rvx_signal_09 + (rrequest & ~rempty);
assign rvx_signal_06 = `BINARY2GRAY(rvx_signal_13);

always @(posedge rclk or negedge rrstnn)
begin
	if (!rrstnn)
		rempty <= 1'b1;
	else
		rempty <= (rvx_signal_06 == rvx_signal_10);
end

assign rready = ~rempty;

always @(posedge wclk or negedge wrstnn)
begin
	if (!wrstnn)
		{rvx_signal_05, rvx_signal_04} <= 0;
	else
		{rvx_signal_05, rvx_signal_04} <= {rvx_signal_11, rvx_signal_03};
end

assign rvx_signal_07 = rvx_signal_05[RVX_LPARA_1-1:0];
assign rvx_signal_11 = rvx_signal_05 + (wrequest & ~wfull);
assign rvx_signal_03 = `BINARY2GRAY(rvx_signal_11);

always@(*)
begin
	rvx_signal_14[RVX_LPARA_1] = rvx_signal_12[RVX_LPARA_1];
	for(k=RVX_LPARA_1-1; k>=0; k=k-1)
		rvx_signal_14[k] = rvx_signal_14[k+1] ^ rvx_signal_12[k];
end

always @(posedge wclk or negedge wrstnn)
begin
	if (!wrstnn)
		wnum <= DEPTH;
	else
		wnum <= DEPTH - (rvx_signal_11 - rvx_signal_14);
end

assign wfull = (wnum==0);

always@(*)
begin
	rvx_signal_01 = 0;
	for(j=0; j<WRITE_READY_SIZE; j=j+1)
		rvx_signal_01[j] = (wnum > j);
end

assign wready = rvx_signal_01;

always@(*)
begin
	rvx_signal_02[RVX_LPARA_1] = rvx_signal_10[RVX_LPARA_1];
	for(m=RVX_LPARA_1-1; m>=0; m=m-1)
		rvx_signal_02[m] = rvx_signal_02[m+1] ^ rvx_signal_10[m];
end

assign rnum = rvx_signal_02 - rvx_signal_09;

endmodule

