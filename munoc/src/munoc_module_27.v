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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"
`include "munoc_include_00.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_27
(
	munoc_port_01,
	munoc_port_15,

	munoc_port_32,
	munoc_port_36,

	munoc_port_02,
	munoc_port_04,
	munoc_port_13,
	munoc_port_26,
	munoc_port_22,
	munoc_port_44,
	munoc_port_27,
	munoc_port_48,
	munoc_port_35,

	munoc_port_40,
	munoc_port_16,
	munoc_port_28,

	munoc_port_07,
	munoc_port_08,

	munoc_port_24,
	munoc_port_10,
	munoc_port_47,
	munoc_port_33,
	munoc_port_34,
	munoc_port_39,
	munoc_port_42,
	munoc_port_45,	
	munoc_port_29,

	munoc_port_23,
	munoc_port_38,
	munoc_port_06,
	munoc_port_05,
	munoc_port_17,
	munoc_port_41,
	munoc_port_12,

	munoc_port_43,
	munoc_port_11,
	munoc_port_19,
	munoc_port_25,
	munoc_port_18,
	munoc_port_14,

	munoc_port_03,
	munoc_port_30,
	munoc_port_46,
	munoc_port_31,
	munoc_port_09,
	munoc_port_00,
	munoc_port_20,
	
	munoc_port_21,
	munoc_port_37
);





parameter MUNOC_GPARA_3 = -1;
parameter MUNOC_GPARA_7 = 8;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_5 = 8;
parameter MUNOC_GPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_6 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_2 = 0;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_34(MUNOC_GPARA_5);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_01, munoc_port_15;

input wire munoc_port_32;
input wire munoc_port_36;

input wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_02;
input wire [`MUNOC_GDEF_69-1:0] munoc_port_04;
input wire [`MUNOC_GDEF_22-1:0] munoc_port_13;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_26;
input wire [`BW_LONGEST_AXI_TID-1:0] munoc_port_22;
input wire [MUNOC_GPARA_4-1:0] munoc_port_44;
input wire [`BW_AXI_ALEN-1:0] munoc_port_27;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_48;
input wire [`BW_AXI_ABURST-1:0] munoc_port_35;

input wire munoc_port_40;
input wire [MUNOC_GPARA_6-1:0] munoc_port_16;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_6)-1:0] munoc_port_28;

output wire munoc_port_07;
output wire munoc_port_08;

input wire munoc_port_24;
output wire munoc_port_10;
output wire [`MUNOC_GDEF_06-1:0] munoc_port_47;
input wire munoc_port_33;
output wire munoc_port_34;
output wire [`MUNOC_GDEF_58-1:0] munoc_port_39;
input wire munoc_port_42;
output wire munoc_port_45;
output wire [`MUNOC_GDEF_68(MUNOC_GPARA_5)-1:0] munoc_port_29;

output wire [MUNOC_GPARA_0-1:0] munoc_port_23;
output wire [MUNOC_GPARA_4-1:0] munoc_port_38;
output wire [`BW_AXI_ALEN-1:0] munoc_port_06;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_05;
output wire [`BW_AXI_ABURST-1:0] munoc_port_17;
output reg munoc_port_41;
input wire munoc_port_12;

output wire [MUNOC_GPARA_0-1:0] munoc_port_43;
output wire [MUNOC_GPARA_5-1:0] munoc_port_11;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_19;
output wire munoc_port_25;
output wire munoc_port_18;
input wire munoc_port_14;

output wire [MUNOC_GPARA_0-1:0] munoc_port_03;
output wire [MUNOC_GPARA_4-1:0] munoc_port_30;
output wire [`BW_AXI_ALEN-1:0] munoc_port_46;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_31;
output wire [`BW_AXI_ABURST-1:0] munoc_port_09;
output wire munoc_port_00;
input wire munoc_port_20;

output wire [`MUNOC_GDEF_72-1:0] munoc_port_21;
`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
output reg munoc_port_37;
`else
output wire munoc_port_37;
`endif

genvar i;
integer j,k;

wire [`REQUIRED_BW_OF_SLAVE_TID-1:0] munoc_signal_16;

wire munoc_signal_20;
wire munoc_signal_14;
wire munoc_signal_22;

wire munoc_signal_01;
wire munoc_signal_07;
wire munoc_signal_19;

reg  munoc_signal_02;
wire munoc_signal_18;
wire munoc_signal_12;
wire munoc_signal_03;
wire munoc_signal_10;
reg  munoc_signal_13;
wire munoc_signal_00;

