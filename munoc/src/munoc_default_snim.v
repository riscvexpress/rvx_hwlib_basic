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
`include "munoc_control.vh"



module MUNOC_DEFAULT_SNIM
(
	clk_network,
	rstnn_network,
	clk_debug,
	rstnn_debug,

	comm_disable,
	
	rfni_link,
	rfni_ready,
	rbni_link,
	rbni_ready,

	
	svri_slink,
	svri_sack,
	svri_rlink,
	svri_rack,

	debug_rpsel,
	debug_rpenable,
	debug_rpaddr,
	debug_rpwrite,
	debug_rpwdata,
	debug_rprdata,
	debug_rpready,
	debug_rpslverr
);



parameter NODE_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter BW_PLATFORM_ADDR = 32;

parameter USE_JTAG_INTERFACE = 0;
parameter USE_SW_INTERFACE = 0;
parameter NOC_CONTROLLER_BASEADDR = 0;

localparam  MUNOC_LPARA_1 = 32;
localparam  MUNOC_LPARA_0 = `REQUIRED_BW_OF_SLAVE_TID;

input wire clk_network, rstnn_network;
input wire clk_debug, rstnn_debug;

input wire comm_disable;

input wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] rfni_link;
output wire rfni_ready;
output wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] rbni_link;
input wire rbni_ready;

output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;
input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;

input wire debug_rpsel;
input wire debug_rpenable;
input wire [BW_PLATFORM_ADDR-1:0] debug_rpaddr;
input wire debug_rpwrite;
input wire [MUNOC_LPARA_1-1:0] debug_rpwdata;
output wire [MUNOC_LPARA_1-1:0] debug_rprdata;
output wire debug_rpready;
output wire debug_rpslverr;

wire [MUNOC_LPARA_0-1:0] munoc_signal_09;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_00;
wire [`BW_AXI_ALEN-1:0] munoc_signal_10;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_46;
wire [`BW_AXI_ABURST-1:0] munoc_signal_17;
wire munoc_signal_11;
wire munoc_signal_02;

wire [MUNOC_LPARA_0-1:0] munoc_signal_36;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_34;	
wire [`BW_AXI_ALEN-1:0] munoc_signal_18;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_24;
wire [`BW_AXI_ABURST-1:0] munoc_signal_04;
wire munoc_signal_15;
wire munoc_signal_43;

wire [MUNOC_LPARA_0-1:0] munoc_signal_12;
wire [MUNOC_LPARA_1-1:0] munoc_signal_39;
wire [`BW_AXI_WSTRB(MUNOC_LPARA_1)-1:0] munoc_signal_25;
wire munoc_signal_48;
wire munoc_signal_06;
wire munoc_signal_37;

wire [MUNOC_LPARA_0-1:0] munoc_signal_31;
wire [`BW_AXI_BRESP-1:0] munoc_signal_38;
wire munoc_signal_44;
wire munoc_signal_32;

wire [MUNOC_LPARA_0-1:0] munoc_signal_03;
wire [MUNOC_LPARA_1-1:0] munoc_signal_33;
wire [`BW_AXI_RRESP-1:0] munoc_signal_29;
wire munoc_signal_23;
wire munoc_signal_47;
wire munoc_signal_22;

wire munoc_signal_19;
wire munoc_signal_27;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_20;
wire munoc_signal_42;
wire [MUNOC_LPARA_1-1:0] munoc_signal_26;
wire [MUNOC_LPARA_1-1:0] munoc_signal_35;
wire munoc_signal_49;
wire munoc_signal_40;
wire [MUNOC_LPARA_0-1:0] munoc_signal_07;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_08;

wire munoc_signal_14;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_41;
wire munoc_signal_16;
wire [MUNOC_LPARA_1-1:0] munoc_signal_45;
wire [MUNOC_LPARA_1-1:0] munoc_signal_05;
wire munoc_signal_21;
wire munoc_signal_28;

reg munoc_signal_01;
wire [`BW_MASTER_NODE_ID-1:0] munoc_signal_13;

`define MUNOC_LDEF_0 1
`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_2 1

