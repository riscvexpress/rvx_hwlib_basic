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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_16
(
	munoc_port_63,
	munoc_port_38,

	munoc_port_26,
	munoc_port_51,
	munoc_port_47,
	munoc_port_05,
	munoc_port_19,
	munoc_port_20,
	munoc_port_70,

	munoc_port_39,
	munoc_port_29,
	munoc_port_50,
	munoc_port_69,
	munoc_port_13,
	munoc_port_11, 

	munoc_port_07,
	munoc_port_36,
	munoc_port_46,
	munoc_port_54,

	munoc_port_27,
	munoc_port_28,
	munoc_port_33,
	munoc_port_08,
	munoc_port_43,
	munoc_port_23,
	munoc_port_18,

	munoc_port_34,
	munoc_port_04,
	munoc_port_17,
	munoc_port_42,
	munoc_port_22,
	munoc_port_03,

	munoc_port_35,
	munoc_port_60,
	munoc_port_40,
	munoc_port_10,
	munoc_port_68,
	munoc_port_32,
	munoc_port_02,

	munoc_port_64,
	munoc_port_62,
	munoc_port_16,
	munoc_port_65,
	munoc_port_14,
	munoc_port_67, 

	munoc_port_01,
	munoc_port_21,
	munoc_port_52,
	munoc_port_44,

	munoc_port_41,
	munoc_port_49,
	munoc_port_56,
	munoc_port_15,
	munoc_port_12,
	munoc_port_09,
	munoc_port_45,

	munoc_port_61,
	munoc_port_59,
	munoc_port_37,
	munoc_port_06,
	munoc_port_24,
	munoc_port_00,

	munoc_port_53,
	munoc_port_30,
	munoc_port_48,
	munoc_port_66,
	munoc_port_31,
	munoc_port_57,
	munoc_port_25,
	munoc_port_55,
	munoc_port_58
);





parameter MUNOC_GPARA_1 = 32;
parameter MUNOC_GPARA_5 = 32;
parameter MUNOC_GPARA_0 = `DEFAULT_BW_AXI_TID;

parameter MUNOC_GPARA_3 = 0;
parameter MUNOC_GPARA_4 = 4;
parameter MUNOC_GPARA_6 = 4'h f;
parameter MUNOC_GPARA_2 = 0;

localparam  MUNOC_LPARA_0 = 4;

input wire munoc_port_63;
input wire munoc_port_38;

input wire [MUNOC_GPARA_0-1:0] munoc_port_26;
input wire [MUNOC_GPARA_1-1:0] munoc_port_51;
input wire [`BW_AXI_ALEN-1:0] munoc_port_47;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_05;
input wire [`BW_AXI_ABURST-1:0] munoc_port_19;
input wire munoc_port_20;
output reg munoc_port_70;

input wire [MUNOC_GPARA_0-1:0] munoc_port_39;
input wire [MUNOC_GPARA_5-1:0] munoc_port_29;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_50;
input wire munoc_port_69;
input wire munoc_port_13;
output reg munoc_port_11;

output wire [MUNOC_GPARA_0-1:0] munoc_port_07;
output wire [`BW_AXI_BRESP-1:0] munoc_port_36;
output wire munoc_port_46;
input wire munoc_port_54;

input wire [MUNOC_GPARA_0-1:0] munoc_port_27;
input wire [MUNOC_GPARA_1-1:0] munoc_port_28;
input wire [`BW_AXI_ALEN-1:0] munoc_port_33;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_08;
input wire [`BW_AXI_ABURST-1:0] munoc_port_43;
input wire munoc_port_23;
output wire munoc_port_18;

output wire [MUNOC_GPARA_0-1:0] munoc_port_34;
output wire [MUNOC_GPARA_5-1:0] munoc_port_04;
output wire [`BW_AXI_RRESP-1:0] munoc_port_17;
output wire munoc_port_42;
output wire munoc_port_22;
input wire munoc_port_03;

output wire [MUNOC_GPARA_0-1:0] munoc_port_35;
output wire [MUNOC_GPARA_1-1:0] munoc_port_60;
output wire [`BW_AXI_ALEN-1:0] munoc_port_40;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_10;
output wire [`BW_AXI_ABURST-1:0] munoc_port_68;
output reg munoc_port_32;
input wire munoc_port_02;

output wire [MUNOC_GPARA_0-1:0] munoc_port_64;
output wire [MUNOC_GPARA_5-1:0] munoc_port_62;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_16;
output wire munoc_port_65;
output reg munoc_port_14;
input wire munoc_port_67;

input wire [MUNOC_GPARA_0-1:0] munoc_port_01;
input wire [`BW_AXI_BRESP-1:0] munoc_port_21;
input wire munoc_port_52;
output wire munoc_port_44;

