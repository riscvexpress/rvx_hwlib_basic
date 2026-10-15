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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"





module RVX_MODULE_006
(
	rvx_port_30,
	rvx_port_10,
  rvx_port_03,
  rvx_port_15,

  rvx_port_06,
  rvx_port_31,
  rvx_port_13,
  rvx_port_27,
  rvx_port_42,
  rvx_port_09,

  rvx_port_26,
  rvx_port_40,
  rvx_port_17,
  rvx_port_16,
  rvx_port_35,

  rvx_port_28,
	rvx_port_04,
	rvx_port_12,
	rvx_port_38,
	rvx_port_22,
	rvx_port_00,
	rvx_port_36,

	rvx_port_21,
	rvx_port_24,
	rvx_port_11,
	rvx_port_14,
	rvx_port_34,
	rvx_port_23, 

	rvx_port_33,
	rvx_port_32,
	rvx_port_01,
	rvx_port_18,

	rvx_port_39,
	rvx_port_07,
	rvx_port_43,
	rvx_port_02,
	rvx_port_29,
	rvx_port_20,
	rvx_port_25,

	rvx_port_41,
	rvx_port_05,
	rvx_port_37,
	rvx_port_08,
	rvx_port_44,
	rvx_port_19
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 1;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_2 = 4;

`include "burden_para.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = RVX_GPARA_0;
localparam  BW_LPIXM_DATA = RVX_GPARA_1;
localparam  BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;

`include "lpixm_lpara.vb"

input wire rvx_port_30;
input wire rvx_port_10;
input wire rvx_port_03;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_06;
input wire rvx_port_31;
input wire rvx_port_13;
input wire rvx_port_27;
input wire rvx_port_42;
input wire [BW_LPI_QDATA-1:0] rvx_port_09;

input wire [2-1:0] rvx_port_26;
output wire rvx_port_40;
output wire rvx_port_17;
output wire rvx_port_16;
output wire [BW_LPI_YDATA-1:0] rvx_port_35;

output wire [RVX_GPARA_3-1:0] rvx_port_28;
output wire [RVX_GPARA_0-1:0] rvx_port_04;
output wire [`BW_AXI_ALEN-1:0] rvx_port_12;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_38;
output wire [`BW_AXI_ABURST-1:0] rvx_port_22;
output wire rvx_port_00;
input wire rvx_port_36;

output wire [RVX_GPARA_3-1:0] rvx_port_21;
output wire [RVX_GPARA_1-1:0] rvx_port_24;
output wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_11;
output wire rvx_port_14;
output wire rvx_port_34;
input wire rvx_port_23;

input wire [RVX_GPARA_3-1:0] rvx_port_33;
input wire [`BW_AXI_BRESP-1:0] rvx_port_32;
input wire rvx_port_01;
output wire rvx_port_18;

output wire [RVX_GPARA_3-1:0] rvx_port_39;
output wire [RVX_GPARA_0-1:0] rvx_port_07;
output wire [`BW_AXI_ALEN-1:0] rvx_port_43;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_02;
output wire [`BW_AXI_ABURST-1:0] rvx_port_29;
output wire rvx_port_20;
input wire rvx_port_25;

input wire [RVX_GPARA_3-1:0] rvx_port_41;
input wire [RVX_GPARA_1-1:0] rvx_port_05;
input wire [`BW_AXI_RRESP-1:0] rvx_port_37;
input wire rvx_port_08;
input wire rvx_port_44;
output wire rvx_port_19;

`include "motype_lpara.vb"

wire rvx_signal_16;
wire [`BW_AXI_ALEN-1:0] rvx_signal_02;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_00;
wire [`BW_AXI_ABURST-1:0] rvx_signal_06;
wire [`NUM_BYTE(RVX_GPARA_1)-1:0] rvx_signal_25;
wire [RVX_GPARA_1-1:0] rvx_signal_11;
wire [RVX_GPARA_0-1:0] rvx_signal_05;

wire rvx_signal_21;
wire rvx_signal_10;
wire rvx_signal_20;
wire rvx_signal_08;
wire rvx_signal_15;

localparam  RVX_LPARA_03 = RVX_GPARA_2 + 1;

wire rvx_signal_09;
wire rvx_signal_18;
wire rvx_signal_01;
wire [RVX_LPARA_03-1:0] rvx_signal_24;
wire rvx_signal_23;
wire rvx_signal_19;
wire rvx_signal_14;

localparam  RVX_LPARA_04 = 2;
localparam  RVX_LPARA_10 = 0;
localparam  RVX_LPARA_00 = 1;

localparam  RVX_LPARA_06 = 1<<RVX_LPARA_10;
localparam  RVX_LPARA_01 = 1<<RVX_LPARA_00;

reg [RVX_LPARA_04-1:0] rvx_signal_04;

localparam  RVX_LPARA_05 = 2;
localparam  RVX_LPARA_08 = 0;
localparam  RVX_LPARA_07 = 1;

localparam  RVX_LPARA_09 = 1<<RVX_LPARA_08;
localparam  RVX_LPARA_02 = 1<<RVX_LPARA_07;

reg [RVX_LPARA_05-1:0] rvx_signal_07; 

reg rvx_signal_03;
wire rvx_signal_13;
wire rvx_signal_17;
wire rvx_signal_12;

reg rvx_signal_22;

assign {rvx_signal_16,rvx_signal_02,rvx_signal_00,rvx_signal_06,rvx_signal_25,rvx_signal_11,rvx_signal_05} = rvx_port_09;

