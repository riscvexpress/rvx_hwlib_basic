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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************
`default_nettype wire



module RVX_MODULE_026(
  input         rvx_port_15,
  input         rvx_port_14,
  output        rvx_port_04,
  input         rvx_port_01,
  input         rvx_port_10,
  input  [23:0] rvx_port_02,
  input  [31:0] rvx_port_05,
  input  [3:0]  rvx_port_12,
  input  [11:0] rvx_port_09,
  input         rvx_port_00,
  output        rvx_port_08,
  output        rvx_port_06,
  output [23:0] rvx_port_03,
  output [31:0] rvx_port_07,
  output [3:0]  rvx_port_11,
  output [11:0] rvx_port_13
);


  reg  rvx_signal_32 [0:0];

  wire  rvx_signal_16;
  wire  rvx_signal_34;
  wire  rvx_signal_00;
  wire  rvx_signal_33;
  wire  rvx_signal_36;
  wire  rvx_signal_30;
  reg [23:0] rvx_signal_21 [0:0];

  wire [23:0] rvx_signal_12;
  wire  rvx_signal_07;
  wire [23:0] rvx_signal_27;
  wire  rvx_signal_04;
  wire  rvx_signal_19;
  wire  rvx_signal_05;
  reg [31:0] rvx_signal_38 [0:0];

  wire [31:0] rvx_signal_15;
  wire  rvx_signal_18;
  wire [31:0] rvx_signal_03;
  wire  rvx_signal_24;
  wire  rvx_signal_11;
  wire  rvx_signal_29;
  reg [3:0] rvx_signal_09 [0:0];

  wire [3:0] rvx_signal_20;
  wire  rvx_signal_28;
  wire [3:0] rvx_signal_10;
  wire  rvx_signal_35;
  wire  rvx_signal_01;
  wire  rvx_signal_13;
  reg [11:0] rvx_signal_02 [0:0];

  wire [11:0] rvx_signal_22;
  wire  rvx_signal_31;
  wire [11:0] rvx_signal_14;
  wire  rvx_signal_25;
  wire  rvx_signal_17;
  wire  rvx_signal_06;
  reg  rvx_signal_23;

  wire  rvx_signal_37;
  wire  _T_28;
  wire  rvx_signal_08;
  wire  _T_30;
  wire  rvx_signal_26;
  wire  _T_36;
  wire  _GEN_8;
  wire  _T_38;
  assign rvx_signal_34 = 1'h0;
  assign rvx_signal_16 = rvx_signal_32[rvx_signal_34];
  assign rvx_signal_00 = rvx_port_10;
  assign rvx_signal_33 = 1'h0;
  assign rvx_signal_36 = rvx_signal_08;
  assign rvx_signal_30 = rvx_signal_08;
  assign rvx_signal_07 = 1'h0;
  assign rvx_signal_12 = rvx_signal_21[rvx_signal_07];
  assign rvx_signal_27 = rvx_port_02;
  assign rvx_signal_04 = 1'h0;
  assign rvx_signal_19 = rvx_signal_08;
  assign rvx_signal_05 = rvx_signal_08;
  assign rvx_signal_18 = 1'h0;
  assign rvx_signal_15 = rvx_signal_38[rvx_signal_18];
  assign rvx_signal_03 = rvx_port_05;
  assign rvx_signal_24 = 1'h0;
  assign rvx_signal_11 = rvx_signal_08;
  assign rvx_signal_29 = rvx_signal_08;
  assign rvx_signal_28 = 1'h0;
  assign rvx_signal_20 = rvx_signal_09[rvx_signal_28];
  assign rvx_signal_10 = rvx_port_12;
  assign rvx_signal_35 = 1'h0;
  assign rvx_signal_01 = rvx_signal_08;
  assign rvx_signal_13 = rvx_signal_08;
  assign rvx_signal_31 = 1'h0;
  assign rvx_signal_22 = rvx_signal_02[rvx_signal_31];
  assign rvx_signal_14 = rvx_port_09;
  assign rvx_signal_25 = 1'h0;
  assign rvx_signal_17 = rvx_signal_08;
  assign rvx_signal_06 = rvx_signal_08;
  assign rvx_signal_37 = rvx_signal_23 == 1'h0;
  assign _T_28 = rvx_port_04 & rvx_port_01;
  assign _T_30 = rvx_port_00 & rvx_port_08;
  assign _T_36 = rvx_signal_08 != rvx_signal_26;
  assign _GEN_8 = _T_36 ? rvx_signal_08 : rvx_signal_23;
  assign _T_38 = rvx_signal_37 == 1'h0;
  assign rvx_port_04 = rvx_signal_37;
  assign rvx_port_08 = _T_38;
  assign rvx_port_06 = rvx_signal_16;
  assign rvx_port_03 = rvx_signal_12;
  assign rvx_port_07 = rvx_signal_15;
  assign rvx_port_11 = rvx_signal_20;
  assign rvx_port_13 = rvx_signal_22;
  assign rvx_signal_08 = _T_28;
  assign rvx_signal_26 = _T_30;

always @(posedge rvx_port_15) begin
  if(rvx_signal_30 & rvx_signal_36) begin
    rvx_signal_32[rvx_signal_33] <= rvx_signal_00;
  end
  if(rvx_signal_05 & rvx_signal_19) begin
    rvx_signal_21[rvx_signal_04] <= rvx_signal_27;
  end
  if(rvx_signal_29 & rvx_signal_11) begin
    rvx_signal_38[rvx_signal_24] <= rvx_signal_03;
  end
  if(rvx_signal_13 & rvx_signal_01) begin
    rvx_signal_09[rvx_signal_35] <= rvx_signal_10;
  end
  if(rvx_signal_06 & rvx_signal_17) begin
    rvx_signal_02[rvx_signal_25] <= rvx_signal_14;
  end
end
always @(posedge rvx_port_15, posedge rvx_port_14) begin
  if (rvx_port_14) begin
    rvx_signal_23 <= 1'h0;
  end else begin
    if (_T_36) begin
      rvx_signal_23 <= rvx_signal_08;
    end
  end
end
endmodule
