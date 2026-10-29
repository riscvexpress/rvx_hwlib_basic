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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_133
(
  rvx_port_38,
  rvx_port_03,
  rvx_port_25,
  rvx_port_15,

  
  rvx_port_18,
  rvx_port_17,
  rvx_port_45,
  rvx_port_11,
  rvx_port_48,
  rvx_port_40,
  rvx_port_23,
	rvx_port_46,
	rvx_port_43,
	rvx_port_08,
  rvx_port_28,
  rvx_port_26,
  rvx_port_27,
  rvx_port_36,
  rvx_port_32,
  rvx_port_41,
  rvx_port_13,
  rvx_port_37,
  rvx_port_19,
  rvx_port_14,
  rvx_port_02,
  rvx_port_42,
  rvx_port_31,
  rvx_port_16,
  rvx_port_01,
  rvx_port_30,
  rvx_port_39,
  rvx_port_05,
  rvx_port_04,
  rvx_port_49,
  rvx_port_24,
  rvx_port_07,

  
  rvx_port_50,
  rvx_port_35,
  rvx_port_20,
  rvx_port_34,
  rvx_port_33,
  rvx_port_09,
  rvx_port_52,
  rvx_port_51,
  rvx_port_12,
  rvx_port_06,
  rvx_port_21,
  rvx_port_22,
  rvx_port_47,
  rvx_port_00,
  rvx_port_44,
  rvx_port_29,
  rvx_port_10
);





parameter RVX_GPARA_6 = 32;

parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_5 = 32;
parameter RVX_GPARA_7 = 32;
parameter RVX_GPARA_0 = 32;

parameter RVX_GPARA_4 = 0;
parameter MMIOX1_FIFO_PARA = 0;

input wire rvx_port_38;
input wire rvx_port_03;
input wire rvx_port_25;
input wire rvx_port_15;

input wire rvx_port_18;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_17;
input wire rvx_port_45;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_11;
input wire rvx_port_48;
output wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_40;
input wire rvx_port_23;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_46;
input wire rvx_port_43;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_08;
input wire rvx_port_28;
output wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_26;
output wire rvx_port_27;
input wire rvx_port_36;
input wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_32;
output wire rvx_port_41;
output wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_13;
input wire rvx_port_37;
input wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_19;
output wire rvx_port_14;
input wire rvx_port_02;
output wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_42;
output wire rvx_port_31;
output wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_16;
input wire rvx_port_01;
input wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_30;
output wire rvx_port_39;
input wire rvx_port_05;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_04;
input wire rvx_port_49;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_24;

output wire [32-1:0] rvx_port_07;

output wire [RVX_GPARA_2-1:0] rvx_port_50;
input wire [RVX_GPARA_3-1:0] rvx_port_35;
output wire rvx_port_20;
input wire rvx_port_34;

output wire rvx_port_33;
input wire rvx_port_09;
input wire [RVX_GPARA_1-1:0] rvx_port_52;

output wire rvx_port_51;
output wire [RVX_GPARA_5-1:0] rvx_port_12;
input wire rvx_port_06;
input wire rvx_port_21;

output wire rvx_port_22;
output wire [RVX_GPARA_7-1:0] rvx_port_47;
input wire rvx_port_00;

output wire rvx_port_44;
input wire rvx_port_29;
input wire [RVX_GPARA_0-1:0] rvx_port_10;

wire rvx_signal_029;
wire rvx_signal_080;
wire rvx_signal_026;
wire rvx_signal_070;
wire rvx_signal_065;
wire rvx_signal_027;
wire rvx_signal_023;
wire rvx_signal_004;
wire rvx_signal_088;

localparam  RVX_LPARA_20 = 16;

`include "rvx_include_13.vh"
`include "rvx_include_17.vh"

localparam  RVX_LPARA_13 = RVX_GPARA_1;
localparam  RVX_LPARA_17 = RVX_GPARA_1;
localparam  RVX_LPARA_21 = RVX_GPARA_6;
localparam  RVX_LPARA_07 = LOG_FIFO_DEPTH;

wire rvx_signal_086;
wire rvx_signal_102;
wire rvx_signal_037;
wire rvx_signal_103;
wire rvx_signal_083;
wire rvx_signal_063;
wire rvx_signal_084;
wire [RVX_LPARA_17-1:0] rvx_signal_104;

wire rvx_signal_107;
wire rvx_signal_072;
wire rvx_signal_089;
wire rvx_signal_003;
wire rvx_signal_019;
wire rvx_signal_062;
wire rvx_signal_059;
wire [RVX_LPARA_21-1:0] rvx_signal_101;

