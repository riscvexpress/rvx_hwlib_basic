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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_035
(
  rvx_port_34,
  rvx_port_05,
  rvx_port_46,
  rvx_port_44,

  
  rvx_port_49,
  rvx_port_04,
  rvx_port_27,
  rvx_port_52,
  rvx_port_25,
  rvx_port_24,
  rvx_port_22,
	rvx_port_47,
	rvx_port_12,
	rvx_port_09,
  rvx_port_37,
  rvx_port_45,
  rvx_port_40,
  rvx_port_15,
  rvx_port_20,
  rvx_port_26,
  rvx_port_14,
  rvx_port_16,
  rvx_port_28,
  rvx_port_02,
  rvx_port_03,
  rvx_port_21,
  rvx_port_23,
  rvx_port_08,
  rvx_port_33,
  rvx_port_31,
  rvx_port_39,
  rvx_port_38,
  rvx_port_51,
  rvx_port_18,
  rvx_port_42,
  rvx_port_29,

  
  rvx_port_35,
  rvx_port_11,
  rvx_port_30,
  rvx_port_50,
  rvx_port_32,
  rvx_port_17,
  rvx_port_10,
  rvx_port_19,
  rvx_port_13,
  rvx_port_00,
  rvx_port_41,
  rvx_port_01,
  rvx_port_48,
  rvx_port_43,
  rvx_port_07,
  rvx_port_06,
  rvx_port_36
);





parameter RVX_GPARA_4 = 32;

parameter RVX_GPARA_7 = 32;
parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_1 = 32;

parameter RVX_GPARA_6 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_34;
input wire rvx_port_05;
input wire rvx_port_46;
input wire rvx_port_44;

input wire rvx_port_49;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_04;
input wire rvx_port_27;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_52;
input wire rvx_port_25;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_24;
input wire rvx_port_22;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_47;
input wire rvx_port_12;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_09;
input wire rvx_port_37;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_45;
output wire rvx_port_40;
input wire rvx_port_15;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_20;
output wire rvx_port_26;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_14;
input wire rvx_port_16;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_28;
output wire rvx_port_02;
input wire rvx_port_03;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_21;
output wire rvx_port_23;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_08;
input wire rvx_port_33;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_31;
output wire rvx_port_39;
input wire rvx_port_38;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_51;
input wire rvx_port_18;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_42;

output wire [32-1:0] rvx_port_29;

output wire [RVX_GPARA_7-1:0] rvx_port_35;
input wire [RVX_GPARA_2-1:0] rvx_port_11;
output wire rvx_port_30;
input wire rvx_port_50;

output wire rvx_port_32;
input wire rvx_port_17;
input wire [RVX_GPARA_0-1:0] rvx_port_10;

output wire rvx_port_19;
output wire [RVX_GPARA_3-1:0] rvx_port_13;
input wire rvx_port_00;
input wire rvx_port_41;

output wire rvx_port_01;
output wire [RVX_GPARA_5-1:0] rvx_port_48;
input wire rvx_port_43;

output wire rvx_port_07;
input wire rvx_port_06;
input wire [RVX_GPARA_1-1:0] rvx_port_36;

wire rvx_signal_012;
wire rvx_signal_003;
wire rvx_signal_026;
wire rvx_signal_000;
wire rvx_signal_041;
wire rvx_signal_057;
wire rvx_signal_109;
wire rvx_signal_065;
wire rvx_signal_086;

localparam  RVX_LPARA_04 = 16;

`include "rvx_include_21.vh"
`include "rvx_include_20.vh"

localparam  RVX_LPARA_15 = RVX_GPARA_0;
localparam  RVX_LPARA_09 = RVX_GPARA_0;
localparam  RVX_LPARA_11 = RVX_GPARA_4;
localparam  RVX_LPARA_03 = LOG_FIFO_DEPTH;

wire rvx_signal_105;
wire rvx_signal_009;
wire rvx_signal_042;
wire rvx_signal_064;
wire rvx_signal_097;
wire rvx_signal_098;
wire rvx_signal_080;
wire [RVX_LPARA_09-1:0] rvx_signal_029;

wire rvx_signal_019;
wire rvx_signal_078;
wire rvx_signal_074;
wire rvx_signal_007;
wire rvx_signal_071;
wire rvx_signal_110;
wire rvx_signal_087;
wire [RVX_LPARA_11-1:0] rvx_signal_049;

