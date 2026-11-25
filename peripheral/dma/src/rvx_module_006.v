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




module RVX_MODULE_006
(
  rvx_port_02,
  rvx_port_08,

  rvx_port_04,
  rvx_port_14,
  rvx_port_10,
  rvx_port_13,
  rvx_port_24,
  rvx_port_20,
  rvx_port_23,

  rvx_port_29,
  rvx_port_28,

  rvx_port_06,
  rvx_port_17,
  rvx_port_21,

  rvx_port_05,
  rvx_port_09,
  rvx_port_01,
  rvx_port_11,
  rvx_port_25,
  rvx_port_12,
  rvx_port_30,
  rvx_port_15,
  rvx_port_16,
  rvx_port_18,
  rvx_port_22,
  rvx_port_31,
  rvx_port_27,
  rvx_port_26,
  rvx_port_00,
  rvx_port_07,
  rvx_port_03,
  rvx_port_19
);




parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;
parameter BW_LINE_SIZE = 32;
parameter RVX_GPARA_1 = 32;
parameter MAX_BURST_LENGTH_M1 = 15;

`include "rvx_include_15.vh"

localparam  RVX_LPARA_4 = 1;

input wire rvx_port_02;
input wire rvx_port_08;

input wire rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire [BW_LINE_SIZE-1:0] rvx_port_10;
input wire [RVX_GPARA_1-1:0] rvx_port_13;
input wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire rvx_port_20;
output wire [`BW_AXI_RESP-1:0] rvx_port_23;

input wire rvx_port_29;
output wire rvx_port_28;

input wire [(2)-1:0] rvx_port_06;
output wire rvx_port_17;
output wire [BW_AXI_DATA-1:0] rvx_port_21;

input wire [(2)-1:0] rvx_port_05;
output wire rvx_port_09;
output wire rvx_port_01;
output wire rvx_port_11;
output wire [`BW_AXI_ALEN-1:0] rvx_port_25;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_12;
output wire [`BW_AXI_ABURST-1:0] rvx_port_30;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_15;
output wire [BW_AXI_DATA-1:0] rvx_port_16;
output wire [RVX_GPARA_0-1:0] rvx_port_18;
output wire [RVX_LPARA_4-1:0] rvx_port_22;
output wire [(2)-1:0] rvx_port_31;
input wire rvx_port_27;
input wire rvx_port_26;
input wire rvx_port_00;
input wire [`BW_AXI_RESP-1:0] rvx_port_07;
input wire [BW_AXI_DATA-1:0] rvx_port_03;
input wire [RVX_LPARA_4-1:0] rvx_port_19;

localparam  RVX_LPARA_0 = 3;
localparam  RVX_LPARA_6 = 0;
localparam  RVX_LPARA_1 = 1;
localparam  RVX_LPARA_2 = 2;
localparam  RVX_LPARA_3 = 3;
localparam  RVX_LPARA_7 = 4;
localparam  RVX_LPARA_5 = 5;

reg [RVX_LPARA_0-1:0] rvx_signal_29;

reg [RVX_GPARA_0-1:0] rvx_signal_18;
wire [RVX_GPARA_0-1:0] rvx_signal_26;
reg [RVX_GPARA_0-1:0] rvx_signal_13;
reg [RVX_GPARA_1-1:0] rvx_signal_32;
reg [BW_NUM_BEAT-1:0] rvx_signal_03;
reg [BW_NUM_BEAT-1:0] rvx_signal_04;
reg [`BW_AXI_ALEN-1:0] rvx_signal_19;
reg rvx_signal_12;
reg [BW_AXI_DATA-1:0] rvx_signal_23;

wire [BW_OFFSET-1:0] rvx_signal_07;
wire [BW_OFFSET-1:0] rvx_signal_15;
wire [RVX_GPARA_0-1:0] rvx_signal_38;
wire rvx_signal_01;
wire [BW_OFFSET-1:0] rvx_signal_02;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_08;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_28;
wire [BW_NUM_BEAT-1:0] rvx_signal_20;
wire [BW_NUM_BEAT-1:0] rvx_signal_05;
reg [BW_NUM_BEAT-1:0] rvx_signal_21;
reg [BW_NUM_BEAT-1:0] rvx_signal_10;
reg rvx_signal_25;
reg [`BW_AXI_RESP-1:0] rvx_signal_17;
wire [`BW_AXI_RESP-1:0] rvx_signal_33;

