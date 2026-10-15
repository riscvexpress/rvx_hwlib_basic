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





module RVX_MODULE_131
(
	rvx_port_51,
	rvx_port_30,
	rvx_port_33,
	rvx_port_01,

	rvx_port_63,
	rvx_port_41,
	rvx_port_57,
	rvx_port_42,
	rvx_port_50,
	rvx_port_69,
	rvx_port_52,
	rvx_port_62,
	rvx_port_06,
	rvx_port_09,
	rvx_port_65,

	rvx_port_44,
	rvx_port_68,
	rvx_port_64,
	rvx_port_14,
	rvx_port_13,
	rvx_port_15,
	rvx_port_21,

	rvx_port_58,
	rvx_port_25,
	rvx_port_23,
	rvx_port_03,
	rvx_port_38,
	rvx_port_32,
	rvx_port_43,
	rvx_port_29,
	rvx_port_49,
	rvx_port_05,
	rvx_port_37,

	rvx_port_08,
	rvx_port_11,
	rvx_port_22,
	rvx_port_36,
	rvx_port_53,
	rvx_port_61,
	rvx_port_07,

	rvx_port_28,
	rvx_port_27,
	rvx_port_48,
	rvx_port_47,
	rvx_port_56,
	rvx_port_26,
	rvx_port_55,

	rvx_port_39,
	rvx_port_34,
	rvx_port_16,
	rvx_port_46,
	rvx_port_54,
	rvx_port_59,

	rvx_port_17,
	rvx_port_20,
	rvx_port_00,
	rvx_port_19,

	rvx_port_35,
	rvx_port_67,
	rvx_port_10,
	rvx_port_45,
	rvx_port_60,
	rvx_port_66,
	rvx_port_24,

	rvx_port_31,
	rvx_port_40,
	rvx_port_12,
	rvx_port_02,
	rvx_port_18,
	rvx_port_04
);





parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_2 = 4;

`include "burden_para.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam BW_LPIXM_ADDR = RVX_GPARA_0;
localparam BW_LPIXM_DATA = RVX_GPARA_1;
localparam BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;

`include "lpixm_lpara.vb"

input wire rvx_port_51;
input wire rvx_port_30;
input wire rvx_port_33;
input wire rvx_port_01;

output wire [(2)-1:0] rvx_port_63;
input wire rvx_port_41;
input wire rvx_port_57;
input wire rvx_port_42;
input wire [`BW_AXI_ALEN-1:0] rvx_port_50;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_69;
input wire [`BW_AXI_ABURST-1:0] rvx_port_52;
input wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_62;
input wire [RVX_GPARA_1-1:0] rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_09;
input wire [BW_BURDEN_NZ-1:0] rvx_port_65;

input wire [(2)-1:0] rvx_port_44;
output wire rvx_port_68;
output wire rvx_port_64;
output wire rvx_port_14;
output wire [`BW_AXI_RESP-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_15;
output wire [BW_BURDEN_NZ-1:0] rvx_port_21;

output wire [(2)-1:0] rvx_port_58;
input wire rvx_port_25;
input wire rvx_port_23;
input wire rvx_port_03;
input wire [`BW_AXI_ALEN-1:0] rvx_port_38;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_32;
input wire [`BW_AXI_ABURST-1:0] rvx_port_43;
input wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_29;
input wire [RVX_GPARA_1-1:0] rvx_port_49;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire [BW_BURDEN_NZ-1:0] rvx_port_37;

input wire [(2)-1:0] rvx_port_08;
output wire rvx_port_11;
output wire rvx_port_22;
output wire rvx_port_36;
output wire [`BW_AXI_RESP-1:0] rvx_port_53;
output wire [RVX_GPARA_1-1:0] rvx_port_61;
output wire [BW_BURDEN_NZ-1:0] rvx_port_07;

output wire [RVX_GPARA_3-1:0] rvx_port_28;
output wire [RVX_GPARA_0-1:0] rvx_port_27;
output wire [`BW_AXI_ALEN-1:0] rvx_port_48;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_47;
output wire [`BW_AXI_ABURST-1:0] rvx_port_56;
output wire rvx_port_26;
input wire rvx_port_55;

