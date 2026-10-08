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




module RVX_MODULE_049
(
	rvx_port_27,
	rvx_port_76,
  rvx_port_29,
	rvx_port_34,
	rvx_port_12,
	
	rvx_port_52,
	rvx_port_64,
	rvx_port_37,
	rvx_port_33,
	rvx_port_80,
	rvx_port_70,
	rvx_port_54,
	rvx_port_62,

  rvx_port_16,
	rvx_port_28,
	rvx_port_07,
	rvx_port_23,
	rvx_port_47,
	rvx_port_68,
	rvx_port_31,
	rvx_port_50,
	
	rvx_port_19,
	rvx_port_48,
	rvx_port_21,
	rvx_port_40,
	rvx_port_09,
	rvx_port_74,
	rvx_port_53,
	
	rvx_port_79,
	rvx_port_26,
	rvx_port_57,
	rvx_port_06,
	rvx_port_77,
	rvx_port_46,
	
	rvx_port_60,
	rvx_port_55,
	rvx_port_58,
	rvx_port_41,
	
	rvx_port_71,
	rvx_port_15,
	rvx_port_17,
	rvx_port_35,
	rvx_port_73,
	rvx_port_59,
	rvx_port_43,
	
	rvx_port_45,
	rvx_port_25,
	rvx_port_10,
	rvx_port_67,
	rvx_port_20,
	rvx_port_18,

  rvx_port_56,
	rvx_port_63,
	rvx_port_44,
	rvx_port_14,
	rvx_port_11,
	rvx_port_38,
	rvx_port_13,
	
	rvx_port_78,
	rvx_port_04,
	rvx_port_22,
	rvx_port_42,
	rvx_port_39,
	rvx_port_51,
	
	rvx_port_65,
	rvx_port_08,
	rvx_port_72,
	rvx_port_32,
	
	rvx_port_24,
	rvx_port_75,
	rvx_port_30,
	rvx_port_61,
	rvx_port_66,
	rvx_port_49,
	rvx_port_02,
	
	rvx_port_03,
	rvx_port_05,
	rvx_port_00,
	rvx_port_69,
	rvx_port_01,
	rvx_port_36
);




parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_2 = 4;

`include "rvx_include_05.vh"

localparam  RVX_LPARA_0 = (MAX_AXI_LENGTH+1)*RVX_GPARA_2;

input wire rvx_port_27;
input wire rvx_port_76;
input wire rvx_port_29;
input wire rvx_port_34;
input wire rvx_port_12;

input wire [RVX_GPARA_3-1:0] rvx_port_52;
input wire rvx_port_64;
input wire rvx_port_37;
input wire rvx_port_33;
input wire [RVX_GPARA_1-1:0] rvx_port_80;
output wire [RVX_GPARA_1-1:0] rvx_port_70;
output wire rvx_port_54;
output wire rvx_port_62;

input wire [RVX_GPARA_3-1:0] rvx_port_16;
input wire rvx_port_28;
input wire rvx_port_07;
input wire rvx_port_23;
input wire [RVX_GPARA_1-1:0] rvx_port_47;
output wire [RVX_GPARA_1-1:0] rvx_port_68;
output wire rvx_port_31;
output wire rvx_port_50;

output wire [RVX_GPARA_0-1:0] rvx_port_19;
output wire [RVX_GPARA_3-1:0] rvx_port_48;
output wire [`BW_AXI_ALEN-1:0] rvx_port_21;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_40;
output wire [`BW_AXI_ABURST-1:0] rvx_port_09;
output wire rvx_port_74;
input wire rvx_port_53;

output wire [RVX_GPARA_0-1:0] rvx_port_79;
output wire [BW_AXI_DATA-1:0] rvx_port_26;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_57;
output wire rvx_port_06;
output wire rvx_port_77;
input wire rvx_port_46;

input wire [RVX_GPARA_0-1:0] rvx_port_60;
input wire [`BW_AXI_BRESP-1:0] rvx_port_55;
input wire rvx_port_58;
output wire rvx_port_41;

output wire [RVX_GPARA_0-1:0] rvx_port_71;
output wire [RVX_GPARA_3-1:0] rvx_port_15;
output wire [`BW_AXI_ALEN-1:0] rvx_port_17;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_35;
output wire [`BW_AXI_ABURST-1:0] rvx_port_73;
output wire rvx_port_59;
input wire rvx_port_43;

input wire [RVX_GPARA_0-1:0] rvx_port_45;
input wire [BW_AXI_DATA-1:0] rvx_port_25;
input wire [`BW_AXI_RRESP-1:0] rvx_port_10;
input wire rvx_port_67;
input wire rvx_port_20;
output wire rvx_port_18;

output wire [RVX_GPARA_0-1:0] rvx_port_56;
output wire [RVX_GPARA_3-1:0] rvx_port_63;
output wire [`BW_AXI_ALEN-1:0] rvx_port_44;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_14;
output wire [`BW_AXI_ABURST-1:0] rvx_port_11;
output wire rvx_port_38;
input wire rvx_port_13;

output wire [RVX_GPARA_0-1:0] rvx_port_78;
output wire [BW_AXI_DATA-1:0] rvx_port_04;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_22;
output wire rvx_port_42;
output wire rvx_port_39;
input wire rvx_port_51;

input wire [RVX_GPARA_0-1:0] rvx_port_65;
input wire [`BW_AXI_BRESP-1:0] rvx_port_08;
input wire rvx_port_72;
output wire rvx_port_32;

output wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire [RVX_GPARA_3-1:0] rvx_port_75;
output wire [`BW_AXI_ALEN-1:0] rvx_port_30;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_61;
output wire [`BW_AXI_ABURST-1:0] rvx_port_66;
output wire rvx_port_49;
input wire rvx_port_02;

input wire [RVX_GPARA_0-1:0] rvx_port_03;
input wire [BW_AXI_DATA-1:0] rvx_port_05;
input wire [`BW_AXI_RRESP-1:0] rvx_port_00;
input wire rvx_port_69;
input wire rvx_port_01;
output wire rvx_port_36;

ERVP_DMA
#(
  .BW_ADDR(RVX_GPARA_3),
  .BW_APB_DATA(RVX_GPARA_1),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_AXI_TID(RVX_GPARA_0),
  .NUM_TXN_BUFFER(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.clk_axi(rvx_port_27),
	.rstnn_axi(rvx_port_76),
  .clk_apb(rvx_port_29),
	.rstnn_apb(rvx_port_34),
	.tick_1us(rvx_port_12),
	
	.control_rpaddr(rvx_port_52),
	.control_rpwrite(rvx_port_64),
	.control_rpsel(rvx_port_37),
	.control_rpenable(rvx_port_33),
	.control_rpwdata(rvx_port_80),
	.control_rprdata(rvx_port_70),
	.control_rpready(rvx_port_54),
	.control_rpslverr(rvx_port_62),
	
	.sxawid(rvx_port_56),
	.sxawaddr(rvx_port_63),
	.sxawlen(rvx_port_44),
	.sxawsize(rvx_port_14),
	.sxawburst(rvx_port_11),
	.sxawvalid(rvx_port_38),
	.sxawready(rvx_port_13),
	
	.sxwid(rvx_port_78),
	.sxwdata(rvx_port_04),
	.sxwstrb(rvx_port_22),
	.sxwlast(rvx_port_42),
	.sxwvalid(rvx_port_39),
	.sxwready(rvx_port_51),
	
	.sxbid(rvx_port_65),
	.sxbresp(rvx_port_08),
	.sxbvalid(rvx_port_72),
	.sxbready(rvx_port_32),
	
	.sxarid(rvx_port_71),
	.sxaraddr(rvx_port_15),
	.sxarlen(rvx_port_17),
	.sxarsize(rvx_port_35),
	.sxarburst(rvx_port_73),
	.sxarvalid(rvx_port_59),
	.sxarready(rvx_port_43),
	
	.sxrid(rvx_port_45),
	.sxrdata(rvx_port_25),
	.sxrresp(rvx_port_10),
	.sxrlast(rvx_port_67),
	.sxrvalid(rvx_port_20),
	.sxrready(rvx_port_18)
);

ERVP_DMA
#(
  .BW_ADDR(RVX_GPARA_3),
  .BW_APB_DATA(RVX_GPARA_1),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_AXI_TID(RVX_GPARA_0),
  .NUM_TXN_BUFFER(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk_axi(rvx_port_27),
	.rstnn_axi(rvx_port_76),
  .clk_apb(rvx_port_29),
	.rstnn_apb(rvx_port_34),
	.tick_1us(rvx_port_12),
	
	.control_rpaddr(rvx_port_16),
	.control_rpwrite(rvx_port_28),
	.control_rpsel(rvx_port_07),
	.control_rpenable(rvx_port_23),
	.control_rpwdata(rvx_port_47),
	.control_rprdata(rvx_port_68),
	.control_rpready(rvx_port_31),
	.control_rpslverr(rvx_port_50),
	
	.sxawid(rvx_port_19),
	.sxawaddr(rvx_port_48),
	.sxawlen(rvx_port_21),
	.sxawsize(rvx_port_40),
	.sxawburst(rvx_port_09),
	.sxawvalid(rvx_port_74),
	.sxawready(rvx_port_53),
	
	.sxwid(rvx_port_79),
	.sxwdata(rvx_port_26),
	.sxwstrb(rvx_port_57),
	.sxwlast(rvx_port_06),
	.sxwvalid(rvx_port_77),
	.sxwready(rvx_port_46),
	
	.sxbid(rvx_port_60),
	.sxbresp(rvx_port_55),
	.sxbvalid(rvx_port_58),
	.sxbready(rvx_port_41),
	
	.sxarid(rvx_port_24),
	.sxaraddr(rvx_port_75),
	.sxarlen(rvx_port_30),
	.sxarsize(rvx_port_61),
	.sxarburst(rvx_port_66),
	.sxarvalid(rvx_port_49),
	.sxarready(rvx_port_02),
	
	.sxrid(rvx_port_03),
	.sxrdata(rvx_port_05),
	.sxrresp(rvx_port_00),
	.sxrlast(rvx_port_69),
	.sxrvalid(rvx_port_01),
	.sxrready(rvx_port_36)
);

endmodule
