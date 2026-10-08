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



module ERVP_PIPELINED_MULTIPLIER
(
  clk,
  rstnn,
  enable,
  stall,

  input_wvalid,
  input_wready,
  input_left,
  input_right,

  output_rvalid,
  output_rready,
  output_result,
  output_upper,
  output_lower
);



parameter BW_INPUT = 32;
parameter BW_OUTPUT = 32;
parameter BW_LOWER = BW_OUTPUT>>1;
parameter USE_LIBRARY = 1;

localparam  RVX_LPARA_2 = 2*BW_INPUT;
localparam  RVX_LPARA_5 = RVX_LPARA_2-BW_LOWER;

input wire clk;
input wire rstnn;
input wire enable;
input wire stall;

input wire input_wvalid;
output wire input_wready;
input wire [BW_INPUT-1:0] input_left;
input wire [BW_INPUT-1:0] input_right;

output wire output_rvalid;
input wire output_rready;
output wire [BW_OUTPUT-1:0] output_result;
output wire [RVX_LPARA_5-1:0] output_upper;
output wire [BW_LOWER-1:0] output_lower;

localparam  RVX_LPARA_3 = (BW_INPUT+1)>>1;
localparam  RVX_LPARA_0 = BW_INPUT-RVX_LPARA_3;

localparam  RVX_LPARA_6 = (RVX_LPARA_3+1)>>1;
localparam  RVX_LPARA_1 = RVX_LPARA_3 - RVX_LPARA_6;
localparam  RVX_LPARA_7 = (RVX_LPARA_0+1)>>1;
localparam  RVX_LPARA_4 = RVX_LPARA_0 - RVX_LPARA_7;

wire rvx_signal_13;
wire rvx_signal_12;
wire rvx_signal_16;

wire [RVX_LPARA_6-1:0] rvx_signal_04;
wire [RVX_LPARA_1-1:0] rvx_signal_07;
wire [RVX_LPARA_7-1:0] rvx_signal_02;
wire [RVX_LPARA_4-1:0] rvx_signal_15;

wire [BW_INPUT+RVX_LPARA_6+1-1:0] rvx_signal_18;
wire [BW_INPUT+RVX_LPARA_1+1-1:0] rvx_signal_22;
wire [BW_INPUT+RVX_LPARA_7+1-1:0] rvx_signal_08;
wire [BW_INPUT+RVX_LPARA_4-1:0] rvx_signal_21;

wire rvx_signal_06;
reg rvx_signal_10;
wire rvx_signal_20;
reg [BW_INPUT+RVX_LPARA_6+1-1:0] rvx_signal_17;
reg [BW_INPUT+RVX_LPARA_1+1-1:0] rvx_signal_00;
reg [BW_INPUT+RVX_LPARA_7+1-1:0] rvx_signal_19;
reg [BW_INPUT+RVX_LPARA_4-1:0] rvx_signal_03;

wire [RVX_LPARA_2-1:0] rvx_signal_09;
wire [RVX_LPARA_2-1:0] rvx_signal_11;
wire [RVX_LPARA_2-1:0] rvx_signal_14;
wire [RVX_LPARA_2-1:0] rvx_signal_01;
wire [RVX_LPARA_2-1:0] rvx_signal_05;

assign input_wready = rvx_signal_16;

assign rvx_signal_13 = rvx_signal_12 & rvx_signal_16;
assign rvx_signal_12 = input_wvalid;
assign rvx_signal_16 = (~stall) & (rvx_signal_10? rvx_signal_20 : 1);

assign {rvx_signal_15,rvx_signal_02,rvx_signal_07,rvx_signal_04} = input_right;

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_6+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_0
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_04}),
  .product(rvx_signal_18)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_1+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_2
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_07}),
  .product(rvx_signal_22)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_7+1),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_3
(
  .multiplicand(input_left),
  .multiplier({1'b0,rvx_signal_02}),
  .product(rvx_signal_08)
);

ERVP_MULTIPLIER
#(
  .BW_MULTIPLICAND(BW_INPUT),
  .BW_MULTIPLIER(RVX_LPARA_4),
  .USE_LIBRARY(USE_LIBRARY)
)
i_rvx_instance_1
(
  .multiplicand(input_left),
  .multiplier(rvx_signal_15),
  .product(rvx_signal_21)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_10 <= 0;
  else if(enable)
  begin
    if(rvx_signal_13)
      rvx_signal_10 <= 1;
    else if(rvx_signal_06)
      rvx_signal_10 <= 0;
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_17 <= 0;
    rvx_signal_00 <= 0;
    rvx_signal_19 <= 0;
    rvx_signal_03 <= 0;
  end
  else if(enable && rvx_signal_13)
  begin
    rvx_signal_17 <= rvx_signal_18;
    rvx_signal_00 <= rvx_signal_22;
    rvx_signal_19 <= rvx_signal_08;
    rvx_signal_03 <= rvx_signal_21;
  end
end

assign rvx_signal_06 = rvx_signal_10 & rvx_signal_20;
assign rvx_signal_20 = (~stall) & output_rready;

assign rvx_signal_09 = $signed(rvx_signal_17);
assign rvx_signal_11 = $signed(rvx_signal_00) << RVX_LPARA_6;
assign rvx_signal_14 = $signed(rvx_signal_19) << (RVX_LPARA_6+RVX_LPARA_1);
assign rvx_signal_01 = $signed(rvx_signal_03) << (RVX_LPARA_6+RVX_LPARA_1+RVX_LPARA_7);

assign rvx_signal_05 = rvx_signal_09 + rvx_signal_11 + rvx_signal_14 + rvx_signal_01;

assign output_rvalid = rvx_signal_10;
assign output_result = rvx_signal_05;
assign {output_upper,output_lower} = rvx_signal_05;

endmodule
