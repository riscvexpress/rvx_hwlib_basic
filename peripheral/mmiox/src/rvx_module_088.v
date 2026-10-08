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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_088
(
  rvx_port_00,
  rvx_port_22,
  rvx_port_08,
  rvx_port_45,

  
  rvx_port_19,
  rvx_port_30,
  rvx_port_40,
  rvx_port_01,
  rvx_port_42,
  rvx_port_34,
  rvx_port_20,
	rvx_port_11,
	rvx_port_27,
	rvx_port_15,
  rvx_port_48,
  rvx_port_25,
  rvx_port_05,
  rvx_port_06,
  rvx_port_39,
  rvx_port_17,
  rvx_port_38,
  rvx_port_50,
  rvx_port_07,
  rvx_port_36,
  rvx_port_35,
  rvx_port_18,
  rvx_port_04,
  rvx_port_14,
  rvx_port_16,
  rvx_port_21,
  rvx_port_09,
  rvx_port_49,
  rvx_port_02,
  rvx_port_52,
  rvx_port_32,
  rvx_port_41,

  
  rvx_port_13,
  rvx_port_23,
  rvx_port_28,
  rvx_port_12,
  rvx_port_24,
  rvx_port_03,
  rvx_port_46,
  rvx_port_10,
  rvx_port_26,
  rvx_port_51,
  rvx_port_47,
  rvx_port_43,
  rvx_port_31,
  rvx_port_37,
  rvx_port_29,
  rvx_port_44,
  rvx_port_33
);





parameter RVX_GPARA_3 = 32;

parameter RVX_GPARA_6 = 32;
parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_7 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;

parameter RVX_GPARA_1 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_00;
input wire rvx_port_22;
input wire rvx_port_08;
input wire rvx_port_45;

input wire rvx_port_19;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_30;
input wire rvx_port_40;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_01;
input wire rvx_port_42;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_34;
input wire rvx_port_20;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_11;
input wire rvx_port_27;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_15;
input wire rvx_port_48;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_25;
output wire rvx_port_05;
input wire rvx_port_06;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_39;
output wire rvx_port_17;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_38;
input wire rvx_port_50;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_07;
output wire rvx_port_36;
input wire rvx_port_35;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_18;
output wire rvx_port_04;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_14;
input wire rvx_port_16;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_21;
output wire rvx_port_09;
input wire rvx_port_49;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_02;
input wire rvx_port_52;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_32;

output wire [32-1:0] rvx_port_41;

output wire [RVX_GPARA_6-1:0] rvx_port_13;
input wire [RVX_GPARA_5-1:0] rvx_port_23;
output wire rvx_port_28;
input wire rvx_port_12;

output wire rvx_port_24;
input wire rvx_port_03;
input wire [RVX_GPARA_4-1:0] rvx_port_46;

output wire rvx_port_10;
output wire [RVX_GPARA_7-1:0] rvx_port_26;
input wire rvx_port_51;
input wire rvx_port_47;

output wire rvx_port_43;
output wire [RVX_GPARA_2-1:0] rvx_port_31;
input wire rvx_port_37;

output wire rvx_port_29;
input wire rvx_port_44;
input wire [RVX_GPARA_0-1:0] rvx_port_33;

wire rvx_signal_013;
wire rvx_signal_053;
wire rvx_signal_039;
wire rvx_signal_056;
wire rvx_signal_105;
wire rvx_signal_068;
wire rvx_signal_094;
wire rvx_signal_021;
wire rvx_signal_003;

localparam  RVX_LPARA_11 = 16;

`include "rvx_include_20.vh"
`include "rvx_include_22.vh"

localparam  RVX_LPARA_05 = RVX_GPARA_4;
localparam  RVX_LPARA_21 = RVX_GPARA_4;
localparam  RVX_LPARA_04 = RVX_GPARA_3;
localparam  RVX_LPARA_19 = LOG_FIFO_DEPTH;

wire rvx_signal_088;
wire rvx_signal_066;
wire rvx_signal_062;
wire rvx_signal_089;
wire rvx_signal_012;
wire rvx_signal_096;
wire rvx_signal_078;
wire [RVX_LPARA_21-1:0] rvx_signal_024;

