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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "ervp_extinput_backend_memorymap_offset.vh"
`include "rvx_include_09.vh"





module RVX_MODULE_125
(
  rvx_port_27,
  rvx_port_13,

  rvx_port_08,
  rvx_port_14,
  rvx_port_00,

  rvx_port_03,
  rvx_port_17,
  rvx_port_12,
  rvx_port_01,

  rvx_port_15,
  rvx_port_23,
  rvx_port_06,
  rvx_port_10,
  rvx_port_04,
  rvx_port_09,
  rvx_port_05,
  rvx_port_02,
  rvx_port_24,
  rvx_port_11,
  rvx_port_07,
  rvx_port_26,
  rvx_port_19,
  rvx_port_21,
  rvx_port_22,
  rvx_port_20,
  rvx_port_16,
  rvx_port_25,

  rvx_port_28,
  rvx_port_18
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 32;

localparam  RVX_LPARA_05 = 1;
localparam  RVX_LPARA_14 = 1;
localparam  RVX_LPARA_16 = 1;
localparam  RVX_LPARA_15 = `BW_ERVP_EXTINPUT_INST;
localparam  RVX_LPARA_09 = 1;
localparam  RVX_LPARA_10 = RVX_GPARA_3;

input wire rvx_port_27;
input wire rvx_port_13;

input wire rvx_port_08;
input wire [RVX_GPARA_3-1:0] rvx_port_14;
output wire rvx_port_00;

input wire rvx_port_03;
input wire [RVX_LPARA_15-1:0] rvx_port_17;
output wire rvx_port_12;
input wire rvx_port_01;

localparam  RVX_LPARA_13 = RVX_GPARA_0;
localparam  RVX_LPARA_06 = 1;

