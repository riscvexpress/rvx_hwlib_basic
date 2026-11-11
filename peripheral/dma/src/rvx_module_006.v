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
  rvx_port_24,
  rvx_port_13,

  rvx_port_03,
  rvx_port_11,
  rvx_port_21,
  rvx_port_14,
  rvx_port_09,
  rvx_port_30,

  rvx_port_20,
  rvx_port_12,

  rvx_port_19,
  rvx_port_07,
  rvx_port_05,

  rvx_port_26,
  rvx_port_15,
  rvx_port_23,
  rvx_port_29,
  rvx_port_18,
  rvx_port_25,
  rvx_port_10,
  rvx_port_06,
  rvx_port_00,
  rvx_port_16,
  rvx_port_27,
  rvx_port_01,
  rvx_port_28,
  rvx_port_08,
  rvx_port_02,
  rvx_port_04,
  rvx_port_22,
  rvx_port_17
);




parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;
parameter BW_LINE_SIZE = 32;
parameter RVX_GPARA_1 = 32;
parameter MAX_BURST_LENGTH_M1 = 15;

`include "rvx_include_15.vh"

localparam  RVX_LPARA_1 = 1;

input wire rvx_port_24;
input wire rvx_port_13;

input wire rvx_port_03;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
input wire [BW_LINE_SIZE-1:0] rvx_port_21;
input wire [RVX_GPARA_1-1:0] rvx_port_14;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
output wire rvx_port_30;

input wire rvx_port_20;
output wire rvx_port_12;

input wire [(2)-1:0] rvx_port_19;
output wire rvx_port_07;
output wire [BW_AXI_DATA-1:0] rvx_port_05;

input wire [(2)-1:0] rvx_port_26;
output wire rvx_port_15;
output wire rvx_port_23;
output wire rvx_port_29;
output wire [`BW_AXI_ALEN-1:0] rvx_port_18;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_25;
output wire [`BW_AXI_ABURST-1:0] rvx_port_10;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_06;
output wire [BW_AXI_DATA-1:0] rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_16;
output wire [RVX_LPARA_1-1:0] rvx_port_27;
output wire [(2)-1:0] rvx_port_01;
input wire rvx_port_28;
input wire rvx_port_08;
input wire rvx_port_02;
input wire [`BW_AXI_RESP-1:0] rvx_port_04;
input wire [BW_AXI_DATA-1:0] rvx_port_22;
input wire [RVX_LPARA_1-1:0] rvx_port_17;

localparam  RVX_LPARA_0 = 2;
localparam  RVX_LPARA_4 = 0;
localparam  RVX_LPARA_2 = 1;
localparam  RVX_LPARA_3 = 2;

reg [RVX_LPARA_0-1:0] rvx_signal_08;