wire rvx_signal_090;
wire rvx_signal_099;
wire rvx_signal_011;
wire rvx_signal_019;
wire rvx_signal_008;
wire rvx_signal_060;
wire rvx_signal_092;
wire [RVX_LPARA_04-1:0] rvx_signal_073;

localparam  RVX_LPARA_02 = RVX_GPARA_7;
localparam  RVX_LPARA_12 = RVX_GPARA_3;
localparam  RVX_LPARA_10 = RVX_GPARA_7;
localparam  RVX_LPARA_08 = INST_FIFO_DEPTH;

wire rvx_signal_086;
wire rvx_signal_055;
wire rvx_signal_076;
wire rvx_signal_087;
wire rvx_signal_065;
wire rvx_signal_109;
wire rvx_signal_106;
wire [RVX_LPARA_12-1:0] rvx_signal_079;
wire [RVX_LPARA_11-1:0] rvx_signal_046;

wire rvx_signal_004;
wire rvx_signal_031;
wire rvx_signal_018;
wire rvx_signal_033;
wire rvx_signal_040;
wire rvx_signal_082;
wire rvx_signal_042;
wire [RVX_LPARA_10-1:0] rvx_signal_002;

localparam  RVX_LPARA_17 = 1;
localparam  RVX_LPARA_16 = INST_FIFO_DEPTH;

wire rvx_signal_057;
wire rvx_signal_110;
wire rvx_signal_050;
wire rvx_signal_052;
wire rvx_signal_093;
wire [RVX_LPARA_17-1:0] rvx_signal_045;

wire rvx_signal_091;
wire rvx_signal_077;
wire rvx_signal_101;
wire rvx_signal_043;
wire rvx_signal_034;
wire [RVX_LPARA_17-1:0] rvx_signal_028;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_14 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_007;
wire rvx_signal_047;
wire rvx_signal_005;
wire rvx_signal_032;
wire [RVX_LPARA_14-1:0] rvx_signal_069;
wire [RVX_LPARA_14-1:0] rvx_signal_006;

wire rvx_signal_023;
wire [8-1:0] rvx_signal_014;
wire [8-1:0] rvx_signal_059;

localparam  RVX_LPARA_18 = RVX_GPARA_2;
localparam  RVX_LPARA_13 = RVX_GPARA_3;
localparam  RVX_LPARA_03 = RVX_GPARA_2;
localparam  RVX_LPARA_01 = INPUT_FIFO_DEPTH;

wire rvx_signal_026;
wire rvx_signal_054;
wire rvx_signal_001;
wire rvx_signal_022;
wire rvx_signal_037;
wire rvx_signal_061;
wire rvx_signal_000;
wire [RVX_LPARA_13-1:0] rvx_signal_035;
wire [RVX_LPARA_11-1:0] rvx_signal_074;

wire rvx_signal_081;
wire rvx_signal_048;
wire rvx_signal_097;
wire rvx_signal_085;
wire rvx_signal_070;
wire rvx_signal_100;
wire rvx_signal_030;
wire [RVX_LPARA_03-1:0] rvx_signal_010;

localparam  RVX_LPARA_00 = RVX_GPARA_0;
localparam  RVX_LPARA_15 = RVX_GPARA_0;
localparam  RVX_LPARA_20 = RVX_GPARA_3;
localparam  RVX_LPARA_06 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_038;
wire rvx_signal_009;
wire rvx_signal_016;
wire rvx_signal_051;
wire rvx_signal_036;
wire rvx_signal_020;
wire rvx_signal_064;
wire [RVX_LPARA_15-1:0] rvx_signal_103;

wire rvx_signal_017;
wire rvx_signal_108;
wire rvx_signal_063;
wire rvx_signal_084;
wire rvx_signal_075;
wire rvx_signal_104;
wire rvx_signal_027;
wire [RVX_LPARA_20-1:0] rvx_signal_025;
wire [RVX_LPARA_11-1:0] rvx_signal_041;

localparam  RVX_LPARA_09 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_07 = INST_FIFO_DEPTH;

wire rvx_signal_080;
wire rvx_signal_095;
wire rvx_signal_029;
wire rvx_signal_083;
wire [RVX_LPARA_09-1:0] rvx_signal_071;
wire rvx_signal_098;
wire rvx_signal_058;
wire [RVX_LPARA_09-1:0] rvx_signal_049;