localparam  RVX_LPARA_15 = RVX_GPARA_5;
localparam  RVX_LPARA_11 = RVX_GPARA_6;
localparam  RVX_LPARA_10 = RVX_GPARA_5;
localparam  RVX_LPARA_08 = INST_FIFO_DEPTH;

wire rvx_signal_069;
wire rvx_signal_090;
wire rvx_signal_028;
wire rvx_signal_075;
wire rvx_signal_014;
wire rvx_signal_085;
wire rvx_signal_020;
wire [RVX_LPARA_11-1:0] rvx_signal_036;
wire [RVX_LPARA_20-1:0] rvx_signal_053;

wire rvx_signal_087;
wire rvx_signal_068;
wire rvx_signal_054;
wire rvx_signal_051;
wire rvx_signal_010;
wire rvx_signal_013;
wire rvx_signal_006;
wire [RVX_LPARA_10-1:0] rvx_signal_079;

localparam  RVX_LPARA_01 = 1;
localparam  RVX_LPARA_12 = INST_FIFO_DEPTH;

wire rvx_signal_047;
wire rvx_signal_033;
wire rvx_signal_064;
wire rvx_signal_015;
wire rvx_signal_035;
wire [RVX_LPARA_01-1:0] rvx_signal_093;

wire rvx_signal_044;
wire rvx_signal_099;
wire rvx_signal_038;
wire rvx_signal_008;
wire rvx_signal_076;
wire [RVX_LPARA_01-1:0] rvx_signal_058;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_09 = REQUIRED_BITWIDTH_UNSIGNED(INST_FIFO_DEPTH) + 1;

wire rvx_signal_073;
wire rvx_signal_041;
wire rvx_signal_050;
wire rvx_signal_057;
wire [RVX_LPARA_09-1:0] rvx_signal_012;
wire [RVX_LPARA_09-1:0] rvx_signal_022;

wire rvx_signal_109;
wire [8-1:0] rvx_signal_095;
wire [8-1:0] rvx_signal_100;

localparam  RVX_LPARA_18 = RVX_GPARA_7;
localparam  RVX_LPARA_03 = RVX_GPARA_6;
localparam  RVX_LPARA_14 = RVX_GPARA_7;
localparam  RVX_LPARA_02 = INPUT_FIFO_DEPTH;

wire rvx_signal_055;
wire rvx_signal_040;
wire rvx_signal_098;
wire rvx_signal_096;
wire rvx_signal_060;
wire rvx_signal_009;
wire rvx_signal_000;
wire [RVX_LPARA_03-1:0] rvx_signal_066;
wire [RVX_LPARA_20-1:0] rvx_signal_077;

wire rvx_signal_071;
wire rvx_signal_048;
wire rvx_signal_106;
wire rvx_signal_039;
wire rvx_signal_045;
wire rvx_signal_034;
wire rvx_signal_016;
wire [RVX_LPARA_14-1:0] rvx_signal_025;

localparam  RVX_LPARA_16 = RVX_GPARA_0;
localparam  RVX_LPARA_00 = RVX_GPARA_0;
localparam  RVX_LPARA_06 = RVX_GPARA_6;
localparam  RVX_LPARA_19 = OUTPUT_FIFO_DEPTH;

wire rvx_signal_024;
wire rvx_signal_031;
wire rvx_signal_007;
wire rvx_signal_081;
wire rvx_signal_108;
wire rvx_signal_001;
wire rvx_signal_046;
wire [RVX_LPARA_00-1:0] rvx_signal_032;

wire rvx_signal_078;
wire rvx_signal_042;
wire rvx_signal_043;
wire rvx_signal_105;
wire rvx_signal_061;
wire rvx_signal_097;
wire rvx_signal_056;
wire [RVX_LPARA_06-1:0] rvx_signal_092;
wire [RVX_LPARA_20-1:0] rvx_signal_110;

