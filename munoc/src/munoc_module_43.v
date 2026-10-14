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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"
`include "munoc_include_04.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_43
(
	munoc_port_30,
	munoc_port_00,

	munoc_port_47,
	munoc_port_32,

	munoc_port_11,
	munoc_port_17,
	munoc_port_08,
	munoc_port_03,
	munoc_port_04,
	munoc_port_18,
	munoc_port_33,
	munoc_port_36,
	munoc_port_46,

	munoc_port_13,
	munoc_port_41,
	munoc_port_14,

	munoc_port_29,
	munoc_port_26,

	munoc_port_10,
	munoc_port_24,
	munoc_port_23,
	munoc_port_43,
	munoc_port_38,
	munoc_port_19,
	munoc_port_15,
	munoc_port_34,	
	munoc_port_22,

	munoc_port_12,
	munoc_port_01,
	munoc_port_31,
	munoc_port_27,
	munoc_port_02,
	munoc_port_06,
	munoc_port_44,

	munoc_port_40,
	munoc_port_37,
	munoc_port_35,
	munoc_port_21,
	munoc_port_07,
	munoc_port_25,

	munoc_port_20,
	munoc_port_16,
	munoc_port_28,
	munoc_port_09,
	munoc_port_05,
	munoc_port_45,
	munoc_port_42,
	
	munoc_port_39,
	munoc_port_48
);





parameter MUNOC_GPARA_7 = -1;
parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_5 = 8;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_6 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_2 = 1;
parameter MUNOC_GPARA_1 = 0;

localparam  MUNOC_LPARA_2 = `MUNOC_GDEF_51(MUNOC_GPARA_3);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_30, munoc_port_00;

input wire munoc_port_47;
input wire munoc_port_32;

input wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_11;
input wire [`MUNOC_GDEF_64-1:0] munoc_port_17;
input wire [`MUNOC_GDEF_60-1:0] munoc_port_08;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_03;
input wire [`BW_LONGEST_AXI_TID-1:0] munoc_port_04;
input wire [MUNOC_GPARA_5-1:0] munoc_port_18;
input wire [`BW_AXI_ALEN-1:0] munoc_port_33;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_36;
input wire [`BW_AXI_ABURST-1:0] munoc_port_46;

input wire munoc_port_13;
input wire [MUNOC_GPARA_0-1:0] munoc_port_41;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_0)-1:0] munoc_port_14;

output wire munoc_port_29;
output wire munoc_port_26;

input wire munoc_port_10;
output wire munoc_port_24;
output wire [`MUNOC_GDEF_21-1:0] munoc_port_23;
input wire munoc_port_43;
output wire munoc_port_38;
output wire [`MUNOC_GDEF_27-1:0] munoc_port_19;
input wire munoc_port_15;
output wire munoc_port_34;
output wire [`MUNOC_GDEF_31(MUNOC_GPARA_3)-1:0] munoc_port_22;

output wire [MUNOC_GPARA_6-1:0] munoc_port_12;
output wire [MUNOC_GPARA_5-1:0] munoc_port_01;
output wire [`BW_AXI_ALEN-1:0] munoc_port_31;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_27;
output wire [`BW_AXI_ABURST-1:0] munoc_port_02;
output reg munoc_port_06;
input wire munoc_port_44;

output wire [MUNOC_GPARA_6-1:0] munoc_port_40;
output wire [MUNOC_GPARA_3-1:0] munoc_port_37;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_35;
output wire munoc_port_21;
output wire munoc_port_07;
input wire munoc_port_25;

output wire [MUNOC_GPARA_6-1:0] munoc_port_20;
output wire [MUNOC_GPARA_5-1:0] munoc_port_16;
output wire [`BW_AXI_ALEN-1:0] munoc_port_28;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_09;
output wire [`BW_AXI_ABURST-1:0] munoc_port_05;
output wire munoc_port_45;
input wire munoc_port_42;