localparam  RVX_LPARA_20 = RVX_GPARA_3;
localparam  RVX_LPARA_07 = RVX_GPARA_4;
localparam  RVX_LPARA_00 = RVX_GPARA_3;
localparam  RVX_LPARA_12 = INST_FIFO_DEPTH;

wire rvx_signal_020;
wire rvx_signal_005;
wire rvx_signal_085;
wire rvx_signal_031;
wire rvx_signal_044;
wire rvx_signal_038;
wire rvx_signal_048;
wire [RVX_LPARA_07-1:0] rvx_signal_081;
wire [RVX_LPARA_04-1:0] rvx_signal_061;

wire rvx_signal_079;
wire rvx_signal_033;
wire rvx_signal_099;
wire rvx_signal_108;
wire rvx_signal_040;
wire rvx_signal_094;
wire rvx_signal_066;
wire [RVX_LPARA_00-1:0] rvx_signal_077;

localparam  RVX_LPARA_05 = 1;
localparam  RVX_LPARA_02 = INST_FIFO_DEPTH;

wire rvx_signal_032;
wire rvx_signal_016;
wire rvx_signal_063;
wire rvx_signal_045;
wire rvx_signal_013;
wire [RVX_LPARA_05-1:0] rvx_signal_036;

wire rvx_signal_075;
wire rvx_signal_070;
wire rvx_signal_035;
wire rvx_signal_008;
wire rvx_signal_024;
wire [RVX_LPARA_05-1:0] rvx_signal_084;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_06 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_060;
wire rvx_signal_088;
wire rvx_signal_062;
wire rvx_signal_083;
wire [RVX_LPARA_06-1:0] rvx_signal_053;
wire [RVX_LPARA_06-1:0] rvx_signal_002;

wire rvx_signal_023;
wire [8-1:0] rvx_signal_103;
wire [8-1:0] rvx_signal_102;

localparam  RVX_LPARA_17 = RVX_GPARA_5;
localparam  RVX_LPARA_19 = RVX_GPARA_4;
localparam  RVX_LPARA_14 = RVX_GPARA_5;
localparam  RVX_LPARA_13 = INPUT_FIFO_DEPTH;

wire rvx_signal_069;
wire rvx_signal_022;
wire rvx_signal_047;
wire rvx_signal_001;
wire rvx_signal_051;
wire rvx_signal_025;
wire rvx_signal_052;
wire [RVX_LPARA_19-1:0] rvx_signal_018;
wire [RVX_LPARA_04-1:0] rvx_signal_073;

wire rvx_signal_055;
wire rvx_signal_056;
wire rvx_signal_096;
wire rvx_signal_054;
wire rvx_signal_107;
wire rvx_signal_068;
wire rvx_signal_067;
wire [RVX_LPARA_14-1:0] rvx_signal_028;

localparam  RVX_LPARA_16 = RVX_GPARA_1;
localparam  RVX_LPARA_10 = RVX_GPARA_1;
localparam  RVX_LPARA_18 = RVX_GPARA_4;
localparam  RVX_LPARA_01 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_090;
wire rvx_signal_100;
wire rvx_signal_006;
wire rvx_signal_059;
wire rvx_signal_101;
wire rvx_signal_039;
wire rvx_signal_014;
wire [RVX_LPARA_10-1:0] rvx_signal_043;

wire rvx_signal_050;
wire rvx_signal_072;
wire rvx_signal_058;
wire rvx_signal_046;
wire rvx_signal_017;
wire rvx_signal_030;
wire rvx_signal_089;
wire [RVX_LPARA_18-1:0] rvx_signal_037;
wire [RVX_LPARA_04-1:0] rvx_signal_010;

localparam  RVX_LPARA_08 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_21 = INST_FIFO_DEPTH;

wire rvx_signal_095;
wire rvx_signal_092;
wire rvx_signal_082;
wire rvx_signal_027;
wire [RVX_LPARA_08-1:0] rvx_signal_034;
wire rvx_signal_106;
wire rvx_signal_004;
wire [RVX_LPARA_08-1:0] rvx_signal_104;