localparam  RVX_LPARA_05 = `BW_MMIO_ITR_REQUEST;
localparam  RVX_LPARA_04 = INST_FIFO_DEPTH;

wire rvx_signal_091;
wire rvx_signal_005;
wire rvx_signal_049;
wire rvx_signal_017;
wire [RVX_LPARA_05-1:0] rvx_signal_018;
wire rvx_signal_094;
wire rvx_signal_002;
wire [RVX_LPARA_05-1:0] rvx_signal_074;

reg [RVX_GPARA_6-1:0] rvx_signal_021;
reg [RVX_GPARA_6-1:0] rvx_signal_011;
wire [RVX_GPARA_3-1:0] rvx_signal_030;
wire [RVX_GPARA_2-1:0] rvx_signal_067;

wire [16-1:0] rvx_signal_082;
wire [16-1:0] rvx_signal_052;

ERVP_MMIO_WIDE_REG
#(
  .BW_MMIO(`BW_MMIO_CORE_CONFIG_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_2),
  .DEFAULT_VALUE(RVX_GPARA_4)
)
i_rvx_instance_00
(
  .clk(rvx_port_38),
  .rstnn(rvx_port_03),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_18),
  .mmio_rdata(rvx_port_17),
  .mmio_we(rvx_port_45),
  .mmio_wdata(rvx_port_11),

  .wide_data_out(rvx_signal_067)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_2)
)
i_rvx_instance_08
(
  .clk(rvx_port_25),
  .rstnn(rvx_port_15),
  .enable(1'b 1),
  .asynch_value(rvx_signal_067),
  .synch_value(rvx_port_50)
);

ERVP_SYNCHRONIZER
#(
  .BW_DATA(RVX_GPARA_3)
)
i_rvx_instance_03
(
  .clk(rvx_port_38),
  .rstnn(rvx_port_03),
  .enable(1'b 1),
  .asynch_value(rvx_port_35),
  .synch_value(rvx_signal_030)
);

ERVP_MMIO_WIDE_READ
#(
  .BW_MMIO(`BW_MMIO_CORE_STATUS_SAWD),
  .BW_WIDE_DATA(RVX_GPARA_3)
)
i_rvx_instance_02
(
  .clk(rvx_port_38),
  .rstnn(rvx_port_03),
  .clear(1'b 0),
  .enable(1'b 1),

  .mmio_re(rvx_port_48),
  .mmio_rdata(rvx_port_40),

  .wide_data_in(rvx_signal_030)
);

ERVP_ASYNCH_SF2VR
i_rvx_instance_06
(
	.wclk(rvx_signal_029),
	.wrstnn(rvx_signal_080),
	.wstart(rvx_signal_026),
  .wbusy(rvx_signal_070),
	.wfinish(rvx_signal_065),
	.rclk(rvx_signal_027),
	.rrstnn(rvx_signal_023),
	.rvalid(rvx_signal_004),
	.rready(rvx_signal_088)
);

assign rvx_signal_029 = rvx_port_38;
assign rvx_signal_080 = rvx_port_03;
assign rvx_signal_026 = rvx_port_43;
assign rvx_signal_027 = rvx_port_25;
assign rvx_signal_023 = rvx_port_15;
assign rvx_port_20 = rvx_signal_004;
assign rvx_signal_088 = rvx_port_34;

assign rvx_port_46 = rvx_signal_070;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_13),
  .BW_PARTIAL_WRITE(RVX_LPARA_17),
  .BW_PARTIAL_READ(RVX_LPARA_21),
  .DEPTH(RVX_LPARA_07)
)
i_rvx_instance_01
(
  .wclk(rvx_signal_086),
  .wrstnn(rvx_signal_102),
  .wready(rvx_signal_037),
  .wfull(rvx_signal_103),
  .wstartindex(rvx_signal_083),
  .wlastindex(rvx_signal_063),
  .wrequest(rvx_signal_084),
  .wdata(rvx_signal_104),
  .wnum(),

  .rclk(rvx_signal_107),
  .rrstnn(rvx_signal_072),
  .rready(rvx_signal_089),
  .rempty(rvx_signal_003),
  .rstartindex(rvx_signal_019),
  .rlastindex(rvx_signal_062),
  .rrequest(rvx_signal_059),
  .rdata(rvx_signal_101),
  .rnum()
);

assign rvx_signal_086 = rvx_port_25;
assign rvx_signal_102 = rvx_port_15 & INCLUDE_LOG_FIFO;
assign rvx_port_33 = rvx_signal_037;
assign rvx_signal_084 = rvx_port_09;
assign rvx_signal_104 = rvx_port_52;

assign rvx_signal_107 = rvx_port_38;
assign rvx_signal_072 = rvx_port_03 & INCLUDE_LOG_FIFO;
assign rvx_port_26 = rvx_signal_101;
assign rvx_signal_059 = rvx_port_28;
assign rvx_port_27 = rvx_signal_089;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_15),
  .BW_PARTIAL_WRITE(RVX_LPARA_11),
  .BW_PARTIAL_READ(RVX_LPARA_10),
  .DEPTH(RVX_LPARA_08),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_09
(
  .wclk(rvx_signal_069),
  .wrstnn(rvx_signal_090),
  .wready(rvx_signal_028),
  .wfull(rvx_signal_075),
  .wstartindex(rvx_signal_014),
  .wlastindex(rvx_signal_085),
  .wrequest(rvx_signal_020),
  .wdata(rvx_signal_036),
  .wnum(rvx_signal_053),

  .rclk(rvx_signal_087),
  .rrstnn(rvx_signal_068),
  .rready(rvx_signal_054),
  .rempty(rvx_signal_051),
  .rstartindex(rvx_signal_010),
  .rlastindex(rvx_signal_013),
  .rrequest(rvx_signal_006),
  .rdata(rvx_signal_079),
  .rnum()
);

assign rvx_signal_069 = rvx_port_38;
assign rvx_signal_090 = rvx_port_03 & INCLUDE_INST_FIFO;
assign rvx_port_41 = rvx_signal_109 & rvx_signal_028;
assign rvx_signal_020 = rvx_signal_109 & rvx_port_36;
assign rvx_signal_036 = rvx_port_32;

assign rvx_signal_087 = rvx_port_25;
assign rvx_signal_068 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_port_51 = rvx_signal_054;
assign rvx_port_12 = rvx_signal_079;
assign rvx_signal_006 = rvx_port_06;

ERVP_ASYNCH_FIFO
#(
  .BW_DATA(RVX_LPARA_01),
  .DEPTH(RVX_LPARA_12)
)
i_rvx_instance_04
(
  .wclk(rvx_signal_047),
  .wrstnn(rvx_signal_033),
  .wready(rvx_signal_064),
  .wfull(rvx_signal_015),
  .wrequest(rvx_signal_035),
  .wdata(rvx_signal_093),  
  .wnum(),

  .rclk(rvx_signal_044),
  .rrstnn(rvx_signal_099),
  .rready(rvx_signal_038),
  .rempty(rvx_signal_008),
  .rrequest(rvx_signal_076),
  .rdata(rvx_signal_058),
  .rnum()
);

assign rvx_signal_047 = rvx_port_25;
assign rvx_signal_033 = rvx_port_15 & INCLUDE_INST_FIFO;
assign rvx_signal_035 = rvx_port_21;
assign rvx_signal_093 = 0;

assign rvx_signal_044 = rvx_port_38;
assign rvx_signal_099 = rvx_port_03 & INCLUDE_INST_FIFO;
assign rvx_signal_076 = rvx_signal_038;

ERVP_UPDOWN_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_09)
)
i_rvx_instance_07
(
  .clk(rvx_port_38),
  .rstnn(rvx_port_03),
  .enable(rvx_signal_073),
  .init(rvx_signal_041),
  .up(rvx_signal_050),
  .down(rvx_signal_057),
  .count_amount(rvx_signal_012),
  .value(rvx_signal_022),
  .is_upper_limit(),
  .is_lower_limit()
);

assign rvx_signal_073 = INCLUDE_INST_FIFO;
assign rvx_signal_041 = 0;
assign rvx_signal_050 = rvx_signal_028 & rvx_signal_020 & rvx_signal_085;
assign rvx_signal_057 = rvx_signal_038 & rvx_signal_076;
assign rvx_signal_012 = 1;

assign rvx_signal_109 = ~(rvx_signal_022[RVX_LPARA_09-1]);

assign rvx_signal_095 = ((INCLUDE_INST_FIFO==0)||(~rvx_signal_109))? 0 : ((rvx_signal_053[RVX_LPARA_20-1:8]==0)? rvx_signal_053 : 63);
assign rvx_signal_100 = (rvx_signal_022>63)? 63 : rvx_signal_022;
assign rvx_port_13[`BW_MMIO_INST_STATUS-1:16]  = rvx_signal_089;
assign rvx_port_13[16-1-:8] = rvx_signal_100;
assign rvx_port_13[8-1-:8] = rvx_signal_095;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_18),
  .BW_PARTIAL_WRITE(RVX_LPARA_03),
  .BW_PARTIAL_READ(RVX_LPARA_14),
  .DEPTH(RVX_LPARA_02),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_11
