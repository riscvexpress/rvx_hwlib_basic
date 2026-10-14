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



module ERVP_FIFO
(
	clk,
  rstnn,
	clear,
	enable,
	wready,
	wfull,
	wrequest,
	wdata,
	wnum,
	rready,
	rempty,
	rrequest,
	rdata,
	rnum
);



parameter BW_DATA = 1;
parameter DEPTH = 1;
parameter BW_NUM_DATA = 32;
parameter READ_READY_SIZE = 1;
parameter WRITE_READY_SIZE = 1;
parameter STREAM = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(DEPTH);
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_UNSIGNED(DEPTH);

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

output reg [WRITE_READY_SIZE-1:0] wready;
input wire wrequest;
output wire wfull;
input wire [BW_DATA-1:0] wdata;
output wire [BW_NUM_DATA-1:0] wnum;

output reg [READ_READY_SIZE-1:0] rready;
input wire rrequest;
output wire rempty;
output wire [BW_DATA-1:0] rdata;
output wire [BW_NUM_DATA-1:0] rnum;

genvar i;
integer j;

reg [BW_DATA-1:0] rvx_signal_6 [DEPTH-1:0];
wire [BW_DATA*DEPTH-1:0] rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_1, rvx_signal_7;
wire rvx_signal_5, rvx_signal_4;

wire [RVX_LPARA_1-1:0] rvx_signal_2;

wire rvx_signal_3;

ERVP_UPDOWN_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_1),
	.BW_COUNT_AMOUNT(2),
	.UPPER_LIMIT_NUMBER(DEPTH),
	.LOWER_LIMIT_NUMBER(0)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.up(rvx_signal_4),
	.down(rvx_signal_5),
	.count_amount(2'b 1),
	.value(rvx_signal_2),
	.is_upper_limit(),
	.is_lower_limit()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.LAST_NUMBER(DEPTH-1),
	.CIRCULAR(1)
)
i_rvx_instance_3
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_4),
	.value(rvx_signal_7),
	.is_first_count(),
	.is_last_count()
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		for (j=0; j<DEPTH; j=j+1)
			rvx_signal_6[j] <= 0;
	else if(enable && rvx_signal_4)
		rvx_signal_6[rvx_signal_7] <= wdata;
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.LAST_NUMBER(DEPTH-1),
	.CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable),
	.init(clear),
	.count(rvx_signal_5),
	.value(rvx_signal_1),
	.is_first_count(),
	.is_last_count()
);

generate
	for(i=0; i<DEPTH; i=i+1)
	begin : i_concatenation
		assign rvx_signal_0[BW_DATA*(i+1)-1-:BW_DATA] = rvx_signal_6[i];
	end
endgenerate

ERVP_MUX
#(
	.BW_DATA(BW_DATA),
	.NUM_DATA(DEPTH)
)
i_rvx_instance_2
(
	.data_input_list(rvx_signal_0),
	.select(rvx_signal_1),
	.data_output(rdata)
);

always@(*)
begin
	wready = 0;
	for(j=0; j<WRITE_READY_SIZE; j=j+1)
		if(j<DEPTH)
			wready[j] = (~clear) & ($unsigned(rvx_signal_2)<(DEPTH-j));
end

assign wfull = ~wready[0];
assign rvx_signal_4 = wrequest & (wready[0] | rvx_signal_3);

always@(*)
begin
	rready = 0;
	for(j=0; j<READ_READY_SIZE; j=j+1)
		if(j<DEPTH)
			rready[j] = ($unsigned(rvx_signal_2)>j);
end

assign rempty = ~rready[0];
assign rvx_signal_5 = (rrequest & rready[0]) | rvx_signal_3;

assign wnum = DEPTH - rvx_signal_2;
assign rnum = rvx_signal_2;

assign rvx_signal_3 = (STREAM==1) & wfull & wrequest;

endmodule
