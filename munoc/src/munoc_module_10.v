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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_10
(
	munoc_port_35,
	munoc_port_61,

	munoc_port_69,
	munoc_port_03,
	munoc_port_17,
	munoc_port_22,
	munoc_port_43,
	munoc_port_25,
	munoc_port_06,

	munoc_port_47,
	munoc_port_57,
	munoc_port_63,
	munoc_port_28,
	munoc_port_01,
	munoc_port_37, 

	munoc_port_11,
	munoc_port_33,
	munoc_port_70,
	munoc_port_66,

	munoc_port_53,
	munoc_port_54,
	munoc_port_38,
	munoc_port_46,
	munoc_port_68,
	munoc_port_41,
	munoc_port_29,

	munoc_port_56,
	munoc_port_27,
	munoc_port_08,
	munoc_port_05,
	munoc_port_12,
	munoc_port_36,

	munoc_port_49,
	munoc_port_51,
	munoc_port_32,
	munoc_port_42,
	munoc_port_23,
	munoc_port_58,
	munoc_port_64,

	munoc_port_24,
	munoc_port_62,
	munoc_port_48,
	munoc_port_07,
	munoc_port_10,
	munoc_port_09, 

	munoc_port_67,
	munoc_port_31,
	munoc_port_19,
	munoc_port_30,

	munoc_port_18,
	munoc_port_52,
	munoc_port_02,
	munoc_port_20,
	munoc_port_44,
	munoc_port_16,
	munoc_port_59,

	munoc_port_15,
	munoc_port_65,
	munoc_port_21,
	munoc_port_45,
	munoc_port_00,
	munoc_port_04,

	munoc_port_60,
	munoc_port_55,
	munoc_port_13,
	munoc_port_50,
	munoc_port_14,
	munoc_port_39,
	munoc_port_40,
	munoc_port_26,
	munoc_port_34
);





parameter MUNOC_GPARA_4 = 32;
parameter MUNOC_GPARA_5 = 32;
parameter MUNOC_GPARA_1 = `DEFAULT_BW_AXI_TID;

parameter MUNOC_GPARA_0 = 0;
parameter MUNOC_GPARA_6 = 4;
parameter MUNOC_GPARA_2 = 4'h f;
parameter MUNOC_GPARA_3 = 0;

localparam  MUNOC_LPARA_0 = 4;

input wire munoc_port_35;
input wire munoc_port_61;

input wire [MUNOC_GPARA_1-1:0] munoc_port_69;
input wire [MUNOC_GPARA_4-1:0] munoc_port_03;
input wire [`BW_AXI_ALEN-1:0] munoc_port_17;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_22;
input wire [`BW_AXI_ABURST-1:0] munoc_port_43;
input wire munoc_port_25;
output reg munoc_port_06;

input wire [MUNOC_GPARA_1-1:0] munoc_port_47;
input wire [MUNOC_GPARA_5-1:0] munoc_port_57;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_63;
input wire munoc_port_28;
input wire munoc_port_01;
output reg munoc_port_37;

output wire [MUNOC_GPARA_1-1:0] munoc_port_11;
output wire [`BW_AXI_BRESP-1:0] munoc_port_33;
output wire munoc_port_70;
input wire munoc_port_66;

input wire [MUNOC_GPARA_1-1:0] munoc_port_53;
input wire [MUNOC_GPARA_4-1:0] munoc_port_54;
input wire [`BW_AXI_ALEN-1:0] munoc_port_38;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_46;
input wire [`BW_AXI_ABURST-1:0] munoc_port_68;
input wire munoc_port_41;
output wire munoc_port_29;

output wire [MUNOC_GPARA_1-1:0] munoc_port_56;
output wire [MUNOC_GPARA_5-1:0] munoc_port_27;
output wire [`BW_AXI_RRESP-1:0] munoc_port_08;
output wire munoc_port_05;
output wire munoc_port_12;
input wire munoc_port_36;

output wire [MUNOC_GPARA_1-1:0] munoc_port_49;
output wire [MUNOC_GPARA_4-1:0] munoc_port_51;
output wire [`BW_AXI_ALEN-1:0] munoc_port_32;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_42;
output wire [`BW_AXI_ABURST-1:0] munoc_port_23;
output reg munoc_port_58;
input wire munoc_port_64;

output wire [MUNOC_GPARA_1-1:0] munoc_port_24;
output wire [MUNOC_GPARA_5-1:0] munoc_port_62;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_48;
output wire munoc_port_07;
output reg munoc_port_10;
input wire munoc_port_09;

input wire [MUNOC_GPARA_1-1:0] munoc_port_67;
input wire [`BW_AXI_BRESP-1:0] munoc_port_31;
input wire munoc_port_19;
output wire munoc_port_30;

