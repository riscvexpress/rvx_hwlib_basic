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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_044
(
	rvx_port_15,
	rvx_port_01,
  rvx_port_25,
  rvx_port_09,
  rvx_port_04,
  
  rvx_port_21,
  rvx_port_10,
  rvx_port_02,
  rvx_port_14,  
  rvx_port_20,
  rvx_port_00,

  rvx_port_19,
  rvx_port_03,
  rvx_port_08,
  rvx_port_23,
  rvx_port_24,
  
  rvx_port_16,
  rvx_port_18,
  rvx_port_26,
  rvx_port_06,
  rvx_port_05,
  rvx_port_22,

  rvx_port_07,
  rvx_port_17,
  rvx_port_12,
  rvx_port_13,
  rvx_port_11
);





parameter BW_LPI_QPARCEL = 32;
parameter BW_LPI_YPARCEL = 32;
parameter RCV_BW_LPI_BURDEN = 0;
parameter RVX_GPARA_0 = 1;

localparam  SND_BW_LPI_BURDEN = (RVX_GPARA_0<=1)? RCV_BW_LPI_BURDEN : (RCV_BW_LPI_BURDEN+RVX_GPARA_0);

input wire rvx_port_15;
input wire rvx_port_01;
input wire rvx_port_25;
input wire rvx_port_09;
output wire rvx_port_04;

