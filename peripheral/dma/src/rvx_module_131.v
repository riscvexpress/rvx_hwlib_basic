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
`include "rvx_include_01.vh"




module RVX_MODULE_131
(
	rvx_port_42,
	rvx_port_33,
  rvx_port_06,
	rvx_port_38,
	rvx_port_70,
	
	rvx_port_35,
	rvx_port_21,
	rvx_port_17,
	rvx_port_39,
	rvx_port_37,
	rvx_port_15,
	rvx_port_58,
	rvx_port_52,
	
	rvx_port_47,
	rvx_port_03,
	rvx_port_59,
	rvx_port_00,
	rvx_port_65,
	rvx_port_13,
	rvx_port_14,
	
	rvx_port_30,
	rvx_port_07,
	rvx_port_63,
	rvx_port_16,
	rvx_port_34,
	rvx_port_28,
	
	rvx_port_40,
	rvx_port_26,
	rvx_port_48,
	rvx_port_27,
	
	rvx_port_61,
	rvx_port_62,
	rvx_port_57,
	rvx_port_44,
	rvx_port_53,
	rvx_port_01,
	rvx_port_64,
	
	rvx_port_24,
	rvx_port_36,
	rvx_port_22,
	rvx_port_71,
	rvx_port_72,
	rvx_port_69,

  rvx_port_46,
	rvx_port_43,
	rvx_port_04,
	rvx_port_05,
	rvx_port_68,
	rvx_port_31,
	rvx_port_12,
	
	rvx_port_41,
	rvx_port_20,
	rvx_port_25,
	rvx_port_10,
	rvx_port_51,
	rvx_port_02,
	
	rvx_port_08,
	rvx_port_23,
	rvx_port_09,
	rvx_port_11,
	
	rvx_port_66,
	rvx_port_45,
	rvx_port_29,
	rvx_port_18,
	rvx_port_55,
	rvx_port_56,
	rvx_port_49,
	
	rvx_port_60,
	rvx_port_32,
	rvx_port_19,
	rvx_port_50,
	rvx_port_67,
	rvx_port_54
);




parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_1 = 4;
parameter RVX_GPARA_2 = 4;

`include "rvx_include_18.vh"

localparam  RVX_LPARA_0 = (MAX_AXI_LENGTH+1)*RVX_GPARA_2;

input wire rvx_port_42;
input wire rvx_port_33;
input wire rvx_port_06;
input wire rvx_port_38;
input wire rvx_port_70;

input wire [RVX_GPARA_0-1:0] rvx_port_35;
input wire rvx_port_21;
input wire rvx_port_17;
input wire rvx_port_39;
input wire [RVX_GPARA_3-1:0] rvx_port_37;
output wire [RVX_GPARA_3-1:0] rvx_port_15;
output wire rvx_port_58;
output wire rvx_port_52;

output wire [RVX_GPARA_1-1:0] rvx_port_47;
output wire [RVX_GPARA_0-1:0] rvx_port_03;
output wire [`BW_AXI_ALEN-1:0] rvx_port_59;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_00;
output wire [`BW_AXI_ABURST-1:0] rvx_port_65;
output wire rvx_port_13;
input wire rvx_port_14;

output wire [RVX_GPARA_1-1:0] rvx_port_30;
output wire [BW_AXI_DATA-1:0] rvx_port_07;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_63;
output wire rvx_port_16;
output wire rvx_port_34;
input wire rvx_port_28;

input wire [RVX_GPARA_1-1:0] rvx_port_40;
input wire [`BW_AXI_BRESP-1:0] rvx_port_26;
input wire rvx_port_48;
output wire rvx_port_27;

output wire [RVX_GPARA_1-1:0] rvx_port_61;
output wire [RVX_GPARA_0-1:0] rvx_port_62;
output wire [`BW_AXI_ALEN-1:0] rvx_port_57;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_44;
output wire [`BW_AXI_ABURST-1:0] rvx_port_53;
output wire rvx_port_01;
input wire rvx_port_64;

input wire [RVX_GPARA_1-1:0] rvx_port_24;
input wire [BW_AXI_DATA-1:0] rvx_port_36;
input wire [`BW_AXI_RRESP-1:0] rvx_port_22;
input wire rvx_port_71;
input wire rvx_port_72;
output wire rvx_port_69;

