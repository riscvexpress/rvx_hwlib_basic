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
`include "rvx_include_19.vh"





module RVX_MODULE_025
(
  rvx_port_11,
  rvx_port_14,

  rvx_port_01,
  rvx_port_15,
  rvx_port_00,

  rvx_port_16,
  rvx_port_05,
  rvx_port_23,
  rvx_port_09,
  rvx_port_21,
  rvx_port_02,

  rvx_port_22,
  rvx_port_19,
  rvx_port_04,
  rvx_port_26,
  rvx_port_20,
  rvx_port_27,
  rvx_port_13,
  rvx_port_08,
  rvx_port_07,
  rvx_port_25,
  rvx_port_17,
  rvx_port_18,
  rvx_port_03,
  rvx_port_12,
  rvx_port_28,
  rvx_port_06,
  rvx_port_30,
  rvx_port_10,

  rvx_port_24,
  rvx_port_29
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = 32;

localparam  RVX_LPARA_09 = 1;
localparam  RVX_LPARA_01 = 1;
localparam  RVX_LPARA_02 = 1;
localparam  RVX_LPARA_12 = `BW_ERVP_EXTINPUT_INST;
localparam  RVX_LPARA_11 = 1;
localparam  RVX_LPARA_07 = RVX_GPARA_0;

input wire rvx_port_11;
input wire rvx_port_14;

input wire rvx_port_01;
input wire [RVX_GPARA_0-1:0] rvx_port_15;
output wire rvx_port_00;

input wire rvx_port_16;
input wire [RVX_LPARA_12-1:0] rvx_port_05;
output wire rvx_port_23;
input wire rvx_port_09;
output wire rvx_port_21;
input wire rvx_port_02;

localparam  RVX_LPARA_10 = RVX_GPARA_2;
localparam  RVX_LPARA_06 = 1;

input wire [(2)-1:0] rvx_port_22;
output wire rvx_port_19;
output wire rvx_port_04;
output wire rvx_port_26;
output wire [`BW_AXI_ALEN-1:0] rvx_port_20;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_27;
output wire [`BW_AXI_ABURST-1:0] rvx_port_13;
output wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_08;
output wire [RVX_GPARA_1-1:0] rvx_port_07;
output wire [RVX_LPARA_10-1:0] rvx_port_25;
output wire [RVX_LPARA_06-1:0] rvx_port_17;
output wire [(2)-1:0] rvx_port_18;
input wire rvx_port_03;
input wire rvx_port_12;
input wire rvx_port_28;
input wire [`BW_AXI_RESP-1:0] rvx_port_06;
input wire [RVX_GPARA_1-1:0] rvx_port_30;
input wire [RVX_LPARA_06-1:0] rvx_port_10;

output wire rvx_port_24;
output wire rvx_port_29;

integer i;

localparam  RVX_LPARA_03 = 1<<`PLOG2(RVX_GPARA_0);
localparam  RVX_LPARA_13 = RVX_LPARA_03/8;
localparam  RVX_LPARA_04 = RVX_GPARA_1/RVX_LPARA_03;
localparam  RVX_LPARA_14 = (RVX_GPARA_3!=0);
localparam  RVX_LPARA_15 = 15;

wire [`BW_ERVP_EXTINPUT_INST_INTERVAL_M1-1:0] rvx_signal_00;
wire [RVX_GPARA_2-1:0] rvx_signal_03;
wire [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_45;
wire rvx_signal_11;
wire rvx_signal_15;
wire rvx_signal_02;
wire rvx_signal_20;
wire rvx_signal_06;

localparam  RVX_LPARA_00 = RVX_LPARA_12;
localparam  RVX_LPARA_08 = 4;

wire rvx_signal_21;
wire rvx_signal_12;
wire rvx_signal_23;
wire rvx_signal_29;
wire [RVX_LPARA_00-1:0] rvx_signal_27;
wire rvx_signal_07;
wire rvx_signal_38;
wire [RVX_LPARA_00-1:0] rvx_signal_08;

localparam  RVX_LPARA_16 = RVX_GPARA_0;
localparam  RVX_LPARA_05 = RVX_LPARA_14? RVX_GPARA_3 : 2;

wire rvx_signal_16;
wire rvx_signal_10;
wire rvx_signal_01;
wire rvx_signal_25;
wire [RVX_LPARA_16-1:0] rvx_signal_17;
wire rvx_signal_46;
wire rvx_signal_34;
wire [RVX_LPARA_16-1:0] rvx_signal_35;

wire rvx_signal_14;
wire rvx_signal_09;
reg [`BW_ERVP_EXTINPUT_INST_NUM_INPUT_M1-1:0] rvx_signal_42;
reg rvx_signal_33;
reg [RVX_GPARA_1-1:0] rvx_signal_13;
reg [RVX_GPARA_1-1:0] rvx_signal_41;
reg rvx_signal_40;
reg [RVX_GPARA_1-1:0] rvx_signal_39;
wire [RVX_LPARA_03-1:0] rvx_signal_26;
wire rvx_signal_43;
wire rvx_signal_31;
wire rvx_signal_44;

wire rvx_signal_22;
wire [RVX_GPARA_2-1:0] rvx_signal_05;
wire [`RVX_GDEF_495-1:0] rvx_signal_30;
wire [`RVX_GDEF_465-1:0] rvx_signal_28;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire rvx_signal_04;
wire rvx_signal_24;
wire rvx_signal_36;
wire rvx_signal_37;
wire [RVX_GPARA_1-1:0] rvx_signal_18;
wire rvx_signal_32;

assign {rvx_signal_06,rvx_signal_20,rvx_signal_02,rvx_signal_15,rvx_signal_11,rvx_signal_45,rvx_signal_03,rvx_signal_00} = rvx_signal_08;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_08)
)
i_rvx_instance_1
(
  .clk(rvx_port_11),
  .rstnn(rvx_port_14),
  .enable(rvx_signal_21),
  .clear(rvx_signal_12),
  .wready(rvx_signal_23),
  .wfull(),
  .wrequest(rvx_signal_29),
  .wdata(rvx_signal_27),
  .wnum(),
  .rready(rvx_signal_07),
  .rempty(),
  .rrequest(rvx_signal_38),
  .rdata(rvx_signal_08),
  .rnum()
);

