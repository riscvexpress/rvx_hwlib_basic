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
`include "ervp_axi_define.vh"




module RVX_MODULE_061
(
	rvx_port_04,
	rvx_port_07,
  rvx_port_17,
  rvx_port_08,

  rvx_port_24,
  rvx_port_09,
  rvx_port_01,
  rvx_port_22,
  rvx_port_14,
  rvx_port_15,

  rvx_port_21,
  rvx_port_05,
  rvx_port_11,
  rvx_port_13,
  rvx_port_20,

  rvx_port_03,
	rvx_port_18,
  rvx_port_10,
	rvx_port_12,
	rvx_port_16,
	rvx_port_23,
	rvx_port_02,
	rvx_port_19,
  rvx_port_06,
	rvx_port_00
);




parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = RVX_GPARA_2;
localparam  BW_LPIXS_DATA = RVX_GPARA_0;
localparam  BW_LPI_BURDEN = BW_AXI2LPIXS_BURDEN(RVX_GPARA_1);

`include "lpixs_lpara.vb"

input wire rvx_port_04;
input wire rvx_port_07;
input wire rvx_port_17;
input wire rvx_port_08;

output wire [2-1:0] rvx_port_24;
input wire rvx_port_09;
input wire rvx_port_01;
input wire rvx_port_22;
input wire rvx_port_14;
input wire [BW_LPI_QDATA-1:0] rvx_port_15;

input wire [2-1:0] rvx_port_21;
output wire rvx_port_05;
output wire rvx_port_11;
output wire rvx_port_13;
output wire [BW_LPI_YDATA-1:0] rvx_port_20;

output wire rvx_port_03;
output wire rvx_port_18;
output wire [RVX_GPARA_2-1:0] rvx_port_10;
output wire rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_16;
input wire [RVX_GPARA_0-1:0] rvx_port_23;
input wire rvx_port_02;
input wire rvx_port_19;
output wire [RVX_GPARA_1-1:0] rvx_port_06;
output wire [`NUM_BYTE(RVX_GPARA_0)-1:0] rvx_port_00;

wire [BW_LPI_BURDEN-1:0] rvx_signal_02;
wire [BW_LPI_QPARCEL-1:0] rvx_signal_09;

wire rvx_signal_06;
wire [`BW_AXI_ALEN-1:0] rvx_signal_03;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_05;
wire [`BW_AXI_ABURST-1:0] rvx_signal_07;
wire [`BW_AXI_RESP-1:0] rvx_signal_10;

reg rvx_signal_11;
wire rvx_signal_04;
wire rvx_signal_01;

localparam  RVX_LPARA_2 = 2;
localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_1 = 1;
localparam  RVX_LPARA_3 = 3;

reg [RVX_LPARA_2-1:0] rvx_signal_08;

wire rvx_signal_00;

assign {rvx_signal_02,rvx_signal_09} = rvx_port_15;
assign rvx_port_06 = rvx_signal_02;
assign {rvx_signal_06,rvx_port_12,rvx_signal_03,rvx_signal_05,rvx_signal_07,rvx_port_00,rvx_port_16,rvx_port_10} = rvx_signal_09;

always@(posedge rvx_port_04, negedge rvx_port_07)
begin
  if(rvx_port_07==0)
    rvx_signal_11 <= 0;
  else if(rvx_port_08 && rvx_signal_00 && rvx_port_12)
  begin
    if(rvx_port_22)
      rvx_signal_11 <= 0;
    else
      rvx_signal_11 <= rvx_signal_04;
  end
end

assign rvx_signal_04 = rvx_signal_11 | rvx_port_19;
assign rvx_signal_01 = rvx_port_12? rvx_signal_04 : rvx_port_19;
assign rvx_signal_10 = rvx_signal_01? `AXI_RESPONSE_SLVERR : `AXI_RESPONSE_OKAY;

always@(posedge rvx_port_04, negedge rvx_port_07)
begin
  if(rvx_port_07==0)
		rvx_signal_08 <= RVX_LPARA_0;
  else if(rvx_port_08)
  begin
    case(rvx_signal_08)
      RVX_LPARA_0:
        if(rvx_port_09 & (rvx_port_21[0]|(~rvx_port_14)))
          rvx_signal_08 <= RVX_LPARA_1;
      RVX_LPARA_1:
        rvx_signal_08 <= RVX_LPARA_3;
      RVX_LPARA_3:
        if(rvx_signal_00)
          rvx_signal_08 <= RVX_LPARA_0;
    endcase
  end
end

assign {rvx_port_18,rvx_port_03} = rvx_signal_08;

assign rvx_signal_00 = (rvx_signal_08==RVX_LPARA_3) & rvx_port_02;

assign rvx_port_24[0] = rvx_signal_00;
assign rvx_port_24[1] = 0;

assign rvx_port_11 = 0;
assign rvx_port_05 = rvx_signal_00 & rvx_port_14;
assign rvx_port_20 = {rvx_signal_06, rvx_port_12, rvx_signal_10, rvx_port_23};
assign rvx_port_13 = 1;

endmodule