output wire [RVX_GPARA_1-1:0] rvx_port_46;
output wire [RVX_GPARA_0-1:0] rvx_port_43;
output wire [`BW_AXI_ALEN-1:0] rvx_port_04;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_05;
output wire [`BW_AXI_ABURST-1:0] rvx_port_68;
output wire rvx_port_31;
input wire rvx_port_12;

output wire [RVX_GPARA_1-1:0] rvx_port_41;
output wire [BW_AXI_DATA-1:0] rvx_port_20;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_25;
output wire rvx_port_10;
output wire rvx_port_51;
input wire rvx_port_02;

input wire [RVX_GPARA_1-1:0] rvx_port_08;
input wire [`BW_AXI_BRESP-1:0] rvx_port_23;
input wire rvx_port_09;
output wire rvx_port_11;

output wire [RVX_GPARA_1-1:0] rvx_port_66;
output wire [RVX_GPARA_0-1:0] rvx_port_45;
output wire [`BW_AXI_ALEN-1:0] rvx_port_29;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_18;
output wire [`BW_AXI_ABURST-1:0] rvx_port_55;
output wire rvx_port_56;
input wire rvx_port_49;

input wire [RVX_GPARA_1-1:0] rvx_port_60;
input wire [BW_AXI_DATA-1:0] rvx_port_32;
input wire [`BW_AXI_RRESP-1:0] rvx_port_19;
input wire rvx_port_50;
input wire rvx_port_67;
output wire rvx_port_54;

ERVP_DMA
#(
  .BW_ADDR(RVX_GPARA_0),
  .BW_APB_DATA(RVX_GPARA_3),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_AXI_TID(RVX_GPARA_1),
  .NUM_TXN_BUFFER(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk_axi(rvx_port_42),
	.rstnn_axi(rvx_port_33),
  .clk_apb(rvx_port_06),
	.rstnn_apb(rvx_port_38),
	.tick_1us(rvx_port_70),
	
	.control_rpaddr(rvx_port_35),
	.control_rpwrite(rvx_port_21),
	.control_rpsel(rvx_port_17),
	.control_rpenable(rvx_port_39),
	.control_rpwdata(rvx_port_37),
	.control_rprdata(rvx_port_15),
	.control_rpready(rvx_port_58),
	.control_rpslverr(rvx_port_52),
	
	.sxawid(rvx_port_46),
	.sxawaddr(rvx_port_43),
	.sxawlen(rvx_port_04),
	.sxawsize(rvx_port_05),
	.sxawburst(rvx_port_68),
	.sxawvalid(rvx_port_31),
	.sxawready(rvx_port_12),
	
	.sxwid(rvx_port_41),
	.sxwdata(rvx_port_20),
	.sxwstrb(rvx_port_25),
	.sxwlast(rvx_port_10),
	.sxwvalid(rvx_port_51),
	.sxwready(rvx_port_02),
	
	.sxbid(rvx_port_08),
	.sxbresp(rvx_port_23),
	.sxbvalid(rvx_port_09),
	.sxbready(rvx_port_11),
	
	.sxarid(rvx_port_61),
	.sxaraddr(rvx_port_62),
	.sxarlen(rvx_port_57),
	.sxarsize(rvx_port_44),
	.sxarburst(rvx_port_53),
	.sxarvalid(rvx_port_01),
	.sxarready(rvx_port_64),
	
	.sxrid(rvx_port_24),
	.sxrdata(rvx_port_36),
	.sxrresp(rvx_port_22),
	.sxrlast(rvx_port_71),
	.sxrvalid(rvx_port_72),
	.sxrready(rvx_port_69)
);

assign rvx_port_47 = 0;
assign rvx_port_03 = 0;
assign rvx_port_59 = 0;
assign rvx_port_00 = 0;
assign rvx_port_65 = 0;
assign rvx_port_13 = 0;

assign rvx_port_30 = 0;
assign rvx_port_07 = 0;
assign rvx_port_63 = 0;
assign rvx_port_16 = 0;
assign rvx_port_34 = 0;

assign rvx_port_27 = 0;

assign rvx_port_66 = 0;
assign rvx_port_45 = 0;
assign rvx_port_29 = 0;
assign rvx_port_18 = 0;
assign rvx_port_55 = 0;
assign rvx_port_56 = 0;

assign rvx_port_54 = 0;

endmodule