reg [`MUNOC_LDEF_0-1:0] munoc_signal_30;

MUNOC_MODULE_23
#(
	.MUNOC_GPARA_08(NODE_ID),
	.MUNOC_GPARA_02(BW_FNI_PHIT),
	.MUNOC_GPARA_01(BW_BNI_PHIT),
	.MUNOC_GPARA_14(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_12(MUNOC_LPARA_1),
	.MUNOC_GPARA_09(MUNOC_LPARA_0),
	.MUNOC_GPARA_13(MUNOC_LPARA_1),
	.MUNOC_GPARA_07(2),
	.MUNOC_GPARA_04(2),
	.MUNOC_GPARA_03(2),
	.MUNOC_GPARA_00(2),
	.MUNOC_GPARA_06(2),
	.MUNOC_GPARA_11(0),
	.MUNOC_GPARA_10(0)
)
i_munoc_instance_2
(
	.munoc_port_29(clk_debug),
	.munoc_port_06(rstnn_debug),
	.munoc_port_40(clk_network),
	.munoc_port_19(rstnn_network),
	
	.munoc_port_13(rfni_link),
	.munoc_port_21(rfni_ready),
	.munoc_port_05(rbni_link),
	.munoc_port_11(rbni_ready),

	.munoc_port_18(munoc_signal_36),
	.munoc_port_41(munoc_signal_34),
	.munoc_port_22(munoc_signal_18),
	.munoc_port_23(munoc_signal_24),
	.munoc_port_33(munoc_signal_04),
	.munoc_port_00(munoc_signal_15),
	.munoc_port_09(munoc_signal_43),

	.munoc_port_35(munoc_signal_12),
	.munoc_port_39(munoc_signal_39),
	.munoc_port_25(munoc_signal_25),
	.munoc_port_24(munoc_signal_48),
	.munoc_port_26(munoc_signal_06),
	.munoc_port_30(munoc_signal_37),

	.munoc_port_02(munoc_signal_31),
	.munoc_port_10(munoc_signal_38),
	.munoc_port_04(munoc_signal_44),
	.munoc_port_38(munoc_signal_32),

	.munoc_port_15(munoc_signal_09),
	.munoc_port_36(munoc_signal_00),
	.munoc_port_08(munoc_signal_10),
	.munoc_port_17(munoc_signal_46),
	.munoc_port_12(munoc_signal_17),
	.munoc_port_34(munoc_signal_11),
	.munoc_port_14(munoc_signal_02),

	.munoc_port_31(munoc_signal_03),
	.munoc_port_03(munoc_signal_33),
	.munoc_port_20(munoc_signal_29),
	.munoc_port_32(munoc_signal_23),
	.munoc_port_37(munoc_signal_47),
	.munoc_port_28(munoc_signal_22),

	.munoc_port_07(1'b 0),
	.munoc_port_27(),
	.munoc_port_16(),
	.munoc_port_01()
);

MUNOC_AXI2APB_CONVERTER_
#(
	.BW_AXI_TID(MUNOC_LPARA_0),
	.BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
	.BW_NODE_DATA(MUNOC_LPARA_1)
)
i_munoc_instance_0
(
	.clk(clk_debug),
	.rstnn(rstnn_debug),

	.rxawid(munoc_signal_36),
	.rxawaddr(munoc_signal_34),
	.rxawlen(munoc_signal_18),
	.rxawsize(munoc_signal_24),
	.rxawburst(munoc_signal_04),
	.rxawvalid(munoc_signal_15),
	.rxawready(munoc_signal_43),

	.rxwid(munoc_signal_12),
	.rxwdata(munoc_signal_39),
	.rxwstrb(munoc_signal_25),
	.rxwlast(munoc_signal_48),
	.rxwvalid(munoc_signal_06),
	.rxwready(munoc_signal_37),

	.rxbid(munoc_signal_31),
	.rxbresp(munoc_signal_38),
	.rxbvalid(munoc_signal_44),
	.rxbready(munoc_signal_32),

	.rxarid(munoc_signal_09),
	.rxaraddr(munoc_signal_00),
	.rxarlen(munoc_signal_10),
	.rxarsize(munoc_signal_46),
	.rxarburst(munoc_signal_17),
	.rxarvalid(munoc_signal_11),
	.rxarready(munoc_signal_02),

	.rxrid(munoc_signal_03),
	.rxrdata(munoc_signal_33),
	.rxrresp(munoc_signal_29),
	.rxrlast(munoc_signal_23),
	.rxrvalid(munoc_signal_47),
	.rxrready(munoc_signal_22),

	.spaddr(munoc_signal_20),
	.spwrite(munoc_signal_42),
	.spsel(munoc_signal_19),
	.spenable(munoc_signal_27),
	.spwdata(munoc_signal_26),
	.sptid(munoc_signal_07),
	.sprdata(munoc_signal_35),
	.spready(munoc_signal_49),
	.spslverr(munoc_signal_40),
	.spwstrb()
);

assign munoc_signal_08 = munoc_signal_07[MUNOC_LPARA_0-1-:`BW_MASTER_NODE_ID];