output wire [MUNOC_GPARA_0-1:0] munoc_port_41;
output wire [MUNOC_GPARA_1-1:0] munoc_port_49;
output wire [`BW_AXI_ALEN-1:0] munoc_port_56;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_15;
output wire [`BW_AXI_ABURST-1:0] munoc_port_12;
output wire munoc_port_09;
input wire munoc_port_45;

input wire [MUNOC_GPARA_0-1:0] munoc_port_61;
input wire [MUNOC_GPARA_5-1:0] munoc_port_59;
input wire [`BW_AXI_RRESP-1:0] munoc_port_37;
input wire munoc_port_06;
input wire munoc_port_24;
output wire munoc_port_00;

output wire [MUNOC_GPARA_1-1:0] munoc_port_53;
output wire munoc_port_30;
output wire munoc_port_48;
output wire munoc_port_66;
output wire [MUNOC_GPARA_5-1:0] munoc_port_31;
input wire [MUNOC_GPARA_5-1:0] munoc_port_57;
input wire munoc_port_25;
input wire munoc_port_55;
output reg munoc_port_58;

wire [MUNOC_GPARA_0-1:0] munoc_signal_24;
wire [MUNOC_GPARA_1-1:0] munoc_signal_56;
wire [`BW_AXI_ALEN-1:0] munoc_signal_52;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_04;
wire [`BW_AXI_ABURST-1:0] munoc_signal_51;
reg munoc_signal_37;
wire munoc_signal_10;

wire [MUNOC_GPARA_0-1:0] munoc_signal_44;
wire [MUNOC_GPARA_5-1:0] munoc_signal_15;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_signal_29;
wire munoc_signal_53;
reg munoc_signal_01;
wire munoc_signal_25;

wire [MUNOC_GPARA_0-1:0] munoc_signal_36;
wire [`BW_AXI_BRESP-1:0] munoc_signal_16;
wire munoc_signal_17;
wire munoc_signal_58;

wire [MUNOC_GPARA_0-1:0] munoc_signal_42;
wire [MUNOC_GPARA_1-1:0] munoc_signal_46;
wire [`BW_AXI_ALEN-1:0] munoc_signal_57;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_03;
wire [`BW_AXI_ABURST-1:0] munoc_signal_50;
wire munoc_signal_61;
wire munoc_signal_54;