output wire [MUNOC_GPARA_1-1:0] munoc_port_18;
output wire [MUNOC_GPARA_4-1:0] munoc_port_52;
output wire [`BW_AXI_ALEN-1:0] munoc_port_02;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_20;
output wire [`BW_AXI_ABURST-1:0] munoc_port_44;
output wire munoc_port_16;
input wire munoc_port_59;

input wire [MUNOC_GPARA_1-1:0] munoc_port_15;
input wire [MUNOC_GPARA_5-1:0] munoc_port_65;
input wire [`BW_AXI_RRESP-1:0] munoc_port_21;
input wire munoc_port_45;
input wire munoc_port_00;
output wire munoc_port_04;

output wire [MUNOC_GPARA_4-1:0] munoc_port_60;
output wire munoc_port_55;
output wire munoc_port_13;
output wire munoc_port_50;
output wire [MUNOC_GPARA_5-1:0] munoc_port_14;
input wire [MUNOC_GPARA_5-1:0] munoc_port_39;
input wire munoc_port_40;
input wire munoc_port_26;
output reg munoc_port_34;

wire [MUNOC_GPARA_1-1:0] munoc_signal_06;
wire [MUNOC_GPARA_4-1:0] munoc_signal_52;
wire [`BW_AXI_ALEN-1:0] munoc_signal_10;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_32;
wire [`BW_AXI_ABURST-1:0] munoc_signal_43;
reg munoc_signal_30;
wire munoc_signal_51;

wire [MUNOC_GPARA_1-1:0] munoc_signal_65;
wire [MUNOC_GPARA_5-1:0] munoc_signal_48;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_signal_46;
wire munoc_signal_38;
reg munoc_signal_01;
wire munoc_signal_33;

wire [MUNOC_GPARA_1-1:0] munoc_signal_11;
wire [`BW_AXI_BRESP-1:0] munoc_signal_34;
wire munoc_signal_04;
wire munoc_signal_64;

wire [MUNOC_GPARA_1-1:0] munoc_signal_40;
wire [MUNOC_GPARA_4-1:0] munoc_signal_54;
wire [`BW_AXI_ALEN-1:0] munoc_signal_42;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_07;
wire [`BW_AXI_ABURST-1:0] munoc_signal_08;
wire munoc_signal_22;
wire munoc_signal_31;

