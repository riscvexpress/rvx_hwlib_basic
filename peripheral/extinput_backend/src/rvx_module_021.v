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
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"

`include "ervp_extinput_backend_memorymap_offset.vh"
`include "rvx_include_07.vh"





module RVX_MODULE_021
(
  rvx_port_23,
  rvx_port_04,

  rvx_port_19,
  rvx_port_27,
  rvx_port_15,

  rvx_port_16,
  rvx_port_18,
  rvx_port_17,
  rvx_port_09,

  rvx_port_11,
  rvx_port_28,
  rvx_port_26,
  rvx_port_02,
  rvx_port_13,
  rvx_port_00,
  rvx_port_24,
  rvx_port_05,
  rvx_port_22,
  rvx_port_06,
  rvx_port_10,
  rvx_port_01,
  rvx_port_03,
  rvx_port_12,
  rvx_port_07,
  rvx_port_21,
  rvx_port_25,
  rvx_port_20,

  rvx_port_14,
  rvx_port_08
);





parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_0 = 32;

localparam  RVX_LPARA_14 = 1;
localparam  RVX_LPARA_07 = 1;
localparam  RVX_LPARA_03 = 1;
localparam  RVX_LPARA_09 = `BW_ERVP_EXTINPUT_INST;
localparam  RVX_LPARA_06 = 1;
localparam  RVX_LPARA_04 = RVX_GPARA_3;

input wire rvx_port_23;
input wire rvx_port_04;

input wire rvx_port_19;
input wire [RVX_GPARA_3-1:0] rvx_port_27;
output wire rvx_port_15;

input wire rvx_port_16;
input wire [RVX_LPARA_09-1:0] rvx_port_18;
output wire rvx_port_17;
input wire rvx_port_09;

localparam  RVX_LPARA_12 = RVX_GPARA_1;
localparam  RVX_LPARA_16 = 1;

input wire [(2)-1:0] rvx_port_11;
output wire rvx_port_28;
output wire rvx_port_26;
output wire rvx_port_02;
output wire [`BW_AXI_ALEN-1:0] rvx_port_13;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_00;
output wire [`BW_AXI_ABURST-1:0] rvx_port_24;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_05;
output wire [RVX_GPARA_2-1:0] rvx_port_22;
output wire [RVX_LPARA_12-1:0] rvx_port_06;
output wire [RVX_LPARA_16-1:0] rvx_port_10;
output wire [(2)-1:0] rvx_port_01;
input wire rvx_port_03;
input wire rvx_port_12;
input wire rvx_port_07;
input wire [`BW_AXI_RESP-1:0] rvx_port_21;
input wire [RVX_GPARA_2-1:0] rvx_port_25;
input wire [RVX_LPARA_16-1:0] rvx_port_20;

output wire rvx_port_14;
output wire rvx_port_08;

integer i;