wire [MUNOC_GPARA_4-1:0] munoc_signal_11;
wire [`BW_AXI_ALEN-1:0] munoc_signal_09;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_06;
wire [`BW_AXI_ABURST-1:0] munoc_signal_17;

wire [`BW_ADDR_OFFSET-1:0] munoc_signal_21;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_08; 
wire [`MUNOC_GDEF_88(MUNOC_GPARA_5)-1:0] munoc_signal_05;

reg munoc_signal_04;

localparam  MUNOC_LPARA_1 = 4;
localparam  MUNOC_LPARA_4 = 4'b 0000;
localparam  MUNOC_LPARA_3 = 4'b 0101;
localparam  MUNOC_LPARA_2 = 4'b 1101;
localparam  MUNOC_LPARA_5 = 4'b 0011;

reg [MUNOC_LPARA_1-1:0] munoc_signal_15;

assign munoc_signal_20 = ($unsigned(munoc_port_13) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_22 = ($unsigned(munoc_port_13) > $unsigned(MUNOC_LPARA_0));
assign munoc_signal_14 = ($unsigned(munoc_port_13) == $unsigned(MUNOC_LPARA_0));

MUNOC_MODULE_12
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_4),
	.MUNOC_GPARA_0(MUNOC_GPARA_5),
	.MUNOC_GPARA_1(MUNOC_GPARA_1)
)
i_munoc_instance_1
(
	.munoc_port_18(munoc_port_01),
	.munoc_port_15(munoc_port_15),

	.munoc_port_20(munoc_port_32),
	.munoc_port_14(munoc_port_13),
	.munoc_port_00(munoc_port_44),
	.munoc_port_16(munoc_port_27),
	.munoc_port_08(munoc_port_48),
	.munoc_port_07(munoc_port_35),
  .munoc_port_09(munoc_port_07),

	.munoc_port_12(munoc_signal_22),
	.munoc_port_06(munoc_signal_02),

	.munoc_port_05(munoc_signal_08),
	.munoc_port_10(munoc_signal_05),
	.munoc_port_04(munoc_signal_11),
	.munoc_port_01(munoc_signal_09),
	.munoc_port_19(munoc_signal_06),
	.munoc_port_21(munoc_signal_17),

  .munoc_port_11(munoc_signal_18),
	.munoc_port_17(munoc_signal_10),
  .munoc_port_02(munoc_signal_13),

	.munoc_port_03(munoc_signal_00),
  .munoc_port_13(munoc_port_21)
);

always@(*)
begin
	munoc_signal_02 = 0;
	case(munoc_port_04)
		`MUNOC_GDEF_39: munoc_signal_02 = munoc_port_24 & munoc_port_33;
		`MUNOC_GDEF_18: munoc_signal_02 = munoc_port_42;
	endcase
end

