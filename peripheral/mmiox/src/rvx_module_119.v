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

`include "ervp_global.vh"
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_119
(
  rvx_port_30,
  rvx_port_14,
  rvx_port_49,
  rvx_port_15,

  
  rvx_port_09,
  rvx_port_36,
  rvx_port_47,
  rvx_port_38,
  rvx_port_24,
  rvx_port_02,
  rvx_port_48,
	rvx_port_40,
	rvx_port_45,
	rvx_port_41,
  rvx_port_07,
  rvx_port_16,
  rvx_port_33,
  rvx_port_42,
  rvx_port_35,
  rvx_port_32,
  rvx_port_26,
  rvx_port_08,
  rvx_port_34,
  rvx_port_10,
  rvx_port_52,
  rvx_port_17,
  rvx_port_00,
  rvx_port_18,
  rvx_port_21,
  rvx_port_29,
  rvx_port_50,
  rvx_port_01,
  rvx_port_39,
  rvx_port_05,
  rvx_port_20,
  rvx_port_44,

  
  rvx_port_22,
  rvx_port_11,
  rvx_port_06,
  rvx_port_37,
  rvx_port_04,
  rvx_port_28,
  rvx_port_12,
  rvx_port_46,
  rvx_port_43,
  rvx_port_13,
  rvx_port_31,
  rvx_port_27,
  rvx_port_03,
  rvx_port_19,
  rvx_port_23,
  rvx_port_51,
  rvx_port_25
);





parameter RVX_GPARA_0 = 32;

parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_6 = 32;
parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_7 = 32;

parameter RVX_GPARA_2 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_30;
input wire rvx_port_14;
input wire rvx_port_49;
input wire rvx_port_15;

input wire rvx_port_09;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_36;
input wire rvx_port_47;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_38;
input wire rvx_port_24;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_02;
input wire rvx_port_48;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_40;
input wire rvx_port_45;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_41;
input wire rvx_port_07;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_16;
output wire rvx_port_33;
input wire rvx_port_42;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_35;
output wire rvx_port_32;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_26;
input wire rvx_port_08;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_34;
output wire rvx_port_10;
input wire rvx_port_52;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_17;
output wire rvx_port_00;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_18;
input wire rvx_port_21;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_29;
output wire rvx_port_50;
input wire rvx_port_01;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_39;
input wire rvx_port_05;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_20;

output wire [32-1:0] rvx_port_44;

output wire [RVX_GPARA_3-1:0] rvx_port_22;
input wire [RVX_GPARA_6-1:0] rvx_port_11;
output wire rvx_port_06;
input wire rvx_port_37;

output wire rvx_port_04;
input wire rvx_port_28;
input wire [RVX_GPARA_5-1:0] rvx_port_12;

output wire rvx_port_46;
output wire [RVX_GPARA_4-1:0] rvx_port_43;
input wire rvx_port_13;
input wire rvx_port_31;

output wire rvx_port_27;
output wire [RVX_GPARA_1-1:0] rvx_port_03;
input wire rvx_port_19;

output wire rvx_port_23;
input wire rvx_port_51;
input wire [RVX_GPARA_7-1:0] rvx_port_25;

wire rvx_signal_008;
wire rvx_signal_084;
wire rvx_signal_023;
wire rvx_signal_012;
wire rvx_signal_035;
wire rvx_signal_037;
wire rvx_signal_079;
wire rvx_signal_078;
wire rvx_signal_058;

localparam  RVX_LPARA_03 = 16;

`include "rvx_include_18.vh"
`include "rvx_include_03.vh"

localparam  RVX_LPARA_01 = RVX_GPARA_5;
localparam  RVX_LPARA_18 = RVX_GPARA_5;
localparam  RVX_LPARA_13 = RVX_GPARA_0;
localparam  RVX_LPARA_11 = LOG_FIFO_DEPTH;

wire rvx_signal_106;
wire rvx_signal_096;
wire rvx_signal_098;
wire rvx_signal_099;
wire rvx_signal_102;
wire rvx_signal_110;
wire rvx_signal_002;
wire [RVX_LPARA_18-1:0] rvx_signal_062;

wire rvx_signal_059;
wire rvx_signal_101;
wire rvx_signal_045;
wire rvx_signal_109;
wire rvx_signal_030;
wire rvx_signal_034;
wire rvx_signal_029;
wire [RVX_LPARA_13-1:0] rvx_signal_086;

localparam  RVX_LPARA_12 = RVX_GPARA_4;
localparam  RVX_LPARA_09 = RVX_GPARA_0;
localparam  RVX_LPARA_14 = RVX_GPARA_4;
localparam  RVX_LPARA_05 = INST_FIFO_DEPTH;

wire rvx_signal_069;
wire rvx_signal_095;
wire rvx_signal_009;
wire rvx_signal_022;
wire rvx_signal_000;
wire rvx_signal_010;
wire rvx_signal_105;
wire [RVX_LPARA_09-1:0] rvx_signal_005;
wire [RVX_LPARA_03-1:0] rvx_signal_090;

wire rvx_signal_025;
wire rvx_signal_052;
wire rvx_signal_082;
wire rvx_signal_024;
wire rvx_signal_057;
wire rvx_signal_083;
wire rvx_signal_094;
wire [RVX_LPARA_14-1:0] rvx_signal_073;

localparam  RVX_LPARA_20 = 1;
localparam  RVX_LPARA_06 = INST_FIFO_DEPTH;

wire rvx_signal_014;
wire rvx_signal_044;
wire rvx_signal_108;
wire rvx_signal_004;
wire rvx_signal_092;
wire [RVX_LPARA_20-1:0] rvx_signal_100;

wire rvx_signal_067;
wire rvx_signal_042;
wire rvx_signal_093;
wire rvx_signal_089;
wire rvx_signal_066;
wire [RVX_LPARA_20-1:0] rvx_signal_056;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_19 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_068;
wire rvx_signal_043;
wire rvx_signal_085;
wire rvx_signal_026;
wire [RVX_LPARA_19-1:0] rvx_signal_006;
wire [RVX_LPARA_19-1:0] rvx_signal_013;

wire rvx_signal_076;
wire [8-1:0] rvx_signal_017;
wire [8-1:0] rvx_signal_046;

localparam  RVX_LPARA_17 = RVX_GPARA_1;
localparam  RVX_LPARA_10 = RVX_GPARA_0;
localparam  RVX_LPARA_02 = RVX_GPARA_1;
localparam  RVX_LPARA_07 = INPUT_FIFO_DEPTH;

wire rvx_signal_003;
wire rvx_signal_032;
wire rvx_signal_033;
wire rvx_signal_104;
wire rvx_signal_065;
wire rvx_signal_016;
wire rvx_signal_020;
wire [RVX_LPARA_10-1:0] rvx_signal_051;
wire [RVX_LPARA_03-1:0] rvx_signal_063;

wire rvx_signal_075;
wire rvx_signal_080;
wire rvx_signal_028;
wire rvx_signal_050;
wire rvx_signal_077;
wire rvx_signal_088;
wire rvx_signal_054;
wire [RVX_LPARA_02-1:0] rvx_signal_019;

localparam  RVX_LPARA_04 = RVX_GPARA_7;
localparam  RVX_LPARA_16 = RVX_GPARA_7;
localparam  RVX_LPARA_08 = RVX_GPARA_0;
localparam  RVX_LPARA_21 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_015;
wire rvx_signal_047;
wire rvx_signal_041;
wire rvx_signal_087;
wire rvx_signal_007;
wire rvx_signal_048;
wire rvx_signal_061;
wire [RVX_LPARA_16-1:0] rvx_signal_070;

wire rvx_signal_038;
wire rvx_signal_021;
wire rvx_signal_103;
wire rvx_signal_097;
wire rvx_signal_091;
wire rvx_signal_071;
wire rvx_signal_011;
wire [RVX_LPARA_08-1:0] rvx_signal_049;
wire [RVX_LPARA_03-1:0] rvx_signal_053;

localparam  RVX_LPARA_00 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_15 = INST_FIFO_DEPTH;

wire rvx_signal_027;
wire rvx_signal_107;
wire rvx_signal_055;
wire rvx_signal_064;
wire [RVX_LPARA_00-1:0] rvx_signal_072;
wire rvx_signal_040;
wire rvx_signal_031;
wire [RVX_LPARA_00-1:0] rvx_signal_018;

reg [RVX_GPARA_0-1:0] rvx_signal_001;
reg [RVX_GPARA_0-1:0] rvx_signal_081;
wire [RVX_GPARA_6-1:0] rvx_signal_060;
wire [RVX_GPARA_3-1:0] rvx_signal_036;

wire [16-1:0] rvx_signal_074;
wire [16-1:0] rvx_signal_039;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_3),
  .DEFAULT_VALUE(RVX_GPARA_2)
)
i_rvx_instance_05
(
  .clk(rvx_port_30),
  .rstnn(rvx_port_14),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_09),
  .mmio_rdata(rvx_port_36),
  .mmio_we(rvx_port_47),
  .mmio_wdata(rvx_port_38),

  .wide_data_out(rvx_signal_036)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_3)
)
i_rvx_instance_01
(
  .clk(rvx_port_49),
  .rstnn(rvx_port_15),
  .enable(1'b 1),
  .asynch_value(rvx_signal_036),
  .synch_value(rvx_port_22)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_6)
)
i_rvx_instance_07
(
  .clk(rvx_port_30),
  .rstnn(rvx_port_14),
  .enable(1'b 1),
  .asynch_value(rvx_port_11),
  .synch_value(rvx_signal_060)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_6)
)
i_rvx_instance_09
(
  .clk(rvx_port_30),
  .rstnn(rvx_port_14),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_24),
  .mmio_rdata(rvx_port_02),

  .wide_data_in(rvx_signal_060)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_02
(
	.wclk(rvx_signal_008),
	.wrstnn(rvx_signal_084),
	.wstart(rvx_signal_023),
  .wbusy(rvx_signal_012),
	.wfinish(rvx_signal_035),
	.rclk(rvx_signal_037),
	.rrstnn(rvx_signal_079),
	.rvalid(rvx_signal_078),
	.rready(rvx_signal_058)
);

assign rvx_signal_008 = rvx_port_30;
assign rvx_signal_084 = rvx_port_14;
assign rvx_signal_023 = rvx_port_45;
assign rvx_signal_037 = rvx_port_49;
assign rvx_signal_079 = rvx_port_15;
assign rvx_port_06 = rvx_signal_078;
assign rvx_signal_058 = rvx_port_37;

assign rvx_port_40 = rvx_signal_012;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_01),
  .BW_PARTIAL_WRITE(RVX_LPARA_18),
  .BW_PARTIAL_READ(RVX_LPARA_13),
  .DEPTH(RVX_LPARA_11)
)
i_rvx_instance_08
(
  .wclk(rvx_signal_106),
  .wrstnn(rvx_signal_096),
  .wready(rvx_signal_098),
  .wfull(rvx_signal_099),
  .wstartindex(rvx_signal_102),
  .wlastindex(rvx_signal_110),
  .wrequest(rvx_signal_002),
  .wdata(rvx_signal_062),
  .wnum(),

  .rclk(rvx_signal_059),
  .rrstnn(rvx_signal_101),
  .rready(rvx_signal_045),
  .rempty(rvx_signal_109),
  .rstartindex(rvx_signal_030),
  .rlastindex(rvx_signal_034),
  .rrequest(rvx_signal_029),
  .rdata(rvx_signal_086),
  .rnum()
);

assign rvx_signal_106 = rvx_port_49;
assign rvx_signal_096 = rvx_port_15 & INCLUDE_LOG_FIFO;
assign rvx_port_04 = rvx_signal_098;
assign rvx_signal_002 = rvx_port_28;
assign rvx_signal_062 = rvx_port_12;

assign rvx_signal_059 = rvx_port_30;
assign rvx_signal_101 = rvx_port_14 & INCLUDE_LOG_FIFO;
assign rvx_port_16 = rvx_signal_086;
assign rvx_signal_029 = rvx_port_07;
assign rvx_port_33 = rvx_signal_045;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_12),
  .BW_PARTIAL_WRITE(RVX_LPARA_09),
  .BW_PARTIAL_READ(RVX_LPARA_14),
  .DEPTH(RVX_LPARA_05),
  .BW_NUM_DATA(RVX_LPARA_03)
)
i_rvx_instance_11
(
  .wclk(rvx_signal_069),
  .wrstnn(rvx_signal_095),
  .wready(rvx_signal_009),
  .wfull(rvx_signal_022),
  .wstartindex(rvx_signal_000),
  .wlastindex(rvx_signal_010),
  .wrequest(rvx_signal_105),
  .wdata(rvx_signal_005),
  .wnum(rvx_signal_090),

  .rclk(rvx_signal_025),
  .rrstnn(rvx_signal_052),
  .rready(rvx_signal_082),
  .rempty(rvx_signal_024),
  .rstartindex(rvx_signal_057),
  .rlastindex(rvx_signal_083),
  .rrequest(rvx_signal_094),
  .rdata(rvx_signal_073),
  .rnum()
);

assign rvx_signal_069 = rvx_port_30;
assign rvx_signal_095 = rvx_port_14 & INCLUDE_INST_FIFO;
assign rvx_port_32 = rvx_signal_076 & rvx_signal_009;
assign rvx_signal_105 = rvx_signal_076 & rvx_port_42;
assign rvx_signal_005 = rvx_port_35;

assign rvx_signal_025 = rvx_port_49;
assign rvx_signal_052 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_port_46 = rvx_signal_082;
assign rvx_port_43 = rvx_signal_073;
assign rvx_signal_094 = rvx_port_13;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_20),
  .DEPTH(RVX_LPARA_06)
)
i_rvx_instance_10
(
  .wclk(rvx_signal_014),
  .wrstnn(rvx_signal_044),
  .wready(rvx_signal_108),
  .wfull(rvx_signal_004),
  .wrequest(rvx_signal_092),
  .wdata(rvx_signal_100),  
  .wnum(),

  .rclk(rvx_signal_067),
  .rrstnn(rvx_signal_042),
  .rready(rvx_signal_093),
  .rempty(rvx_signal_089),
  .rrequest(rvx_signal_066),
  .rdata(rvx_signal_056),
  .rnum()
);

assign rvx_signal_014 = rvx_port_49;
assign rvx_signal_044 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_signal_092 = rvx_port_31;
assign rvx_signal_100 = 0;

assign rvx_signal_067 = rvx_port_30;
assign rvx_signal_042 = rvx_port_14 & INCLUDE_INST_FIFO;
assign rvx_signal_066 = rvx_signal_093;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_19)
)
i_rvx_instance_00
(
  .clk(rvx_port_30),
  .rstnn(rvx_port_14),
  .enable(rvx_signal_068),
  .init(rvx_signal_043),
  .up(rvx_signal_085),
  .down(rvx_signal_026),
  .count_amount(rvx_signal_006),
  .value(rvx_signal_013),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_068 = INCLUDE_INST_FIFO;
assign rvx_signal_043 = 0;
assign rvx_signal_085 = rvx_signal_009 & rvx_signal_105 & rvx_signal_010;
assign rvx_signal_026 = rvx_signal_093 & rvx_signal_066;
assign rvx_signal_006 = 1;

assign rvx_signal_076 = ~(rvx_signal_013[RVX_LPARA_19-1]);

assign rvx_signal_017 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_076))? 0 : ((rvx_signal_090[RVX_LPARA_03-1:8]==0)? rvx_signal_090 : 63);
assign rvx_signal_046 = (rvx_signal_013>63)? 63 : rvx_signal_013;
assign rvx_port_26[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_045;
assign rvx_port_26[16-1-:8] = rvx_signal_046;
assign rvx_port_26[8-1-:8] = rvx_signal_017;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_17),
  .BW_PARTIAL_WRITE(RVX_LPARA_10),
  .BW_PARTIAL_READ(RVX_LPARA_02),
  .DEPTH(RVX_LPARA_07),
  .BW_NUM_DATA(RVX_LPARA_03)
)
i_rvx_instance_03
(
  .wclk(rvx_signal_003),
  .wrstnn(rvx_signal_032),
  .wready(rvx_signal_033),
  .wfull(rvx_signal_104),
  .wstartindex(rvx_signal_065),
  .wlastindex(rvx_signal_016),
  .wrequest(rvx_signal_020),
  .wdata(rvx_signal_051),
  .wnum(rvx_signal_063),

  .rclk(rvx_signal_075),
  .rrstnn(rvx_signal_080),
  .rready(rvx_signal_028),
  .rempty(rvx_signal_050),
  .rstartindex(rvx_signal_077),
  .rlastindex(rvx_signal_088),
  .rrequest(rvx_signal_054),
  .rdata(rvx_signal_019),
  .rnum()
);

assign rvx_signal_003 = rvx_port_30;
assign rvx_signal_032 = rvx_port_14 & INCLUDE_INPUT_FIFO;
assign rvx_port_10 = rvx_signal_033;
assign rvx_signal_020 = rvx_port_08;
assign rvx_signal_051 = rvx_port_34;

assign rvx_signal_075 = rvx_port_49;
assign rvx_signal_080 = rvx_port_15 & INCLUDE_INPUT_FIFO;
assign rvx_port_27 = rvx_signal_028;
assign rvx_port_03 = rvx_signal_019;
assign rvx_signal_054 = rvx_port_19;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_04),
  .BW_PARTIAL_WRITE(RVX_LPARA_16),
  .BW_PARTIAL_READ(RVX_LPARA_08),
  .DEPTH(RVX_LPARA_21),
  .BW_NUM_DATA(RVX_LPARA_03)
)
i_rvx_instance_06
(
  .wclk(rvx_signal_015),
  .wrstnn(rvx_signal_047),
  .wready(rvx_signal_041),
  .wfull(rvx_signal_087),
  .wstartindex(rvx_signal_007),
  .wlastindex(rvx_signal_048),
  .wrequest(rvx_signal_061),
  .wdata(rvx_signal_070),
  .wnum(),

  .rclk(rvx_signal_038),
  .rrstnn(rvx_signal_021),
  .rready(rvx_signal_103),
  .rempty(rvx_signal_097),
  .rstartindex(rvx_signal_091),
  .rlastindex(rvx_signal_071),
  .rrequest(rvx_signal_011),
  .rdata(rvx_signal_049),
  .rnum(rvx_signal_053)
);

assign rvx_signal_015 = rvx_port_49;
assign rvx_signal_047 = rvx_port_15 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_23 = rvx_signal_041;
assign rvx_signal_061 = rvx_port_51;
assign rvx_signal_070 = rvx_port_25;

assign rvx_signal_038 = rvx_port_30;
assign rvx_signal_021 = rvx_port_14 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_17 = rvx_signal_049;
assign rvx_signal_011 = rvx_port_52;
assign rvx_port_00 = rvx_signal_103;

assign rvx_signal_074 = rvx_signal_063[RVX_LPARA_03-1]? 0 : rvx_signal_063;
assign rvx_signal_039 = rvx_signal_053[RVX_LPARA_03-1]? 0 : rvx_signal_053;

assign rvx_port_18[32-1-:16] = rvx_signal_074;
assign rvx_port_18[16-1-:16] = rvx_signal_039;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_15)
)
i_rvx_instance_04
(
  .clk(rvx_signal_027),
  .rstnn(rvx_signal_107),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_055),
  .wfull(),
  .wrequest(rvx_signal_064),
  .wdata(rvx_signal_072),
  .wnum(),
  .rready(rvx_signal_040),
  .rempty(),
  .rrequest(rvx_signal_031),
  .rdata(rvx_signal_018),
  .rnum()
);

assign rvx_signal_027 = rvx_port_30;
assign rvx_signal_107 = rvx_port_14 & INCLUDE_INST_FIFO;

assign rvx_signal_064 = rvx_signal_076 & rvx_port_21;
assign rvx_signal_072 = rvx_port_29;
assign rvx_port_50 = rvx_signal_076 & rvx_signal_055;
assign rvx_signal_031 = rvx_signal_026; 

always@(posedge rvx_port_30, negedge rvx_port_14)
begin
  if(rvx_port_14==0)
    rvx_signal_001 <= 0;
  else if(rvx_signal_031|rvx_port_05)
    rvx_signal_001 <= rvx_signal_081;
end

always@(*)
begin
  rvx_signal_081 = rvx_signal_001;
  if(rvx_signal_031& rvx_signal_040)
    rvx_signal_081 = rvx_signal_081 | rvx_signal_018;
  if(rvx_port_05)
    rvx_signal_081 = rvx_signal_081 & (~rvx_port_20);
end

assign rvx_port_39 = rvx_signal_001;
assign rvx_port_44 = rvx_signal_001;

endmodule