localparam  RVX_LPARA_00 = 1<<`PLOG2(RVX_GPARA_3);
localparam  RVX_LPARA_08 = RVX_LPARA_00/8;
localparam  RVX_LPARA_10 = RVX_GPARA_2/RVX_LPARA_00;
localparam  RVX_LPARA_01 = (RVX_GPARA_0!=0);
localparam  RVX_LPARA_15 = 15;

wire [`BW_ERVP_EXTINPUT_INST_INTERVAL_M1-1:0] rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_41;
wire [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_20;
wire rvx_signal_09;
wire rvx_signal_38;
wire rvx_signal_16;
wire rvx_signal_19;
wire rvx_signal_26;

localparam  RVX_LPARA_13 = RVX_LPARA_09;
localparam  RVX_LPARA_11 = 4;

wire rvx_signal_07;
wire rvx_signal_17;
wire rvx_signal_22;
wire rvx_signal_39;
wire [RVX_LPARA_13-1:0] rvx_signal_37;
wire rvx_signal_42;
wire rvx_signal_40;
wire [RVX_LPARA_13-1:0] rvx_signal_15;

localparam  RVX_LPARA_05 = RVX_GPARA_3;
localparam  RVX_LPARA_02 = RVX_LPARA_01? RVX_GPARA_0 : 2;

wire rvx_signal_35;
wire rvx_signal_05;
wire rvx_signal_06;
wire rvx_signal_32;
wire [RVX_LPARA_05-1:0] rvx_signal_01;
wire rvx_signal_25;
wire rvx_signal_18;
wire [RVX_LPARA_05-1:0] rvx_signal_27;

wire rvx_signal_12;
reg [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_14;
reg rvx_signal_13;
reg [RVX_GPARA_2-1:0] rvx_signal_29;
reg [RVX_GPARA_2-1:0] rvx_signal_44;
reg rvx_signal_11;
reg [RVX_GPARA_2-1:0] rvx_signal_45;
wire [RVX_LPARA_00-1:0] rvx_signal_00;
wire rvx_signal_04;
wire rvx_signal_23;
wire rvx_signal_43;

wire rvx_signal_24;
wire [RVX_GPARA_1-1:0] rvx_signal_34;
wire [`RVX_GDEF_284-1:0] rvx_signal_30;
wire [`RVX_GDEF_169-1:0] rvx_signal_33;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
wire rvx_signal_03;
wire rvx_signal_08;
wire rvx_signal_28;
wire rvx_signal_02;
wire [RVX_GPARA_2-1:0] rvx_signal_31;
wire rvx_signal_10;

assign {rvx_signal_26,rvx_signal_19,rvx_signal_16,rvx_signal_38,rvx_signal_09,rvx_signal_20,rvx_signal_41,rvx_signal_21} = rvx_signal_15;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_13),
  .DEPTH(RVX_LPARA_11)
)
i_rvx_instance_0
(
  .clk(rvx_port_23),
  .rstnn(rvx_port_04),
  .enable(rvx_signal_07),
  .clear(rvx_signal_17),
  .wready(rvx_signal_22),
  .wfull(),
  .wrequest(rvx_signal_39),
  .wdata(rvx_signal_37),
  .wnum(),
  .rready(rvx_signal_42),
  .rempty(),
  .rrequest(rvx_signal_40),
  .rdata(rvx_signal_15),
  .rnum()
);

assign rvx_signal_07 = 1;
assign rvx_signal_17 = rvx_port_09;
assign rvx_port_17 = rvx_signal_22;
assign rvx_signal_39 = rvx_port_16;
assign rvx_signal_37 = rvx_port_18;
assign rvx_signal_40 = rvx_port_08;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_05),
  .DEPTH(RVX_LPARA_02)
)
i_rvx_instance_1
(
  .clk(rvx_port_23),
  .rstnn(rvx_port_04),
  .enable(rvx_signal_35),
  .clear(rvx_signal_05),
  .wready(rvx_signal_06),
  .wfull(),
  .wrequest(rvx_signal_32),
  .wdata(rvx_signal_01),
  .wnum(),
  .rready(rvx_signal_25),
  .rempty(),
  .rrequest(rvx_signal_18),
  .rdata(rvx_signal_27),
  .rnum()
);

assign rvx_signal_35 = RVX_LPARA_01;
assign rvx_signal_05 = rvx_port_09;
assign rvx_signal_32 = rvx_port_19;
assign rvx_signal_01 = rvx_port_27;
assign rvx_port_15 = rvx_signal_06;
assign rvx_signal_18 = rvx_signal_04;

assign rvx_signal_12 = RVX_LPARA_01 & rvx_signal_42 & rvx_signal_19;
assign rvx_signal_00 = rvx_signal_27;
assign rvx_signal_23 = (rvx_signal_14==rvx_signal_20);
assign rvx_signal_04 = rvx_signal_12 & (~rvx_signal_13) & rvx_signal_25 & ((~rvx_signal_11) | rvx_signal_10);
assign rvx_signal_43 = rvx_signal_04 & (((rvx_signal_14 % RVX_LPARA_10)==(RVX_LPARA_10-1)) | rvx_signal_23);