wire [MUNOC_GPARA_1-1:0] munoc_signal_09;
wire [MUNOC_GPARA_5-1:0] munoc_signal_25;
wire [`BW_AXI_RRESP-1:0] munoc_signal_44;
wire munoc_signal_61;
wire munoc_signal_62;
wire munoc_signal_37;

wire munoc_signal_57;
wire munoc_signal_24;
wire munoc_signal_35;
wire munoc_signal_60;
wire munoc_signal_63;

`define MUNOC_LDEF_6 2
`define MUNOC_LDEF_4 3
`define MUNOC_LDEF_2 0
`define MUNOC_LDEF_5 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_1 3
`define MUNOC_LDEF_3 4

reg [`MUNOC_LDEF_6-1:0] munoc_signal_23;
reg munoc_signal_17;
wire munoc_signal_50;
wire munoc_signal_13;

wire munoc_signal_27;
wire munoc_signal_03;
wire munoc_signal_59;
wire munoc_signal_55;

wire munoc_signal_58;
wire munoc_signal_14;
wire munoc_signal_29;
wire munoc_signal_12;

wire munoc_signal_21;
wire munoc_signal_02;

reg [`MUNOC_LDEF_4-1:0] munoc_signal_00;
reg munoc_signal_39;
wire munoc_signal_26;
wire munoc_signal_18;

wire munoc_signal_19;
wire munoc_signal_16;
wire munoc_signal_47;
wire munoc_signal_41;

wire munoc_signal_36;
wire munoc_signal_45;
wire munoc_signal_15;
wire munoc_signal_28;

wire munoc_signal_53;
wire munoc_signal_20;

assign munoc_signal_06 = munoc_port_69;
assign munoc_signal_52 = munoc_port_03;
assign munoc_signal_10 = munoc_port_17;
assign munoc_signal_32 = munoc_port_22;
assign munoc_signal_43 = munoc_port_43;

assign munoc_signal_65 = munoc_port_47;
assign munoc_signal_48 = munoc_port_57;
assign munoc_signal_46 = munoc_port_63;
assign munoc_signal_38 = munoc_port_28;

assign munoc_signal_40 = munoc_port_53;
assign munoc_signal_54 = munoc_port_54;
assign munoc_signal_42 = munoc_port_38;
assign munoc_signal_07 = munoc_port_46;
assign munoc_signal_08 = munoc_port_68;

assign munoc_port_49 = munoc_port_69;
assign munoc_port_51 = munoc_port_03;
assign munoc_port_32 = munoc_port_17;
assign munoc_port_42 = munoc_port_22;
assign munoc_port_23 = munoc_port_43;

assign munoc_port_24 = munoc_port_47;
assign munoc_port_62 = munoc_port_57;
assign munoc_port_48 = munoc_port_63;
assign munoc_port_07 = munoc_port_28;

assign munoc_port_18 = munoc_port_53;
assign munoc_port_52 = munoc_port_54;
assign munoc_port_02 = munoc_port_38;
assign munoc_port_20 = munoc_port_46;
assign munoc_port_44 = munoc_port_68;

assign munoc_port_11 = munoc_signal_18? munoc_signal_11 : munoc_port_67;
assign munoc_port_33 = munoc_signal_18? munoc_signal_34 : munoc_port_31;

assign munoc_port_56 = munoc_signal_13? munoc_signal_09 : munoc_port_15;
assign munoc_port_27 = munoc_signal_13? munoc_signal_25 : munoc_port_65;
assign munoc_port_08 = munoc_signal_13? munoc_signal_44 : munoc_port_21;
assign munoc_port_05 = munoc_signal_13? munoc_signal_61 : munoc_port_45;

assign munoc_signal_57 = munoc_port_41 & munoc_port_29;
assign munoc_signal_24 = munoc_port_12 & munoc_port_36 & munoc_port_05;
assign munoc_signal_35 = munoc_port_25 & munoc_port_06;
assign munoc_signal_60 = munoc_port_01 & munoc_port_37 & munoc_port_28;
assign munoc_signal_63 = munoc_port_70 & munoc_port_66;

always@(posedge munoc_port_35, negedge munoc_port_61)
begin
	if(munoc_port_61==0)
	begin
		munoc_signal_23 <= `MUNOC_LDEF_2;
		munoc_signal_17 <= 0;
	end
	else
	begin
		case(munoc_signal_23)
			`MUNOC_LDEF_2:
				if(munoc_port_41)
				begin
					munoc_signal_17 <= munoc_signal_50;
					if(munoc_signal_50)
					begin
						if(munoc_signal_21)
							munoc_signal_23 <= `MUNOC_LDEF_0;
						else
							munoc_signal_23 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_02)
							munoc_signal_23 <= `MUNOC_LDEF_0;
						else
							munoc_signal_23 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_17)
				begin
					if(munoc_signal_21)
						munoc_signal_23 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_02)
						munoc_signal_23 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_57)
					munoc_signal_23 <= `MUNOC_LDEF_2;
		endcase
	end
end

assign munoc_signal_50 = (munoc_port_54[MUNOC_GPARA_4-1-:MUNOC_GPARA_6]==MUNOC_GPARA_2);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_2
(
	.clk(munoc_port_35),
	.rstnn(munoc_port_61),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_27),
	.wfull(munoc_signal_59),
	.wrequest(munoc_signal_03),
	.wdata(munoc_signal_55),
	.rready(munoc_signal_58),
	.rempty(munoc_signal_29),
	.rrequest(munoc_signal_14),
	.rdata(munoc_signal_12)
);

assign munoc_signal_03 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_57;
assign munoc_signal_55 = munoc_signal_50;
assign munoc_signal_14 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_24;
assign munoc_signal_13 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_12;

assign munoc_signal_21 = (~munoc_signal_59);
assign munoc_signal_02 = (~munoc_signal_59);

always@(posedge munoc_port_35, negedge munoc_port_61)
begin
	if(munoc_port_61==0)
	begin
		munoc_signal_00 <= `MUNOC_LDEF_2;
		munoc_signal_39 <= 0;
	end
	else
	begin
		case(munoc_signal_00)
			`MUNOC_LDEF_2:
				if(munoc_port_25)
				begin
					munoc_signal_39 <= munoc_signal_26;
					if(munoc_signal_26)
					begin
						if(munoc_signal_53)
							munoc_signal_00 <= `MUNOC_LDEF_0;
						else
							munoc_signal_00 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_20)
							munoc_signal_00 <= `MUNOC_LDEF_0;
						else
							munoc_signal_00 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_39)
				begin
					if(munoc_signal_53)
						munoc_signal_00 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_20)
						munoc_signal_00 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_35 && munoc_signal_60)
					munoc_signal_00 <= `MUNOC_LDEF_2;
				else if(munoc_signal_35)
					munoc_signal_00 <= `MUNOC_LDEF_3;
				else if(munoc_signal_60)
					munoc_signal_00 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_1:
				if(munoc_signal_35)
					munoc_signal_00 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_3:
				if(munoc_signal_60)
					munoc_signal_00 <= `MUNOC_LDEF_2;
		endcase
	end
