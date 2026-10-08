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





module RVX_MODULE_062
(
  rvx_port_12,
  rvx_port_05,

  rvx_port_26,
  rvx_port_23,
  rvx_port_15,

  rvx_port_00,
  rvx_port_28,
  rvx_port_10,
  rvx_port_22,

  rvx_port_24,
  rvx_port_02,
  rvx_port_27,
  rvx_port_01,
  rvx_port_16,
  rvx_port_19,
  rvx_port_07,
  rvx_port_13,
  rvx_port_04,
  rvx_port_08,
  rvx_port_18,
  rvx_port_09,
  rvx_port_25,
  rvx_port_21,
  rvx_port_03,
  rvx_port_11,
  rvx_port_20,
  rvx_port_06,

  rvx_port_17,
  rvx_port_14
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = 32;

localparam  RVX_LPARA_02 = 1;
localparam  RVX_LPARA_17 = 1;
localparam  RVX_LPARA_08 = 1;
localparam  RVX_LPARA_04 = `RVX_GDEF_574;
localparam  RVX_LPARA_10 = 1;
localparam  RVX_LPARA_00 = RVX_GPARA_0;

input wire rvx_port_12;
input wire rvx_port_05;

input wire rvx_port_26;
input wire [RVX_GPARA_0-1:0] rvx_port_23;
output wire rvx_port_15;

input wire rvx_port_00;
input wire [RVX_LPARA_04-1:0] rvx_port_28;
output wire rvx_port_10;
input wire rvx_port_22;

localparam  RVX_LPARA_12 = RVX_GPARA_1;
localparam  RVX_LPARA_05 = 1;

input wire [(2)-1:0] rvx_port_24;
output wire rvx_port_02;
output wire rvx_port_27;
output wire rvx_port_01;
output wire [`BW_AXI_ALEN-1:0] rvx_port_16;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_19;
output wire [`BW_AXI_ABURST-1:0] rvx_port_07;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_04;
output wire [RVX_LPARA_12-1:0] rvx_port_08;
output wire [RVX_LPARA_05-1:0] rvx_port_18;
output wire [(2)-1:0] rvx_port_09;
input wire rvx_port_25;
input wire rvx_port_21;
input wire rvx_port_03;
input wire [`BW_AXI_RESP-1:0] rvx_port_11;
input wire [RVX_GPARA_2-1:0] rvx_port_20;
input wire [RVX_LPARA_05-1:0] rvx_port_06;

output wire rvx_port_17;
output wire rvx_port_14;

genvar i;

localparam  RVX_LPARA_07 = 1<<`PLOG2(RVX_GPARA_0);
localparam  RVX_LPARA_09 = (RVX_GPARA_3!=0);

wire [`RVX_GDEF_105-1:0] rvx_signal_14;
wire [RVX_GPARA_1-1:0] rvx_signal_03;
wire [`RVX_GDEF_445-1:0] rvx_signal_21;
wire rvx_signal_17;
wire rvx_signal_26;
wire rvx_signal_05;
wire rvx_signal_22;
wire rvx_signal_01;

localparam  RVX_LPARA_03 = RVX_LPARA_04;
localparam  RVX_LPARA_13 = 4;

wire rvx_signal_27;
wire rvx_signal_04;
wire rvx_signal_06;
wire rvx_signal_00;
wire [RVX_LPARA_03-1:0] rvx_signal_19;
wire rvx_signal_24;
wire rvx_signal_07;
wire [RVX_LPARA_03-1:0] rvx_signal_13;

localparam  RVX_LPARA_15 = RVX_GPARA_0;
localparam  RVX_LPARA_16 = RVX_LPARA_09? RVX_GPARA_3 : 2;

wire rvx_signal_31;
wire rvx_signal_16;
wire rvx_signal_09;
wire rvx_signal_23;
wire [RVX_LPARA_15-1:0] rvx_signal_33;
wire rvx_signal_08;
wire rvx_signal_20;
wire [RVX_LPARA_15-1:0] rvx_signal_18;

localparam  RVX_LPARA_11 = `RVX_GDEF_105;

wire rvx_signal_11;
wire rvx_signal_02;
wire rvx_signal_10;
wire [RVX_LPARA_11-1:0] rvx_signal_29;

wire rvx_signal_12;
wire rvx_signal_30;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_15;

localparam  RVX_LPARA_01 = `GET_AXI_SIZE(RVX_GPARA_2);

wire [RVX_LPARA_01-1:0] rvx_signal_28;
wire [RVX_LPARA_01-1:0] rvx_signal_25;
wire [RVX_LPARA_12-1:0] rvx_signal_32;

localparam  RVX_LPARA_14 = `BW_AXI_WSTRB(RVX_GPARA_2);
localparam  RVX_LPARA_06 = RVX_LPARA_01;

assign {rvx_signal_01,rvx_signal_22,rvx_signal_05,rvx_signal_26,rvx_signal_17,rvx_signal_21,rvx_signal_03,rvx_signal_14} = rvx_signal_13;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_03),
  .DEPTH(RVX_LPARA_13)
)
i_rvx_instance_0
(
  .clk(rvx_port_12),
  .rstnn(rvx_port_05),
  .enable(rvx_signal_27),
  .clear(rvx_signal_04),
  .wready(rvx_signal_06),
  .wfull(),
  .wrequest(rvx_signal_00),
  .wdata(rvx_signal_19),
  .wnum(),
  .rready(rvx_signal_24),
  .rempty(),
  .rrequest(rvx_signal_07),
  .rdata(rvx_signal_13),
  .rnum()
);

