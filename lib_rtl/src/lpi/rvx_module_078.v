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
`include "ervp_axi_define.vh"





module RVX_MODULE_078
(
	rvx_port_05,
	rvx_port_00,
  rvx_port_13,
  rvx_port_23,

  rvx_port_21,
  rvx_port_08,
  rvx_port_03,
  rvx_port_22,
  rvx_port_16,
  rvx_port_19,

  rvx_port_02,
  rvx_port_24,
  rvx_port_18,
  rvx_port_17,
  rvx_port_11,

  rvx_port_14,
	rvx_port_12,
	rvx_port_06,
	rvx_port_04,
	rvx_port_01,
	rvx_port_10,
	rvx_port_09,
	rvx_port_20,
	rvx_port_07,
  rvx_port_15
);





parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_2 = 32;
parameter BW_LPI_BURDEN = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_5 = 0;

parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = RVX_GPARA_2;
parameter RVX_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_03 = `NUM_BYTE(RVX_GPARA_2);
localparam  RVX_LPARA_08 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_03);

localparam  RVX_LPARA_09 = `NUM_BYTE(RVX_GPARA_3);
localparam  RVX_LPARA_00 = (RVX_GPARA_0<=1)? 0 : REQUIRED_BITWIDTH_INDEX(RVX_GPARA_0);
localparam  RVX_LPARA_05 = `MAX(RVX_LPARA_00, 1);
localparam  RVX_LPARA_07 = RVX_LPARA_00 + RVX_GPARA_1;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_4;
localparam  BW_LPIXS_DATA = RVX_GPARA_2;

`include "lpixs_lpara.vb"

input wire rvx_port_05;
input wire rvx_port_00;
input wire rvx_port_13;
input wire rvx_port_23;

output wire [2-1:0] rvx_port_21;
input wire rvx_port_08;
input wire rvx_port_03;
input wire rvx_port_22;
input wire rvx_port_16;
input wire [BW_LPI_QDATA-1:0] rvx_port_19;

input wire [2-1:0] rvx_port_02;
output reg rvx_port_24;
output wire rvx_port_18;
output wire rvx_port_17;
output wire [BW_LPI_YDATA-1:0] rvx_port_11;

output wire [RVX_GPARA_0-1:0] rvx_port_14;
output wire [RVX_GPARA_1*RVX_GPARA_0-1:0] rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire [RVX_GPARA_0-1:0] rvx_port_04;
output wire [RVX_LPARA_09*RVX_GPARA_0-1:0] rvx_port_01;
output wire [RVX_GPARA_3*RVX_GPARA_0-1:0] rvx_port_10;
output wire [RVX_GPARA_3*RVX_GPARA_0-1:0] rvx_port_09;
output wire [RVX_GPARA_0-1:0] rvx_port_20;
input wire [RVX_GPARA_3*RVX_GPARA_0-1:0] rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_15;

genvar i;

localparam  RVX_LPARA_01 = RVX_GPARA_4;
localparam  RVX_LPARA_04 = RVX_GPARA_2;

wire [BW_LPI_BURDEN-1:0] rvx_signal_30;
wire [BW_LPI_QPARCEL-1:0] rvx_signal_23;

wire rvx_signal_06;
wire rvx_signal_19;
wire [`BW_AXI_ALEN-1:0] rvx_signal_34;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_10;
wire [`BW_AXI_ABURST-1:0] rvx_signal_32;
wire [`NUM_BYTE(RVX_LPARA_04)-1:0] rvx_signal_04;
wire [RVX_LPARA_04-1:0] rvx_signal_13;
wire [RVX_LPARA_01-1:0] rvx_signal_21;

wire [RVX_LPARA_08-1:0] rvx_signal_09;

wire [RVX_GPARA_4-RVX_LPARA_08-1:0] rvx_signal_35;
wire rvx_signal_02;
wire [RVX_LPARA_03-1:0] rvx_signal_31;
wire [RVX_GPARA_2-1:0] rvx_signal_18;
wire [RVX_GPARA_2-1:0] rvx_signal_01;
wire rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_24;
wire rvx_signal_26;

localparam  RVX_LPARA_06 = RVX_GPARA_3/RVX_GPARA_2;
localparam  RVX_LPARA_02 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_06);

wire [RVX_LPARA_02-1:0] rvx_signal_14;

wire [RVX_LPARA_07-1:0] rvx_signal_29;
wire rvx_signal_03;
wire [RVX_LPARA_09-1:0] rvx_signal_20;
wire [RVX_GPARA_3-1:0] rvx_signal_07;
wire [RVX_GPARA_3-1:0] rvx_signal_08;
wire rvx_signal_12;
wire [RVX_GPARA_3-1:0] rvx_signal_00;
wire rvx_signal_27;

reg  [RVX_LPARA_02-1:0] rvx_signal_17;
reg  [RVX_GPARA_0-1:0] rvx_signal_11;

wire rvx_signal_05;
wire rvx_signal_33;