`include "lpi_conv.vb"

output wire [2*RVX_GPARA_0-1:0] rvx_port_21;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire [RVX_GPARA_0-1:0] rvx_port_02;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire [RVX_GPARA_0-1:0] rvx_port_20;
input wire [RCV_BW_LPI_QDATA*RVX_GPARA_0-1:0] rvx_port_00;

input wire [2*RVX_GPARA_0-1:0] rvx_port_19;
output wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_08;
output wire [RVX_GPARA_0-1:0] rvx_port_23;
output wire [RCV_BW_LPI_YDATA*RVX_GPARA_0-1:0] rvx_port_24;

input wire [2-1:0] rvx_port_16;
output wire rvx_port_18;
output wire rvx_port_26;
output wire rvx_port_05;
output wire rvx_port_06;
output wire [SND_BW_LPI_QDATA-1:0] rvx_port_22;

output wire [2-1:0] rvx_port_07;
input wire rvx_port_17;
input wire rvx_port_12;
input wire rvx_port_13;
input wire [SND_BW_LPI_YDATA-1:0] rvx_port_11;

genvar i;

localparam  RVX_LPARA_1 = RVX_GPARA_0;

wire [RVX_LPARA_1-1:0] rvx_signal_19;
wire [RVX_LPARA_1-1:0] rvx_signal_00;
wire [RVX_LPARA_1-1:0] rvx_signal_22;
wire [RVX_LPARA_1-1:0] rvx_signal_23;
wire [RVX_LPARA_1-1:0] rvx_signal_21;
wire rvx_signal_17;
wire rvx_signal_07;
wire rvx_signal_16;

wire [RVX_GPARA_0+RCV_BW_LPI_QDATA-1:0] rvx_signal_13;
wire [RVX_GPARA_0+RCV_BW_LPI_YDATA-1:0] rvx_signal_03;

localparam  RVX_LPARA_2 = 1;

wire [2-1:0] rvx_signal_08;
wire rvx_signal_09;
wire [RVX_LPARA_2-1:0] rvx_signal_15;
wire rvx_signal_12;
wire rvx_signal_04;
wire [RVX_LPARA_2-1:0] rvx_signal_02;

localparam  RVX_LPARA_0 = SND_BW_LPI_YDATA;

wire [2-1:0] rvx_signal_05;
wire rvx_signal_18;
wire [RVX_LPARA_0-1:0] rvx_signal_06;
wire rvx_signal_01;
wire rvx_signal_20;
wire [RVX_LPARA_0-1:0] rvx_signal_14;

wire [RVX_GPARA_0-1:0] rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_10;

ERVP_GRANTER
#(
  .NUM_CANDIDATE(RVX_LPARA_1)
)
i_rvx_instance_2
(
  .clk(rvx_port_15),
  .rstnn(rvx_port_01),
  .clear(rvx_port_25),
  .enable(rvx_port_09),
  .candidate_ready_list(rvx_signal_19),
  .candidate_hint_list(rvx_signal_00),
  .candidate_valid_list(rvx_signal_22),
  .candidate_last_list(rvx_signal_23),
  .grant_list(rvx_signal_21),
  .granted_ready(rvx_signal_17),
  .granted_valid(rvx_signal_07),
  .granted_last(rvx_signal_16)
);

assign rvx_signal_17 = rvx_port_16[0];

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_gen_dready
  assign rvx_port_21[2*(i+1)-1-:2]  = {1'b 0, rvx_signal_19[i]};
end
endgenerate

assign rvx_signal_00 = rvx_port_02;
assign rvx_signal_22 = rvx_port_10;
assign rvx_signal_23 = rvx_port_14;

assign rvx_port_18 = rvx_signal_07;
assign rvx_port_26 = (rvx_signal_00!=0);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(1),
  .NUM_DATA(RVX_GPARA_0)
 )
i_rvx_instance_0
(
	.data_input_list(rvx_port_14),
	.select(rvx_signal_21),
	.data_output(rvx_port_05)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(1),
  .NUM_DATA(RVX_GPARA_0)
 )
i_rvx_instance_3
(
	.data_input_list(rvx_port_20),
	.select(rvx_signal_21),
	.data_output(rvx_port_06)
);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(RCV_BW_LPI_QDATA),
  .NUM_DATA(RVX_GPARA_0)
 )
i_rvx_instance_1
(
	.data_input_list(rvx_port_00),
	.select(rvx_signal_21),
	.data_output(rvx_signal_13[RCV_BW_LPI_QDATA-1:0])
);

assign rvx_signal_13[RVX_GPARA_0+RCV_BW_LPI_QDATA-1:RCV_BW_LPI_QDATA] = rvx_signal_21;
assign rvx_port_22 = rvx_signal_13;

ERVP_SMALL_FIFO
#(
  .BW_DATA(RVX_LPARA_2),
  .DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_5
(
	.clk(rvx_port_15),
  .rstnn(rvx_port_01),
	.enable(rvx_port_09),
  .clear(rvx_port_25),
	.wready(rvx_signal_08),
	.wfull(),
	.wrequest(rvx_signal_09),
	.wdata(rvx_signal_15),
	.rready(rvx_signal_12),
	.rempty(),
	.rrequest(rvx_signal_04),
	.rdata(rvx_signal_02)
);

assign rvx_signal_09 = rvx_port_17;
assign rvx_signal_15 = rvx_port_13;
assign rvx_signal_04 = rvx_signal_20;

ERVP_SMALL_FIFO
#(
  .BW_DATA(RVX_LPARA_0),
  .DEPTH(3),
  .WRITE_READY_SIZE(2)
)
i_rvx_instance_4
(
	.clk(rvx_port_15),
  .rstnn(rvx_port_01),
	.enable(rvx_port_09),
  .clear(rvx_port_25),
	.wready(rvx_signal_05),
	.wfull(),
	.wrequest(rvx_signal_18),
	.wdata(rvx_signal_06),
	.rready(rvx_signal_01),
	.rempty(),
	.rrequest(rvx_signal_20),
	.rdata(rvx_signal_14)
);

assign rvx_signal_18 = rvx_port_17;
assign rvx_signal_06 = rvx_port_11;
assign rvx_signal_20 = ((rvx_signal_10 & rvx_signal_11)!=0);

assign rvx_signal_03 = rvx_signal_14;
assign rvx_signal_10 = (RVX_GPARA_0==1)? 1 : rvx_signal_03[RVX_GPARA_0+RCV_BW_LPI_YDATA-1-:RVX_GPARA_0];

assign rvx_port_07 = rvx_signal_05;

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_gen_rly
  assign rvx_signal_11[i] = rvx_port_19[i*2];
  assign rvx_port_23[i] = rvx_signal_02;
  assign rvx_port_24[RCV_BW_LPI_YDATA*(i+1)-1-:RCV_BW_LPI_YDATA] = rvx_signal_14;
end
endgenerate
assign rvx_port_08 = 0;
assign rvx_port_03 = rvx_signal_01? rvx_signal_10 : 0;

assign rvx_port_04 = rvx_signal_01;

endmodule
