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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_10.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_03.vh"
`include "munoc_include_08.vh"
`include "munoc_include_07.vh"





module MUNOC_MODULE_13
(
	munoc_port_38,
	munoc_port_45,

	munoc_port_08,
	munoc_port_26,

	munoc_port_22,
	munoc_port_13,
	munoc_port_29,
	munoc_port_10,
	munoc_port_42,
	munoc_port_17,
	munoc_port_43,
	munoc_port_20,
	munoc_port_21,

	munoc_port_09,
	munoc_port_28,
	munoc_port_47,

	munoc_port_14,
	munoc_port_40,

	munoc_port_44,
	munoc_port_04,
	munoc_port_12,
	munoc_port_30,
	munoc_port_03,
	munoc_port_48,
	munoc_port_24,
	munoc_port_33,	
	munoc_port_39,

	munoc_port_15,
	munoc_port_46,
	munoc_port_36,
	munoc_port_18,
	munoc_port_02,
	munoc_port_25,
	munoc_port_23,

	munoc_port_06,
	munoc_port_16,
	munoc_port_05,
	munoc_port_07,
	munoc_port_11,
	munoc_port_35,

	munoc_port_34,
	munoc_port_01,
	munoc_port_19,
	munoc_port_27,
	munoc_port_37,
	munoc_port_32,
	munoc_port_41,
	
	munoc_port_31,
	munoc_port_00
);





parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_6 = 8;
parameter MUNOC_GPARA_5 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_2 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_7 = 1;
parameter MUNOC_GPARA_4 = 0;

localparam  MUNOC_LPARA_3 = `MUNOC_GDEF_72(MUNOC_GPARA_6);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_38, munoc_port_45;

input wire munoc_port_08;
input wire munoc_port_26;

input wire [`BW_SLAVE_NODE_ID-1:0] munoc_port_22;
input wire [`MUNOC_GDEF_16-1:0] munoc_port_13;
input wire [`MUNOC_GDEF_77-1:0] munoc_port_29;
input wire [`BW_MASTER_NODE_ID-1:0] munoc_port_10;
input wire [`BW_LONGEST_AXI_TID-1:0] munoc_port_42;
input wire [MUNOC_GPARA_1-1:0] munoc_port_17;
input wire [`BW_AXI_ALEN-1:0] munoc_port_43;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_20;
input wire [`BW_AXI_ABURST-1:0] munoc_port_21;

input wire munoc_port_09;
input wire [MUNOC_GPARA_2-1:0] munoc_port_28;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_2)-1:0] munoc_port_47;

output wire munoc_port_14;
output wire munoc_port_40;

input wire munoc_port_44;
output wire munoc_port_04;
output wire [`MUNOC_GDEF_55-1:0] munoc_port_12;
input wire munoc_port_30;
output wire munoc_port_03;
output wire [`MUNOC_GDEF_18-1:0] munoc_port_48;
input wire munoc_port_24;
output wire munoc_port_33;
output wire [`MUNOC_GDEF_08(MUNOC_GPARA_6)-1:0] munoc_port_39;

output wire [MUNOC_GPARA_5-1:0] munoc_port_15;
output wire [MUNOC_GPARA_1-1:0] munoc_port_46;
output wire [`BW_AXI_ALEN-1:0] munoc_port_36;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_18;
output wire [`BW_AXI_ABURST-1:0] munoc_port_02;
output reg munoc_port_25;
input wire munoc_port_23;

output wire [MUNOC_GPARA_5-1:0] munoc_port_06;
output wire [MUNOC_GPARA_6-1:0] munoc_port_16;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_6)-1:0] munoc_port_05;
output wire munoc_port_07;
output wire munoc_port_11;
input wire munoc_port_35;

output wire [MUNOC_GPARA_5-1:0] munoc_port_34;
output wire [MUNOC_GPARA_1-1:0] munoc_port_01;
output wire [`BW_AXI_ALEN-1:0] munoc_port_19;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_27;
output wire [`BW_AXI_ABURST-1:0] munoc_port_37;
output wire munoc_port_32;
input wire munoc_port_41;

output wire [`MUNOC_GDEF_37-1:0] munoc_port_31;
`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
output reg munoc_port_00;
`else
output wire munoc_port_00;
`endif

genvar i;
integer j,k;

wire [`REQUIRED_BW_OF_SLAVE_TID-1:0] munoc_signal_14;

wire munoc_signal_16;
wire munoc_signal_13;
wire munoc_signal_03;

wire munoc_signal_15;
wire munoc_signal_19;
wire munoc_signal_01;