always@(posedge munoc_port_01, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
    munoc_signal_04 <= 0;
  else if(munoc_signal_18)
    munoc_signal_04 <= 1;
  else if(munoc_signal_04)
    munoc_signal_04 <= 0;
end

assign munoc_port_10 = munoc_signal_04 & (munoc_port_04==`MUNOC_GDEF_39);
assign munoc_port_34 = munoc_signal_04 & (munoc_port_04==`MUNOC_GDEF_39);
assign munoc_port_45 = munoc_signal_04 & (munoc_port_04==`MUNOC_GDEF_18);

always@(posedge munoc_port_01, negedge munoc_port_15)
begin
  if(munoc_port_15==0)
    munoc_signal_15 <= MUNOC_LPARA_4;
  else if(munoc_signal_00)
    munoc_signal_15 <= MUNOC_LPARA_4;
  else
    case(munoc_signal_15)
      MUNOC_LPARA_4:
        if(munoc_port_41)
        begin
          if(munoc_port_12)
            munoc_signal_15 <= MUNOC_LPARA_5;
          else
            munoc_signal_15 <= MUNOC_LPARA_3;
        end
      MUNOC_LPARA_3:
        if(munoc_port_12)
          munoc_signal_15 <= MUNOC_LPARA_5;
        else if(munoc_signal_19)
          munoc_signal_15 <= MUNOC_LPARA_2;
    endcase
end

always@(*)
begin
  munoc_signal_13 = 0;
  case(munoc_signal_15)
    MUNOC_LPARA_4:
      if(munoc_port_04==`MUNOC_GDEF_39)
        munoc_signal_13 = munoc_port_20;
    MUNOC_LPARA_3:
      munoc_signal_13 = munoc_port_12 & munoc_signal_19;
    MUNOC_LPARA_5:
      munoc_signal_13 = munoc_signal_19;
    MUNOC_LPARA_2:
      munoc_signal_13 = munoc_port_12;
	endcase
end

assign munoc_port_00 = (munoc_signal_15==MUNOC_LPARA_4) & munoc_signal_10 & (munoc_port_04==`MUNOC_GDEF_39);
always@(*)
begin
  munoc_port_41 = 0;
  case(munoc_signal_15)
    MUNOC_LPARA_4:
      munoc_port_41 = munoc_signal_10 & (munoc_port_04==`MUNOC_GDEF_18);
    MUNOC_LPARA_3,
    MUNOC_LPARA_2:
      munoc_port_41 = 1;
  endcase
end
assign munoc_signal_01 = munoc_port_00 & munoc_port_20;
assign munoc_signal_07 = munoc_port_41 & munoc_port_12;

assign munoc_signal_16 = (MUNOC_GPARA_1==0)? $unsigned({munoc_port_26,munoc_port_22}) : ((MUNOC_GPARA_2==1)? munoc_port_26 : 0);
assign munoc_port_03 = munoc_signal_16;
assign munoc_port_30 = munoc_signal_11;
assign munoc_port_46 = munoc_signal_09;
assign munoc_port_31 = munoc_signal_06;
assign munoc_port_09 = munoc_signal_17;

assign munoc_port_23 = munoc_signal_16;
assign munoc_port_38 = munoc_signal_11;
assign munoc_port_06 = munoc_signal_09;
assign munoc_port_05 = munoc_signal_06;
assign munoc_port_17 = munoc_signal_17;

assign munoc_signal_21 = munoc_port_44[`BW_ADDR_OFFSET-1:0];

MUNOC_MODULE_13
#(
	.MUNOC_GPARA_1(MUNOC_GPARA_5),
	.MUNOC_GPARA_0(MUNOC_GPARA_6)
)
i_munoc_instance_0
(
	.munoc_port_17(munoc_port_01),
	.munoc_port_22(munoc_port_15),

	.munoc_port_07(munoc_port_13),
	.munoc_port_13(munoc_port_48),
	.munoc_port_01(munoc_port_36),
	.munoc_port_12(munoc_port_40),
	.munoc_port_11(munoc_port_16),
	.munoc_port_09(munoc_port_28),
	.munoc_port_02(munoc_signal_21),
	.munoc_port_15(munoc_signal_09),

	.munoc_port_19(munoc_signal_20),
	.munoc_port_08(munoc_signal_14),
	.munoc_port_04(munoc_signal_22),
	.munoc_port_16(munoc_signal_12),
	.munoc_port_00(munoc_signal_03),
	.munoc_port_14(),

	.munoc_port_06(munoc_port_11),
	.munoc_port_21(munoc_port_19),
	.munoc_port_20(munoc_port_25),
	.munoc_port_03(munoc_port_18),
	.munoc_port_05(munoc_port_14),
	.munoc_port_10(munoc_port_08),
	.munoc_port_18(munoc_signal_19)
);

assign munoc_signal_12 = munoc_signal_18 && (munoc_port_04==`MUNOC_GDEF_18); 
assign munoc_signal_03 = (munoc_signal_15==MUNOC_LPARA_4) & munoc_signal_10 & (munoc_port_04==`MUNOC_GDEF_18);
assign munoc_port_43 = munoc_port_23;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign munoc_port_47 = {munoc_port_48,munoc_signal_21,munoc_signal_08};
assign munoc_port_39 = {munoc_port_26,munoc_port_22};
`else
assign munoc_port_47 = {munoc_port_13,munoc_port_48,munoc_signal_21,munoc_signal_08};
assign munoc_port_39 = {munoc_port_26,munoc_port_22,munoc_port_13};
`endif
assign munoc_port_29 = {munoc_port_26,munoc_port_22,munoc_signal_05};

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(posedge munoc_port_01, negedge munoc_port_15)
begin
	if(munoc_port_15==0)
		munoc_port_37 <= 0;
	else if(munoc_signal_10)
		if(munoc_port_02!=MUNOC_GPARA_3)
			munoc_port_37 <= 1;
end
`else
	assign munoc_port_37 = 0;
`endif

endmodule