always@(*)
begin
  rvx_signal_45 = rvx_signal_29;
  for(i=0; i<RVX_LPARA_10; i=i+1)
    if((rvx_signal_14 % RVX_LPARA_10)==i)
      rvx_signal_45[RVX_LPARA_00*i+:RVX_LPARA_00] = rvx_signal_00;
end

always@(posedge rvx_port_23, negedge rvx_port_04)
begin
  if(rvx_port_04==0)
  begin
    rvx_signal_14 <= 0;
    rvx_signal_13 <= 0;
    rvx_signal_29 <= 0;
    rvx_signal_44 <= 0;
    rvx_signal_11 <= 0;
  end
  else if(rvx_port_09)
  begin
    rvx_signal_14 <= 0;
    rvx_signal_13 <= 0;
    rvx_signal_29 <= 0;
    rvx_signal_11 <= 0;
  end
  else
  begin
    if(rvx_signal_04)
    begin
      if(rvx_signal_23)
      begin
        rvx_signal_14 <= 0;
        rvx_signal_13 <= 1;
      end
      else
        rvx_signal_14 <= rvx_signal_14 + 1'b 1;
      rvx_signal_29 <= rvx_signal_43? 0 : rvx_signal_45;
    end
    else if(rvx_port_08)
      rvx_signal_13 <= 0;
    if(rvx_signal_43)
    begin
      rvx_signal_44 <= rvx_signal_45;
      rvx_signal_11 <= 1;
    end
    else if(rvx_signal_10)
      rvx_signal_11 <= 0;
  end
end

RVX_MODULE_058
#(
  .RVX_GPARA_0(RVX_GPARA_1),
  .BW_AXI_DATA(RVX_GPARA_2),
  .MAX_BURST_LENGTH_M1(RVX_LPARA_15)
)
i_rvx_instance_2
(
  .rvx_port_03(rvx_port_23),
  .rvx_port_01(rvx_port_04),

  .rvx_port_27(rvx_signal_24),
  .rvx_port_02(rvx_signal_34),
  .rvx_port_08(rvx_signal_30),
  .rvx_port_30(rvx_signal_33),
  .rvx_port_09(rvx_signal_36),
  .rvx_port_25(rvx_signal_03),

  .rvx_port_23(rvx_signal_08),
  .rvx_port_04(rvx_signal_28),

  .rvx_port_22(rvx_signal_02),
  .rvx_port_24(rvx_signal_31),
  .rvx_port_29(rvx_signal_10),

  .rvx_port_11(rvx_port_11),
  .rvx_port_28(rvx_port_28),
  .rvx_port_13(rvx_port_26),
  .rvx_port_16(rvx_port_02),
  .rvx_port_18(rvx_port_13),
  .rvx_port_21(rvx_port_00),
  .rvx_port_20(rvx_port_24),
  .rvx_port_06(rvx_port_05),
  .rvx_port_12(rvx_port_22),
  .rvx_port_19(rvx_port_06),
  .rvx_port_00(rvx_port_10),
  .rvx_port_07(rvx_port_01),
  .rvx_port_17(rvx_port_03),
  .rvx_port_14(rvx_port_12),
  .rvx_port_26(rvx_port_07),
  .rvx_port_05(rvx_port_21),
  .rvx_port_10(rvx_port_25),
  .rvx_port_15(rvx_port_20)
);

assign rvx_signal_24 = rvx_signal_12;
assign rvx_signal_34 = rvx_signal_41;
assign rvx_signal_30 = (rvx_signal_20 + 1) * RVX_LPARA_08;
assign rvx_signal_33 = 1;
assign rvx_signal_36 = 0;
assign rvx_signal_08 = 1;
assign rvx_signal_02 = rvx_signal_11;
assign rvx_signal_31 = rvx_signal_44;

assign rvx_port_14 = rvx_port_09;
assign rvx_port_08 = rvx_signal_42 & (rvx_signal_19? ((~rvx_signal_26) & rvx_signal_03) : 1);

endmodule