reg [RVX_GPARA_4-1:0] rvx_signal_021;
reg [RVX_GPARA_4-1:0] rvx_signal_076;
wire [RVX_GPARA_2-1:0] rvx_signal_091;
wire [RVX_GPARA_7-1:0] rvx_signal_015;

wire [16-1:0] rvx_signal_093;
wire [16-1:0] rvx_signal_011;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_7),
  .DEFAULT_VALUE(RVX_GPARA_6)
)
i_rvx_instance_09
(
  .clk(rvx_port_34),
  .rstnn(rvx_port_05),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_49),
  .mmio_rdata(rvx_port_04),
  .mmio_we(rvx_port_27),
  .mmio_wdata(rvx_port_52),

  .wide_data_out(rvx_signal_015)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_7)
)
i_rvx_instance_01
(
  .clk(rvx_port_46),
  .rstnn(rvx_port_44),
  .enable(1'b 1),
  .asynch_value(rvx_signal_015),
  .synch_value(rvx_port_35)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_2)
)
i_rvx_instance_07
(
  .clk(rvx_port_34),
  .rstnn(rvx_port_05),
  .enable(1'b 1),
  .asynch_value(rvx_port_11),
  .synch_value(rvx_signal_091)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_2)
)
i_rvx_instance_06
(
  .clk(rvx_port_34),
  .rstnn(rvx_port_05),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_25),
  .mmio_rdata(rvx_port_24),

  .wide_data_in(rvx_signal_091)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_08
(
	.wclk(rvx_signal_012),
	.wrstnn(rvx_signal_003),
	.wstart(rvx_signal_026),
  .wbusy(rvx_signal_000),
	.wfinish(rvx_signal_041),
	.rclk(rvx_signal_057),
	.rrstnn(rvx_signal_109),
	.rvalid(rvx_signal_065),
	.rready(rvx_signal_086)
);

assign rvx_signal_012 = rvx_port_34;
assign rvx_signal_003 = rvx_port_05;
assign rvx_signal_026 = rvx_port_12;
assign rvx_signal_057 = rvx_port_46;
assign rvx_signal_109 = rvx_port_44;
assign rvx_port_30 = rvx_signal_065;
assign rvx_signal_086 = rvx_port_50;

assign rvx_port_47 = rvx_signal_000;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_15),
  .BW_PARTIAL_WRITE(RVX_LPARA_09),
  .BW_PARTIAL_READ(RVX_LPARA_11),
  .DEPTH(RVX_LPARA_03)
)
i_rvx_instance_00
(
  .wclk(rvx_signal_105),
  .wrstnn(rvx_signal_009),
  .wready(rvx_signal_042),
  .wfull(rvx_signal_064),
  .wstartindex(rvx_signal_097),
  .wlastindex(rvx_signal_098),
  .wrequest(rvx_signal_080),
  .wdata(rvx_signal_029),
  .wnum(),

  .rclk(rvx_signal_019),
  .rrstnn(rvx_signal_078),
  .rready(rvx_signal_074),
  .rempty(rvx_signal_007),
  .rstartindex(rvx_signal_071),
  .rlastindex(rvx_signal_110),
  .rrequest(rvx_signal_087),
  .rdata(rvx_signal_049),
  .rnum()
);

assign rvx_signal_105 = rvx_port_46;
assign rvx_signal_009 = rvx_port_44 & INCLUDE_LOG_FIFO;
assign rvx_port_32 = rvx_signal_042;
assign rvx_signal_080 = rvx_port_17;
assign rvx_signal_029 = rvx_port_10;

assign rvx_signal_019 = rvx_port_34;
assign rvx_signal_078 = rvx_port_05 & INCLUDE_LOG_FIFO;
assign rvx_port_45 = rvx_signal_049;
assign rvx_signal_087 = rvx_port_37;
assign rvx_port_40 = rvx_signal_074;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_20),
  .BW_PARTIAL_WRITE(RVX_LPARA_07),
  .BW_PARTIAL_READ(RVX_LPARA_00),
  .DEPTH(RVX_LPARA_12),
  .BW_NUM_DATA(RVX_LPARA_04)
)
i_rvx_instance_10
(
  .wclk(rvx_signal_020),
  .wrstnn(rvx_signal_005),
  .wready(rvx_signal_085),
  .wfull(rvx_signal_031),
  .wstartindex(rvx_signal_044),
  .wlastindex(rvx_signal_038),
  .wrequest(rvx_signal_048),
  .wdata(rvx_signal_081),
  .wnum(rvx_signal_061),

  .rclk(rvx_signal_079),
  .rrstnn(rvx_signal_033),
  .rready(rvx_signal_099),
  .rempty(rvx_signal_108),
  .rstartindex(rvx_signal_040),
  .rlastindex(rvx_signal_094),
  .rrequest(rvx_signal_066),
  .rdata(rvx_signal_077),
  .rnum()
);

