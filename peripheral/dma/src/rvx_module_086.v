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




module RVX_MODULE_086
(
	rvx_port_17,
	rvx_port_01,
  rvx_port_59,
	rvx_port_50,
	rvx_port_44,
	
	rvx_port_03,
	rvx_port_56,
	rvx_port_06,
	rvx_port_20,
	rvx_port_61,
	rvx_port_32,
	rvx_port_63,
	rvx_port_36,
	
	rvx_port_13,
	rvx_port_43,
	rvx_port_71,
	rvx_port_72,
	rvx_port_24,
	rvx_port_34,
	rvx_port_12,
	
	rvx_port_53,
	rvx_port_05,
	rvx_port_23,
	rvx_port_07,
	rvx_port_52,
	rvx_port_37,
	
	rvx_port_45,
	rvx_port_64,
	rvx_port_28,
	rvx_port_62,
	
	rvx_port_46,
	rvx_port_66,
	rvx_port_57,
	rvx_port_67,
	rvx_port_02,
	rvx_port_21,
	rvx_port_49,
	
	rvx_port_38,
	rvx_port_08,
	rvx_port_30,
	rvx_port_58,
	rvx_port_35,
	rvx_port_48,

  rvx_port_51,
	rvx_port_09,
	rvx_port_39,
	rvx_port_14,
	rvx_port_19,
	rvx_port_04,
	rvx_port_60,
	
	rvx_port_70,
	rvx_port_69,
	rvx_port_55,
	rvx_port_31,
	rvx_port_25,
	rvx_port_22,
	
	rvx_port_68,
	rvx_port_26,
	rvx_port_11,
	rvx_port_47,
	
	rvx_port_18,
	rvx_port_54,
	rvx_port_29,
	rvx_port_41,
	rvx_port_16,
	rvx_port_00,
	rvx_port_27,
	
	rvx_port_33,
	rvx_port_65,
	rvx_port_40,
	rvx_port_42,
	rvx_port_15,
	rvx_port_10
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_2 = 4;
parameter RVX_GPARA_0 = 4;

`include "rvx_include_05.vh"

localparam  RVX_LPARA_0 = (MAX_AXI_LENGTH+1)*RVX_GPARA_0;

input wire rvx_port_17;
input wire rvx_port_01;
input wire rvx_port_59;
input wire rvx_port_50;
input wire rvx_port_44;

input wire [RVX_GPARA_1-1:0] rvx_port_03;
input wire rvx_port_56;
input wire rvx_port_06;
input wire rvx_port_20;
input wire [RVX_GPARA_3-1:0] rvx_port_61;
output wire [RVX_GPARA_3-1:0] rvx_port_32;
output wire rvx_port_63;
output wire rvx_port_36;

output wire [RVX_GPARA_2-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_43;
output wire [`BW_AXI_ALEN-1:0] rvx_port_71;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_72;
output wire [`BW_AXI_ABURST-1:0] rvx_port_24;
output wire rvx_port_34;
input wire rvx_port_12;

output wire [RVX_GPARA_2-1:0] rvx_port_53;
output wire [BW_AXI_DATA-1:0] rvx_port_05;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_23;
output wire rvx_port_07;
output wire rvx_port_52;
input wire rvx_port_37;

input wire [RVX_GPARA_2-1:0] rvx_port_45;
input wire [`BW_AXI_BRESP-1:0] rvx_port_64;
input wire rvx_port_28;
output wire rvx_port_62;

output wire [RVX_GPARA_2-1:0] rvx_port_46;
output wire [RVX_GPARA_1-1:0] rvx_port_66;
output wire [`BW_AXI_ALEN-1:0] rvx_port_57;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_67;
output wire [`BW_AXI_ABURST-1:0] rvx_port_02;
output wire rvx_port_21;
input wire rvx_port_49;