assign rvx_signal_21 = 1;
assign rvx_signal_12 = rvx_port_09;
assign rvx_port_23 = rvx_signal_23;
assign rvx_port_21 = ~rvx_signal_07;
assign rvx_signal_29 = rvx_port_16;
assign rvx_signal_27 = rvx_port_05;
assign rvx_signal_38 = rvx_signal_09;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_16),
  .DEPTH(RVX_LPARA_05)
)
i_rvx_instance_2
(
  .clk(rvx_port_11),
  .rstnn(rvx_port_14),
  .enable(rvx_signal_16),
  .clear(rvx_signal_10),
  .wready(rvx_signal_01),
  .wfull(),
  .wrequest(rvx_signal_25),
  .wdata(rvx_signal_17),
  .wnum(),
  .rready(rvx_signal_46),
  .rempty(),
  .rrequest(rvx_signal_34),
  .rdata(rvx_signal_35),
  .rnum()
);

assign rvx_signal_16 = RVX_LPARA_14;
assign rvx_signal_10 = rvx_port_09;
assign rvx_signal_25 = rvx_port_01;
assign rvx_signal_17 = rvx_port_15;
assign rvx_port_00 = rvx_signal_01;
assign rvx_signal_34 = rvx_signal_43;

assign rvx_signal_14 = RVX_LPARA_14 & rvx_signal_07 & rvx_signal_20;
assign rvx_signal_26 = rvx_signal_35;
assign rvx_signal_31 = (rvx_signal_42==rvx_signal_45);
assign rvx_signal_43 = rvx_signal_14 & (~rvx_signal_33) & rvx_signal_46 & ((~rvx_signal_40) | rvx_signal_32);
assign rvx_signal_44 = rvx_signal_43 & (((rvx_signal_42 % RVX_LPARA_04)==(RVX_LPARA_04-1)) | rvx_signal_31);