(
  .wclk(rvx_signal_055),
  .wrstnn(rvx_signal_040),
  .wready(rvx_signal_098),
  .wfull(rvx_signal_096),
  .wstartindex(rvx_signal_060),
  .wlastindex(rvx_signal_009),
  .wrequest(rvx_signal_000),
  .wdata(rvx_signal_066),
  .wnum(rvx_signal_077),

  .rclk(rvx_signal_071),
  .rrstnn(rvx_signal_048),
  .rready(rvx_signal_106),
  .rempty(rvx_signal_039),
  .rstartindex(rvx_signal_045),
  .rlastindex(rvx_signal_034),
  .rrequest(rvx_signal_016),
  .rdata(rvx_signal_025),
  .rnum()
);

assign rvx_signal_055 = rvx_port_38;
assign rvx_signal_040 = rvx_port_03 & INCLUDE_INPUT_FIFO;
assign rvx_port_14 = rvx_signal_098;
assign rvx_signal_000 = rvx_port_37;
assign rvx_signal_066 = rvx_port_19;

assign rvx_signal_071 = rvx_port_25;
assign rvx_signal_048 = rvx_port_15 & INCLUDE_INPUT_FIFO;
assign rvx_port_22 = rvx_signal_106;
assign rvx_port_47 = rvx_signal_025;
assign rvx_signal_016 = rvx_port_00;