input wire [RVX_GPARA_2-1:0] rvx_port_38;
input wire [BW_AXI_DATA-1:0] rvx_port_08;
input wire [`BW_AXI_RRESP-1:0] rvx_port_30;
input wire rvx_port_58;
input wire rvx_port_35;
output wire rvx_port_48;

output wire [RVX_GPARA_2-1:0] rvx_port_51;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
output wire [`BW_AXI_ALEN-1:0] rvx_port_39;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_14;
output wire [`BW_AXI_ABURST-1:0] rvx_port_19;
output wire rvx_port_04;
input wire rvx_port_60;

output wire [RVX_GPARA_2-1:0] rvx_port_70;
output wire [BW_AXI_DATA-1:0] rvx_port_69;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_55;
output wire rvx_port_31;
output wire rvx_port_25;
input wire rvx_port_22;

input wire [RVX_GPARA_2-1:0] rvx_port_68;
input wire [`BW_AXI_BRESP-1:0] rvx_port_26;
input wire rvx_port_11;
output wire rvx_port_47;

output wire [RVX_GPARA_2-1:0] rvx_port_18;
output wire [RVX_GPARA_1-1:0] rvx_port_54;
output wire [`BW_AXI_ALEN-1:0] rvx_port_29;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_41;
output wire [`BW_AXI_ABURST-1:0] rvx_port_16;
output wire rvx_port_00;
input wire rvx_port_27;

input wire [RVX_GPARA_2-1:0] rvx_port_33;
input wire [BW_AXI_DATA-1:0] rvx_port_65;
input wire [`BW_AXI_RRESP-1:0] rvx_port_40;
input wire rvx_port_42;
input wire rvx_port_15;
output wire rvx_port_10;

ERVP_DMA
#(
  .BW_ADDR(RVX_GPARA_1),
  .BW_APB_DATA(RVX_GPARA_3),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_AXI_TID(RVX_GPARA_2),
  .NUM_TXN_BUFFER(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk_axi(rvx_port_17),
	.rstnn_axi(rvx_port_01),
  .clk_apb(rvx_port_59),
	.rstnn_apb(rvx_port_50),
	.tick_1us(rvx_port_44),
	
	.control_rpaddr(rvx_port_03),
	.control_rpwrite(rvx_port_56),
	.control_rpsel(rvx_port_06),
	.control_rpenable(rvx_port_20),
	.control_rpwdata(rvx_port_61),
	.control_rprdata(rvx_port_32),
	.control_rpready(rvx_port_63),
	.control_rpslverr(rvx_port_36),
	
	.sxawid(rvx_port_51),
	.sxawaddr(rvx_port_09),
	.sxawlen(rvx_port_39),
	.sxawsize(rvx_port_14),
	.sxawburst(rvx_port_19),
	.sxawvalid(rvx_port_04),
	.sxawready(rvx_port_60),
	
	.sxwid(rvx_port_70),
	.sxwdata(rvx_port_69),
	.sxwstrb(rvx_port_55),
	.sxwlast(rvx_port_31),
	.sxwvalid(rvx_port_25),
	.sxwready(rvx_port_22),
	
	.sxbid(rvx_port_68),
	.sxbresp(rvx_port_26),
	.sxbvalid(rvx_port_11),
	.sxbready(rvx_port_47),
	
	.sxarid(rvx_port_46),
	.sxaraddr(rvx_port_66),
	.sxarlen(rvx_port_57),
	.sxarsize(rvx_port_67),
	.sxarburst(rvx_port_02),
	.sxarvalid(rvx_port_21),
	.sxarready(rvx_port_49),
	
	.sxrid(rvx_port_38),
	.sxrdata(rvx_port_08),
	.sxrresp(rvx_port_30),
	.sxrlast(rvx_port_58),
	.sxrvalid(rvx_port_35),
	.sxrready(rvx_port_48)
);

assign rvx_port_13 = 0;
assign rvx_port_43 = 0;
assign rvx_port_71 = 0;
assign rvx_port_72 = 0;
assign rvx_port_24 = 0;
assign rvx_port_34 = 0;

assign rvx_port_53 = 0;
assign rvx_port_05 = 0;
assign rvx_port_23 = 0;
assign rvx_port_07 = 0;
assign rvx_port_52 = 0;

assign rvx_port_62 = 0;

assign rvx_port_18 = 0;
assign rvx_port_54 = 0;
assign rvx_port_29 = 0;
assign rvx_port_41 = 0;
assign rvx_port_16 = 0;
assign rvx_port_00 = 0;

assign rvx_port_10 = 0;

endmodule