reg  munoc_signal_21;
wire munoc_signal_12;
wire munoc_signal_05;
wire munoc_signal_07;
wire munoc_signal_17;
reg  munoc_signal_02;
wire munoc_signal_22;

wire [MUNOC_GPARA_1-1:0] munoc_signal_04;
wire [`BW_AXI_ALEN-1:0] munoc_signal_08;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_11;
wire [`BW_AXI_ABURST-1:0] munoc_signal_09;

wire [`BW_ADDR_OFFSET-1:0] munoc_signal_10;
wire [`MUNOC_GDEF_90-1:0] munoc_signal_20; 
wire [`MUNOC_GDEF_12(MUNOC_GPARA_6)-1:0] munoc_signal_06;

reg munoc_signal_18;

localparam  MUNOC_LPARA_5 = 4;
localparam  MUNOC_LPARA_0 = 4'b 0000;
localparam  MUNOC_LPARA_1 = 4'b 0101;
localparam  MUNOC_LPARA_2 = 4'b 1101;
localparam  MUNOC_LPARA_4 = 4'b 0011;

reg [MUNOC_LPARA_5-1:0] munoc_signal_00;

assign munoc_signal_16 = ($unsigned(munoc_port_29) < $unsigned(MUNOC_LPARA_3));
assign munoc_signal_03 = ($unsigned(munoc_port_29) > $unsigned(MUNOC_LPARA_3));
assign munoc_signal_13 = ($unsigned(munoc_port_29) == $unsigned(MUNOC_LPARA_3));

MUNOC_MODULE_38
#(
	.MUNOC_GPARA_2(MUNOC_GPARA_1),
	.MUNOC_GPARA_1(MUNOC_GPARA_6),
	.MUNOC_GPARA_0(MUNOC_GPARA_7)
)
i_munoc_instance_1
(
	.munoc_port_21(munoc_port_38),
	.munoc_port_05(munoc_port_45),

	.munoc_port_07(munoc_port_08),
	.munoc_port_06(munoc_port_29),
	.munoc_port_00(munoc_port_17),
	.munoc_port_08(munoc_port_43),
	.munoc_port_15(munoc_port_20),
	.munoc_port_17(munoc_port_21),
  .munoc_port_20(munoc_port_14),

	.munoc_port_09(munoc_signal_03),
	.munoc_port_13(munoc_signal_21),

	.munoc_port_11(munoc_signal_20),
	.munoc_port_03(munoc_signal_06),
	.munoc_port_18(munoc_signal_04),
	.munoc_port_01(munoc_signal_08),
	.munoc_port_10(munoc_signal_11),
	.munoc_port_14(munoc_signal_09),

  .munoc_port_02(munoc_signal_12),
	.munoc_port_12(munoc_signal_17),
  .munoc_port_04(munoc_signal_02),

	.munoc_port_19(munoc_signal_22),
  .munoc_port_16(munoc_port_31)
);

always@(*)
begin
	munoc_signal_21 = 0;
	case(munoc_port_13)
		`MUNOC_GDEF_26: munoc_signal_21 = munoc_port_44 & munoc_port_30;
		`MUNOC_GDEF_45: munoc_signal_21 = munoc_port_24;
	endcase
end

always@(posedge munoc_port_38, negedge munoc_port_45)
begin
	if(munoc_port_45==0)
    munoc_signal_18 <= 0;
  else if(munoc_signal_12)
    munoc_signal_18 <= 1;
  else if(munoc_signal_18)
    munoc_signal_18 <= 0;
end

assign munoc_port_04 = munoc_signal_18 & (munoc_port_13==`MUNOC_GDEF_26);
assign munoc_port_03 = munoc_signal_18 & (munoc_port_13==`MUNOC_GDEF_26);
assign munoc_port_33 = munoc_signal_18 & (munoc_port_13==`MUNOC_GDEF_45);

always@(posedge munoc_port_38, negedge munoc_port_45)
begin
  if(munoc_port_45==0)
    munoc_signal_00 <= MUNOC_LPARA_0;
  else if(munoc_signal_22)
    munoc_signal_00 <= MUNOC_LPARA_0;
  else
    case(munoc_signal_00)
      MUNOC_LPARA_0:
        if(munoc_port_25)
        begin
          if(munoc_port_23)
            munoc_signal_00 <= MUNOC_LPARA_4;
          else
            munoc_signal_00 <= MUNOC_LPARA_1;
        end
      MUNOC_LPARA_1:
        if(munoc_port_23)
          munoc_signal_00 <= MUNOC_LPARA_4;
        else if(munoc_signal_01)
          munoc_signal_00 <= MUNOC_LPARA_2;
    endcase
end