MUNOC_MODULE_09
#(
	.MUNOC_GPARA_0(BW_PLATFORM_ADDR),
	.MUNOC_GPARA_1(MUNOC_LPARA_1),
	.NOC_CONTROLLER_BASEADDR(NOC_CONTROLLER_BASEADDR)
)
i_munoc_instance_1
(
	.munoc_port_14(clk_debug),
	.munoc_port_09(rstnn_debug),

	.munoc_port_05(svri_slink),
	.munoc_port_01(svri_sack),
	.munoc_port_11(svri_rlink),
	.munoc_port_04(svri_rack),
	
	.munoc_port_08(munoc_signal_14),
	.munoc_port_10(munoc_signal_41),
	.munoc_port_06(munoc_signal_16),
	.munoc_port_07(munoc_signal_45),
	.munoc_port_13(munoc_signal_28),
	.munoc_port_00(munoc_signal_05),
	.munoc_port_02(munoc_signal_21),
	.munoc_port_12(munoc_signal_01),
	.munoc_port_03(munoc_signal_13)
);

always@(posedge clk_debug, negedge rstnn_debug)
begin
	if(rstnn_debug==0)
	begin
		munoc_signal_30 <= `MUNOC_LDEF_1;
		munoc_signal_01 <= 0;
	end
	else
	begin
		case(munoc_signal_30)
			`MUNOC_LDEF_1:
				if(munoc_signal_01==0)
				begin
					if((USE_JTAG_INTERFACE) && debug_rpsel && debug_rpenable)
					begin
						munoc_signal_30 <= `MUNOC_LDEF_2;
						munoc_signal_01 <= 1;
					end
					else if((USE_SW_INTERFACE) && munoc_signal_19 && munoc_signal_27)
					begin
						munoc_signal_30 <= `MUNOC_LDEF_2;
						munoc_signal_01 <= 0;
					end
				end
				else
				begin
					if((USE_SW_INTERFACE) && munoc_signal_19 && munoc_signal_27)
					begin
						munoc_signal_30 <= `MUNOC_LDEF_2;
						munoc_signal_01 <= 0;
					end
					else if((USE_JTAG_INTERFACE) && debug_rpsel && debug_rpenable)
					begin
						munoc_signal_30 <= `MUNOC_LDEF_2;
						munoc_signal_01 <= 1;
					end
				end
			`MUNOC_LDEF_2:
				if(munoc_signal_28)
					munoc_signal_30 <= `MUNOC_LDEF_1;
		endcase
	end
end

assign munoc_signal_14 = (munoc_signal_30==`MUNOC_LDEF_2);

assign munoc_signal_41 = (munoc_signal_01)? debug_rpaddr : munoc_signal_20;
assign munoc_signal_16 = (munoc_signal_01)? debug_rpwrite : munoc_signal_42;
assign munoc_signal_45 = (munoc_signal_01)? debug_rpwdata : munoc_signal_26;

assign munoc_signal_13 = munoc_signal_08;

assign munoc_signal_49 = munoc_signal_28;
assign debug_rpready = munoc_signal_28;

assign munoc_signal_35 = munoc_signal_05;
assign debug_rprdata = munoc_signal_05;

assign munoc_signal_40 = munoc_signal_21;
assign debug_rpslverr = munoc_signal_21;

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
endmodule