output wire [RVX_GPARA_3-1:0] rvx_port_39;
output wire [RVX_GPARA_1-1:0] rvx_port_34;
output wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_16;
output wire rvx_port_46;
output wire rvx_port_54;
input wire rvx_port_59;

input wire [RVX_GPARA_3-1:0] rvx_port_17;
input wire [`BW_AXI_BRESP-1:0] rvx_port_20;
input wire rvx_port_00;
output wire rvx_port_19;

output wire [RVX_GPARA_3-1:0] rvx_port_35;
output wire [RVX_GPARA_0-1:0] rvx_port_67;
output wire [`BW_AXI_ALEN-1:0] rvx_port_10;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_45;
output wire [`BW_AXI_ABURST-1:0] rvx_port_60;
output wire rvx_port_66;
input wire rvx_port_24;

input wire [RVX_GPARA_3-1:0] rvx_port_31;
input wire [RVX_GPARA_1-1:0] rvx_port_40;
input wire [`BW_AXI_RRESP-1:0] rvx_port_12;
input wire rvx_port_02;
input wire rvx_port_18;
output wire rvx_port_04;

wire [BW_LPI_QPARCEL-1:0] rvx_signal_04;
wire [BW_LPI_QDATA-1:0] rvx_signal_08;
wire [BW_LPI_YPARCEL-1:0] rvx_signal_09;
wire [BW_LPI_YDATA-1:0] rvx_signal_06;
wire rvx_signal_01;

wire [BW_LPI_QPARCEL-1:0] rvx_signal_07;
wire [BW_LPI_QDATA-1:0] rvx_signal_00;
wire [BW_LPI_YPARCEL-1:0] rvx_signal_05;
wire [BW_LPI_YDATA-1:0] rvx_signal_03;
wire rvx_signal_02;

assign rvx_signal_04 = {rvx_port_57,rvx_port_42,rvx_port_50,rvx_port_69,rvx_port_52,rvx_port_62,rvx_port_06,rvx_port_09};
assign rvx_signal_09 = rvx_signal_06[BW_LPI_YPARCEL-1:0];
assign {rvx_signal_01,rvx_port_14,rvx_port_13,rvx_port_15} = rvx_signal_09;

assign rvx_signal_07 = {rvx_port_23,rvx_port_03,rvx_port_38,rvx_port_32,rvx_port_43,rvx_port_29,rvx_port_49,rvx_port_05};
assign rvx_signal_05 = rvx_signal_03[BW_LPI_YPARCEL-1:0];
assign {rvx_signal_02,rvx_port_36,rvx_port_53,rvx_port_61} = rvx_signal_05;

generate
if(HAS_BURDEN)
begin : i_has_burden
	assign rvx_signal_08 = {rvx_port_65,rvx_signal_04};
	assign rvx_port_21 = rvx_signal_06[BW_LPI_YDATA-1-:BW_BURDEN_NZ];
	assign rvx_signal_00 = {rvx_port_37,rvx_signal_07};
	assign rvx_port_07 = rvx_signal_03[BW_LPI_YDATA-1-:BW_BURDEN_NZ];
end
else
begin : i_no_burden
	assign rvx_signal_08 = rvx_signal_04;
	assign rvx_port_21 = 0;
	assign rvx_signal_00 = rvx_signal_07;
	assign rvx_port_07 = 0;
end
endgenerate