reg rvx_signal_22;
reg rvx_signal_25;
wire [`BW_AXI_RESP-1:0] rvx_signal_28;
wire [RVX_GPARA_2-1:0] rvx_signal_16;

assign {rvx_signal_30,rvx_signal_23} = rvx_port_19;
assign {rvx_signal_06,rvx_signal_19,rvx_signal_34,rvx_signal_10,rvx_signal_32,rvx_signal_04,rvx_signal_13,rvx_signal_21} = rvx_signal_23;

assign rvx_port_21[0] = rvx_signal_33 & (~rvx_signal_26);
assign rvx_port_21[1] = 0;

assign {rvx_signal_35,rvx_signal_09} = rvx_signal_21 - RVX_GPARA_5;
assign rvx_signal_02 = rvx_signal_33 & rvx_port_08 & rvx_signal_19;
assign rvx_signal_31 = rvx_signal_02? rvx_signal_04 : 0;

generate
for(i=0; i<RVX_GPARA_2; i=i+1)
begin : i_gen_wenable_bit
  assign rvx_signal_18[i] = rvx_signal_02 & rvx_signal_31[i/`BW_BYTE];
end
endgenerate

assign rvx_signal_01 = rvx_signal_13;
assign rvx_signal_15 = rvx_signal_33 & rvx_port_08 & (~rvx_signal_19);
assign rvx_signal_26 = rvx_signal_27;

always@(posedge rvx_port_05, negedge rvx_port_00)
begin
  if(rvx_port_00==0)
  begin
    rvx_signal_17 <= 0;
    rvx_signal_11 <= 0;
  end
  else if(rvx_port_08 & rvx_port_21[0] & (~rvx_signal_19))
  begin
    rvx_signal_17 <= rvx_signal_14;
    rvx_signal_11 <= rvx_port_14;
  end
end

assign rvx_signal_05 = rvx_port_24? rvx_port_02[1] : rvx_port_02[0];
assign rvx_signal_33 = rvx_port_16? rvx_signal_05 : 1;

assign rvx_signal_14 = rvx_signal_35[RVX_LPARA_02-1:0];

assign rvx_signal_29 = (RVX_LPARA_06==1)? rvx_signal_35 : (rvx_signal_35>>RVX_LPARA_02);
assign rvx_signal_03 = rvx_signal_02;

ERVP_DEMUX
#(
  .BW_DATA(RVX_LPARA_03),
  .NUM_DATA(RVX_LPARA_06)
)
i_rvx_instance_4
(
  .data_input(rvx_signal_31),
  .select(rvx_signal_14),
  .data_output_list(rvx_signal_20)
);

ERVP_DEMUX
#(
  .BW_DATA(RVX_GPARA_2),
  .NUM_DATA(RVX_LPARA_06)
)
i_rvx_instance_2
(
  .data_input(rvx_signal_18),
  .select(rvx_signal_14),
  .data_output_list(rvx_signal_07)
);

ERVP_DUPLICATOR
#(
  .BW_DATA(RVX_GPARA_2),
  .NUM_DATA(RVX_LPARA_06)
)
i_rvx_instance_3
(
  .data_input(rvx_signal_01),
  .data_output(rvx_signal_08)
);

assign rvx_signal_12 = rvx_signal_15;

ERVP_MUX
#(
	.BW_DATA(RVX_GPARA_2),
	.NUM_DATA(RVX_LPARA_06)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_00),
	.select(rvx_signal_17),
	.data_output(rvx_signal_24)
);

assign rvx_port_06 = rvx_port_04 | rvx_port_20;

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_generate_each_cell
  assign rvx_port_14[i] = (RVX_GPARA_0<=1)? 1 : (rvx_signal_29[RVX_LPARA_07-1-:RVX_LPARA_05]==i);
  assign rvx_port_12[RVX_GPARA_1*(i+1)-1 -:RVX_GPARA_1] = rvx_signal_29[RVX_GPARA_1-1:0];
  assign rvx_port_04[i] = (rvx_port_14[i]==1)? rvx_signal_03 : 0;
  assign rvx_port_01[RVX_LPARA_09*(i+1)-1 -:RVX_LPARA_09] = (rvx_port_14[i]==1)? rvx_signal_20 : 0;
  assign rvx_port_10[RVX_GPARA_2*(i+1)-1 -:RVX_GPARA_2] = (rvx_port_14[i]==1)? rvx_signal_07 : 0;
  assign rvx_port_09[RVX_GPARA_2*(i+1)-1 -:RVX_GPARA_2] = rvx_signal_08;
  assign rvx_port_20[i] = (rvx_port_14[i]==1)? rvx_signal_12 : 0;
end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(1),
	.NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.data_input_list(rvx_port_15),
	.select(rvx_port_14),
	.data_output(rvx_signal_27)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_GPARA_3),
	.NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_5
(
	.data_input_list(rvx_port_07),
	.select(rvx_signal_11),
	.data_output(rvx_signal_00)
);

assign rvx_signal_28 = `AXI_RESPONSE_OKAY;
assign rvx_signal_16 = rvx_signal_24;

always@(posedge rvx_port_05, negedge rvx_port_00)
begin
  if(rvx_port_00==0)
  begin
		rvx_port_24 <= 0;
    rvx_signal_22 <= 0;
    rvx_signal_25 <= 0;
  end
  else if(rvx_port_08 & rvx_port_21[0] & rvx_port_16)
  begin
    rvx_port_24 <= 1;
    rvx_signal_22 <= rvx_signal_06;
    rvx_signal_25 <= rvx_signal_19;
  end
  else
    rvx_port_24 <= 0;
end

assign rvx_port_18 = 0;
assign rvx_port_17 = 1;
assign rvx_port_11 = {rvx_signal_22, rvx_signal_25, rvx_signal_28, rvx_signal_16};

endmodule