reg [RVX_GPARA_3-1:0] rvx_signal_015;
reg [RVX_GPARA_3-1:0] rvx_signal_067;
wire [RVX_GPARA_5-1:0] rvx_signal_107;
wire [RVX_GPARA_6-1:0] rvx_signal_102;

wire [16-1:0] rvx_signal_044;
wire [16-1:0] rvx_signal_072;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_6),
  .DEFAULT_VALUE(RVX_GPARA_1)
)
i_rvx_instance_05
(
  .clk(rvx_port_00),
  .rstnn(rvx_port_22),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_19),
  .mmio_rdata(rvx_port_30),
  .mmio_we(rvx_port_40),
  .mmio_wdata(rvx_port_01),

  .wide_data_out(rvx_signal_102)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_6)
)
i_rvx_instance_06
(
  .clk(rvx_port_08),
  .rstnn(rvx_port_45),
  .enable(1'b 1),
  .asynch_value(rvx_signal_102),
  .synch_value(rvx_port_13)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_5)
)
i_rvx_instance_02
(
  .clk(rvx_port_00),
  .rstnn(rvx_port_22),
  .enable(1'b 1),
  .asynch_value(rvx_port_23),
  .synch_value(rvx_signal_107)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_5)
)
i_rvx_instance_00
(
  .clk(rvx_port_00),
  .rstnn(rvx_port_22),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_42),
  .mmio_rdata(rvx_port_34),

  .wide_data_in(rvx_signal_107)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_04
(
	.wclk(rvx_signal_013),
	.wrstnn(rvx_signal_053),
	.wstart(rvx_signal_039),
  .wbusy(rvx_signal_056),
	.wfinish(rvx_signal_105),
	.rclk(rvx_signal_068),
	.rrstnn(rvx_signal_094),
	.rvalid(rvx_signal_021),
	.rready(rvx_signal_003)
);

assign rvx_signal_013 = rvx_port_00;
assign rvx_signal_053 = rvx_port_22;
assign rvx_signal_039 = rvx_port_27;
assign rvx_signal_068 = rvx_port_08;
assign rvx_signal_094 = rvx_port_45;
assign rvx_port_28 = rvx_signal_021;
assign rvx_signal_003 = rvx_port_12;

assign rvx_port_11 = rvx_signal_056;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_05),
  .BW_PARTIAL_WRITE(RVX_LPARA_21),
  .BW_PARTIAL_READ(RVX_LPARA_04),
  .DEPTH(RVX_LPARA_19)
)
i_rvx_instance_01
(
  .wclk(rvx_signal_088),
  .wrstnn(rvx_signal_066),
  .wready(rvx_signal_062),
  .wfull(rvx_signal_089),
  .wstartindex(rvx_signal_012),
  .wlastindex(rvx_signal_096),
  .wrequest(rvx_signal_078),
  .wdata(rvx_signal_024),
  .wnum(),

  .rclk(rvx_signal_090),
  .rrstnn(rvx_signal_099),
  .rready(rvx_signal_011),
  .rempty(rvx_signal_019),
  .rstartindex(rvx_signal_008),
  .rlastindex(rvx_signal_060),
  .rrequest(rvx_signal_092),
  .rdata(rvx_signal_073),
  .rnum()
);

assign rvx_signal_088 = rvx_port_08;
assign rvx_signal_066 = rvx_port_45 & INCLUDE_LOG_FIFO;
assign rvx_port_24 = rvx_signal_062;
assign rvx_signal_078 = rvx_port_03;
assign rvx_signal_024 = rvx_port_46;

assign rvx_signal_090 = rvx_port_00;
assign rvx_signal_099 = rvx_port_22 & INCLUDE_LOG_FIFO;
assign rvx_port_25 = rvx_signal_073;
assign rvx_signal_092 = rvx_port_48;
assign rvx_port_05 = rvx_signal_011;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_02),
  .BW_PARTIAL_WRITE(RVX_LPARA_12),
  .BW_PARTIAL_READ(RVX_LPARA_10),
  .DEPTH(RVX_LPARA_08),
  .BW_NUM_DATA(RVX_LPARA_11)
)
i_rvx_instance_10
(
  .wclk(rvx_signal_086),
  .wrstnn(rvx_signal_055),
  .wready(rvx_signal_076),
  .wfull(rvx_signal_087),
  .wstartindex(rvx_signal_065),
  .wlastindex(rvx_signal_109),
  .wrequest(rvx_signal_106),
  .wdata(rvx_signal_079),
  .wnum(rvx_signal_046),

  .rclk(rvx_signal_004),
  .rrstnn(rvx_signal_031),
  .rready(rvx_signal_018),
  .rempty(rvx_signal_033),
  .rstartindex(rvx_signal_040),
  .rlastindex(rvx_signal_082),
  .rrequest(rvx_signal_042),
  .rdata(rvx_signal_002),
  .rnum()
);

