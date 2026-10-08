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




module RVX_MODULE_099
(
	rvx_port_40,
	rvx_port_14,
	rvx_port_04,
	rvx_port_06,
	rvx_port_09,
	rvx_port_61,
	rvx_port_11,
	rvx_port_15,
	rvx_port_63,
	rvx_port_17,
	rvx_port_52,
	rvx_port_18,
	rvx_port_70,
	rvx_port_20,
	rvx_port_39,
	rvx_port_56,
	rvx_port_36,
	rvx_port_34,
	rvx_port_24,
	rvx_port_42,
	rvx_port_45,
	rvx_port_22,
	rvx_port_25,
	rvx_port_64,
	rvx_port_57,
	rvx_port_21,
	rvx_port_75,
	rvx_port_51,
	rvx_port_74,
	rvx_port_62,
	rvx_port_69,
	rvx_port_00,
	rvx_port_73,
	rvx_port_71,
	rvx_port_26,
	rvx_port_31,
	rvx_port_55,
	rvx_port_07,

	rvx_port_29,
	rvx_port_43,
	rvx_port_46,
	rvx_port_38,
	rvx_port_23,
	rvx_port_16,
	rvx_port_67,
	rvx_port_28,
	rvx_port_35,
	rvx_port_60,
	rvx_port_05,
	rvx_port_10,
	rvx_port_50,
	rvx_port_19,
	rvx_port_59,
	rvx_port_54,
	rvx_port_49,
	rvx_port_02,
	rvx_port_32,
	rvx_port_72,
	rvx_port_68,
	rvx_port_44,
	rvx_port_33,
	rvx_port_47,
	rvx_port_03,
	rvx_port_41,
	rvx_port_48,
	rvx_port_66,
	rvx_port_37,
	rvx_port_53,
	rvx_port_08,
	rvx_port_65,
	rvx_port_01,
	rvx_port_13,
	rvx_port_58,
	rvx_port_27,
	rvx_port_30,
	rvx_port_12
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_40, rvx_port_14;
input wire [RVX_GPARA_0-1:0] rvx_port_04;
input wire [RVX_GPARA_1-1:0] rvx_port_06;
input wire [`BW_AXI_ALEN-1:0] rvx_port_09;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_61;
input wire [`BW_AXI_ABURST-1:0] rvx_port_11;
input wire [`BW_AXI_ALOCK-1:0] rvx_port_15;
input wire [`BW_AXI_ACACHE-1:0] rvx_port_63;
input wire [`BW_AXI_APROT-1:0] rvx_port_17;
input wire rvx_port_52;
output wire rvx_port_18;
input wire [RVX_GPARA_0-1:0] rvx_port_70;
input wire [RVX_GPARA_2-1:0] rvx_port_20;
input wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_39;
input wire rvx_port_56;
input wire rvx_port_36;
output wire rvx_port_34;
output wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire [`BW_AXI_BRESP-1:0] rvx_port_42;
output wire rvx_port_45;
input wire rvx_port_22;
input wire [RVX_GPARA_0-1:0] rvx_port_25;
input wire [RVX_GPARA_1-1:0] rvx_port_64;
input wire [`BW_AXI_ALEN-1:0] rvx_port_57;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_21;
input wire [`BW_AXI_ABURST-1:0] rvx_port_75;
input wire [`BW_AXI_ALOCK-1:0] rvx_port_51;
input wire [`BW_AXI_ACACHE-1:0] rvx_port_74;
input wire [`BW_AXI_APROT-1:0] rvx_port_62;
input wire rvx_port_69;
output wire rvx_port_00;
output wire [RVX_GPARA_0-1:0] rvx_port_73;
output wire [RVX_GPARA_2-1:0] rvx_port_71;
output wire [`BW_AXI_RRESP-1:0] rvx_port_26;
output wire rvx_port_31;
output wire rvx_port_55;
input wire rvx_port_07;

input wire rvx_port_29, rvx_port_43;
output wire [RVX_GPARA_0-1:0] rvx_port_46;
output wire [RVX_GPARA_1-1:0] rvx_port_38;
output wire [`BW_AXI_ALEN-1:0] rvx_port_23;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_16;
output wire [`BW_AXI_ABURST-1:0] rvx_port_67;
output wire [`BW_AXI_ALOCK-1:0] rvx_port_28;
output wire [`BW_AXI_ACACHE-1:0] rvx_port_35;
output wire [`BW_AXI_APROT-1:0] rvx_port_60;
output wire rvx_port_05;
input wire rvx_port_10;
output wire [RVX_GPARA_0-1:0] rvx_port_50;
output wire [RVX_GPARA_2-1:0] rvx_port_19;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_59;
output wire rvx_port_54;
output wire rvx_port_49;
input wire rvx_port_02;
input wire [RVX_GPARA_0-1:0] rvx_port_32;
input wire [`BW_AXI_BRESP-1:0] rvx_port_72;
input wire rvx_port_68;
output wire rvx_port_44;
output wire [RVX_GPARA_0-1:0] rvx_port_33;
output wire [RVX_GPARA_1-1:0] rvx_port_47;
output wire [`BW_AXI_ALEN-1:0] rvx_port_03;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_41;
output wire [`BW_AXI_ABURST-1:0] rvx_port_48;
output wire [`BW_AXI_ALOCK-1:0] rvx_port_66;
output wire [`BW_AXI_ACACHE-1:0] rvx_port_37;
output wire [`BW_AXI_APROT-1:0] rvx_port_53;
output wire rvx_port_08;
input wire rvx_port_65;
input wire [RVX_GPARA_0-1:0] rvx_port_01;
input wire [RVX_GPARA_2-1:0] rvx_port_13;
input wire [`BW_AXI_RRESP-1:0] rvx_port_58;
input wire rvx_port_27;
input wire rvx_port_30;
output wire rvx_port_12;

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_ARCHANNEL(RVX_GPARA_0,RVX_GPARA_1)),
	.DEPTH(1)
)
i_rvx_instance_4
(
	.wclk(rvx_port_40),
	.wrstnn(rvx_port_14),
	.wready(rvx_port_00),
	.wrequest(rvx_port_69),
	.wdata({rvx_port_25,rvx_port_64,rvx_port_57,rvx_port_21,rvx_port_75,rvx_port_51,rvx_port_74,rvx_port_62}),
	.rclk(rvx_port_29),
	.rrstnn(rvx_port_43),
	.rready(rvx_port_08),
	.rrequest(rvx_port_65),
	.rdata({rvx_port_33,rvx_port_47,rvx_port_03,rvx_port_41,rvx_port_48,rvx_port_66,rvx_port_37,rvx_port_53}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(RVX_GPARA_0,RVX_GPARA_1)),
	.DEPTH(1)
)
i_rvx_instance_1
(
	.wclk(rvx_port_40),
	.wrstnn(rvx_port_14),
	.wready(rvx_port_18),
	.wrequest(rvx_port_52),
	.wdata({rvx_port_04,rvx_port_06,rvx_port_09,rvx_port_61,rvx_port_11,rvx_port_15,rvx_port_63,rvx_port_17}),
	.rclk(rvx_port_29),
	.rrstnn(rvx_port_43),
	.rready(rvx_port_05),
	.rrequest(rvx_port_10),
	.rdata({rvx_port_46,rvx_port_38,rvx_port_23,rvx_port_16,rvx_port_67,rvx_port_28,rvx_port_35,rvx_port_60}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_WCHANNEL(RVX_GPARA_0,RVX_GPARA_2)),
	.DEPTH(2)
)
i_rvx_instance_3
(
	.wclk(rvx_port_40),
	.wrstnn(rvx_port_14),
	.wready(rvx_port_34),
	.wrequest(rvx_port_36),
	.wdata({rvx_port_70,rvx_port_20,rvx_port_39,rvx_port_56}),
	.rclk(rvx_port_29),
	.rrstnn(rvx_port_43),
	.rready(rvx_port_49),
	.rrequest(rvx_port_02),
	.rdata({rvx_port_50,rvx_port_19,rvx_port_59,rvx_port_54}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_RCHANNEL(RVX_GPARA_0,RVX_GPARA_2)),
	.DEPTH(2)
)
i_rvx_instance_2
(
	.wclk(rvx_port_29),
	.wrstnn(rvx_port_43),
	.wready(rvx_port_12),
	.wrequest(rvx_port_30),
	.wdata({rvx_port_01,rvx_port_13,rvx_port_58,rvx_port_27}),
	.rclk(rvx_port_40),
	.rrstnn(rvx_port_14),
	.rready(rvx_port_55),
	.rrequest(rvx_port_07),
	.rdata({rvx_port_73,rvx_port_71,rvx_port_26,rvx_port_31}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(RVX_GPARA_0)),
	.DEPTH(2)
)
i_rvx_instance_0
(
	.wclk(rvx_port_29),
	.wrstnn(rvx_port_43),
	.wready(rvx_port_44),
	.wrequest(rvx_port_68),
	.wdata({rvx_port_32,rvx_port_72}),
	.rclk(rvx_port_40),
	.rrstnn(rvx_port_14),
	.rready(rvx_port_45),
	.rrequest(rvx_port_22),
	.rdata({rvx_port_24,rvx_port_42}),
	.wfull(),
	.rempty()
);

endmodule
