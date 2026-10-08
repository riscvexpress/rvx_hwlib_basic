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




module RVX_MODULE_031
(
	rvx_port_00,
	rvx_port_68,
	rvx_port_16,
	rvx_port_19,
	rvx_port_15,
	rvx_port_03,
	rvx_port_25,
	rvx_port_38,
	rvx_port_11,
	rvx_port_69,
	rvx_port_56,
	rvx_port_51,
	rvx_port_26,
	rvx_port_60,
	rvx_port_18,
	rvx_port_39,
	rvx_port_52,
	rvx_port_05,
	rvx_port_55,
	rvx_port_64,
	rvx_port_37,
	rvx_port_36,
	rvx_port_35,
	rvx_port_73,
	rvx_port_30,
	rvx_port_07,
	rvx_port_67,
	rvx_port_70,
	rvx_port_57,
	rvx_port_42,
	rvx_port_61,
	rvx_port_31,
	rvx_port_32,
	rvx_port_40,
	rvx_port_62,
	rvx_port_01,
	rvx_port_65,
	rvx_port_63,

	rvx_port_14,
	rvx_port_48,
	rvx_port_13,
	rvx_port_28,
	rvx_port_54,
	rvx_port_75,
	rvx_port_50,
	rvx_port_24,
	rvx_port_43,
	rvx_port_71,
	rvx_port_33,
	rvx_port_74,
	rvx_port_44,
	rvx_port_49,
	rvx_port_22,
	rvx_port_45,
	rvx_port_17,
	rvx_port_47,
	rvx_port_06,
	rvx_port_34,
	rvx_port_12,
	rvx_port_58,
	rvx_port_72,
	rvx_port_10,
	rvx_port_46,
	rvx_port_53,
	rvx_port_23,
	rvx_port_59,
	rvx_port_02,
	rvx_port_29,
	rvx_port_41,
	rvx_port_09,
	rvx_port_04,
	rvx_port_27,
	rvx_port_20,
	rvx_port_21,
	rvx_port_08,
	rvx_port_66
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire rvx_port_00, rvx_port_68;
input wire [RVX_GPARA_0-1:0] rvx_port_16;
input wire [RVX_GPARA_1-1:0] rvx_port_19;
input wire [`BW_AXI_ALEN-1:0] rvx_port_15;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_03;
input wire [`BW_AXI_ABURST-1:0] rvx_port_25;
input wire [`BW_AXI_ALOCK-1:0] rvx_port_38;
input wire [`BW_AXI_ACACHE-1:0] rvx_port_11;
input wire [`BW_AXI_APROT-1:0] rvx_port_69;
input wire rvx_port_56;
output wire rvx_port_51;
input wire [RVX_GPARA_0-1:0] rvx_port_26;
input wire [RVX_GPARA_2-1:0] rvx_port_60;
input wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_18;
input wire rvx_port_39;
input wire rvx_port_52;
output wire rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_55;
output wire [`BW_AXI_BRESP-1:0] rvx_port_64;
output wire rvx_port_37;
input wire rvx_port_36;
input wire [RVX_GPARA_0-1:0] rvx_port_35;
input wire [RVX_GPARA_1-1:0] rvx_port_73;
input wire [`BW_AXI_ALEN-1:0] rvx_port_30;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_07;
input wire [`BW_AXI_ABURST-1:0] rvx_port_67;
input wire [`BW_AXI_ALOCK-1:0] rvx_port_70;
input wire [`BW_AXI_ACACHE-1:0] rvx_port_57;
input wire [`BW_AXI_APROT-1:0] rvx_port_42;
input wire rvx_port_61;
output wire rvx_port_31;
output wire [RVX_GPARA_0-1:0] rvx_port_32;
output wire [RVX_GPARA_2-1:0] rvx_port_40;
output wire [`BW_AXI_RRESP-1:0] rvx_port_62;
output wire rvx_port_01;
output wire rvx_port_65;
input wire rvx_port_63;

input wire rvx_port_14, rvx_port_48;
output wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_28;
output wire [`BW_AXI_ALEN-1:0] rvx_port_54;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_75;
output wire [`BW_AXI_ABURST-1:0] rvx_port_50;
output wire [`BW_AXI_ALOCK-1:0] rvx_port_24;
output wire [`BW_AXI_ACACHE-1:0] rvx_port_43;
output wire [`BW_AXI_APROT-1:0] rvx_port_71;
output wire rvx_port_33;
input wire rvx_port_74;
output wire [RVX_GPARA_0-1:0] rvx_port_44;
output wire [RVX_GPARA_2-1:0] rvx_port_49;
output wire [`BW_AXI_WSTRB(RVX_GPARA_2)-1:0] rvx_port_22;
output wire rvx_port_45;
output wire rvx_port_17;
input wire rvx_port_47;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire [`BW_AXI_BRESP-1:0] rvx_port_34;
input wire rvx_port_12;
output wire rvx_port_58;
output wire [RVX_GPARA_0-1:0] rvx_port_72;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
output wire [`BW_AXI_ALEN-1:0] rvx_port_46;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_53;
output wire [`BW_AXI_ABURST-1:0] rvx_port_23;
output wire [`BW_AXI_ALOCK-1:0] rvx_port_59;
output wire [`BW_AXI_ACACHE-1:0] rvx_port_02;
output wire [`BW_AXI_APROT-1:0] rvx_port_29;
output wire rvx_port_41;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_04;
input wire [RVX_GPARA_2-1:0] rvx_port_27;
input wire [`BW_AXI_RRESP-1:0] rvx_port_20;
input wire rvx_port_21;
input wire rvx_port_08;
output wire rvx_port_66;

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_ARCHANNEL(RVX_GPARA_0,RVX_GPARA_1)),
	.DEPTH(1)
)
i_rvx_instance_2
(
	.wclk(rvx_port_00),
	.wrstnn(rvx_port_68),
	.wready(rvx_port_31),
	.wrequest(rvx_port_61),
	.wdata({rvx_port_35,rvx_port_73,rvx_port_30,rvx_port_07,rvx_port_67,rvx_port_70,rvx_port_57,rvx_port_42}),
	.rclk(rvx_port_14),
	.rrstnn(rvx_port_48),
	.rready(rvx_port_41),
	.rrequest(rvx_port_09),
	.rdata({rvx_port_72,rvx_port_10,rvx_port_46,rvx_port_53,rvx_port_23,rvx_port_59,rvx_port_02,rvx_port_29}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(RVX_GPARA_0,RVX_GPARA_1)),
	.DEPTH(1)
)
i_rvx_instance_4
(
	.wclk(rvx_port_00),
	.wrstnn(rvx_port_68),
	.wready(rvx_port_51),
	.wrequest(rvx_port_56),
	.wdata({rvx_port_16,rvx_port_19,rvx_port_15,rvx_port_03,rvx_port_25,rvx_port_38,rvx_port_11,rvx_port_69}),
	.rclk(rvx_port_14),
	.rrstnn(rvx_port_48),
	.rready(rvx_port_33),
	.rrequest(rvx_port_74),
	.rdata({rvx_port_13,rvx_port_28,rvx_port_54,rvx_port_75,rvx_port_50,rvx_port_24,rvx_port_43,rvx_port_71}),
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
	.wclk(rvx_port_00),
	.wrstnn(rvx_port_68),
	.wready(rvx_port_05),
	.wrequest(rvx_port_52),
	.wdata({rvx_port_26,rvx_port_60,rvx_port_18,rvx_port_39}),
	.rclk(rvx_port_14),
	.rrstnn(rvx_port_48),
	.rready(rvx_port_17),
	.rrequest(rvx_port_47),
	.rdata({rvx_port_44,rvx_port_49,rvx_port_22,rvx_port_45}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_RCHANNEL(RVX_GPARA_0,RVX_GPARA_2)),
	.DEPTH(2)
)
i_rvx_instance_0
(
	.wclk(rvx_port_14),
	.wrstnn(rvx_port_48),
	.wready(rvx_port_66),
	.wrequest(rvx_port_08),
	.wdata({rvx_port_04,rvx_port_27,rvx_port_20,rvx_port_21}),
	.rclk(rvx_port_00),
	.rrstnn(rvx_port_68),
	.rready(rvx_port_65),
	.rrequest(rvx_port_63),
	.rdata({rvx_port_32,rvx_port_40,rvx_port_62,rvx_port_01}),
	.wfull(),
	.rempty()
);

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(`BW_BCHANNEL(RVX_GPARA_0)),
	.DEPTH(2)
)
i_rvx_instance_1
(
	.wclk(rvx_port_14),
	.wrstnn(rvx_port_48),
	.wready(rvx_port_58),
	.wrequest(rvx_port_12),
	.wdata({rvx_port_06,rvx_port_34}),
	.rclk(rvx_port_00),
	.rrstnn(rvx_port_68),
	.rready(rvx_port_37),
	.rrequest(rvx_port_36),
	.rdata({rvx_port_55,rvx_port_64}),
	.wfull(),
	.rempty()
);

endmodule