assign rvx_signal_21 = rvx_port_20 & rvx_port_25;
assign rvx_signal_10 = rvx_port_44 & rvx_port_19;
assign rvx_signal_20 = rvx_port_00 & rvx_port_36;
assign rvx_signal_08 = rvx_port_34 & rvx_port_23;
assign rvx_signal_15 = rvx_port_01 & rvx_port_18;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(RVX_LPARA_03)
)
i_rvx_instance_0
(
	.clk(rvx_port_30),
  .rstnn(rvx_port_10),
	.enable(rvx_port_15 & (~EXCLUSIVE_SUPPORTED)),
	.init(rvx_signal_09),
	.up(rvx_signal_18),
	.down(rvx_signal_01),
	.value(rvx_signal_24),
	.is_first_count(rvx_signal_23),
	.is_last_count(rvx_signal_19)
);

assign rvx_signal_09 = rvx_port_03;
assign rvx_signal_18 = rvx_signal_20 | rvx_signal_21;
assign rvx_signal_01 = rvx_signal_15 | (rvx_signal_10&rvx_port_08);
assign rvx_signal_14 = EXCLUSIVE_SUPPORTED | (~rvx_signal_19);

always@(posedge rvx_port_30, negedge rvx_port_10)
begin
  if(rvx_port_10==0)
    rvx_signal_04 <= WRITE_ONLY_SUPPORTED? RVX_LPARA_01 : RVX_LPARA_06;
  else if(rvx_port_03)
    rvx_signal_04 <= WRITE_ONLY_SUPPORTED? RVX_LPARA_01 : RVX_LPARA_06;
  else if(rvx_port_15 & (~EXCLUSIVE_SUPPORTED))
  begin
    if(rvx_signal_23)
    begin
      if(rvx_signal_21|rvx_signal_20)
      begin
        rvx_signal_04[RVX_LPARA_10] <= rvx_signal_21;
        rvx_signal_04[RVX_LPARA_00] <= rvx_signal_20;
      end
    end
  end
end

always@(posedge rvx_port_30, negedge rvx_port_10)
begin
  if(rvx_port_10==0)
    rvx_signal_07 <= RVX_LPARA_09;
  else if(rvx_port_03)
    rvx_signal_07 <= RVX_LPARA_09;
  else if(rvx_port_15 & WRITE_SUPPORTED)
  begin
    if(rvx_signal_20)
      rvx_signal_07 <= RVX_LPARA_02;
    else if(rvx_signal_08&rvx_port_14)
      rvx_signal_07 <= RVX_LPARA_09;
  end
end

always@(*)
begin
  rvx_signal_03 = 0;
  if(WRITE_SUPPORTED)
  begin
    if(EXCLUSIVE_SUPPORTED)
      rvx_signal_03 = rvx_signal_07[RVX_LPARA_08];
    else if(rvx_signal_23|(rvx_signal_04[RVX_LPARA_00]&rvx_signal_14))
      rvx_signal_03 = rvx_signal_07[RVX_LPARA_08];
  end
end

assign rvx_signal_13 = WRITE_SUPPORTED & rvx_signal_07[RVX_LPARA_07];
assign rvx_signal_17 = READ_SUPPORTED & (EXCLUSIVE_SUPPORTED|rvx_signal_23|(rvx_signal_04[RVX_LPARA_10]&rvx_signal_14));
assign rvx_signal_12 = rvx_signal_16? (rvx_signal_13&rvx_port_23) : (rvx_signal_17&rvx_port_25);

assign rvx_port_06[1] = 0;
assign rvx_port_06[0] = rvx_signal_12;

assign rvx_port_28 = 0;
assign rvx_port_04 = rvx_signal_05;
assign rvx_port_12 = rvx_signal_02;
assign rvx_port_38 = rvx_signal_00;
assign rvx_port_22 = rvx_signal_06;
assign rvx_port_00 = rvx_signal_03 & rvx_port_31 & rvx_signal_16;

assign rvx_port_21 = 0;
assign rvx_port_24 = rvx_signal_11;
assign rvx_port_11 = rvx_signal_25;
assign rvx_port_14 = rvx_port_27;
assign rvx_port_34 = rvx_signal_13 & rvx_port_31;

assign rvx_port_39 = 0;
assign rvx_port_07 = rvx_signal_05;
assign rvx_port_43 = rvx_signal_02;
assign rvx_port_02 = rvx_signal_00;
assign rvx_port_29 = rvx_signal_06;
assign rvx_port_20 = rvx_signal_17 & rvx_port_31 & (~rvx_signal_16);

assign rvx_port_18 = WRITE_SUPPORTED & rvx_signal_04[RVX_LPARA_00] & rvx_port_26[0];
assign rvx_port_19 = READ_SUPPORTED & rvx_signal_04[RVX_LPARA_10] & rvx_port_26[0];

always@(*)
begin
  rvx_signal_22 = 0;
  if(WRITE_SUPPORTED)
  begin
    if(EXCLUSIVE_SUPPORTED)
      rvx_signal_22 = 1;
    else
      rvx_signal_22 = rvx_signal_04[RVX_LPARA_00] & (~rvx_signal_23);
  end
end

assign rvx_port_40 = rvx_port_01 | rvx_port_44;
assign rvx_port_17 = 0;
assign rvx_port_16 = rvx_signal_22? 1'b 1 : rvx_port_08;
assign rvx_port_35 = {rvx_signal_22, (rvx_signal_22? rvx_port_32 : rvx_port_37), rvx_port_05};

endmodule
