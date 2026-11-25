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




module RVX_MODULE_121
(
  rvx_port_15,
  rvx_port_07,

  rvx_port_18,
  rvx_port_17,
  rvx_port_01,
  rvx_port_04,
  rvx_port_06,
  rvx_port_26,
  rvx_port_22,

  rvx_port_25,
  rvx_port_14,

  rvx_port_21,
  rvx_port_23,
  rvx_port_10,

  rvx_port_24,
  rvx_port_12,
  rvx_port_30,
  rvx_port_20,
  rvx_port_28,
  rvx_port_19,
  rvx_port_13,
  rvx_port_05,
  rvx_port_09,
  rvx_port_02,
  rvx_port_03,
  rvx_port_16,
  rvx_port_00,
  rvx_port_29,
  rvx_port_31,
  rvx_port_27,
  rvx_port_11,
  rvx_port_08
);




parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;
parameter BW_LINE_SIZE = 32;
parameter RVX_GPARA_1 = 32;
parameter MAX_BURST_LENGTH_M1 = 15;

`include "rvx_include_15.vh"

localparam  RVX_LPARA_3 = 1;

input wire rvx_port_15;
input wire rvx_port_07;

input wire rvx_port_18;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
input wire [BW_LINE_SIZE-1:0] rvx_port_01;
input wire [RVX_GPARA_1-1:0] rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_26;
output wire [`BW_AXI_RESP-1:0] rvx_port_22;

input wire rvx_port_25;
output wire rvx_port_14;

input wire rvx_port_21;
input wire [BW_AXI_DATA-1:0] rvx_port_23;
output wire rvx_port_10;

input wire [(2)-1:0] rvx_port_24;
output wire rvx_port_12;
output wire rvx_port_30;
output wire rvx_port_20;
output wire [`BW_AXI_ALEN-1:0] rvx_port_28;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_19;
output wire [`BW_AXI_ABURST-1:0] rvx_port_13;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_05;
output wire [BW_AXI_DATA-1:0] rvx_port_09;
output wire [RVX_GPARA_0-1:0] rvx_port_02;
output wire [RVX_LPARA_3-1:0] rvx_port_03;
output wire [(2)-1:0] rvx_port_16;
input wire rvx_port_00;
input wire rvx_port_29;
input wire rvx_port_31;
input wire [`BW_AXI_RESP-1:0] rvx_port_27;
input wire [BW_AXI_DATA-1:0] rvx_port_11;
input wire [RVX_LPARA_3-1:0] rvx_port_08;

integer i;

localparam  RVX_LPARA_0 = 2;
localparam  RVX_LPARA_5 = 0;
localparam  RVX_LPARA_1 = 1;
localparam  RVX_LPARA_4 = 2;
localparam  RVX_LPARA_2 = 3;

reg [RVX_LPARA_0-1:0] rvx_signal_23;

reg [RVX_GPARA_0-1:0] rvx_signal_32;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
reg [RVX_GPARA_0-1:0] rvx_signal_30;
reg [RVX_GPARA_1-1:0] rvx_signal_26;
reg [BW_NUM_BEAT-1:0] rvx_signal_11;
reg [`BW_AXI_ALEN-1:0] rvx_signal_00;
reg [`BW_AXI_ALEN-1:0] rvx_signal_28;
reg [RVX_GPARA_0-1:0] rvx_signal_16;
reg [BW_AXI_DATA-1:0] rvx_signal_14;
reg rvx_signal_01;
reg [`BW_AXI_RESP-1:0] rvx_signal_36;

wire [BW_OFFSET-1:0] rvx_signal_29;
wire [BW_OFFSET-1:0] rvx_signal_19;
wire [RVX_GPARA_0-1:0] rvx_signal_37;
wire [BW_OFFSET-1:0] rvx_signal_35;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_06;
reg [BW_OFFSET-1:0] rvx_signal_33;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_27;
reg [BW_NUM_BEAT-1:0] rvx_signal_04;
reg [BW_NUM_BEAT-1:0] rvx_signal_24;
wire [BW_NUM_BEAT-1:0] rvx_signal_25;