assign rvx_signal_020 = rvx_port_34;
assign rvx_signal_005 = rvx_port_05 & INCLUDE_INST_FIFO;
assign rvx_port_26 = rvx_signal_023 & rvx_signal_085;
assign rvx_signal_048 = rvx_signal_023 & rvx_port_15;
assign rvx_signal_081 = rvx_port_20;

assign rvx_signal_079 = rvx_port_46;
assign rvx_signal_033 = rvx_port_44 & INCLUDE_INST_FIFO;
assign rvx_port_19 = rvx_signal_099;
assign rvx_port_13 = rvx_signal_077;
assign rvx_signal_066 = rvx_port_00;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_05),
  .DEPTH(RVX_LPARA_02)
)
i_rvx_instance_05
(
  .wclk(rvx_signal_032),
  .wrstnn(rvx_signal_016),
  .wready(rvx_signal_063),
  .wfull(rvx_signal_045),
  .wrequest(rvx_signal_013),
  .wdata(rvx_signal_036),  
  .wnum(),

  .rclk(rvx_signal_075),
  .rrstnn(rvx_signal_070),
  .rready(rvx_signal_035),
  .rempty(rvx_signal_008),
  .rrequest(rvx_signal_024),
  .rdata(rvx_signal_084),
  .rnum()
);

assign rvx_signal_032 = rvx_port_46;
assign rvx_signal_016 = rvx_port_44 & INCLUDE_INST_FIFO;
assign rvx_signal_013 = rvx_port_41;
assign rvx_signal_036 = 0;

assign rvx_signal_075 = rvx_port_34;
assign rvx_signal_070 = rvx_port_05 & INCLUDE_INST_FIFO;
assign rvx_signal_024 = rvx_signal_035;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_06)
)
i_rvx_instance_11
(
  .clk(rvx_port_34),
  .rstnn(rvx_port_05),
  .enable(rvx_signal_060),
  .init(rvx_signal_088),
  .up(rvx_signal_062),
  .down(rvx_signal_083),
  .count_amount(rvx_signal_053),
  .value(rvx_signal_002),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_060 = INCLUDE_INST_FIFO;
assign rvx_signal_088 = 0;
assign rvx_signal_062 = rvx_signal_085 & rvx_signal_048 & rvx_signal_038;
assign rvx_signal_083 = rvx_signal_035 & rvx_signal_024;
assign rvx_signal_053 = 1;

assign rvx_signal_023 = ~(rvx_signal_002[RVX_LPARA_06-1]);

assign rvx_signal_103 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_023))? 0 : ((rvx_signal_061[RVX_LPARA_04-1:8]==0)? rvx_signal_061 : 63);
assign rvx_signal_102 = (rvx_signal_002>63)? 63 : rvx_signal_002;
assign rvx_port_14[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_074;
assign rvx_port_14[16-1-:8] = rvx_signal_102;
assign rvx_port_14[8-1-:8] = rvx_signal_103;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_17),
  .BW_PARTIAL_WRITE(RVX_LPARA_19),
  .BW_PARTIAL_READ(RVX_LPARA_14),
  .DEPTH(RVX_LPARA_13),
  .BW_NUM_DATA(RVX_LPARA_04)
)
i_rvx_instance_03
(
  .wclk(rvx_signal_069),
  .wrstnn(rvx_signal_022),
  .wready(rvx_signal_047),
  .wfull(rvx_signal_001),
  .wstartindex(rvx_signal_051),
  .wlastindex(rvx_signal_025),
  .wrequest(rvx_signal_052),
  .wdata(rvx_signal_018),
  .wnum(rvx_signal_073),

  .rclk(rvx_signal_055),
  .rrstnn(rvx_signal_056),
  .rready(rvx_signal_096),
  .rempty(rvx_signal_054),
  .rstartindex(rvx_signal_107),
  .rlastindex(rvx_signal_068),
  .rrequest(rvx_signal_067),
  .rdata(rvx_signal_028),
  .rnum()
);