wire [BW_NUM_BEAT-1:0] rvx_signal_31;
reg [BW_NUM_BEAT-1:0] rvx_signal_11;
wire [BW_NUM_BEAT-1:0] rvx_signal_37;
reg rvx_signal_09;
reg [BW_BURST_LENGTH-1:0] rvx_signal_22;
reg [RVX_GPARA_0-1:0] rvx_signal_24;
wire rvx_signal_34;

wire rvx_signal_14;
wire rvx_signal_36;
wire rvx_signal_16;
wire [BW_AXI_DATA-1:0] rvx_signal_00;
wire [2*BW_AXI_DATA-1:0] rvx_signal_27;
wire [2*BW_AXI_DATA-1:0] rvx_signal_06;
wire rvx_signal_35;
wire rvx_signal_30;

assign rvx_signal_26 = rvx_port_14 + rvx_signal_18;
assign rvx_signal_02 = rvx_signal_26;
assign rvx_signal_07 = rvx_signal_13;
assign rvx_signal_15 = 0;
assign rvx_signal_38 = {rvx_signal_13[RVX_GPARA_0-1:BW_OFFSET], rvx_signal_15};
assign rvx_signal_01 = (rvx_signal_07!=0);

assign rvx_signal_08 = rvx_port_10;
assign rvx_signal_28 = rvx_signal_08 + rvx_signal_02;
assign rvx_signal_20 = (rvx_signal_08 + (NUM_BYTE-1)) >> BW_OFFSET;
assign rvx_signal_05 = (rvx_signal_28 + (NUM_BYTE-1)) >> BW_OFFSET;

assign rvx_signal_31 = rvx_signal_03 + (MAX_BURST_LENGTH_M1 - rvx_signal_19);
assign rvx_signal_37 = rvx_signal_11 + 1'b 1 - rvx_signal_04;
assign rvx_signal_34 = rvx_port_04 & (rvx_signal_12 | rvx_port_29);

assign rvx_signal_14 = rvx_port_09 & rvx_port_05[0];
assign rvx_signal_36 = (rvx_signal_29==RVX_LPARA_7) & rvx_port_27 & rvx_port_31[0];
assign rvx_signal_16 = (~rvx_signal_01) | (rvx_signal_04!=0);