wire rvx_signal_03;
wire [`BW_AXI_ALEN-1:0] rvx_signal_22;
wire rvx_signal_31;

wire rvx_signal_34;
wire rvx_signal_21;
wire rvx_signal_12;
wire rvx_signal_02;
wire rvx_signal_17;
wire rvx_signal_05;
reg rvx_signal_20;

wire [BW_AXI_DATA-1:0] rvx_signal_18;
wire [BW_OFFSET:0] rvx_signal_15;
wire [2*BW_AXI_DATA-1:0] rvx_signal_09;
wire [2*BW_AXI_DATA-1:0] rvx_signal_08;

reg [NUM_BYTE-1:0] rvx_signal_10;
reg [NUM_BYTE-1:0] rvx_signal_13;

assign rvx_signal_07 = rvx_port_17 + rvx_signal_32;
assign rvx_signal_35 = rvx_signal_07;
assign rvx_signal_29 = rvx_signal_30;
assign rvx_signal_19 = 0;
assign rvx_signal_37 = {rvx_signal_30[RVX_GPARA_0-1:BW_OFFSET], rvx_signal_19};

assign rvx_signal_27 = rvx_port_01;
assign rvx_signal_06 = rvx_signal_27 + rvx_signal_35;
assign rvx_signal_25 = rvx_signal_24 - rvx_signal_11;

assign rvx_signal_03 = (rvx_signal_25 <= MAX_BURST_LENGTH);
assign rvx_signal_22 = rvx_signal_03? (rvx_signal_25 - 1'b 1) : MAX_BURST_LENGTH_M1;
assign rvx_signal_31 = (rvx_signal_23==RVX_LPARA_1) & rvx_port_18 & rvx_port_25;

assign rvx_signal_34 = rvx_port_12 & rvx_port_24[0];
assign rvx_signal_21 = (rvx_signal_00==rvx_signal_28);
assign rvx_signal_12 = rvx_port_00 & rvx_port_16[0] & rvx_port_29;
assign rvx_signal_02 = (rvx_signal_11 < rvx_signal_04);
assign rvx_signal_17 = (rvx_signal_11==0);
assign rvx_signal_05 = (rvx_signal_25==1);

always@(posedge rvx_port_15, negedge rvx_port_07)
begin
  if(rvx_port_07==0)
  begin
    rvx_signal_23 <= RVX_LPARA_5;
    rvx_signal_32 <= 0;
    rvx_signal_26 <= 0;
    rvx_signal_11 <= 0;
    rvx_signal_00 <= 0;
    rvx_signal_28 <= 0;
    rvx_signal_16 <= 0;
    rvx_signal_14 <= 0;
    rvx_signal_01 <= 0;
  end
  else
    case(rvx_signal_23)
      RVX_LPARA_5:
        if(rvx_port_18)
          rvx_signal_23 <= RVX_LPARA_1;
      RVX_LPARA_1:
        if(rvx_signal_31)
        begin
          rvx_signal_23 <= RVX_LPARA_4;
          rvx_signal_00 <= 0;
          rvx_signal_28 <= rvx_signal_22;
          rvx_signal_16 <= rvx_signal_37 + (rvx_signal_11 << BW_OFFSET);
        end
      RVX_LPARA_4:
        if(rvx_signal_34)
        begin
          if(rvx_signal_02)
            rvx_signal_14 <= rvx_port_23;
          rvx_signal_00 <= rvx_signal_00 + 1'b 1;
          if(rvx_signal_05)
          begin
            rvx_signal_11 <= 0;
            if(rvx_signal_20)
            begin
              rvx_signal_32 <= 0;
              rvx_signal_26 <= 0;
            end
            else
            begin
              rvx_signal_32 <= rvx_signal_32 + rvx_port_06;
              rvx_signal_26 <= rvx_signal_26 + 1'b 1;
            end
          end
          else
            rvx_signal_11 <= rvx_signal_11 + 1'b 1;
          if(rvx_signal_21)
          begin
            rvx_signal_23 <= RVX_LPARA_2;
            rvx_signal_01 <= rvx_signal_05 & rvx_signal_20;
          end
        end
      RVX_LPARA_2:
        if(rvx_signal_12)
          rvx_signal_23 <= (rvx_signal_11==0)? RVX_LPARA_5 : RVX_LPARA_1;
    endcase
end

always@(posedge rvx_port_15, negedge rvx_port_07)
begin
  if(rvx_port_07==0)
  begin
    rvx_signal_30 <= 0;
    rvx_signal_33 <= 0;
    rvx_signal_04 <= 0;
    rvx_signal_24 <= 0;
    rvx_signal_20 <= 0;
  end
  else if(rvx_signal_23==RVX_LPARA_5)
  begin
    rvx_signal_30 <= rvx_signal_07;
    rvx_signal_33 <= rvx_signal_06;
    rvx_signal_04 <= (rvx_signal_27 + (NUM_BYTE-1)) >> BW_OFFSET;
    rvx_signal_24 <= (rvx_signal_06 + (NUM_BYTE-1)) >> BW_OFFSET;
    rvx_signal_20 <= ((rvx_signal_26 + 1'b 1)==rvx_port_04);
  end
end

assign rvx_port_10 = rvx_signal_34 & rvx_signal_02;
assign rvx_port_14 = (rvx_signal_23==RVX_LPARA_2) & rvx_signal_12 & rvx_signal_02;
assign rvx_port_26 = (rvx_signal_23==RVX_LPARA_2) & rvx_signal_12 & rvx_signal_01;
assign rvx_port_22 = (rvx_signal_36!=`AXI_RESPONSE_OKAY)? rvx_signal_36 : rvx_port_27;