input wire [(2)-1:0] rvx_port_15;
output wire rvx_port_23;
output wire rvx_port_06;
output wire rvx_port_10;
output wire [`BW_AXI_ALEN-1:0] rvx_port_04;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_09;
output wire [`BW_AXI_ABURST-1:0] rvx_port_05;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_02;
output wire [RVX_GPARA_2-1:0] rvx_port_24;
output wire [RVX_LPARA_13-1:0] rvx_port_11;
output wire [RVX_LPARA_06-1:0] rvx_port_07;
output wire [(2)-1:0] rvx_port_26;
input wire rvx_port_19;
input wire rvx_port_21;
input wire rvx_port_22;
input wire [`BW_AXI_RESP-1:0] rvx_port_20;
input wire [RVX_GPARA_2-1:0] rvx_port_16;
input wire [RVX_LPARA_06-1:0] rvx_port_25;

output wire rvx_port_28;
output wire rvx_port_18;

integer i;

localparam  RVX_LPARA_12 = 1<<`PLOG2(RVX_GPARA_3);
localparam  RVX_LPARA_08 = RVX_LPARA_12/8;
localparam  RVX_LPARA_11 = RVX_GPARA_2/RVX_LPARA_12;
localparam  RVX_LPARA_01 = (RVX_GPARA_1!=0);
localparam  RVX_LPARA_04 = 15;

wire [`BW_ERVP_EXTINPUT_INST_INTERVAL_M1-1:0] rvx_signal_35;
wire [RVX_GPARA_0-1:0] rvx_signal_12;
wire [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_22;
wire rvx_signal_29;
wire rvx_signal_07;
wire rvx_signal_31;
wire rvx_signal_17;
wire rvx_signal_19;

localparam  RVX_LPARA_07 = RVX_LPARA_15;
localparam  RVX_LPARA_00 = 4;

wire rvx_signal_45;
wire rvx_signal_27;
wire rvx_signal_23;
wire rvx_signal_32;
wire [RVX_LPARA_07-1:0] rvx_signal_26;
wire rvx_signal_28;
wire rvx_signal_15;
wire [RVX_LPARA_07-1:0] rvx_signal_42;

localparam  RVX_LPARA_03 = RVX_GPARA_3;
localparam  RVX_LPARA_02 = RVX_LPARA_01? RVX_GPARA_1 : 2;

wire rvx_signal_37;
wire rvx_signal_08;
wire rvx_signal_41;
wire rvx_signal_43;
wire [RVX_LPARA_03-1:0] rvx_signal_39;
wire rvx_signal_05;
wire rvx_signal_10;
wire [RVX_LPARA_03-1:0] rvx_signal_04;

wire rvx_signal_25;
reg [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_02;
reg rvx_signal_06;
reg [RVX_GPARA_2-1:0] rvx_signal_36;
reg [RVX_GPARA_2-1:0] rvx_signal_09;
reg rvx_signal_14;
reg [RVX_GPARA_2-1:0] rvx_signal_18;
wire [RVX_LPARA_12-1:0] rvx_signal_03;
wire rvx_signal_40;
wire rvx_signal_20;
wire rvx_signal_00;

wire rvx_signal_24;
wire [RVX_GPARA_0-1:0] rvx_signal_21;
wire [`RVX_GDEF_132-1:0] rvx_signal_16;
wire [`RVX_GDEF_391-1:0] rvx_signal_33;
wire [RVX_GPARA_0-1:0] rvx_signal_34;
wire rvx_signal_30;
wire rvx_signal_11;
wire rvx_signal_44;
wire rvx_signal_13;
wire [RVX_GPARA_2-1:0] rvx_signal_38;
wire rvx_signal_01;

assign {rvx_signal_19,rvx_signal_17,rvx_signal_31,rvx_signal_07,rvx_signal_29,rvx_signal_22,rvx_signal_12,rvx_signal_35} = rvx_signal_42;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_07),
  .DEPTH(RVX_LPARA_00)
)
i_rvx_instance_0
(
  .clk(rvx_port_27),
  .rstnn(rvx_port_13),
  .enable(rvx_signal_45),
  .clear(rvx_signal_27),
  .wready(rvx_signal_23),
  .wfull(),
  .wrequest(rvx_signal_32),
  .wdata(rvx_signal_26),
  .wnum(),
  .rready(rvx_signal_28),
  .rempty(),
  .rrequest(rvx_signal_15),
  .rdata(rvx_signal_42),
  .rnum()
);

assign rvx_signal_45 = 1;
assign rvx_signal_27 = rvx_port_01;
assign rvx_port_12 = rvx_signal_23;
assign rvx_signal_32 = rvx_port_03;
assign rvx_signal_26 = rvx_port_17;
assign rvx_signal_15 = rvx_port_18;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_03),
  .DEPTH(RVX_LPARA_02)
)
i_rvx_instance_1
(
  .clk(rvx_port_27),
  .rstnn(rvx_port_13),
  .enable(rvx_signal_37),
  .clear(rvx_signal_08),
  .wready(rvx_signal_41),
  .wfull(),
  .wrequest(rvx_signal_43),
  .wdata(rvx_signal_39),
  .wnum(),
  .rready(rvx_signal_05),
  .rempty(),
  .rrequest(rvx_signal_10),
  .rdata(rvx_signal_04),
  .rnum()
);

assign rvx_signal_37 = RVX_LPARA_01;
assign rvx_signal_08 = rvx_port_01;
assign rvx_signal_43 = rvx_port_08;
assign rvx_signal_39 = rvx_port_14;
assign rvx_port_00 = rvx_signal_41;
assign rvx_signal_10 = rvx_signal_40;

assign rvx_signal_25 = RVX_LPARA_01 & rvx_signal_28 & rvx_signal_17;
assign rvx_signal_03 = rvx_signal_04;
assign rvx_signal_20 = (rvx_signal_02==rvx_signal_22);
assign rvx_signal_40 = rvx_signal_25 & (~rvx_signal_06) & rvx_signal_05 & ((~rvx_signal_14) | rvx_signal_01);
assign rvx_signal_00 = rvx_signal_40 & (((rvx_signal_02 % RVX_LPARA_11)==(RVX_LPARA_11-1)) | rvx_signal_20);

always@(*)
begin
  rvx_signal_18 = rvx_signal_36;
  for(i=0; i<RVX_LPARA_11; i=i+1)
    if((rvx_signal_02 % RVX_LPARA_11)==i)
      rvx_signal_18[RVX_LPARA_12*i+:RVX_LPARA_12] = rvx_signal_03;
end

always@(posedge rvx_port_27, negedge rvx_port_13)
begin
  if(rvx_port_13==0)
  begin
    rvx_signal_02 <= 0;
    rvx_signal_06 <= 0;
    rvx_signal_36 <= 0;
    rvx_signal_09 <= 0;
    rvx_signal_14 <= 0;
  end
  else if(rvx_port_01)
  begin
    rvx_signal_02 <= 0;
    rvx_signal_06 <= 0;
    rvx_signal_36 <= 0;
    rvx_signal_14 <= 0;
  end
  else
  begin
    if(rvx_signal_40)
    begin
      if(rvx_signal_20)
      begin
        rvx_signal_02 <= 0;
        rvx_signal_06 <= 1;
      end
      else
        rvx_signal_02 <= rvx_signal_02 + 1'b 1;
      rvx_signal_36 <= rvx_signal_00? 0 : rvx_signal_18;
    end
    else if(rvx_port_18)
      rvx_signal_06 <= 0;
    if(rvx_signal_00)
    begin
      rvx_signal_09 <= rvx_signal_18;
      rvx_signal_14 <= 1;
    end
    else if(rvx_signal_01)
      rvx_signal_14 <= 0;
  end
end

RVX_MODULE_089
#(
  .RVX_GPARA_0(RVX_GPARA_0),
  .BW_AXI_DATA(RVX_GPARA_2),
  .MAX_BURST_LENGTH_M1(RVX_LPARA_04)
)
i_rvx_instance_2
(
  .rvx_port_14(rvx_port_27),
  .rvx_port_12(rvx_port_13),

  .rvx_port_10(rvx_signal_24),
  .rvx_port_23(rvx_signal_21),
  .rvx_port_03(rvx_signal_16),
  .rvx_port_11(rvx_signal_33),
  .rvx_port_07(rvx_signal_34),
  .rvx_port_20(rvx_signal_30),

  .rvx_port_26(rvx_signal_11),
  .rvx_port_00(rvx_signal_44),

  .rvx_port_18(rvx_signal_13),
  .rvx_port_01(rvx_signal_38),
  .rvx_port_21(rvx_signal_01),

  .rvx_port_22(rvx_port_15),
  .rvx_port_24(rvx_port_23),
  .rvx_port_30(rvx_port_06),
  .rvx_port_04(rvx_port_10),
  .rvx_port_16(rvx_port_04),
  .rvx_port_05(rvx_port_09),
  .rvx_port_06(rvx_port_05),
  .rvx_port_13(rvx_port_02),
  .rvx_port_15(rvx_port_24),
  .rvx_port_02(rvx_port_11),
  .rvx_port_09(rvx_port_07),
  .rvx_port_27(rvx_port_26),
  .rvx_port_25(rvx_port_19),
  .rvx_port_29(rvx_port_21),
  .rvx_port_08(rvx_port_22),
  .rvx_port_19(rvx_port_20),
  .rvx_port_28(rvx_port_16),
  .rvx_port_17(rvx_port_25)
);

assign rvx_signal_24 = rvx_signal_25;
assign rvx_signal_21 = rvx_signal_12;
assign rvx_signal_16 = (rvx_signal_22 + 1) * RVX_LPARA_08;
assign rvx_signal_33 = 1;
assign rvx_signal_34 = 0;
assign rvx_signal_11 = 1;
assign rvx_signal_13 = rvx_signal_14;
assign rvx_signal_38 = rvx_signal_09;

assign rvx_port_28 = rvx_port_01;
assign rvx_port_18 = rvx_signal_28 & (rvx_signal_17? ((~rvx_signal_19) & rvx_signal_30) : 1);

endmodule