always@(*)
begin
  munoc_signal_02 = 0;
  case(munoc_signal_00)
    MUNOC_LPARA_0:
      if(munoc_port_13==`MUNOC_GDEF_26)
        munoc_signal_02 = munoc_port_41;
    MUNOC_LPARA_1:
      munoc_signal_02 = munoc_port_23 & munoc_signal_01;
    MUNOC_LPARA_4:
      munoc_signal_02 = munoc_signal_01;
    MUNOC_LPARA_2:
      munoc_signal_02 = munoc_port_23;
	endcase
end

assign munoc_port_32 = (munoc_signal_00==MUNOC_LPARA_0) & munoc_signal_17 & (munoc_port_13==`MUNOC_GDEF_26);
always@(*)
begin
  munoc_port_25 = 0;
  case(munoc_signal_00)
    MUNOC_LPARA_0:
      munoc_port_25 = munoc_signal_17 & (munoc_port_13==`MUNOC_GDEF_45);
    MUNOC_LPARA_1,
    MUNOC_LPARA_2:
      munoc_port_25 = 1;
  endcase
end
assign munoc_signal_15 = munoc_port_32 & munoc_port_41;
assign munoc_signal_19 = munoc_port_25 & munoc_port_23;

assign munoc_signal_14 = (MUNOC_GPARA_7==0)? $unsigned({munoc_port_10,munoc_port_42}) : ((MUNOC_GPARA_4==1)? munoc_port_10 : 0);
assign munoc_port_34 = munoc_signal_14;
assign munoc_port_01 = munoc_signal_04;
assign munoc_port_19 = munoc_signal_08;
assign munoc_port_27 = munoc_signal_11;
assign munoc_port_37 = munoc_signal_09;

assign munoc_port_15 = munoc_signal_14;
assign munoc_port_46 = munoc_signal_04;
assign munoc_port_36 = munoc_signal_08;
assign munoc_port_18 = munoc_signal_11;
assign munoc_port_02 = munoc_signal_09;

assign munoc_signal_10 = munoc_port_17[`BW_ADDR_OFFSET-1:0];

MUNOC_MODULE_00
#(
	.MUNOC_GPARA_0(MUNOC_GPARA_6),
	.MUNOC_GPARA_1(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.munoc_port_03(munoc_port_38),
	.munoc_port_19(munoc_port_45),

	.munoc_port_14(munoc_port_29),
	.munoc_port_01(munoc_port_20),
	.munoc_port_15(munoc_port_26),
	.munoc_port_09(munoc_port_09),
	.munoc_port_13(munoc_port_28),
	.munoc_port_20(munoc_port_47),
	.munoc_port_10(munoc_signal_10),
	.munoc_port_04(munoc_signal_08),

	.munoc_port_05(munoc_signal_16),
	.munoc_port_06(munoc_signal_13),
	.munoc_port_16(munoc_signal_03),
	.munoc_port_17(munoc_signal_05),
	.munoc_port_12(munoc_signal_07),
	.munoc_port_18(),

	.munoc_port_21(munoc_port_16),
	.munoc_port_08(munoc_port_05),
	.munoc_port_00(munoc_port_07),
	.munoc_port_22(munoc_port_11),
	.munoc_port_11(munoc_port_35),
	.munoc_port_02(munoc_port_40),
	.munoc_port_07(munoc_signal_01)
);

assign munoc_signal_05 = munoc_signal_12 && (munoc_port_13==`MUNOC_GDEF_45); 
assign munoc_signal_07 = (munoc_signal_00==MUNOC_LPARA_0) & munoc_signal_17 & (munoc_port_13==`MUNOC_GDEF_45);
assign munoc_port_06 = munoc_port_15;
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
assign munoc_port_12 = {munoc_port_20,munoc_signal_10,munoc_signal_20};
assign munoc_port_48 = {munoc_port_10,munoc_port_42};
`else
assign munoc_port_12 = {munoc_port_29,munoc_port_20,munoc_signal_10,munoc_signal_20};
assign munoc_port_48 = {munoc_port_10,munoc_port_42,munoc_port_29};
`endif
assign munoc_port_39 = {munoc_port_10,munoc_port_42,munoc_signal_06};

`ifdef __MUNOC_INCLUDE_ROUTING_ERROR
always@(posedge munoc_port_38, negedge munoc_port_45)
begin
	if(munoc_port_45==0)
		munoc_port_00 <= 0;
	else if(munoc_signal_17)
		if(munoc_port_22!=MUNOC_GPARA_0)
			munoc_port_00 <= 1;
end
`else
	assign munoc_port_00 = 0;
`endif

endmodule