assign rvx_signal_086 = rvx_port_00;
assign rvx_signal_055 = rvx_port_22 & INCLUDE_INST_FIFO;
assign rvx_port_17 = rvx_signal_023 & rvx_signal_076;
assign rvx_signal_106 = rvx_signal_023 & rvx_port_06;
assign rvx_signal_079 = rvx_port_39;

assign rvx_signal_004 = rvx_port_08;
assign rvx_signal_031 = rvx_port_45 & INCLUDE_INST_FIFO;
assign rvx_port_10 = rvx_signal_018;
assign rvx_port_26 = rvx_signal_002;
assign rvx_signal_042 = rvx_port_51;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_17),
  .DEPTH(RVX_LPARA_16)
)
i_rvx_instance_08
(
  .wclk(rvx_signal_057),
  .wrstnn(rvx_signal_110),
  .wready(rvx_signal_050),
  .wfull(rvx_signal_052),
  .wrequest(rvx_signal_093),
  .wdata(rvx_signal_045),  

  .rclk(rvx_signal_091),
  .rrstnn(rvx_signal_077),
  .rready(rvx_signal_101),
  .rempty(rvx_signal_043),
  .rrequest(rvx_signal_034),
  .rdata(rvx_signal_028)
);

assign rvx_signal_057 = rvx_port_08;
assign rvx_signal_110 = rvx_port_45 & INCLUDE_INST_FIFO;
assign rvx_signal_093 = rvx_port_47;
assign rvx_signal_045 = 0;

assign rvx_signal_091 = rvx_port_00;
assign rvx_signal_077 = rvx_port_22 & INCLUDE_INST_FIFO;
assign rvx_signal_034 = rvx_signal_101;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_14)
)
i_rvx_instance_09
(
  .clk(rvx_port_00),
  .rstnn(rvx_port_22),
  .enable(rvx_signal_007),
  .init(rvx_signal_047),
  .up(rvx_signal_005),
  .down(rvx_signal_032),
  .count_amount(rvx_signal_069),
  .value(rvx_signal_006),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_007 = INCLUDE_INST_FIFO;
assign rvx_signal_047 = 0;
assign rvx_signal_005 = rvx_signal_076 & rvx_signal_106 & rvx_signal_109;
assign rvx_signal_032 = rvx_signal_101 & rvx_signal_034;
assign rvx_signal_069 = 1;

assign rvx_signal_023 = ~(rvx_signal_006[RVX_LPARA_14-1]);

assign rvx_signal_014 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_023))? 0 : ((rvx_signal_046[RVX_LPARA_11-1:8]==0)? rvx_signal_046 : 63);
assign rvx_signal_059 = (rvx_signal_006>63)? 63 : rvx_signal_006;
assign rvx_port_38[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_011;
assign rvx_port_38[16-1-:8] = rvx_signal_059;
assign rvx_port_38[8-1-:8] = rvx_signal_014;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_18),
  .BW_PARTIAL_WRITE(RVX_LPARA_13),
  .BW_PARTIAL_READ(RVX_LPARA_03),
  .DEPTH(RVX_LPARA_01),
  .BW_NUM_DATA(RVX_LPARA_11)
)
i_rvx_instance_11
(
  .wclk(rvx_signal_026),
  .wrstnn(rvx_signal_054),
  .wready(rvx_signal_001),
  .wfull(rvx_signal_022),
  .wstartindex(rvx_signal_037),
  .wlastindex(rvx_signal_061),
  .wrequest(rvx_signal_000),
  .wdata(rvx_signal_035),
  .wnum(rvx_signal_074),

  .rclk(rvx_signal_081),
  .rrstnn(rvx_signal_048),
  .rready(rvx_signal_097),
  .rempty(rvx_signal_085),
  .rstartindex(rvx_signal_070),
  .rlastindex(rvx_signal_100),
  .rrequest(rvx_signal_030),
  .rdata(rvx_signal_010),
  .rnum()
);