always@(*)
begin
  rvx_signal_39 = rvx_signal_13;
  for(i=0; i<RVX_LPARA_04; i=i+1)
    if((rvx_signal_42 % RVX_LPARA_04)==i)
      rvx_signal_39[RVX_LPARA_03*i+:RVX_LPARA_03] = rvx_signal_26;
end

always@(posedge rvx_port_11, negedge rvx_port_14)
begin
  if(rvx_port_14==0)
  begin
    rvx_signal_42 <= 0;
    rvx_signal_33 <= 0;
    rvx_signal_13 <= 0;
    rvx_signal_41 <= 0;
    rvx_signal_40 <= 0;
  end
  else if(rvx_port_09)
  begin
    rvx_signal_42 <= 0;
    rvx_signal_33 <= 0;
    rvx_signal_13 <= 0;
    rvx_signal_40 <= 0;
  end
  else
  begin
    if(rvx_signal_43)
    begin
      if(rvx_signal_31)
      begin
        rvx_signal_42 <= 0;
        rvx_signal_33 <= 1;
      end
      else
        rvx_signal_42 <= rvx_signal_42 + 1'b 1;
      rvx_signal_13 <= rvx_signal_44? 0 : rvx_signal_39;
    end
    else if(rvx_signal_09)
      rvx_signal_33 <= 0;
    if(rvx_signal_44)
    begin
      rvx_signal_41 <= rvx_signal_39;
      rvx_signal_40 <= 1;
    end
    else if(rvx_signal_32)
      rvx_signal_40 <= 0;
  end
end

RVX_MODULE_121
#(
  .RVX_GPARA_0(RVX_GPARA_2),
  .BW_AXI_DATA(RVX_GPARA_1),
  .MAX_BURST_LENGTH_M1(RVX_LPARA_15)
)
i_rvx_instance_0
(
  .rvx_port_25(rvx_port_11),
  .rvx_port_12(rvx_port_14),

  .rvx_port_24(rvx_signal_22),
  .rvx_port_29(rvx_signal_05),
  .rvx_port_08(rvx_signal_30),
  .rvx_port_06(rvx_signal_28),
  .rvx_port_10(rvx_signal_19),
  .rvx_port_16(rvx_signal_04),

  .rvx_port_03(rvx_signal_24),
  .rvx_port_04(rvx_signal_36),

  .rvx_port_13(rvx_signal_37),
  .rvx_port_27(rvx_signal_18),
  .rvx_port_07(rvx_signal_32),

  .rvx_port_18(rvx_port_22),
  .rvx_port_28(rvx_port_19),
  .rvx_port_05(rvx_port_04),
  .rvx_port_09(rvx_port_26),
  .rvx_port_01(rvx_port_20),
  .rvx_port_23(rvx_port_27),
  .rvx_port_26(rvx_port_13),
  .rvx_port_21(rvx_port_08),
  .rvx_port_19(rvx_port_07),
  .rvx_port_22(rvx_port_25),
  .rvx_port_17(rvx_port_17),
  .rvx_port_11(rvx_port_18),
  .rvx_port_00(rvx_port_03),
  .rvx_port_30(rvx_port_12),
  .rvx_port_14(rvx_port_28),
  .rvx_port_15(rvx_port_06),
  .rvx_port_20(rvx_port_30),
  .rvx_port_02(rvx_port_10)
);

assign rvx_signal_22 = rvx_signal_14;
assign rvx_signal_05 = rvx_signal_03;
assign rvx_signal_30 = (rvx_signal_45 + 1) * RVX_LPARA_13;
assign rvx_signal_28 = 1;
assign rvx_signal_19 = 0;
assign rvx_signal_24 = 1;
assign rvx_signal_37 = rvx_signal_40;
assign rvx_signal_18 = rvx_signal_41;

assign rvx_port_24 = rvx_port_09;
assign rvx_signal_09 = rvx_signal_07 & (rvx_signal_20? rvx_signal_04 : 1);
assign rvx_port_29 = (rvx_signal_09 & (~rvx_signal_06)) | rvx_port_02;

endmodule
