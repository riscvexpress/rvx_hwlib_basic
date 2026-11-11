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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "ervp_extinput_backend_memorymap_offset.vh"





module RVX_MODULE_105
(
  rvx_port_15,
  rvx_port_03,

  rvx_port_05,
  rvx_port_33,

  rvx_port_18,
  rvx_port_24,
  rvx_port_19,
  rvx_port_17,
  rvx_port_35,
  rvx_port_31,
  rvx_port_02,
  rvx_port_28,
  rvx_port_10,
  rvx_port_27,
  rvx_port_20,
  rvx_port_32,
  rvx_port_26,
  rvx_port_00,
  rvx_port_12,

  rvx_port_29,
  rvx_port_21,
  rvx_port_13,
  rvx_port_08,
  rvx_port_16,
  rvx_port_11,
  rvx_port_22,
  rvx_port_25,

  rvx_port_07,
  rvx_port_34,
  rvx_port_23,

  rvx_port_14,
  rvx_port_30,
  rvx_port_01,
  rvx_port_06,
  rvx_port_04,
  rvx_port_09
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_0 = 32;

localparam  RVX_LPARA_11 = 1;
localparam  RVX_LPARA_13 = `BW_ERVP_EXTINPUT_INST;
localparam  RVX_LPARA_01 = 1;
localparam  RVX_LPARA_08 = RVX_GPARA_0;

localparam  RVX_LPARA_10 = ((RVX_GPARA_1+7)>>3)<<3;
localparam  RVX_LPARA_09 = 8;
localparam  RVX_LPARA_02 = 0;
localparam  RVX_LPARA_03 = RVX_LPARA_10+RVX_LPARA_09;
localparam  RVX_LPARA_04 = RVX_GPARA_3+RVX_LPARA_02;

input wire rvx_port_15;
input wire rvx_port_03;

input wire rvx_port_05;
input wire rvx_port_33;

input wire [(RVX_LPARA_03)-1:0] rvx_port_18;
output wire [(RVX_LPARA_04)-1:0] rvx_port_24;
input wire rvx_port_19;
input wire rvx_port_17;
output wire rvx_port_35;
output wire [(RVX_LPARA_11)-1:0] rvx_port_31;
input wire rvx_port_02;
input wire [(RVX_LPARA_13)-1:0] rvx_port_28;
output wire rvx_port_10;
input wire rvx_port_27;
input wire [(RVX_LPARA_01)-1:0] rvx_port_20;
output wire rvx_port_32;
input wire rvx_port_26;
output wire rvx_port_00;
output wire [(RVX_LPARA_08)-1:0] rvx_port_12;

output wire [RVX_GPARA_1-1:0] rvx_port_29;
input wire [RVX_GPARA_3-1:0] rvx_port_21;
output wire rvx_port_13;
output wire rvx_port_08;
output wire rvx_port_16;
input wire rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_22;
output wire rvx_port_25;

output wire rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_34;
input wire rvx_port_23;

output wire rvx_port_14;
output wire [RVX_LPARA_13-1:0] rvx_port_30;
input wire rvx_port_01;
output wire rvx_port_06;
input wire rvx_port_04;
output wire rvx_port_09;

wire rvx_signal_07;

wire [`BW_ERVP_EXTINPUT_INST_INTERVAL_M1-1:0] rvx_signal_25;
wire [RVX_GPARA_2-1:0] rvx_signal_11;
wire [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_22;
wire rvx_signal_14;
wire rvx_signal_15;
wire rvx_signal_04;
wire rvx_signal_28;
wire rvx_signal_24;

localparam  RVX_LPARA_05 = `BW_ERVP_EXTINPUT_INST_INTERVAL_M1;

wire rvx_signal_01;
wire rvx_signal_18;
wire rvx_signal_16;
wire [RVX_LPARA_05-1:0] rvx_signal_13;
wire rvx_signal_27;
wire rvx_signal_23;

localparam  RVX_LPARA_12 = `BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1;

wire rvx_signal_00;
wire rvx_signal_21;
wire rvx_signal_03;
wire [RVX_LPARA_12-1:0] rvx_signal_20;

wire rvx_signal_29;
reg rvx_signal_02;
wire rvx_signal_26;
wire rvx_signal_06;
wire rvx_signal_09;

wire rvx_signal_08;
wire rvx_signal_12;
wire rvx_signal_10;

wire rvx_signal_05;
wire rvx_signal_19;

localparam  RVX_LPARA_07 = 1;
localparam  RVX_LPARA_06 = 1;
localparam  RVX_LPARA_00 = 0;

reg [RVX_LPARA_07-1:0] rvx_signal_17;

ERVP_ASYNCH_SINGLE_CYCLE
i_rvx_instance_2
(
	.wclk(rvx_port_15),
	.wrstnn(rvx_port_33),
	.wcontrol(rvx_port_03),
	.rclk(rvx_port_05),
	.rrstnn(rvx_port_33),
	.rcontrol(rvx_signal_07)
);

assign {rvx_signal_24,rvx_signal_28,rvx_signal_04,rvx_signal_15,rvx_signal_14,rvx_signal_22,rvx_signal_11,rvx_signal_25} = rvx_port_28;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_05)
)
i_rvx_instance_0
(
	.clk(rvx_port_05),
  .rstnn(rvx_port_33),
	.enable(rvx_signal_01),
	.init(rvx_signal_18),
  .count(rvx_signal_16),
	.value(rvx_signal_13),
	.is_first_count(rvx_signal_27),
	.is_last_count()
);