output wire [`MUNOC_GDEF_02-1:0] munoc_port_39;
`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
output reg munoc_port_48;
`else
output wire munoc_port_48;
`endif

genvar i;
integer j,k;

wire [`REQUIRED_BW_OF_SLAVE_TID-1:0] munoc_signal_19;

wire munoc_signal_10;
wire munoc_signal_13;
wire munoc_signal_02;

wire munoc_signal_06;
wire munoc_signal_15;
wire munoc_signal_11;

reg  munoc_signal_08;
wire munoc_signal_03;
wire munoc_signal_16;
wire munoc_signal_00;
wire munoc_signal_14;
reg  munoc_signal_12;
wire munoc_signal_17;

wire [MUNOC_GPARA_5-1:0] munoc_signal_07;
wire [`BW_AXI_ALEN-1:0] munoc_signal_21;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_09;
wire [`BW_AXI_ABURST-1:0] munoc_signal_05;

wire [`BW_ADDR_OFFSET-1:0] munoc_signal_18;
wire [`MUNOC_GDEF_05-1:0] munoc_signal_22; 
wire [`MUNOC_GDEF_19(MUNOC_GPARA_3)-1:0] munoc_signal_04;

reg munoc_signal_20;

localparam  MUNOC_LPARA_5 = 4;
localparam  MUNOC_LPARA_3 = 4'b 0000;
localparam  MUNOC_LPARA_4 = 4'b 0101;
localparam  MUNOC_LPARA_1 = 4'b 1101;
localparam  MUNOC_LPARA_0 = 4'b 0011;

reg [MUNOC_LPARA_5-1:0] munoc_signal_01;

assign munoc_signal_10 = ($unsigned(munoc_port_08) < $unsigned(MUNOC_LPARA_2));
assign munoc_signal_02 = ($unsigned(munoc_port_08) > $unsigned(MUNOC_LPARA_2));
assign munoc_signal_13 = ($unsigned(munoc_port_08) == $unsigned(MUNOC_LPARA_2));

MUNOC_MODULE_23
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_5),
	.MUNOC_GPARA_2(MUNOC_GPARA_3),
	.MUNOC_GPARA_1(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.munoc_port_21(munoc_port_30),
	.munoc_port_16(munoc_port_00),

	.munoc_port_04(munoc_port_47),
	.munoc_port_01(munoc_port_08),
	.munoc_port_00(munoc_port_18),
	.munoc_port_17(munoc_port_33),
	.munoc_port_02(munoc_port_36),
	.munoc_port_11(munoc_port_46),
  .munoc_port_05(munoc_port_29),

	.munoc_port_10(munoc_signal_02),
	.munoc_port_19(munoc_signal_08),

	.munoc_port_06(munoc_signal_22),
	.munoc_port_09(munoc_signal_04),
	.munoc_port_20(munoc_signal_07),
	.munoc_port_18(munoc_signal_21),
	.munoc_port_14(munoc_signal_09),
	.munoc_port_07(munoc_signal_05),

  .munoc_port_13(munoc_signal_03),
	.munoc_port_08(munoc_signal_14),
  .munoc_port_03(munoc_signal_12),

	.munoc_port_12(munoc_signal_17),
  .munoc_port_15(munoc_port_39)
);

always@(*)
begin
	munoc_signal_08 = 0;
	case(munoc_port_17)
		`MUNOC_GDEF_25: munoc_signal_08 = munoc_port_10 & munoc_port_43;
		`MUNOC_GDEF_66: munoc_signal_08 = munoc_port_15;
	endcase
end

