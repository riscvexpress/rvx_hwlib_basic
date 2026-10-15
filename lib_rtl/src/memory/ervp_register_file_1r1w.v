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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"



module ERVP_REGISTER_FILE_1R1W
(
	clk,
	rstnn,

	index,
	
	windex,
	wenable,
	wpermit,
	wdata,

	rindex,
	rdata_list_asynch,
	rdata_asynch,
	renable,
	rdata_synch
);



parameter DEPTH = 2;
parameter WIDTH = 2;
parameter BW_INDEX = 1;
parameter USE_SINGLE_INDEX = 0;
parameter BW_SUBWORD = WIDTH;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_3 = `DIVIDERU(WIDTH,BW_SUBWORD);
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(DEPTH);
localparam  RVX_LPARA_2 = RVX_LPARA_3*BW_SUBWORD;
localparam  RVX_LPARA_0 = (2**RVX_LPARA_1);

parameter BW_SELECT = RVX_LPARA_3;

input wire clk, rstnn;

input wire [BW_INDEX-1:0] index;

input wire [BW_INDEX-1:0] windex;
input wire wenable;
input wire [BW_SELECT-1:0] wpermit;
input wire [WIDTH-1:0] wdata;

input wire [BW_INDEX-1:0] rindex;
output wire [WIDTH*DEPTH-1:0] rdata_list_asynch;
output wire [WIDTH-1:0] rdata_asynch;
input wire renable;
output reg [WIDTH-1:0] rdata_synch;

genvar i;
integer j;

reg [RVX_LPARA_2-1:0] rvx_signal_1 [0:RVX_LPARA_0-1];
wire [RVX_LPARA_1-1:0] rvx_signal_2, rvx_signal_5;
wire [RVX_LPARA_3-1:0] rvx_signal_0;	
wire [RVX_LPARA_2-1:0] rvx_signal_3;

wire [WIDTH*RVX_LPARA_0-1:0] rvx_signal_4;

assign rvx_signal_2 = (USE_SINGLE_INDEX==1)? $unsigned(index) : $unsigned(windex);
assign rvx_signal_5 = (USE_SINGLE_INDEX==1)? $unsigned(index) : $unsigned(rindex);

assign rvx_signal_0 = (wenable)? $unsigned(wpermit) : 0;

assign rvx_signal_3 = $unsigned(wdata);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin : i_write_byte
		always@(posedge clk or negedge rstnn)
		begin
			if(rstnn==0)
				for (j=0; j<RVX_LPARA_0; j=j+1)
					rvx_signal_1[j][BW_SUBWORD*(i+1)-1-:BW_SUBWORD] <= 0;
			else if(rvx_signal_0[i])
				rvx_signal_1[rvx_signal_2][BW_SUBWORD*(i+1)-1-:BW_SUBWORD] <= rvx_signal_3[BW_SUBWORD*(i+1)-1-:BW_SUBWORD];
		end
	end
endgenerate

generate
	for (i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_concatenation
		assign rvx_signal_4[WIDTH*(i+1)-1 -:WIDTH] = (i<DEPTH)? rvx_signal_1[i] : 0;
	end
endgenerate

assign rdata_list_asynch = rvx_signal_4;

ERVP_MUX
#(
	.BW_DATA(WIDTH),
	.NUM_DATA(RVX_LPARA_0),
	.LOWER_INDEX_TO_UPPER_DATA(0)
)
i_rvx_instance_0
(
	.data_input_list(rvx_signal_4),
	.select(rvx_signal_5),
	.data_output(rdata_asynch)
);

always@(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
		rdata_synch <= 0;
	else if(renable)
		rdata_synch <= rdata_asynch;
end

endmodule
