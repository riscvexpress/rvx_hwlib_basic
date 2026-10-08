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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "rvx_include_08.vh"





module RVX_MODULE_091
(
  rvx_port_33,
  rvx_port_22,

  rvx_port_12,
  rvx_port_21,

  rvx_port_10,
  rvx_port_14,
  rvx_port_23,
  rvx_port_05,
  rvx_port_15,
  rvx_port_27,
  rvx_port_00,
  rvx_port_32,
  rvx_port_04,
  rvx_port_02,
  rvx_port_03,
  rvx_port_30,
  rvx_port_20,
  rvx_port_18,
  rvx_port_08,

  rvx_port_13,
  rvx_port_01,
  rvx_port_09,
  rvx_port_19,
  rvx_port_17,
  rvx_port_31,
  rvx_port_24,
  rvx_port_06,

  rvx_port_28,
  rvx_port_16,
  rvx_port_11,

  rvx_port_07,
  rvx_port_25,
  rvx_port_26,
  rvx_port_29
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_3 = 32;

localparam  RVX_LPARA_08 = 1;
localparam  RVX_LPARA_12 = `RVX_GDEF_574;
localparam  RVX_LPARA_02 = 1;
localparam  RVX_LPARA_01 = RVX_GPARA_3;

localparam  RVX_LPARA_11 = 0;
localparam  RVX_LPARA_06 = 0;
localparam  RVX_LPARA_10 = RVX_GPARA_0+RVX_LPARA_11;
localparam  RVX_LPARA_05 = RVX_GPARA_2+RVX_LPARA_06;

input wire rvx_port_33;
input wire rvx_port_22;

input wire rvx_port_12;
input wire rvx_port_21;

input wire [(RVX_LPARA_10)-1:0] rvx_port_10;
output wire [(RVX_LPARA_05)-1:0] rvx_port_14;
input wire rvx_port_23;
input wire rvx_port_05;
output wire rvx_port_15;
output wire [(RVX_LPARA_08)-1:0] rvx_port_27;
input wire rvx_port_00;
input wire [(RVX_LPARA_12)-1:0] rvx_port_32;
output wire rvx_port_04;
input wire rvx_port_02;
input wire [(RVX_LPARA_02)-1:0] rvx_port_03;
output wire rvx_port_30;
input wire rvx_port_20;
output wire rvx_port_18;
output wire [(RVX_LPARA_01)-1:0] rvx_port_08;

output wire [RVX_GPARA_0-1:0] rvx_port_13;
input wire [RVX_GPARA_2-1:0] rvx_port_01;
output wire rvx_port_09;
output wire rvx_port_19;
output wire rvx_port_17;
input wire rvx_port_31;
input wire [RVX_GPARA_3-1:0] rvx_port_24;
output wire rvx_port_06;

output wire rvx_port_28;
output wire [RVX_GPARA_3-1:0] rvx_port_16;
input wire rvx_port_11;

output wire rvx_port_07;
output wire [RVX_LPARA_12-1:0] rvx_port_25;
input wire rvx_port_26;
output wire rvx_port_29;

wire rvx_signal_18;

wire [`RVX_GDEF_105-1:0] rvx_signal_27;
wire [RVX_GPARA_1-1:0] rvx_signal_20;
wire [`RVX_GDEF_445-1:0] rvx_signal_08;
wire rvx_signal_12;
wire rvx_signal_21;
wire rvx_signal_06;
wire rvx_signal_25;
wire rvx_signal_01;

localparam  RVX_LPARA_09 = `RVX_GDEF_105;

wire rvx_signal_10;
wire rvx_signal_02;
wire rvx_signal_11;
wire [RVX_LPARA_09-1:0] rvx_signal_05;
wire rvx_signal_16;
wire rvx_signal_14;

localparam  RVX_LPARA_04 = `RVX_GDEF_445;

wire rvx_signal_22;
wire rvx_signal_09;
wire rvx_signal_24;
wire [RVX_LPARA_04-1:0] rvx_signal_23;

wire rvx_signal_00;
wire rvx_signal_04;
wire rvx_signal_07;

wire rvx_signal_19;
wire rvx_signal_13;
wire rvx_signal_17;

wire rvx_signal_26;
wire rvx_signal_03;

localparam  RVX_LPARA_00 = 1;
localparam  RVX_LPARA_03 = 1;
localparam  RVX_LPARA_07 = 0;

reg [RVX_LPARA_00-1:0] rvx_signal_15;

ERVP_ASYNCH_SINGLE_CYCLE
i_rvx_instance_1
(
	.wclk(rvx_port_33),
	.wrstnn(rvx_port_21),
	.wcontrol(rvx_port_22),
	.rclk(rvx_port_12),
	.rrstnn(rvx_port_21),
	.rcontrol(rvx_signal_18)
);

assign {rvx_signal_01,rvx_signal_25,rvx_signal_06,rvx_signal_21,rvx_signal_12,rvx_signal_08,rvx_signal_20,rvx_signal_27} = rvx_port_32;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_09)
)
i_rvx_instance_2
(
	.clk(rvx_port_12),
  .rstnn(rvx_port_21),
	.enable(rvx_signal_10),
	.init(rvx_signal_02),
  .count(rvx_signal_11),
	.value(rvx_signal_05),
	.is_first_count(rvx_signal_16),
	.is_last_count()
);

assign rvx_signal_10 = rvx_signal_00;
assign rvx_signal_02 = (rvx_signal_11 & rvx_signal_14) | rvx_signal_03;
assign rvx_signal_11 = rvx_signal_12? 0 : (rvx_signal_21? rvx_signal_18 : 1);
assign rvx_signal_14 = (rvx_signal_05==rvx_signal_27);

always@(posedge rvx_port_12, negedge rvx_port_21)
begin
  if(rvx_port_21==0)
    rvx_signal_15 <= RVX_LPARA_07;
  else if(rvx_signal_03)
    rvx_signal_15 <= RVX_LPARA_07;
  else if(rvx_signal_00 & (rvx_signal_06|rvx_signal_21))
  begin
    if(rvx_port_17)
      rvx_signal_15 <= RVX_LPARA_03;
    else if(rvx_signal_19)
      rvx_signal_15 <= RVX_LPARA_07;
  end
end

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_04)
)
i_rvx_instance_0
(
	.clk(rvx_port_12),
  .rstnn(rvx_port_21),
	.enable(rvx_signal_22),
	.init(rvx_signal_09),
  .count(rvx_signal_24),
	.value(rvx_signal_23),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_22 = rvx_signal_00;
assign rvx_signal_09 = rvx_signal_03;
assign rvx_signal_24 = rvx_signal_19;

assign rvx_signal_13 = (rvx_signal_23==rvx_signal_08);

assign rvx_signal_00 = rvx_port_00 & (rvx_signal_06|rvx_signal_21|rvx_signal_12);
assign rvx_port_17 = rvx_signal_00 & rvx_signal_11 & rvx_signal_16;
assign rvx_signal_04 = rvx_signal_00 & (rvx_signal_12? 1 : (rvx_signal_15==RVX_LPARA_03));
assign rvx_signal_07 = rvx_signal_04 & rvx_port_31;
assign rvx_port_06 = rvx_signal_04 & (rvx_signal_25? rvx_port_11 : rvx_port_20);
assign rvx_signal_19 = rvx_signal_07 & rvx_port_06;
assign rvx_signal_17 = rvx_signal_19 & rvx_signal_13;

assign rvx_signal_26 = rvx_signal_17;
assign rvx_signal_03 = rvx_signal_26 | rvx_port_23;

assign rvx_port_28 = rvx_signal_25 & rvx_signal_07;
assign rvx_port_16 = rvx_port_24;

assign rvx_port_07 = rvx_signal_26;
assign rvx_port_25 = rvx_port_32;
assign rvx_port_29 = rvx_port_23;

assign rvx_port_13 = rvx_port_10;
assign rvx_port_09 = rvx_port_23;
assign rvx_port_19 = rvx_signal_00;

assign rvx_port_14 = rvx_port_01;
assign rvx_port_15 = (rvx_signal_07 & (~rvx_port_06)) | (rvx_port_07 & (~rvx_port_26));
assign rvx_port_27 = 0;
assign rvx_port_04 = ((~rvx_signal_01) & rvx_signal_26) | rvx_port_23;
assign rvx_port_30 = 0;
assign rvx_port_18 = (~rvx_signal_25) & rvx_signal_07;
assign rvx_port_08 = rvx_port_24;

endmodule