RVX_MODULE_064
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.RVX_GPARA_1(RVX_GPARA_1),
	.RVX_GPARA_3(RVX_GPARA_3),
	.MEMORY_OPERATION_TYPE(1),
	.RVX_GPARA_2(RVX_GPARA_2),
	.HAS_BURDEN(HAS_BURDEN),
	.BW_BURDEN(BW_BURDEN)
)
i_rvx_instance_1
(
	.rvx_port_30(rvx_port_51),
	.rvx_port_10(rvx_port_30),
	.rvx_port_03(rvx_port_33),
	.rvx_port_15(rvx_port_01),

	.rvx_port_06(rvx_port_63),
	.rvx_port_31(rvx_port_41),
	.rvx_port_13(1'b 0),
	.rvx_port_27(rvx_port_57),
	.rvx_port_42(rvx_port_57),
	.rvx_port_09(rvx_signal_08),

	.rvx_port_26(rvx_port_44),
	.rvx_port_40(rvx_port_68),
	.rvx_port_17(),
	.rvx_port_16(rvx_port_64),
	.rvx_port_35(rvx_signal_06),

	.rvx_port_28(),
	.rvx_port_04(),
	.rvx_port_12(),
	.rvx_port_38(),
	.rvx_port_22(),
	.rvx_port_00(),
	.rvx_port_36(1'b 0),

	.rvx_port_21(),
	.rvx_port_24(),
	.rvx_port_11(),
	.rvx_port_14(),
	.rvx_port_34(),
	.rvx_port_23(1'b 0),

	.rvx_port_33({RVX_GPARA_3{1'b 0}}),
	.rvx_port_32({`BW_AXI_BRESP{1'b 0}}),
	.rvx_port_01(1'b 0),
	.rvx_port_18(),

	.rvx_port_39(rvx_port_35),
	.rvx_port_07(rvx_port_67),
	.rvx_port_43(rvx_port_10),
	.rvx_port_02(rvx_port_45),
	.rvx_port_29(rvx_port_60),
	.rvx_port_20(rvx_port_66),
	.rvx_port_25(rvx_port_24),

	.rvx_port_41(rvx_port_31),
	.rvx_port_05(rvx_port_40),
	.rvx_port_37(rvx_port_12),
	.rvx_port_08(rvx_port_02),
	.rvx_port_44(rvx_port_18),
	.rvx_port_19(rvx_port_04)
);

RVX_MODULE_064
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.RVX_GPARA_1(RVX_GPARA_1),
	.RVX_GPARA_3(RVX_GPARA_3),
	.MEMORY_OPERATION_TYPE(2),
	.RVX_GPARA_2(RVX_GPARA_2),
	.HAS_BURDEN(HAS_BURDEN),
	.BW_BURDEN(BW_BURDEN)
)
i_rvx_instance_0
(
	.rvx_port_30(rvx_port_51),
	.rvx_port_10(rvx_port_30),
	.rvx_port_03(rvx_port_33),
	.rvx_port_15(rvx_port_01),

	.rvx_port_06(rvx_port_58),
	.rvx_port_31(rvx_port_25),
	.rvx_port_13(1'b 0),
	.rvx_port_27(rvx_port_23),
	.rvx_port_42(rvx_port_23),
	.rvx_port_09(rvx_signal_00),

	.rvx_port_26(rvx_port_08),
	.rvx_port_40(rvx_port_11),
	.rvx_port_17(),
	.rvx_port_16(rvx_port_22),
	.rvx_port_35(rvx_signal_03),

	.rvx_port_28(rvx_port_28),
	.rvx_port_04(rvx_port_27),
	.rvx_port_12(rvx_port_48),
	.rvx_port_38(rvx_port_47),
	.rvx_port_22(rvx_port_56),
	.rvx_port_00(rvx_port_26),
	.rvx_port_36(rvx_port_55),

	.rvx_port_21(rvx_port_39),
	.rvx_port_24(rvx_port_34),
	.rvx_port_11(rvx_port_16),
	.rvx_port_14(rvx_port_46),
	.rvx_port_34(rvx_port_54),
	.rvx_port_23(rvx_port_59),

	.rvx_port_33(rvx_port_17),
	.rvx_port_32(rvx_port_20),
	.rvx_port_01(rvx_port_00),
	.rvx_port_18(rvx_port_19),

	.rvx_port_39(),
	.rvx_port_07(),
	.rvx_port_43(),
	.rvx_port_02(),
	.rvx_port_29(),
	.rvx_port_20(),
	.rvx_port_25(1'b 0),

	.rvx_port_41({RVX_GPARA_3{1'b 0}}),
	.rvx_port_05({RVX_GPARA_1{1'b 0}}),
	.rvx_port_37({`BW_AXI_RRESP{1'b 0}}),
	.rvx_port_08(1'b 0),
	.rvx_port_44(1'b 0),
	.rvx_port_19()
);

endmodule