assign rvx_signal_27 = 1;
assign rvx_signal_04 = rvx_port_22;
assign rvx_port_10 = rvx_signal_06;
assign rvx_signal_00 = rvx_port_00;
assign rvx_signal_19 = rvx_port_28;
assign rvx_signal_07 = rvx_port_14;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_15),
  .DEPTH(RVX_LPARA_16)
)
i_rvx_instance_2
(
  .clk(rvx_port_12),
  .rstnn(rvx_port_05),
  .enable(rvx_signal_31),
  .clear(rvx_signal_16),
  .wready(rvx_signal_09),
  .wfull(),
  .wrequest(rvx_signal_23),
  .wdata(rvx_signal_33),
  .wnum(),
  .rready(rvx_signal_08),
  .rempty(),
  .rrequest(rvx_signal_20),
  .rdata(rvx_signal_18),
  .rnum()
);

assign rvx_signal_31 = RVX_LPARA_09;
assign rvx_signal_16 = rvx_port_22;
assign rvx_signal_23 = rvx_port_26;
assign rvx_signal_33 = rvx_port_23;
assign rvx_port_15 = rvx_signal_09;
assign rvx_signal_20 = rvx_signal_10;

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_11)
)
i_rvx_instance_1
(
	.clk(rvx_port_12),
  .rstnn(rvx_port_05),
	.enable(rvx_signal_11),
	.init(rvx_signal_02),
  .count(rvx_signal_10),
	.value(rvx_signal_29),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_11 = RVX_LPARA_09;
assign rvx_signal_02 = rvx_signal_30 | rvx_port_22;
assign rvx_signal_10 = rvx_signal_12;

assign rvx_signal_12 = rvx_port_02 & rvx_port_24[0];
assign rvx_signal_30 = rvx_signal_12 & rvx_port_27;

assign rvx_signal_15 = `GET_AXI_SIZE(RVX_LPARA_07);

assign rvx_signal_28 = 0;
assign rvx_signal_25 = rvx_signal_03;
assign rvx_signal_32 = {rvx_signal_03[RVX_LPARA_12-1:RVX_LPARA_01], rvx_signal_28};

assign rvx_port_02 = rvx_signal_24 & rvx_signal_22;
assign rvx_port_27 = (rvx_signal_29==rvx_signal_21);
assign rvx_port_01 = 1;
assign rvx_port_16 = rvx_signal_21;
assign rvx_port_19 = rvx_signal_15;
assign rvx_port_07 = `AXI_BURST_INCR;
assign rvx_port_08 = rvx_signal_32;
assign rvx_port_18 = 0;

assign rvx_port_13 = -1;

generate
for(i=0; i<RVX_GPARA_2/RVX_LPARA_07; i=i+1)
begin : i_duplicate_dma_wdata
  assign rvx_port_04[RVX_LPARA_07*(i+1)-1-:RVX_LPARA_07] = rvx_signal_18;
end
endgenerate

assign rvx_port_09[1] = 1;
assign rvx_port_09[0] = 1;

assign rvx_port_17 = rvx_port_22;
assign rvx_port_14 = rvx_signal_24 & (rvx_signal_22? ((~rvx_signal_01) & rvx_signal_30) : 1);

endmodule