assign rvx_signal_00 = (rvx_signal_29==RVX_LPARA_5)? 0 : rvx_port_03;
assign rvx_signal_27 = {rvx_signal_00, rvx_signal_23};
assign rvx_signal_06 = rvx_signal_27 >> {rvx_signal_07, 3'b 000};

assign rvx_port_17 = (rvx_signal_36 & rvx_signal_16) | ((rvx_signal_29==RVX_LPARA_5) & rvx_port_06[0]);
assign rvx_port_21 = rvx_signal_01? rvx_signal_06 : rvx_port_03;

assign rvx_signal_30 = rvx_port_17 & (rvx_signal_03==rvx_signal_21);
assign rvx_signal_35 = rvx_port_17 & ((rvx_signal_19==MAX_BURST_LENGTH_M1) | (rvx_signal_03==rvx_signal_21));

always@(posedge rvx_port_02, negedge rvx_port_08)
begin
  if(rvx_port_08==0)
  begin
    rvx_signal_29 <= RVX_LPARA_6;
    rvx_signal_18 <= 0;
    rvx_signal_32 <= 0;
    rvx_signal_03 <= 0;
    rvx_signal_04 <= 0;
    rvx_signal_19 <= 0;
    rvx_signal_12 <= 0;
    rvx_signal_23 <= 0;
  end
  else
  begin
    case(rvx_signal_29)
      RVX_LPARA_6:
        if(rvx_port_04)
          rvx_signal_29 <= RVX_LPARA_1;
      RVX_LPARA_1:
        rvx_signal_29 <= RVX_LPARA_2;
      RVX_LPARA_2:
        rvx_signal_29 <= RVX_LPARA_3;
      RVX_LPARA_3:
        if(rvx_signal_34)
        begin
          if(rvx_signal_09)
          begin
            rvx_signal_29 <= RVX_LPARA_5;
            rvx_signal_12 <= 1;
          end
          else if(rvx_signal_14)
          begin
            rvx_signal_29 <= RVX_LPARA_7;
            rvx_signal_12 <= 1;
          end
        end
      RVX_LPARA_7:
        if(rvx_signal_36)
        begin
          rvx_signal_23 <= rvx_port_03;
          rvx_signal_04 <= rvx_signal_04 + 1'b 1;
          if(rvx_port_26)
            rvx_signal_29 <= RVX_LPARA_1;
        end
    endcase
    if(rvx_port_17)
    begin
      if(rvx_signal_35)
      begin
        rvx_signal_19 <= 0;
        rvx_signal_12 <= 0;
        rvx_signal_29 <= rvx_signal_30? RVX_LPARA_6 : RVX_LPARA_1;
      end
      else
        rvx_signal_19 <= rvx_signal_19 + 1'b 1;
      if(rvx_signal_30)
      begin
        rvx_signal_03 <= 0;
        rvx_signal_04 <= 0;
        if(rvx_signal_25)
        begin
          rvx_signal_18 <= 0;
          rvx_signal_32 <= 0;
        end
        else
        begin
          rvx_signal_18 <= rvx_signal_18 + rvx_port_24;
          rvx_signal_32 <= rvx_signal_32 + 1'b 1;
        end
      end
      else
        rvx_signal_03 <= rvx_signal_03 + 1'b 1;
    end
  end
end

always@(posedge rvx_port_02, negedge rvx_port_08)
begin
  if(rvx_port_08==0)
  begin
    rvx_signal_13 <= 0;
    rvx_signal_21 <= 0;
    rvx_signal_10 <= 0;
    rvx_signal_25 <= 0;
    rvx_signal_11 <= 0;
    rvx_signal_09 <= 0;
    rvx_signal_22 <= 0;
    rvx_signal_24 <= 0;
  end
  else
    case(rvx_signal_29)
      RVX_LPARA_6:
      begin
        rvx_signal_13 <= rvx_signal_26;
        rvx_signal_21 <= rvx_signal_20 - 1'b 1;
        rvx_signal_10 <= rvx_signal_05 - 1'b 1;
        rvx_signal_25 <= ((rvx_signal_32 + 1'b 1)==rvx_port_13);
      end
      RVX_LPARA_1:
        rvx_signal_11 <= (rvx_signal_31 >= rvx_signal_21)? rvx_signal_10 : (rvx_signal_31 + rvx_signal_01);
      RVX_LPARA_2:
      begin
        rvx_signal_09 <= (rvx_signal_37==0);
        rvx_signal_22 <= (rvx_signal_37 > MAX_BURST_LENGTH)? MAX_BURST_LENGTH : rvx_signal_37;
        rvx_signal_24 <= rvx_signal_38 + (rvx_signal_04 << BW_OFFSET);
      end
    endcase
end

assign rvx_port_20 = rvx_signal_30 & rvx_signal_25;
assign rvx_signal_33 = (rvx_signal_36 & (rvx_signal_17==`AXI_RESPONSE_OKAY))? rvx_port_07 : rvx_signal_17;
assign rvx_port_23 = rvx_signal_33;

always@(posedge rvx_port_02, negedge rvx_port_08)
begin
  if(rvx_port_08==0)
    rvx_signal_17 <= `AXI_RESPONSE_OKAY;
  else if(rvx_port_20)
    rvx_signal_17 <= `AXI_RESPONSE_OKAY;
  else
    rvx_signal_17 <= rvx_signal_33;
end
assign rvx_port_28 = rvx_signal_35;

assign rvx_port_09 = (rvx_signal_29==RVX_LPARA_3) & rvx_signal_34 & (~rvx_signal_09);
assign rvx_port_01 = 1;
assign rvx_port_11 = 0;
assign rvx_port_25 = rvx_signal_22 - 1'b 1;
assign rvx_port_12 = AXI_SIZE;
assign rvx_port_30 = `AXI_BURST_INCR;
assign rvx_port_15 = 0;
assign rvx_port_16 = 0;
assign rvx_port_18 = rvx_signal_24;
assign rvx_port_22 = 0;

assign rvx_port_31 = rvx_port_06;

endmodule