ERVP_ASYNCH_FIFO_WIDTH_CONVERTER
#(
  .BW_DATA(RVX_LPARA_16),
  .BW_PARTIAL_WRITE(RVX_LPARA_00),
  .BW_PARTIAL_READ(RVX_LPARA_06),
  .DEPTH(RVX_LPARA_19),
  .BW_NUM_DATA(RVX_LPARA_20)
)
i_rvx_instance_05
(
  .wclk(rvx_signal_024),
  .wrstnn(rvx_signal_031),
  .wready(rvx_signal_007),
  .wfull(rvx_signal_081),
  .wstartindex(rvx_signal_108),
  .wlastindex(rvx_signal_001),
  .wrequest(rvx_signal_046),
  .wdata(rvx_signal_032),
  .wnum(),

  .rclk(rvx_signal_078),
  .rrstnn(rvx_signal_042),
  .rready(rvx_signal_043),
  .rempty(rvx_signal_105),
  .rstartindex(rvx_signal_061),
  .rlastindex(rvx_signal_097),
  .rrequest(rvx_signal_056),
  .rdata(rvx_signal_092),
  .rnum(rvx_signal_110)
);

assign rvx_signal_024 = rvx_port_25;
assign rvx_signal_031 = rvx_port_15 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_44 = rvx_signal_007;
assign rvx_signal_046 = rvx_port_29;
assign rvx_signal_032 = rvx_port_10;

assign rvx_signal_078 = rvx_port_38;
assign rvx_signal_042 = rvx_port_03 & INCLUDE_OUTPUT_FIFO;
assign rvx_port_42 = rvx_signal_092;
assign rvx_signal_056 = rvx_port_02;
assign rvx_port_31 = rvx_signal_043;

assign rvx_signal_082 = rvx_signal_077[RVX_LPARA_20-1]? 0 : rvx_signal_077;
assign rvx_signal_052 = rvx_signal_110[RVX_LPARA_20-1]? 0 : rvx_signal_110;

assign rvx_port_16[32-1-:16] = rvx_signal_082;
assign rvx_port_16[16-1-:16] = rvx_signal_052;

ERVP_FIFO
#(
  .BW_DATA(RVX_LPARA_05),
  .DEPTH(RVX_LPARA_04)
)
i_rvx_instance_10
(
  .clk(rvx_signal_091),
  .rstnn(rvx_signal_005),
  .enable(1'b 1),
  .clear(1'b 0),
  .wready(rvx_signal_049),
  .wfull(),
  .wrequest(rvx_signal_017),
  .wdata(rvx_signal_018),
  .wnum(),
  .rready(rvx_signal_094),
  .rempty(),
  .rrequest(rvx_signal_002),
  .rdata(rvx_signal_074),
  .rnum()
);

assign rvx_signal_091 = rvx_port_38;
assign rvx_signal_005 = rvx_port_03 & INCLUDE_INST_FIFO;

assign rvx_signal_017 = rvx_signal_109 & rvx_port_01;
assign rvx_signal_018 = rvx_port_30;
assign rvx_port_39 = rvx_signal_109 & rvx_signal_049;
assign rvx_signal_002 = rvx_signal_057; 

always@(posedge rvx_port_38, negedge rvx_port_03)
begin
  if(rvx_port_03==0)
    rvx_signal_021 <= 0;
  else if(rvx_signal_002|rvx_port_49)
    rvx_signal_021 <= rvx_signal_011;
end

always@(*)
begin
  rvx_signal_011 = rvx_signal_021;
  if(rvx_signal_002& rvx_signal_094)
    rvx_signal_011 = rvx_signal_011 | rvx_signal_074;
  if(rvx_port_49)
    rvx_signal_011 = rvx_signal_011 & (~rvx_port_24);
end

assign rvx_port_04 = rvx_signal_021;
assign rvx_port_07 = rvx_signal_021;

endmodule