assign rvx_signal_069 = rvx_port_34;
assign rvx_signal_022 = rvx_port_05 & INCLUDE_INPUT_FIFO;
assign rvx_port_02 = rvx_signal_047;
assign rvx_signal_052 = rvx_port_16;
assign rvx_signal_018 = rvx_port_28;

assign rvx_signal_055 = rvx_port_46;
assign rvx_signal_056 = rvx_port_44 & INCLUDE_INPUT_FIFO;
assign rvx_port_01 = rvx_signal_096;
assign rvx_port_48 = rvx_signal_028;
assign rvx_signal_067 = rvx_port_43;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_16),
  .BW_PARTIAL_WRITE(RVX_LPARA_10),
  .BW_PARTIAL_READ(RVX_LPARA_18),
  .DEPTH(RVX_LPARA_01),
  .BW_NUM_DATA(RVX_LPARA_04)
)
i_rvx_instance_04
(
  .wclk(rvx_signal_090),
  .wrstnn(rvx_signal_100),
  .wready(rvx_signal_006),
  .wfull(rvx_signal_059),
  .wstartindex(rvx_signal_101),
  .wlastindex(rvx_signal_039),
  .wrequest(rvx_signal_014),
  .wdata(rvx_signal_043),
  .wnum(),

  .rclk(rvx_signal_050),
  .rrstnn(rvx_signal_072),
  .rready(rvx_signal_058),
  .rempty(rvx_signal_046),
  .rstartindex(rvx_signal_017),
  .rlastindex(rvx_signal_030),
  .rrequest(rvx_signal_089),
  .rdata(rvx_signal_037),
  .rnum(rvx_signal_010)
);

assign rvx_signal_090 = rvx_port_46;
assign rvx_signal_100 = rvx_port_44 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_07 = rvx_signal_006;
assign rvx_signal_014 = rvx_port_06;
assign rvx_signal_043 = rvx_port_36;

assign rvx_signal_050 = rvx_port_34;
assign rvx_signal_072 = rvx_port_05 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_21 = rvx_signal_037;
assign rvx_signal_089 = rvx_port_03;
assign rvx_port_23 = rvx_signal_058;

assign rvx_signal_093 = rvx_signal_073[RVX_LPARA_04-1]? 0 : rvx_signal_073;
assign rvx_signal_011 = rvx_signal_010[RVX_LPARA_04-1]? 0 : rvx_signal_010;

assign rvx_port_08[32-1-:16] = rvx_signal_093;
assign rvx_port_08[16-1-:16] = rvx_signal_011;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_08),
  .DEPTH(RVX_LPARA_21)
)
i_rvx_instance_02
(
  .clk(rvx_signal_095),
  .rstnn(rvx_signal_092),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_082),
  .wfull(),
  .wrequest(rvx_signal_027),
  .wdata(rvx_signal_034),
  .wnum(),
  .rready(rvx_signal_106),
  .rempty(),
  .rrequest(rvx_signal_004),
  .rdata(rvx_signal_104),
  .rnum()
);

assign rvx_signal_095 = rvx_port_34;
assign rvx_signal_092 = rvx_port_05 & INCLUDE_INST_FIFO;

assign rvx_signal_027 = rvx_signal_023 & rvx_port_33;
assign rvx_signal_034 = rvx_port_31;
assign rvx_port_39 = rvx_signal_023 & rvx_signal_082;
assign rvx_signal_004 = rvx_signal_083; 

always@(posedge rvx_port_34, negedge rvx_port_05)
begin
  if(rvx_port_05==0)
    rvx_signal_021 <= 0;
  else if(rvx_signal_004|rvx_port_18)
    rvx_signal_021 <= rvx_signal_076;
end

always@(*)
begin
  rvx_signal_076 = rvx_signal_021;
  if(rvx_signal_004& rvx_signal_106)
    rvx_signal_076 = rvx_signal_076 | rvx_signal_104;
  if(rvx_port_18)
    rvx_signal_076 = rvx_signal_076 & (~rvx_port_42);
end

assign rvx_port_51 = rvx_signal_021;
assign rvx_port_29 = rvx_signal_021;

endmodule