end

assign munoc_signal_26 = (munoc_port_03[MUNOC_GPARA_4-1-:MUNOC_GPARA_6]==MUNOC_GPARA_2);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_0
(
	.clk(munoc_port_35),
	.rstnn(munoc_port_61),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_19),
	.wfull(munoc_signal_47),
	.wrequest(munoc_signal_16),
	.wdata(munoc_signal_41),
	.rready(munoc_signal_36),
	.rempty(munoc_signal_15),
	.rrequest(munoc_signal_45),
	.rdata(munoc_signal_28)
);

assign munoc_signal_16 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_35;
assign munoc_signal_41 = munoc_signal_26;
assign munoc_signal_45 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_63;
assign munoc_signal_18 = (MUNOC_GPARA_0==0)? 0 : munoc_signal_28;

assign munoc_signal_53 = (~munoc_signal_47);
assign munoc_signal_20 = (~munoc_signal_47);

assign munoc_signal_22 = (MUNOC_GPARA_0==0)? 0 : ((munoc_signal_23==`MUNOC_LDEF_0) & munoc_signal_17);
assign munoc_port_16 = (MUNOC_GPARA_0==0)? munoc_port_41 : ((munoc_signal_23==`MUNOC_LDEF_0) & (~munoc_signal_17));
assign munoc_port_29 = (MUNOC_GPARA_0==0)? munoc_port_59 : (munoc_signal_23==`MUNOC_LDEF_0) & (((munoc_signal_17) & munoc_signal_31) | ((~munoc_signal_17) & munoc_port_59));

assign munoc_signal_37 = (MUNOC_GPARA_0==0)? 0 : (munoc_signal_58 & (munoc_signal_13) & munoc_port_36);
assign munoc_port_04 = (MUNOC_GPARA_0==0)? munoc_port_36 : (munoc_signal_58 & (~munoc_signal_13) & munoc_port_36);
assign munoc_port_12 = (MUNOC_GPARA_0==0)? munoc_port_00 : (munoc_signal_58 & (((munoc_signal_13) & munoc_signal_62) | ((~munoc_signal_13) & munoc_port_00)));

always@(*)
begin
	munoc_signal_30 = 0;
	munoc_port_58 = 0;
	munoc_port_06 = 0;
	if(MUNOC_GPARA_0==0)
	begin
		munoc_port_58 = munoc_port_25;
		munoc_port_06 = munoc_port_64;
	end
	else
	begin
		case(munoc_signal_00)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_1:
			begin
				if(munoc_signal_39)
				begin
					munoc_signal_30 = 1'b 1;
					munoc_port_06 = munoc_signal_51;
				end
				else
				begin
					munoc_port_58 = 1'b 1;
					munoc_port_06 = munoc_port_64;
				end
			end
		endcase
	end
end

always@(*)
begin
	munoc_signal_01 = 0;
	munoc_port_10 = 0;
	munoc_port_37 = 0;
	if(MUNOC_GPARA_0==0)
	begin
		munoc_port_10 = munoc_port_01;
		munoc_port_37 = munoc_port_09;
	end
	else
	begin
		case(munoc_signal_00)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_3:
			begin
				if(munoc_signal_39)
				begin
					munoc_signal_01 = munoc_port_01;
					munoc_port_37 = munoc_signal_33;
				end
				else
				begin
					munoc_port_10 = munoc_port_01;
					munoc_port_37 = munoc_port_09;
				end
			end
		endcase
	end
end

assign munoc_signal_64 = (MUNOC_GPARA_0==0)? 0 : (munoc_signal_36 & (munoc_signal_18) & munoc_port_66);
assign munoc_port_30 = (MUNOC_GPARA_0==0)? munoc_port_66 : (munoc_signal_36 & (~munoc_signal_18) & munoc_port_66);
assign munoc_port_70 = (MUNOC_GPARA_0==0)? munoc_port_19 : (munoc_signal_36 & (((munoc_signal_18) & munoc_signal_04) | ((~munoc_signal_18) & munoc_port_19)));

localparam  MUNOC_LPARA_2 = 32;
localparam  MUNOC_LPARA_1 = MUNOC_GPARA_5/MUNOC_LPARA_2;

wire [MUNOC_GPARA_5-1:0] munoc_signal_49;
wire [MUNOC_GPARA_5-1:0] munoc_signal_05;

generate
if(MUNOC_LPARA_1>1)
begin : i_local_lane
	wire [$clog2(MUNOC_LPARA_1)-1:0] lane = munoc_port_60[2+:$clog2(MUNOC_LPARA_1)];
	assign munoc_port_14 = {MUNOC_LPARA_1{munoc_signal_49[lane*MUNOC_LPARA_2+:MUNOC_LPARA_2]}};
	assign munoc_signal_05 = {MUNOC_LPARA_1{munoc_port_39[MUNOC_LPARA_2-1:0]}};
end
else
begin : i_no_local_lane
	assign munoc_port_14 = munoc_signal_49;
	assign munoc_signal_05 = munoc_port_39;
end
endgenerate

MUNOC_AXI2APB_BRIDGE
#(
	.BW_AXI_TID(MUNOC_GPARA_1),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_4),
	.BW_NODE_DATA(MUNOC_GPARA_5),
	.CHECK_WID(MUNOC_GPARA_3)
)
i_munoc_instance_1
(
	.clk(munoc_port_35),
	.rstnn(munoc_port_61),

	.rxawid(munoc_signal_06),
	.rxawaddr(munoc_signal_52),
	.rxawlen(munoc_signal_10),
	.rxawsize(munoc_signal_32),
	.rxawburst(munoc_signal_43),
	.rxawvalid(munoc_signal_30),
	.rxawready(munoc_signal_51),

	.rxwid(munoc_signal_65),
	.rxwdata(munoc_signal_48),
	.rxwstrb(munoc_signal_46),
	.rxwlast(munoc_signal_38),
	.rxwvalid(munoc_signal_01),
	.rxwready(munoc_signal_33),

	.rxbid(munoc_signal_11),
	.rxbresp(munoc_signal_34),
	.rxbvalid(munoc_signal_04),
	.rxbready(munoc_signal_64),

	.rxarid(munoc_signal_40),
	.rxaraddr(munoc_signal_54),
	.rxarlen(munoc_signal_42),
	.rxarsize(munoc_signal_07),
	.rxarburst(munoc_signal_08),
	.rxarvalid(munoc_signal_22),
	.rxarready(munoc_signal_31),

	.rxrid(munoc_signal_09),
	.rxrdata(munoc_signal_25),
	.rxrresp(munoc_signal_44),
	.rxrlast(munoc_signal_61),
	.rxrvalid(munoc_signal_62),
	.rxrready(munoc_signal_37),

	.spaddr(munoc_port_60),
	.spwrite(munoc_port_55),
	.spsel(munoc_port_13),
	.spenable(munoc_port_50),
	.spwdata(munoc_signal_49),
	.sptid(),
	.sprdata(munoc_signal_05),
	.spready(munoc_port_40),
	.spslverr(munoc_port_26),
	.spwstrb()
);

always@(*)
begin
	munoc_port_34 = 1;
	if(munoc_signal_13)
		if(munoc_port_00)
			munoc_port_34 = 0;
	if(munoc_signal_18)
		if(munoc_port_19)
			munoc_port_34 = 0;
end

endmodule