reg [RVX_GPARA_0-1:0] rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_04;
reg [RVX_GPARA_1-1:0] rvx_signal_29;
reg [BW_NUM_BEAT-1:0] rvx_signal_01;
reg [BW_NUM_BEAT-1:0] rvx_signal_05;
reg [`BW_AXI_ALEN-1:0] rvx_signal_09;
reg rvx_signal_30;
reg [BW_AXI_DATA-1:0] rvx_signal_14;

wire [BW_OFFSET-1:0] rvx_signal_27;
wire [BW_OFFSET-1:0] rvx_signal_15;
wire [RVX_GPARA_0-1:0] rvx_signal_31;
wire rvx_signal_12;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_25;
wire [BW_TOTAL_SIZE-1:0] rvx_signal_02;
wire [BW_NUM_BEAT-1:0] rvx_signal_19;
wire [BW_NUM_BEAT-1:0] rvx_signal_10;
wire [BW_NUM_BEAT-1:0] rvx_signal_28;
wire [BW_NUM_BEAT-1:0] rvx_signal_26;
wire rvx_signal_18;

wire [BW_NUM_BEAT-1:0] rvx_signal_23;
wire [BW_NUM_BEAT-1:0] rvx_signal_17;
wire [BW_NUM_BEAT-1:0] rvx_signal_13;
wire [BW_NUM_BEAT-1:0] rvx_signal_35;
wire [BW_NUM_BEAT-1:0] rvx_signal_20;
wire rvx_signal_33;
wire [BW_BURST_LENGTH-1:0] rvx_signal_03;
wire rvx_signal_11;

wire rvx_signal_00;
wire rvx_signal_21;
wire rvx_signal_06;
wire [BW_AXI_DATA-1:0] rvx_signal_32;
wire [2*BW_AXI_DATA-1:0] rvx_signal_34;
wire [2*BW_AXI_DATA-1:0] rvx_signal_22;
wire rvx_signal_24;
wire rvx_signal_07;

assign rvx_signal_04 = rvx_port_11 + rvx_signal_16;
assign rvx_signal_27 = rvx_signal_04;
assign rvx_signal_15 = 0;
assign rvx_signal_31 = {rvx_signal_04[RVX_GPARA_0-1:BW_OFFSET], rvx_signal_15};
assign rvx_signal_12 = (rvx_signal_27!=0);

assign rvx_signal_25 = rvx_port_21;
assign rvx_signal_02 = rvx_signal_25 + rvx_signal_27;
assign rvx_signal_19 = (rvx_signal_25 + (NUM_BYTE-1)) >> BW_OFFSET;
assign rvx_signal_10 = (rvx_signal_02 + (NUM_BYTE-1)) >> BW_OFFSET;
assign rvx_signal_28 = rvx_signal_19 - 1'b 1;
assign rvx_signal_26 = rvx_signal_10 - 1'b 1;
assign rvx_signal_18 = ((rvx_signal_29 + 1'b 1)==rvx_port_14);

assign rvx_signal_23 = rvx_signal_01 + (MAX_BURST_LENGTH_M1 - rvx_signal_09);
assign rvx_signal_17 = (rvx_signal_23 > rvx_signal_28)? rvx_signal_28 : rvx_signal_23;
assign rvx_signal_13 = rvx_signal_17 + rvx_signal_12;
assign rvx_signal_35 = (rvx_signal_13 > rvx_signal_26)? rvx_signal_26 : rvx_signal_13;
assign rvx_signal_20 = rvx_signal_35 + 1'b 1 - rvx_signal_05;
assign rvx_signal_33 = (rvx_signal_20==0);
assign rvx_signal_03 = (rvx_signal_20 > MAX_BURST_LENGTH)? MAX_BURST_LENGTH : rvx_signal_20;
assign rvx_signal_11 = rvx_port_03 & (rvx_signal_30 | rvx_port_20);

assign rvx_signal_00 = rvx_port_15 & rvx_port_26[0];
assign rvx_signal_21 = (rvx_signal_08==RVX_LPARA_2) & rvx_port_28 & rvx_port_01[0];
assign rvx_signal_06 = (~rvx_signal_12) | (rvx_signal_05!=0);

assign rvx_signal_32 = (rvx_signal_08==RVX_LPARA_3)? 0 : rvx_port_22;
assign rvx_signal_34 = {rvx_signal_32, rvx_signal_14};
assign rvx_signal_22 = rvx_signal_34 >> {rvx_signal_27, 3'b 000};

assign rvx_port_07 = (rvx_signal_21 & rvx_signal_06) | ((rvx_signal_08==RVX_LPARA_3) & rvx_port_19[0]);
assign rvx_port_05 = rvx_signal_12? rvx_signal_22 : rvx_port_22;

assign rvx_signal_07 = rvx_port_07 & (rvx_signal_01==rvx_signal_28);
assign rvx_signal_24 = rvx_port_07 & ((rvx_signal_09==MAX_BURST_LENGTH_M1) | (rvx_signal_01==rvx_signal_28));

always@(posedge rvx_port_24, negedge rvx_port_13)
begin
  if(rvx_port_13==0)
  begin
    rvx_signal_08 <= RVX_LPARA_4;
    rvx_signal_16 <= 0;
    rvx_signal_29 <= 0;
    rvx_signal_01 <= 0;
    rvx_signal_05 <= 0;
    rvx_signal_09 <= 0;
    rvx_signal_30 <= 0;
    rvx_signal_14 <= 0;
  end
  else
  begin
    case(rvx_signal_08)
      RVX_LPARA_4:
        if(rvx_signal_11)
        begin
          if(rvx_signal_33)
          begin
            rvx_signal_08 <= RVX_LPARA_3;
            rvx_signal_30 <= 1;
          end
          else if(rvx_signal_00)
          begin
            rvx_signal_08 <= RVX_LPARA_2;
            rvx_signal_30 <= 1;
          end
        end
      RVX_LPARA_2:
        if(rvx_signal_21)
        begin
          rvx_signal_14 <= rvx_port_22;
          rvx_signal_05 <= rvx_signal_05 + 1'b 1;
          if(rvx_port_08)
            rvx_signal_08 <= RVX_LPARA_4;
        end
    endcase
    if(rvx_port_07)
    begin
      if(rvx_signal_24)
      begin
        rvx_signal_09 <= 0;
        rvx_signal_30 <= 0;
        rvx_signal_08 <= RVX_LPARA_4;
      end
      else
        rvx_signal_09 <= rvx_signal_09 + 1'b 1;
      if(rvx_signal_07)
      begin
        rvx_signal_01 <= 0;
        rvx_signal_05 <= 0;
        if(rvx_signal_18)
        begin
          rvx_signal_16 <= 0;
          rvx_signal_29 <= 0;
        end
        else
        begin
          rvx_signal_16 <= rvx_signal_16 + rvx_port_09;
          rvx_signal_29 <= rvx_signal_29 + 1'b 1;
        end
      end
      else
        rvx_signal_01 <= rvx_signal_01 + 1'b 1;
    end
  end
end

assign rvx_port_30 = rvx_signal_07 & rvx_signal_18;
assign rvx_port_12 = rvx_signal_24;

assign rvx_port_15 = (rvx_signal_08==RVX_LPARA_4) & rvx_signal_11 & (~rvx_signal_33);
assign rvx_port_23 = 1;
assign rvx_port_29 = 0;
assign rvx_port_18 = rvx_signal_03 - 1'b 1;
assign rvx_port_25 = AXI_SIZE;
assign rvx_port_10 = `AXI_BURST_INCR;
assign rvx_port_06 = 0;
assign rvx_port_00 = 0;
assign rvx_port_16 = rvx_signal_31 + (rvx_signal_05 << BW_OFFSET);
assign rvx_port_27 = 0;

assign rvx_port_01 = rvx_port_19;

endmodule
