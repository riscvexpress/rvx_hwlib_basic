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
`include "ervp_axi_define.vh"





module RVX_MODULE_135
(
  rvx_port_06,
  rvx_port_02,
  rvx_port_07,
  rvx_port_00,

  rvx_port_01,
  rvx_port_11,
  rvx_port_04,
  rvx_port_14,
  rvx_port_13,
  rvx_port_12,

  rvx_port_15,
  rvx_port_09,
  rvx_port_05,
  rvx_port_10,
  rvx_port_03,
  rvx_port_08
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `BW_AXI_ALEN;
parameter RVX_GPARA_2 = 0;

input wire rvx_port_06;
input wire rvx_port_02;
input wire rvx_port_07;
input wire rvx_port_00;

input wire rvx_port_01;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_04;
input wire [`BW_AXI_ABURST-1:0] rvx_port_14;
input wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire rvx_port_12;

output reg rvx_port_15;
output reg [RVX_GPARA_1-1:0] rvx_port_09;
output reg rvx_port_05;
output wire rvx_port_10;
output reg [RVX_GPARA_0-1:0] rvx_port_03;
input wire rvx_port_08;

wire rvx_signal_06;
wire rvx_signal_03;

reg [RVX_GPARA_1-1:0] rvx_signal_07;
reg [RVX_GPARA_1-1:0] rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
wire [RVX_GPARA_1-1:0] rvx_signal_05, rvx_signal_04;
reg [RVX_GPARA_1-1:0] rvx_signal_08;

reg [RVX_GPARA_1-1:0] rvx_signal_00, rvx_signal_02;

assign rvx_port_12 = (rvx_port_15==0) | ((~RVX_GPARA_2) & rvx_signal_03 & rvx_port_10); 
assign rvx_signal_06 = rvx_port_01 & rvx_port_12;
assign rvx_signal_03 = rvx_port_15 & rvx_port_08;

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
  if(rvx_port_02==0)
  begin
    rvx_port_15 <= 0;
    rvx_port_09 <= 0;
    rvx_port_03 <= 0;
  end
  else if(rvx_port_07)
    rvx_port_15 <= 0;
  else if(rvx_port_00)
  begin
    if(rvx_signal_06==1)
    begin
      rvx_port_15 <= 1;
      rvx_port_09 <= $unsigned(rvx_port_13);
      case(rvx_port_14)
        `AXI_BURST_FIXED:
        rvx_port_03 <= 0;
        `AXI_BURST_INCR,
        `AXI_BURST_WRAP:
        rvx_port_03 <= rvx_port_11;
      endcase
    end
    else
    begin
      if(rvx_signal_03)
      begin
        if(rvx_port_10)
        begin
          rvx_port_15 <= 0;
          rvx_port_09 <= rvx_signal_08;
          rvx_port_03 <= rvx_port_03 - 1;
        end
        else
        begin
          rvx_port_09 <= rvx_signal_08;
          rvx_port_03 <= rvx_port_03 - 1;
        end
      end
    end
  end
end

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
  if(rvx_port_02==0)
    rvx_signal_07 <= 0;
  else if(rvx_signal_06)
  case(rvx_port_04)
    `AXI_SIZE_001BYTE: rvx_signal_07 <= 1;
    `AXI_SIZE_002BYTE: rvx_signal_07 <= 2;
    `AXI_SIZE_004BYTE: rvx_signal_07 <= 4;
    `AXI_SIZE_008BYTE: rvx_signal_07 <= 8;
    `AXI_SIZE_016BYTE: rvx_signal_07 <= 16;
    `AXI_SIZE_032BYTE: rvx_signal_07 <= 32;
    `AXI_SIZE_064BYTE: rvx_signal_07 <= 64;
    `AXI_SIZE_128BYTE: rvx_signal_07 <= 128;
  endcase
end

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(RVX_GPARA_1),
  .BW_SHIFT_AMOUNT(`BW_AXI_ASIZE),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1),
  .ARITHMETIC_SHIFT(0),
  .LSB_FILL_VALUE(1)
)
i_rvx_instance_0
(
  .data_input(rvx_signal_05),
  .shift_amount(rvx_port_04),
  .data_output(rvx_signal_04)
);

assign rvx_signal_05 = $unsigned(rvx_port_11);
assign rvx_signal_01 = (rvx_port_14==`AXI_BURST_WRAP)? rvx_signal_04 : $signed(-1);

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
  if(rvx_port_02==0)
    rvx_signal_09 <= $signed(-1);
  else if(rvx_signal_06)
    rvx_signal_09 <= rvx_signal_01;
end

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
  if(rvx_port_02==0)
    rvx_signal_00 <= 0;
  else if(rvx_signal_06)
    rvx_signal_00 <= rvx_signal_02;
end

always@(*)
begin
  rvx_signal_02 = -1;
  case(rvx_port_04)
    `AXI_SIZE_001BYTE: ;
    `AXI_SIZE_002BYTE: rvx_signal_02[0] = 0;
    `AXI_SIZE_004BYTE: rvx_signal_02[1:0] = 0;
    `AXI_SIZE_008BYTE: rvx_signal_02[2:0] = 0;
    `AXI_SIZE_016BYTE: rvx_signal_02[3:0] = 0;
    `AXI_SIZE_032BYTE: rvx_signal_02[4:0] = 0;
    `AXI_SIZE_064BYTE: rvx_signal_02[5:0] = 0;
    `AXI_SIZE_128BYTE: rvx_signal_02[6:0] = 0;
  endcase
end

always@(*)
begin
  rvx_signal_08 = rvx_port_09 + rvx_signal_07;
  rvx_signal_08 = (rvx_port_09 & (~rvx_signal_09) ) | (rvx_signal_08 & rvx_signal_09);
  rvx_signal_08 = rvx_signal_08 & rvx_signal_00;
end

always@(posedge rvx_port_06, negedge rvx_port_02)
begin
  if(rvx_port_02==0)
    rvx_port_05 <= 0;
  else if(rvx_signal_06)
    rvx_port_05 <= 1;
  else if(rvx_port_05&&rvx_signal_03)
    rvx_port_05 <= 0;
end

assign rvx_port_10 = (rvx_port_03==0);

endmodule