wire [MUNOC_GPARA_0-1:0] munoc_signal_62;
wire [MUNOC_GPARA_5-1:0] munoc_signal_27;
wire [`BW_AXI_RRESP-1:0] munoc_signal_59;
wire munoc_signal_19;
wire munoc_signal_07;
wire munoc_signal_28;

wire munoc_signal_05;
wire munoc_signal_13;
wire munoc_signal_12;
wire munoc_signal_48;
wire munoc_signal_47;

`define MUNOC_LDEF_6 2
`define MUNOC_LDEF_5 3
`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_4 1
`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_2 3
`define MUNOC_LDEF_3 4

reg [`MUNOC_LDEF_6-1:0] munoc_signal_60;
reg munoc_signal_40;
wire munoc_signal_32;
wire munoc_signal_31;

wire munoc_signal_43;
wire munoc_signal_39;
wire munoc_signal_02;
wire munoc_signal_11;

wire munoc_signal_41;
wire munoc_signal_22;
wire munoc_signal_18;
wire munoc_signal_21;

wire munoc_signal_34;
wire munoc_signal_08;

reg [`MUNOC_LDEF_5-1:0] munoc_signal_06;
reg munoc_signal_49;
wire munoc_signal_33;
wire munoc_signal_23;

wire munoc_signal_35;
wire munoc_signal_45;
wire munoc_signal_38;
wire munoc_signal_20;

wire munoc_signal_00;
wire munoc_signal_09;
wire munoc_signal_14;
wire munoc_signal_26;

wire munoc_signal_55;
wire munoc_signal_30;

assign munoc_signal_24 = munoc_port_26;
assign munoc_signal_56 = munoc_port_51;
assign munoc_signal_52 = munoc_port_47;
assign munoc_signal_04 = munoc_port_05;
assign munoc_signal_51 = munoc_port_19;

assign munoc_signal_44 = munoc_port_39;
assign munoc_signal_15 = munoc_port_29;
assign munoc_signal_29 = munoc_port_50;
assign munoc_signal_53 = munoc_port_69;

assign munoc_signal_42 = munoc_port_27;
assign munoc_signal_46 = munoc_port_28;
assign munoc_signal_57 = munoc_port_33;
assign munoc_signal_03 = munoc_port_08;
assign munoc_signal_50 = munoc_port_43;

assign munoc_port_35 = munoc_port_26;
assign munoc_port_60 = munoc_port_51;
assign munoc_port_40 = munoc_port_47;
assign munoc_port_10 = munoc_port_05;
assign munoc_port_68 = munoc_port_19;

assign munoc_port_64 = munoc_port_39;
assign munoc_port_62 = munoc_port_29;
assign munoc_port_16 = munoc_port_50;
assign munoc_port_65 = munoc_port_69;

assign munoc_port_41 = munoc_port_27;
assign munoc_port_49 = munoc_port_28;
assign munoc_port_56 = munoc_port_33;
assign munoc_port_15 = munoc_port_08;
assign munoc_port_12 = munoc_port_43;

assign munoc_port_07 = munoc_signal_23? munoc_signal_36 : munoc_port_01;
assign munoc_port_36 = munoc_signal_23? munoc_signal_16 : munoc_port_21;

assign munoc_port_34 = munoc_signal_31? munoc_signal_62 : munoc_port_61;
assign munoc_port_04 = munoc_signal_31? munoc_signal_27 : munoc_port_59;
assign munoc_port_17 = munoc_signal_31? munoc_signal_59 : munoc_port_37;
assign munoc_port_42 = munoc_signal_31? munoc_signal_19 : munoc_port_06;

assign munoc_signal_05 = munoc_port_23 & munoc_port_18;
assign munoc_signal_13 = munoc_port_22 & munoc_port_03 & munoc_port_42;
assign munoc_signal_12 = munoc_port_20 & munoc_port_70;
assign munoc_signal_48 = munoc_port_13 & munoc_port_11 & munoc_port_69;
assign munoc_signal_47 = munoc_port_46 & munoc_port_54;

always@(posedge munoc_port_63, negedge munoc_port_38)
begin
	if(munoc_port_38==0)
	begin
		munoc_signal_60 <= `MUNOC_LDEF_0;
		munoc_signal_40 <= 0;
	end
	else
	begin
		case(munoc_signal_60)
			`MUNOC_LDEF_0:
				if(munoc_port_23)
				begin
					munoc_signal_40 <= munoc_signal_32;
					if(munoc_signal_32)
					begin
						if(munoc_signal_34)
							munoc_signal_60 <= `MUNOC_LDEF_1;
						else
							munoc_signal_60 <= `MUNOC_LDEF_4;
					end
					else
					begin
						if(munoc_signal_08)
							munoc_signal_60 <= `MUNOC_LDEF_1;
						else
							munoc_signal_60 <= `MUNOC_LDEF_4;
					end
				end
			`MUNOC_LDEF_4:
				if(munoc_signal_40)
				begin
					if(munoc_signal_34)
						munoc_signal_60 <= `MUNOC_LDEF_1;
				end
				else
				begin
					if(munoc_signal_08)
						munoc_signal_60 <= `MUNOC_LDEF_1;
				end
			`MUNOC_LDEF_1:
				if(munoc_signal_05)
					munoc_signal_60 <= `MUNOC_LDEF_0;
		endcase
	end
end

assign munoc_signal_32 = (munoc_port_28[MUNOC_GPARA_1-1-:MUNOC_GPARA_4]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_2
(
	.clk(munoc_port_63),
	.rstnn(munoc_port_38),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_43),
	.wfull(munoc_signal_02),
	.wrequest(munoc_signal_39),
	.wdata(munoc_signal_11),
	.rready(munoc_signal_41),
	.rempty(munoc_signal_18),
	.rrequest(munoc_signal_22),
	.rdata(munoc_signal_21)
);

assign munoc_signal_39 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_05;
assign munoc_signal_11 = munoc_signal_32;
assign munoc_signal_22 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_13;
assign munoc_signal_31 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_21;

assign munoc_signal_34 = (~munoc_signal_02);
assign munoc_signal_08 = (~munoc_signal_02);

always@(posedge munoc_port_63, negedge munoc_port_38)
begin
	if(munoc_port_38==0)
	begin
		munoc_signal_06 <= `MUNOC_LDEF_0;
		munoc_signal_49 <= 0;
	end
	else
	begin
		case(munoc_signal_06)
			`MUNOC_LDEF_0:
				if(munoc_port_20)
				begin
					munoc_signal_49 <= munoc_signal_33;
					if(munoc_signal_33)
					begin
						if(munoc_signal_55)
							munoc_signal_06 <= `MUNOC_LDEF_1;
						else
							munoc_signal_06 <= `MUNOC_LDEF_4;
					end
					else
					begin
						if(munoc_signal_30)
							munoc_signal_06 <= `MUNOC_LDEF_1;
						else
							munoc_signal_06 <= `MUNOC_LDEF_4;
					end
				end
			`MUNOC_LDEF_4:
				if(munoc_signal_49)
				begin
					if(munoc_signal_55)
						munoc_signal_06 <= `MUNOC_LDEF_1;
				end
				else
				begin
					if(munoc_signal_30)
						munoc_signal_06 <= `MUNOC_LDEF_1;
				end
			`MUNOC_LDEF_1:
				if(munoc_signal_12 && munoc_signal_48)
					munoc_signal_06 <= `MUNOC_LDEF_0;
				else if(munoc_signal_12)
					munoc_signal_06 <= `MUNOC_LDEF_3;
				else if(munoc_signal_48)
					munoc_signal_06 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_12)
					munoc_signal_06 <= `MUNOC_LDEF_0;
			`MUNOC_LDEF_3:
				if(munoc_signal_48)
					munoc_signal_06 <= `MUNOC_LDEF_0;
		endcase
	end
end

assign munoc_signal_33 = (munoc_port_51[MUNOC_GPARA_1-1-:MUNOC_GPARA_4]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_1
(
	.clk(munoc_port_63),
	.rstnn(munoc_port_38),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_35),
	.wfull(munoc_signal_38),
	.wrequest(munoc_signal_45),
	.wdata(munoc_signal_20),
	.rready(munoc_signal_00),
	.rempty(munoc_signal_14),
	.rrequest(munoc_signal_09),
	.rdata(munoc_signal_26)
);

assign munoc_signal_45 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_12;
assign munoc_signal_20 = munoc_signal_33;
assign munoc_signal_09 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_47;
assign munoc_signal_23 = (MUNOC_GPARA_3==0)? 0 : munoc_signal_26;

assign munoc_signal_55 = (~munoc_signal_38);
assign munoc_signal_30 = (~munoc_signal_38);

assign munoc_signal_61 = (MUNOC_GPARA_3==0)? 0 : ((munoc_signal_60==`MUNOC_LDEF_1) & munoc_signal_40);
assign munoc_port_09 = (MUNOC_GPARA_3==0)? munoc_port_23 : ((munoc_signal_60==`MUNOC_LDEF_1) & (~munoc_signal_40));
assign munoc_port_18 = (MUNOC_GPARA_3==0)? munoc_port_45 : (munoc_signal_60==`MUNOC_LDEF_1) & (((munoc_signal_40) & munoc_signal_54) | ((~munoc_signal_40) & munoc_port_45));

assign munoc_signal_28 = (MUNOC_GPARA_3==0)? 0 : (munoc_signal_41 & (munoc_signal_31) & munoc_port_03);
assign munoc_port_00 = (MUNOC_GPARA_3==0)? munoc_port_03 : (munoc_signal_41 & (~munoc_signal_31) & munoc_port_03);
assign munoc_port_22 = (MUNOC_GPARA_3==0)? munoc_port_24 : (munoc_signal_41 & (((munoc_signal_31) & munoc_signal_07) | ((~munoc_signal_31) & munoc_port_24)));

always@(*)
begin
	munoc_signal_37 = 0;
	munoc_port_32 = 0;
	munoc_port_70 = 0;
	if(MUNOC_GPARA_3==0)
	begin
		munoc_port_32 = munoc_port_20;
		munoc_port_70 = munoc_port_02;
	end
	else
	begin
		case(munoc_signal_06)
			`MUNOC_LDEF_1,
			`MUNOC_LDEF_2:
			begin
				if(munoc_signal_49)
				begin
					munoc_signal_37 = 1'b 1;
					munoc_port_70 = munoc_signal_10;
				end
				else
				begin
					munoc_port_32 = 1'b 1;
					munoc_port_70 = munoc_port_02;
				end
			end
		endcase
	end
end

always@(*)
begin
	munoc_signal_01 = 0;
	munoc_port_14 = 0;
	munoc_port_11 = 0;
	if(MUNOC_GPARA_3==0)
	begin
		munoc_port_14 = munoc_port_13;
		munoc_port_11 = munoc_port_67;
	end
	else
	begin
		case(munoc_signal_06)
			`MUNOC_LDEF_1,
			`MUNOC_LDEF_3:
			begin
				if(munoc_signal_49)
				begin
					munoc_signal_01 = munoc_port_13;
					munoc_port_11 = munoc_signal_25;
				end
				else
				begin
					munoc_port_14 = munoc_port_13;
					munoc_port_11 = munoc_port_67;
				end
			end
		endcase
	end
end

assign munoc_signal_58 = (MUNOC_GPARA_3==0)? 0 : (munoc_signal_00 & (munoc_signal_23) & munoc_port_54);
assign munoc_port_44 = (MUNOC_GPARA_3==0)? munoc_port_54 : (munoc_signal_00 & (~munoc_signal_23) & munoc_port_54);
assign munoc_port_46 = (MUNOC_GPARA_3==0)? munoc_port_52 : (munoc_signal_00 & (((munoc_signal_23) & munoc_signal_17) | ((~munoc_signal_23) & munoc_port_52)));

MUNOC_AXI2APB_BRIDGE
#(
	.BW_AXI_TID(MUNOC_GPARA_0),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_1),
	.BW_NODE_DATA(MUNOC_GPARA_5),
	.CHECK_WID(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.clk(munoc_port_63),
	.rstnn(munoc_port_38),

	.rxawid(munoc_signal_24),
	.rxawaddr(munoc_signal_56),
	.rxawlen(munoc_signal_52),
	.rxawsize(munoc_signal_04),
	.rxawburst(munoc_signal_51),
	.rxawvalid(munoc_signal_37),
	.rxawready(munoc_signal_10),

	.rxwid(munoc_signal_44),
	.rxwdata(munoc_signal_15),
	.rxwstrb(munoc_signal_29),
	.rxwlast(munoc_signal_53),
	.rxwvalid(munoc_signal_01),
	.rxwready(munoc_signal_25),

	.rxbid(munoc_signal_36),
	.rxbresp(munoc_signal_16),
	.rxbvalid(munoc_signal_17),
	.rxbready(munoc_signal_58),

	.rxarid(munoc_signal_42),
	.rxaraddr(munoc_signal_46),
	.rxarlen(munoc_signal_57),
	.rxarsize(munoc_signal_03),
	.rxarburst(munoc_signal_50),
	.rxarvalid(munoc_signal_61),
	.rxarready(munoc_signal_54),

	.rxrid(munoc_signal_62),
	.rxrdata(munoc_signal_27),
	.rxrresp(munoc_signal_59),
	.rxrlast(munoc_signal_19),
	.rxrvalid(munoc_signal_07),
	.rxrready(munoc_signal_28),

	.spaddr(munoc_port_53),
	.spwrite(munoc_port_30),
	.spsel(munoc_port_48),
	.spenable(munoc_port_66),
	.spwdata(munoc_port_31),
	.sptid(),
	.sprdata(munoc_port_57),
	.spready(munoc_port_25),
	.spslverr(munoc_port_55),
	.spwstrb()
);

always@(*)
begin
	munoc_port_58 = 1;
	if(munoc_signal_31)
		if(munoc_port_24)
			munoc_port_58 = 0;
	if(munoc_signal_23)
		if(munoc_port_52)
			munoc_port_58 = 0;
end

endmodule