always@(posedge rvx_port_15, negedge rvx_port_07)
begin
  if(rvx_port_07==0)
    rvx_signal_36 <= `AXI_RESPONSE_OKAY;
  else if((rvx_signal_23==RVX_LPARA_2) & rvx_signal_12)
  begin
    if(rvx_signal_01)
      rvx_signal_36 <= `AXI_RESPONSE_OKAY;
    else if(rvx_signal_36==`AXI_RESPONSE_OKAY)
      rvx_signal_36 <= rvx_port_27;
  end
end

assign rvx_signal_18 = rvx_signal_02? rvx_port_23 : 0;
assign rvx_signal_15 = NUM_BYTE - rvx_signal_29;
assign rvx_signal_09 = {rvx_signal_18, rvx_signal_14};
assign rvx_signal_08 = rvx_signal_09 >> {rvx_signal_15, 3'b 000};

always@(*)
begin
  for(i=0; i<NUM_BYTE; i=i+1)
  begin
    rvx_signal_10[i] = (i >= rvx_signal_29);
    rvx_signal_13[i] = (rvx_signal_33==0) | (i < rvx_signal_33);
  end
end

assign rvx_port_12 = (rvx_signal_23==RVX_LPARA_4) & (rvx_port_21 | (~rvx_signal_02));
assign rvx_port_30 = rvx_signal_21;
assign rvx_port_20 = 1;
assign rvx_port_28 = rvx_signal_28;
assign rvx_port_19 = AXI_SIZE;
assign rvx_port_13 = `AXI_BURST_INCR;
assign rvx_port_05 = (rvx_signal_17? rvx_signal_10 : {NUM_BYTE{1'b 1}}) & (rvx_signal_05? rvx_signal_13 : {NUM_BYTE{1'b 1}});
assign rvx_port_09 = rvx_signal_08;
assign rvx_port_02 = rvx_signal_16;
assign rvx_port_03 = 0;

assign rvx_port_16 = 2'b 11;

endmodule