assign rvx_signal_01 = rvx_signal_26 | rvx_port_19;
assign rvx_signal_18 = (rvx_signal_16 & rvx_signal_23) | rvx_signal_19;
assign rvx_signal_16 = rvx_signal_14? 0 : (rvx_signal_15? rvx_signal_07 : 1);
assign rvx_signal_23 = (rvx_signal_13==rvx_signal_25);

always@(posedge rvx_port_05, negedge rvx_port_33)
begin
  if(rvx_port_33==0)
    rvx_signal_17 <= RVX_LPARA_00;
  else if(rvx_signal_19)
    rvx_signal_17 <= RVX_LPARA_00;
  else if(rvx_signal_26 & (rvx_signal_04|rvx_signal_15))
  begin
    if(rvx_port_16)
      rvx_signal_17 <= RVX_LPARA_06;
    else if(rvx_signal_08)
      rvx_signal_17 <= RVX_LPARA_00;
  end
end

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_12)
)
i_rvx_instance_1
(
	.clk(rvx_port_05),
  .rstnn(rvx_port_33),
	.enable(rvx_signal_00),
	.init(rvx_signal_21),
  .count(rvx_signal_03),
	.value(rvx_signal_20),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_00 = rvx_signal_26 | rvx_port_19;
assign rvx_signal_21 = rvx_signal_19;
assign rvx_signal_03 = rvx_signal_08;

assign rvx_signal_12 = (rvx_signal_20==rvx_signal_22);

assign rvx_signal_29 = rvx_port_18[RVX_LPARA_10];

always@(posedge rvx_port_05, negedge rvx_port_33)
begin
  if(rvx_port_33==0)
    rvx_signal_02 <= 0;
  else if(rvx_signal_19)
    rvx_signal_02 <= 0;
  else if(rvx_signal_26)
    rvx_signal_02 <= 1;
end

assign rvx_signal_26 = rvx_port_02 & (~rvx_port_19) & (rvx_signal_29 | rvx_signal_02) & (rvx_signal_04|rvx_signal_15|rvx_signal_14);
assign rvx_port_16 = rvx_signal_26 & rvx_signal_16 & rvx_signal_27;
assign rvx_signal_06 = rvx_signal_26 & (rvx_signal_14? 1 : (rvx_signal_17==RVX_LPARA_06));
assign rvx_signal_09 = rvx_signal_06 & rvx_port_11;
assign rvx_port_25 = rvx_signal_06 & (rvx_signal_28? rvx_port_23 : rvx_port_26);
assign rvx_signal_08 = rvx_signal_09 & rvx_port_25;
assign rvx_signal_10 = rvx_signal_08 & rvx_signal_12;

assign rvx_signal_05 = rvx_signal_10;
assign rvx_signal_19 = rvx_signal_05 | rvx_port_19;

assign rvx_port_07 = rvx_signal_28 & rvx_signal_09;
assign rvx_port_34 = rvx_port_22;

assign rvx_port_14 = rvx_signal_05;
assign rvx_port_30 = rvx_port_28;
assign rvx_port_09 = rvx_port_19 & rvx_port_04 & rvx_port_02;
assign rvx_port_06 = rvx_port_19 & rvx_port_04 & (~rvx_port_02);

assign rvx_port_29 = rvx_port_18[RVX_GPARA_1-1:0];
assign rvx_port_13 = rvx_port_19;
assign rvx_port_08 = rvx_signal_26 | rvx_port_19;

assign rvx_port_24 = rvx_port_21;
assign rvx_port_35 = (rvx_signal_09 & (~rvx_port_25)) | (rvx_port_14 & (~rvx_port_01));
assign rvx_port_31 = 0;
assign rvx_port_10 = ((~rvx_signal_24) & rvx_signal_05) | rvx_port_09;
assign rvx_port_32 = 0;
assign rvx_port_00 = (~rvx_signal_28) & rvx_signal_09;
assign rvx_port_12 = rvx_port_22;

endmodule
