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
`default_nettype wire



module RVX_MODULE_030(
  input         rvx_port_05,
  input         rvx_port_04,
  output        rvx_port_12,
  input         rvx_port_08,
  input         rvx_port_02,
  input  [23:0] rvx_port_03,
  input  [31:0] rvx_port_10,
  input  [3:0]  rvx_port_09,
  input  [11:0] rvx_port_11,
  input         rvx_port_06,
  output        rvx_port_13,
  output        rvx_port_07,
  output [23:0] rvx_port_14,
  output [31:0] rvx_port_15,
  output [3:0]  rvx_port_01,
  output [11:0] rvx_port_00
);


  reg  rvx_signal_31 [0:0];

  wire  rvx_signal_28;
  wire  rvx_signal_26;
  wire  rvx_signal_29;
  wire  rvx_signal_02;
  wire  rvx_signal_37;
  wire  rvx_signal_20;
  reg [23:0] rvx_signal_38 [0:0];

  wire [23:0] rvx_signal_22;
  wire  rvx_signal_13;
  wire [23:0] rvx_signal_36;
  wire  rvx_signal_00;
  wire  rvx_signal_05;
  wire  rvx_signal_08;
  reg [31:0] rvx_signal_33 [0:0];

  wire [31:0] rvx_signal_25;
  wire  rvx_signal_03;
  wire [31:0] rvx_signal_01;
  wire  rvx_signal_16;
  wire  rvx_signal_35;
  wire  rvx_signal_18;
  reg [3:0] rvx_signal_17 [0:0];

  wire [3:0] rvx_signal_32;
  wire  rvx_signal_09;
  wire [3:0] rvx_signal_15;
  wire  rvx_signal_10;
  wire  rvx_signal_06;
  wire  rvx_signal_23;
  reg [11:0] rvx_signal_30 [0:0];

  wire [11:0] rvx_signal_07;
  wire  rvx_signal_14;
  wire [11:0] rvx_signal_27;
  wire  rvx_signal_19;
  wire  rvx_signal_24;
  wire  rvx_signal_34;
  reg  rvx_signal_04;

  wire  rvx_signal_11;
  wire  _T_28;
  wire  rvx_signal_21;
  wire  _T_30;
  wire  rvx_signal_12;
  wire  _T_36;
  wire  _GEN_8;
  wire  _T_38;
  assign rvx_signal_26 = 1'h0;
  assign rvx_signal_28 = rvx_signal_31[rvx_signal_26];
  assign rvx_signal_29 = rvx_port_02;
  assign rvx_signal_02 = 1'h0;
  assign rvx_signal_37 = rvx_signal_21;
  assign rvx_signal_20 = rvx_signal_21;
  assign rvx_signal_13 = 1'h0;
  assign rvx_signal_22 = rvx_signal_38[rvx_signal_13];
  assign rvx_signal_36 = rvx_port_03;
  assign rvx_signal_00 = 1'h0;
  assign rvx_signal_05 = rvx_signal_21;
  assign rvx_signal_08 = rvx_signal_21;
  assign rvx_signal_03 = 1'h0;
  assign rvx_signal_25 = rvx_signal_33[rvx_signal_03];
  assign rvx_signal_01 = rvx_port_10;
  assign rvx_signal_16 = 1'h0;
  assign rvx_signal_35 = rvx_signal_21;
  assign rvx_signal_18 = rvx_signal_21;
  assign rvx_signal_09 = 1'h0;
  assign rvx_signal_32 = rvx_signal_17[rvx_signal_09];
  assign rvx_signal_15 = rvx_port_09;
  assign rvx_signal_10 = 1'h0;
  assign rvx_signal_06 = rvx_signal_21;
  assign rvx_signal_23 = rvx_signal_21;
  assign rvx_signal_14 = 1'h0;
  assign rvx_signal_07 = rvx_signal_30[rvx_signal_14];
  assign rvx_signal_27 = rvx_port_11;
  assign rvx_signal_19 = 1'h0;
  assign rvx_signal_24 = rvx_signal_21;
  assign rvx_signal_34 = rvx_signal_21;
  assign rvx_signal_11 = rvx_signal_04 == 1'h0;
  assign _T_28 = rvx_port_12 & rvx_port_08;
  assign _T_30 = rvx_port_06 & rvx_port_13;
  assign _T_36 = rvx_signal_21 != rvx_signal_12;
  assign _GEN_8 = _T_36 ? rvx_signal_21 : rvx_signal_04;
  assign _T_38 = rvx_signal_11 == 1'h0;
  assign rvx_port_12 = rvx_signal_11;
  assign rvx_port_13 = _T_38;
  assign rvx_port_07 = rvx_signal_28;
  assign rvx_port_14 = rvx_signal_22;
  assign rvx_port_15 = rvx_signal_25;
  assign rvx_port_01 = rvx_signal_32;
  assign rvx_port_00 = rvx_signal_07;
  assign rvx_signal_21 = _T_28;
  assign rvx_signal_12 = _T_30;

always @(posedge rvx_port_05) begin
  if(rvx_signal_20 & rvx_signal_37) begin
    rvx_signal_31[rvx_signal_02] <= rvx_signal_29;
  end
  if(rvx_signal_08 & rvx_signal_05) begin
    rvx_signal_38[rvx_signal_00] <= rvx_signal_36;
  end
  if(rvx_signal_18 & rvx_signal_35) begin
    rvx_signal_33[rvx_signal_16] <= rvx_signal_01;
  end
  if(rvx_signal_23 & rvx_signal_06) begin
    rvx_signal_17[rvx_signal_10] <= rvx_signal_15;
  end
  if(rvx_signal_34 & rvx_signal_24) begin
    rvx_signal_30[rvx_signal_19] <= rvx_signal_27;
  end
end
always @(posedge rvx_port_05, posedge rvx_port_04) begin
  if (rvx_port_04) begin
    rvx_signal_04 <= 1'h0;
  end else begin
    if (_T_36) begin
      rvx_signal_04 <= rvx_signal_21;
    end
  end
end
endmodule