always@(posedge munoc_port_30, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
    munoc_signal_20 <= 0;
  else if(munoc_signal_03)
    munoc_signal_20 <= 1;
  else if(munoc_signal_20)
    munoc_signal_20 <= 0;
end

assign munoc_port_24 = munoc_signal_20 & (munoc_port_17==`MUNOC_GDEF_25);
assign munoc_port_38 = munoc_signal_20 & (munoc_port_17==`MUNOC_GDEF_25);
assign munoc_port_34 = munoc_signal_20 & (munoc_port_17==`MUNOC_GDEF_66);

always@(posedge munoc_port_30, negedge munoc_port_00)
begin
  if(munoc_port_00==0)
    munoc_signal_01 <= MUNOC_LPARA_3;
  else if(munoc_signal_17)
    munoc_signal_01 <= MUNOC_LPARA_3;
  else
    case(munoc_signal_01)
      MUNOC_LPARA_3:
        if(munoc_port_06)
        begin
          if(munoc_port_44)
            munoc_signal_01 <= MUNOC_LPARA_0;
          else
            munoc_signal_01 <= MUNOC_LPARA_4;
        end
      MUNOC_LPARA_4:
        if(munoc_port_44)
          munoc_signal_01 <= MUNOC_LPARA_0;
        else if(munoc_signal_11)
          munoc_signal_01 <= MUNOC_LPARA_1;
    endcase
end

always@(*)
begin
  munoc_signal_12 = 0;
  case(munoc_signal_01)
    MUNOC_LPARA_3:
      if(munoc_port_17==`MUNOC_GDEF_25)
        munoc_signal_12 = munoc_port_42;
    MUNOC_LPARA_4:
      munoc_signal_12 = munoc_port_44 & munoc_signal_11;
    MUNOC_LPARA_0:
      munoc_signal_12 = munoc_signal_11;
    MUNOC_LPARA_1:
      munoc_signal_12 = munoc_port_44;
	endcase
end

assign munoc_port_45 = (munoc_signal_01==MUNOC_LPARA_3) & munoc_signal_14 & (munoc_port_17==`MUNOC_GDEF_25);
always@(*)
begin
  munoc_port_06 = 0;
  case(munoc_signal_01)
    MUNOC_LPARA_3:
      munoc_port_06 = munoc_signal_14 & (munoc_port_17==`MUNOC_GDEF_66);
    MUNOC_LPARA_4,
    MUNOC_LPARA_1:
      munoc_port_06 = 1;
  endcase
end
assign munoc_signal_06 = munoc_port_45 & munoc_port_42;
assign munoc_signal_15 = munoc_port_06 & munoc_port_44;

assign munoc_signal_19 = (MUNOC_GPARA_2==0)? $unsigned({munoc_port_03,munoc_port_04}) : ((MUNOC_GPARA_1==1)? munoc_port_03 : 0);
assign munoc_port_20 = munoc_signal_19;
assign munoc_port_16 = munoc_signal_07;
assign munoc_port_28 = munoc_signal_21;
assign munoc_port_09 = munoc_signal_09;
assign munoc_port_05 = munoc_signal_05;

assign munoc_port_12 = munoc_signal_19;
assign munoc_port_01 = munoc_signal_07;
assign munoc_port_31 = munoc_signal_21;
assign munoc_port_27 = munoc_signal_09;
assign munoc_port_02 = munoc_signal_05;

assign munoc_signal_18 = munoc_port_18[`BW_ADDR_OFFSET-1:0];

MUNOC_MODULE_05
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_3),
	.MUNOC_GPARA_1(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_21(munoc_port_30),
	.munoc_port_19(munoc_port_00),

	.munoc_port_04(munoc_port_08),
	.munoc_port_11(munoc_port_36),
	.munoc_port_20(munoc_port_32),
	.munoc_port_09(munoc_port_13),
	.munoc_port_06(munoc_port_41),
	.munoc_port_03(munoc_port_14),
	.munoc_port_01(munoc_signal_18),
	.munoc_port_13(munoc_signal_21),

	.munoc_port_17(munoc_signal_10),
	.munoc_port_22(munoc_signal_13),
	.munoc_port_16(munoc_signal_02),
	.munoc_port_02(munoc_signal_16),
	.munoc_port_08(munoc_signal_00),
	.munoc_port_18(),

	.munoc_port_10(munoc_port_37),
	.munoc_port_12(munoc_port_35),
	.munoc_port_05(munoc_port_21),
	.munoc_port_07(munoc_port_07),
	.munoc_port_15(munoc_port_25),
	.munoc_port_14(munoc_port_26),
	.munoc_port_00(munoc_signal_11)
);

assign munoc_signal_16 = munoc_signal_03 && (munoc_port_17==`MUNOC_GDEF_66); 
assign munoc_signal_00 = (munoc_signal_01==MUNOC_LPARA_3) & munoc_signal_14 & (munoc_port_17==`MUNOC_GDEF_66);
assign munoc_port_40 = munoc_port_12;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign munoc_port_23 = {munoc_port_36,munoc_signal_18,munoc_signal_22};
assign munoc_port_19 = {munoc_port_03,munoc_port_04};
`else
assign munoc_port_23 = {munoc_port_08,munoc_port_36,munoc_signal_18,munoc_signal_22};
assign munoc_port_19 = {munoc_port_03,munoc_port_04,munoc_port_08};
`endif
assign munoc_port_22 = {munoc_port_03,munoc_port_04,munoc_signal_04};

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(posedge munoc_port_30, negedge munoc_port_00)
begin
	if(munoc_port_00==0)
		munoc_port_48 <= 0;
	else if(munoc_signal_14)
		if(munoc_port_11!=MUNOC_GPARA_7)
			munoc_port_48 <= 1;
end
`else
	assign munoc_port_48 = 0;
`endif

endmodule