assign rvx_signal_026 = rvx_port_00;
assign rvx_signal_054 = rvx_port_22 & INCLUDE_INPUT_FIFO;
assign rvx_port_36 = rvx_signal_001;
assign rvx_signal_000 = rvx_port_50;
assign rvx_signal_035 = rvx_port_07;

assign rvx_signal_081 = rvx_port_08;
assign rvx_signal_048 = rvx_port_45 & INCLUDE_INPUT_FIFO;
assign rvx_port_43 = rvx_signal_097;
assign rvx_port_31 = rvx_signal_010;
assign rvx_signal_030 = rvx_port_37;

ERVP_ASYNCH_FIFO_ADVANCED
#(
  .BW_DATA(RVX_LPARA_00),
  .BW_PARTIAL_WRITE(RVX_LPARA_15),
  .BW_PARTIAL_READ(RVX_LPARA_20),
  .DEPTH(RVX_LPARA_06),
  .BW_NUM_DATA(RVX_LPARA_11)
)
i_rvx_instance_03
(
  .wclk(rvx_signal_038),
  .wrstnn(rvx_signal_009),
  .wready(rvx_signal_016),
  .wfull(rvx_signal_051),
  .wstartindex(rvx_signal_036),
  .wlastindex(rvx_signal_020),
  .wrequest(rvx_signal_064),
  .wdata(rvx_signal_103),
  .wnum(),

  .rclk(rvx_signal_017),
  .rrstnn(rvx_signal_108),
  .rready(rvx_signal_063),
  .rempty(rvx_signal_084),
  .rstartindex(rvx_signal_075),
  .rlastindex(rvx_signal_104),
  .rrequest(rvx_signal_027),
  .rdata(rvx_signal_025),
  .rnum(rvx_signal_041)
);

assign rvx_signal_038 = rvx_port_08;
assign rvx_signal_009 = rvx_port_45 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_29 = rvx_signal_016;
assign rvx_signal_064 = rvx_port_44;
assign rvx_signal_103 = rvx_port_33;

assign rvx_signal_017 = rvx_port_00;
assign rvx_signal_108 = rvx_port_22 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_18 = rvx_signal_025;
assign rvx_signal_027 = rvx_port_35;
assign rvx_port_04 = rvx_signal_063;

assign rvx_signal_044 = rvx_signal_074[RVX_LPARA_11-1]? 0 : rvx_signal_074;
assign rvx_signal_072 = rvx_signal_041[RVX_LPARA_11-1]? 0 : rvx_signal_041;

assign rvx_port_14[32-1-:16] = rvx_signal_044;
assign rvx_port_14[16-1-:16] = rvx_signal_072;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_09),
  .DEPTH(RVX_LPARA_07)
)
i_rvx_instance_07
(
  .clk(rvx_signal_080),
  .rstnn(rvx_signal_095),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_029),
  .wfull(),
  .wrequest(rvx_signal_083),
  .wdata(rvx_signal_071),
  .wnum(),
  .rready(rvx_signal_098),
  .rempty(),
  .rrequest(rvx_signal_058),
  .rdata(rvx_signal_049),
  .rnum()
);

assign rvx_signal_080 = rvx_port_00;
assign rvx_signal_095 = rvx_port_22 & INCLUDE_INST_FIFO;

assign rvx_signal_083 = rvx_signal_023 & rvx_port_16;
assign rvx_signal_071 = rvx_port_21;
assign rvx_port_09 = rvx_signal_023 & rvx_signal_029;
assign rvx_signal_058 = rvx_signal_032; 

always@(posedge rvx_port_00, negedge rvx_port_22)
begin
  if(rvx_port_22==0)
    rvx_signal_015 <= 0;
  else if(rvx_signal_058|rvx_port_52)
    rvx_signal_015 <= rvx_signal_067;
end

always@(*)
begin
  rvx_signal_067 = rvx_signal_015;
  if(rvx_signal_058& rvx_signal_098)
    rvx_signal_067 = rvx_signal_067 | rvx_signal_049;
  if(rvx_port_52)
    rvx_signal_067 = rvx_signal_067 & (~rvx_port_32);
end

assign rvx_port_02 = rvx_signal_015;
assign rvx_port_41 = rvx_signal_015;

endmodule
