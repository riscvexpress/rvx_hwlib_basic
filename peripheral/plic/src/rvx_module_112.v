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



module RVX_MODULE_112(
  input         rvx_port_11,
  input         rvx_port_09,
  output        rvx_port_08,
  input         rvx_port_01,
  input         rvx_port_12,
  input  [23:0] rvx_port_06,
  input  [31:0] rvx_port_02,
  input  [3:0]  rvx_port_15,
  input  [11:0] rvx_port_10,
  input         rvx_port_04,
  output        rvx_port_13,
  output        rvx_port_07,
  output [23:0] rvx_port_14,
  output [31:0] rvx_port_00,
  output [3:0]  rvx_port_05,
  output [11:0] rvx_port_03
);


  reg  rvx_signal_35 [0:0];

  wire  rvx_signal_28;
  wire  rvx_signal_24;
  wire  rvx_signal_06;
  wire  rvx_signal_11;
  wire  rvx_signal_08;
  wire  rvx_signal_38;
  reg [23:0] rvx_signal_18 [0:0];

  wire [23:0] rvx_signal_20;
  wire  rvx_signal_09;
  wire [23:0] rvx_signal_34;
  wire  rvx_signal_22;
  wire  rvx_signal_05;
  wire  rvx_signal_30;
  reg [31:0] rvx_signal_37 [0:0];

  wire [31:0] rvx_signal_13;
  wire  rvx_signal_26;
  wire [31:0] rvx_signal_27;
  wire  rvx_signal_14;
  wire  rvx_signal_00;
  wire  rvx_signal_10;
  reg [3:0] rvx_signal_29 [0:0];

  wire [3:0] rvx_signal_15;
  wire  rvx_signal_33;
  wire [3:0] rvx_signal_07;
  wire  rvx_signal_01;
  wire  rvx_signal_12;
  wire  rvx_signal_21;
  reg [11:0] rvx_signal_36 [0:0];

  wire [11:0] rvx_signal_32;
  wire  rvx_signal_31;
  wire [11:0] rvx_signal_03;
  wire  rvx_signal_23;
  wire  rvx_signal_02;
  wire  rvx_signal_25;
  reg  rvx_signal_17;

  wire  rvx_signal_16;
  wire  _T_28;
  wire  rvx_signal_04;
  wire  _T_30;
  wire  rvx_signal_19;
  wire  _T_36;
  wire  _GEN_8;
  wire  _T_38;
  assign rvx_signal_24 = 1'h0;
  assign rvx_signal_28 = rvx_signal_35[rvx_signal_24];
  assign rvx_signal_06 = rvx_port_12;
  assign rvx_signal_11 = 1'h0;
  assign rvx_signal_08 = rvx_signal_04;
  assign rvx_signal_38 = rvx_signal_04;
  assign rvx_signal_09 = 1'h0;
  assign rvx_signal_20 = rvx_signal_18[rvx_signal_09];
  assign rvx_signal_34 = rvx_port_06;
  assign rvx_signal_22 = 1'h0;
  assign rvx_signal_05 = rvx_signal_04;
  assign rvx_signal_30 = rvx_signal_04;
  assign rvx_signal_26 = 1'h0;
  assign rvx_signal_13 = rvx_signal_37[rvx_signal_26];
  assign rvx_signal_27 = rvx_port_02;
  assign rvx_signal_14 = 1'h0;
  assign rvx_signal_00 = rvx_signal_04;
  assign rvx_signal_10 = rvx_signal_04;
  assign rvx_signal_33 = 1'h0;
  assign rvx_signal_15 = rvx_signal_29[rvx_signal_33];
  assign rvx_signal_07 = rvx_port_15;
  assign rvx_signal_01 = 1'h0;
  assign rvx_signal_12 = rvx_signal_04;
  assign rvx_signal_21 = rvx_signal_04;
  assign rvx_signal_31 = 1'h0;
  assign rvx_signal_32 = rvx_signal_36[rvx_signal_31];
  assign rvx_signal_03 = rvx_port_10;
  assign rvx_signal_23 = 1'h0;
  assign rvx_signal_02 = rvx_signal_04;
  assign rvx_signal_25 = rvx_signal_04;
  assign rvx_signal_16 = rvx_signal_17 == 1'h0;
  assign _T_28 = rvx_port_08 & rvx_port_01;
  assign _T_30 = rvx_port_04 & rvx_port_13;
  assign _T_36 = rvx_signal_04 != rvx_signal_19;
  assign _GEN_8 = _T_36 ? rvx_signal_04 : rvx_signal_17;
  assign _T_38 = rvx_signal_16 == 1'h0;
  assign rvx_port_08 = rvx_signal_16;
  assign rvx_port_13 = _T_38;
  assign rvx_port_07 = rvx_signal_28;
  assign rvx_port_14 = rvx_signal_20;
  assign rvx_port_00 = rvx_signal_13;
  assign rvx_port_05 = rvx_signal_15;
  assign rvx_port_03 = rvx_signal_32;
  assign rvx_signal_04 = _T_28;
  assign rvx_signal_19 = _T_30;

always @(posedge rvx_port_11) begin
  if(rvx_signal_38 & rvx_signal_08) begin
    rvx_signal_35[rvx_signal_11] <= rvx_signal_06;
  end
  if(rvx_signal_30 & rvx_signal_05) begin
    rvx_signal_18[rvx_signal_22] <= rvx_signal_34;
  end
  if(rvx_signal_10 & rvx_signal_00) begin
    rvx_signal_37[rvx_signal_14] <= rvx_signal_27;
  end
  if(rvx_signal_21 & rvx_signal_12) begin
    rvx_signal_29[rvx_signal_01] <= rvx_signal_07;
  end
  if(rvx_signal_25 & rvx_signal_02) begin
    rvx_signal_36[rvx_signal_23] <= rvx_signal_03;
  end
end
always @(posedge rvx_port_11, posedge rvx_port_09) begin
  if (rvx_port_09) begin
    rvx_signal_17 <= 1'h0;
  end else begin
    if (_T_36) begin
      rvx_signal_17 <= rvx_signal_04;
    end
  end
end
endmodule
