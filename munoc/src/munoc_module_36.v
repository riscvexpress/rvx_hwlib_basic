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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_01.vh"
`include "ervp_axi_define.vh"





module MUNOC_MODULE_36
(
	munoc_port_45,
	munoc_port_64,

	munoc_port_44,
	munoc_port_29,
	munoc_port_06,
	munoc_port_32,
	munoc_port_24,
	munoc_port_49,
	munoc_port_25,

	munoc_port_12,
	munoc_port_14,
	munoc_port_28,
	munoc_port_56,
	munoc_port_04,
	munoc_port_19, 

	munoc_port_41,
	munoc_port_20,
	munoc_port_31,
	munoc_port_54,

	munoc_port_08,
	munoc_port_18,
	munoc_port_42,
	munoc_port_03,
	munoc_port_70,
	munoc_port_43,
	munoc_port_67,

	munoc_port_38,
	munoc_port_30,
	munoc_port_00,
	munoc_port_23,
	munoc_port_60,
	munoc_port_48,

	munoc_port_10,
	munoc_port_01,
	munoc_port_37,
	munoc_port_46,
	munoc_port_39,
	munoc_port_53,
	munoc_port_15,

	munoc_port_07,
	munoc_port_33,
	munoc_port_68,
	munoc_port_36,
	munoc_port_66,
	munoc_port_34, 

	munoc_port_21,
	munoc_port_65,
	munoc_port_27,
	munoc_port_52,

	munoc_port_62,
	munoc_port_55,
	munoc_port_35,
	munoc_port_40,
	munoc_port_69,
	munoc_port_05,
	munoc_port_57,

	munoc_port_17,
	munoc_port_09,
	munoc_port_22,
	munoc_port_58,
	munoc_port_51,
	munoc_port_26,

	munoc_port_61,
	munoc_port_11,
	munoc_port_02,
	munoc_port_59,
	munoc_port_16,
	munoc_port_47,
	munoc_port_13,
	munoc_port_50,
	munoc_port_63
);





parameter MUNOC_GPARA_4 = 32;
parameter MUNOC_GPARA_3 = 32;
parameter MUNOC_GPARA_5 = `DEFAULT_BW_AXI_TID;

parameter MUNOC_GPARA_2 = 0;
parameter MUNOC_GPARA_0 = 4;
parameter MUNOC_GPARA_6 = 4'h f;
parameter MUNOC_GPARA_1 = 0;

localparam  MUNOC_LPARA_0 = 4;

input wire munoc_port_45;
input wire munoc_port_64;

input wire [MUNOC_GPARA_5-1:0] munoc_port_44;
input wire [MUNOC_GPARA_4-1:0] munoc_port_29;
input wire [`BW_AXI_ALEN-1:0] munoc_port_06;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_32;
input wire [`BW_AXI_ABURST-1:0] munoc_port_24;
input wire munoc_port_49;
output reg munoc_port_25;

input wire [MUNOC_GPARA_5-1:0] munoc_port_12;
input wire [MUNOC_GPARA_3-1:0] munoc_port_14;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_28;
input wire munoc_port_56;
input wire munoc_port_04;
output reg munoc_port_19;

output wire [MUNOC_GPARA_5-1:0] munoc_port_41;
output wire [`BW_AXI_BRESP-1:0] munoc_port_20;
output wire munoc_port_31;
input wire munoc_port_54;

input wire [MUNOC_GPARA_5-1:0] munoc_port_08;
input wire [MUNOC_GPARA_4-1:0] munoc_port_18;
input wire [`BW_AXI_ALEN-1:0] munoc_port_42;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_03;
input wire [`BW_AXI_ABURST-1:0] munoc_port_70;
input wire munoc_port_43;
output wire munoc_port_67;

output wire [MUNOC_GPARA_5-1:0] munoc_port_38;
output wire [MUNOC_GPARA_3-1:0] munoc_port_30;
output wire [`BW_AXI_RRESP-1:0] munoc_port_00;
output wire munoc_port_23;
output wire munoc_port_60;
input wire munoc_port_48;

output wire [MUNOC_GPARA_5-1:0] munoc_port_10;
output wire [MUNOC_GPARA_4-1:0] munoc_port_01;
output wire [`BW_AXI_ALEN-1:0] munoc_port_37;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_46;
output wire [`BW_AXI_ABURST-1:0] munoc_port_39;
output reg munoc_port_53;
input wire munoc_port_15;

output wire [MUNOC_GPARA_5-1:0] munoc_port_07;
output wire [MUNOC_GPARA_3-1:0] munoc_port_33;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_68;
output wire munoc_port_36;
output reg munoc_port_66;
input wire munoc_port_34;

input wire [MUNOC_GPARA_5-1:0] munoc_port_21;
input wire [`BW_AXI_BRESP-1:0] munoc_port_65;
input wire munoc_port_27;
output wire munoc_port_52;

output wire [MUNOC_GPARA_5-1:0] munoc_port_62;
output wire [MUNOC_GPARA_4-1:0] munoc_port_55;
output wire [`BW_AXI_ALEN-1:0] munoc_port_35;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_40;
output wire [`BW_AXI_ABURST-1:0] munoc_port_69;
output wire munoc_port_05;
input wire munoc_port_57;

input wire [MUNOC_GPARA_5-1:0] munoc_port_17;
input wire [MUNOC_GPARA_3-1:0] munoc_port_09;
input wire [`BW_AXI_RRESP-1:0] munoc_port_22;
input wire munoc_port_58;
input wire munoc_port_51;
output wire munoc_port_26;

output wire [MUNOC_GPARA_4-1:0] munoc_port_61;
output wire munoc_port_11;
output wire munoc_port_02;
output wire munoc_port_59;
output wire [MUNOC_GPARA_3-1:0] munoc_port_16;
input wire [MUNOC_GPARA_3-1:0] munoc_port_47;
input wire munoc_port_13;
input wire munoc_port_50;
output reg munoc_port_63;

wire [MUNOC_GPARA_5-1:0] munoc_signal_11;
wire [MUNOC_GPARA_4-1:0] munoc_signal_61;
wire [`BW_AXI_ALEN-1:0] munoc_signal_58;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_22;
wire [`BW_AXI_ABURST-1:0] munoc_signal_25;
reg munoc_signal_19;
wire munoc_signal_37;

wire [MUNOC_GPARA_5-1:0] munoc_signal_36;
wire [MUNOC_GPARA_3-1:0] munoc_signal_54;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_60;
wire munoc_signal_57;
reg munoc_signal_17;
wire munoc_signal_49;

wire [MUNOC_GPARA_5-1:0] munoc_signal_14;
wire [`BW_AXI_BRESP-1:0] munoc_signal_32;
wire munoc_signal_51;
wire munoc_signal_24;

wire [MUNOC_GPARA_5-1:0] munoc_signal_23;
wire [MUNOC_GPARA_4-1:0] munoc_signal_29;
wire [`BW_AXI_ALEN-1:0] munoc_signal_53;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_20;
wire [`BW_AXI_ABURST-1:0] munoc_signal_04;
wire munoc_signal_16;
wire munoc_signal_44;

wire [MUNOC_GPARA_5-1:0] munoc_signal_21;
wire [MUNOC_GPARA_3-1:0] munoc_signal_38;
wire [`BW_AXI_RRESP-1:0] munoc_signal_02;
wire munoc_signal_35;
wire munoc_signal_18;
wire munoc_signal_27;

wire munoc_signal_15;
wire munoc_signal_28;
wire munoc_signal_46;
wire munoc_signal_40;
wire munoc_signal_41;

`define MUNOC_LDEF_1 2
`define MUNOC_LDEF_2 3
`define MUNOC_LDEF_5 0
`define MUNOC_LDEF_6 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_4 3
`define MUNOC_LDEF_3 4

reg [`MUNOC_LDEF_1-1:0] munoc_signal_13;
reg munoc_signal_00;
wire munoc_signal_09;
wire munoc_signal_42;

wire munoc_signal_10;
wire munoc_signal_55;
wire munoc_signal_05;
wire munoc_signal_08;

wire munoc_signal_30;
wire munoc_signal_01;
wire munoc_signal_12;
wire munoc_signal_43;

wire munoc_signal_62;
wire munoc_signal_39;

reg [`MUNOC_LDEF_2-1:0] munoc_signal_03;
reg munoc_signal_26;
wire munoc_signal_47;
wire munoc_signal_07;

wire munoc_signal_52;
wire munoc_signal_06;
wire munoc_signal_31;
wire munoc_signal_45;

wire munoc_signal_50;
wire munoc_signal_56;
wire munoc_signal_48;
wire munoc_signal_34;

wire munoc_signal_59;
wire munoc_signal_33;

assign munoc_signal_11 = munoc_port_44;
assign munoc_signal_61 = munoc_port_29;
assign munoc_signal_58 = munoc_port_06;
assign munoc_signal_22 = munoc_port_32;
assign munoc_signal_25 = munoc_port_24;

assign munoc_signal_36 = munoc_port_12;
assign munoc_signal_54 = munoc_port_14;
assign munoc_signal_60 = munoc_port_28;
assign munoc_signal_57 = munoc_port_56;

assign munoc_signal_23 = munoc_port_08;
assign munoc_signal_29 = munoc_port_18;
assign munoc_signal_53 = munoc_port_42;
assign munoc_signal_20 = munoc_port_03;
assign munoc_signal_04 = munoc_port_70;

assign munoc_port_10 = munoc_port_44;
assign munoc_port_01 = munoc_port_29;
assign munoc_port_37 = munoc_port_06;
assign munoc_port_46 = munoc_port_32;
assign munoc_port_39 = munoc_port_24;

assign munoc_port_07 = munoc_port_12;
assign munoc_port_33 = munoc_port_14;
assign munoc_port_68 = munoc_port_28;
assign munoc_port_36 = munoc_port_56;

assign munoc_port_62 = munoc_port_08;
assign munoc_port_55 = munoc_port_18;
assign munoc_port_35 = munoc_port_42;
assign munoc_port_40 = munoc_port_03;
assign munoc_port_69 = munoc_port_70;

assign munoc_port_41 = munoc_signal_07? munoc_signal_14 : munoc_port_21;
assign munoc_port_20 = munoc_signal_07? munoc_signal_32 : munoc_port_65;

assign munoc_port_38 = munoc_signal_42? munoc_signal_21 : munoc_port_17;
assign munoc_port_30 = munoc_signal_42? munoc_signal_38 : munoc_port_09;
assign munoc_port_00 = munoc_signal_42? munoc_signal_02 : munoc_port_22;
assign munoc_port_23 = munoc_signal_42? munoc_signal_35 : munoc_port_58;

assign munoc_signal_15 = munoc_port_43 & munoc_port_67;
assign munoc_signal_28 = munoc_port_60 & munoc_port_48 & munoc_port_23;
assign munoc_signal_46 = munoc_port_49 & munoc_port_25;
assign munoc_signal_40 = munoc_port_04 & munoc_port_19 & munoc_port_56;
assign munoc_signal_41 = munoc_port_31 & munoc_port_54;

always@(posedge munoc_port_45, negedge munoc_port_64)
begin
	if(munoc_port_64==0)
	begin
		munoc_signal_13 <= `MUNOC_LDEF_5;
		munoc_signal_00 <= 0;
	end
	else
	begin
		case(munoc_signal_13)
			`MUNOC_LDEF_5:
				if(munoc_port_43)
				begin
					munoc_signal_00 <= munoc_signal_09;
					if(munoc_signal_09)
					begin
						if(munoc_signal_62)
							munoc_signal_13 <= `MUNOC_LDEF_0;
						else
							munoc_signal_13 <= `MUNOC_LDEF_6;
					end
					else
					begin
						if(munoc_signal_39)
							munoc_signal_13 <= `MUNOC_LDEF_0;
						else
							munoc_signal_13 <= `MUNOC_LDEF_6;
					end
				end
			`MUNOC_LDEF_6:
				if(munoc_signal_00)
				begin
					if(munoc_signal_62)
						munoc_signal_13 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_39)
						munoc_signal_13 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_15)
					munoc_signal_13 <= `MUNOC_LDEF_5;
		endcase
	end
end

assign munoc_signal_09 = (munoc_port_18[MUNOC_GPARA_4-1-:MUNOC_GPARA_0]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_1
(
	.clk(munoc_port_45),
	.rstnn(munoc_port_64),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_10),
	.wfull(munoc_signal_05),
	.wrequest(munoc_signal_55),
	.wdata(munoc_signal_08),
	.rready(munoc_signal_30),
	.rempty(munoc_signal_12),
	.rrequest(munoc_signal_01),
	.rdata(munoc_signal_43)
);

assign munoc_signal_55 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_15;
assign munoc_signal_08 = munoc_signal_09;
assign munoc_signal_01 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_28;
assign munoc_signal_42 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_43;

assign munoc_signal_62 = (~munoc_signal_05);
assign munoc_signal_39 = (~munoc_signal_05);

always@(posedge munoc_port_45, negedge munoc_port_64)
begin
	if(munoc_port_64==0)
	begin
		munoc_signal_03 <= `MUNOC_LDEF_5;
		munoc_signal_26 <= 0;
	end
	else
	begin
		case(munoc_signal_03)
			`MUNOC_LDEF_5:
				if(munoc_port_49)
				begin
					munoc_signal_26 <= munoc_signal_47;
					if(munoc_signal_47)
					begin
						if(munoc_signal_59)
							munoc_signal_03 <= `MUNOC_LDEF_0;
						else
							munoc_signal_03 <= `MUNOC_LDEF_6;
					end
					else
					begin
						if(munoc_signal_33)
							munoc_signal_03 <= `MUNOC_LDEF_0;
						else
							munoc_signal_03 <= `MUNOC_LDEF_6;
					end
				end
			`MUNOC_LDEF_6:
				if(munoc_signal_26)
				begin
					if(munoc_signal_59)
						munoc_signal_03 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_33)
						munoc_signal_03 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_46 && munoc_signal_40)
					munoc_signal_03 <= `MUNOC_LDEF_5;
				else if(munoc_signal_46)
					munoc_signal_03 <= `MUNOC_LDEF_3;
				else if(munoc_signal_40)
					munoc_signal_03 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_4:
				if(munoc_signal_46)
					munoc_signal_03 <= `MUNOC_LDEF_5;
			`MUNOC_LDEF_3:
				if(munoc_signal_40)
					munoc_signal_03 <= `MUNOC_LDEF_5;
		endcase
	end
end

assign munoc_signal_47 = (munoc_port_29[MUNOC_GPARA_4-1-:MUNOC_GPARA_0]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_0
(
	.clk(munoc_port_45),
	.rstnn(munoc_port_64),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_52),
	.wfull(munoc_signal_31),
	.wrequest(munoc_signal_06),
	.wdata(munoc_signal_45),
	.rready(munoc_signal_50),
	.rempty(munoc_signal_48),
	.rrequest(munoc_signal_56),
	.rdata(munoc_signal_34)
);

assign munoc_signal_06 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_46;
assign munoc_signal_45 = munoc_signal_47;
assign munoc_signal_56 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_41;
assign munoc_signal_07 = (MUNOC_GPARA_2==0)? 0 : munoc_signal_34;

assign munoc_signal_59 = (~munoc_signal_31);
assign munoc_signal_33 = (~munoc_signal_31);

assign munoc_signal_16 = (MUNOC_GPARA_2==0)? 0 : ((munoc_signal_13==`MUNOC_LDEF_0) & munoc_signal_00);
assign munoc_port_05 = (MUNOC_GPARA_2==0)? munoc_port_43 : ((munoc_signal_13==`MUNOC_LDEF_0) & (~munoc_signal_00));
assign munoc_port_67 = (MUNOC_GPARA_2==0)? munoc_port_57 : (munoc_signal_13==`MUNOC_LDEF_0) & (((munoc_signal_00) & munoc_signal_44) | ((~munoc_signal_00) & munoc_port_57));

assign munoc_signal_27 = (MUNOC_GPARA_2==0)? 0 : (munoc_signal_30 & (munoc_signal_42) & munoc_port_48);
assign munoc_port_26 = (MUNOC_GPARA_2==0)? munoc_port_48 : (munoc_signal_30 & (~munoc_signal_42) & munoc_port_48);
assign munoc_port_60 = (MUNOC_GPARA_2==0)? munoc_port_51 : (munoc_signal_30 & (((munoc_signal_42) & munoc_signal_18) | ((~munoc_signal_42) & munoc_port_51)));

always@(*)
begin
	munoc_signal_19 = 0;
	munoc_port_53 = 0;
	munoc_port_25 = 0;
	if(MUNOC_GPARA_2==0)
	begin
		munoc_port_53 = munoc_port_49;
		munoc_port_25 = munoc_port_15;
	end
	else
	begin
		case(munoc_signal_03)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_4:
			begin
				if(munoc_signal_26)
				begin
					munoc_signal_19 = 1'b 1;
					munoc_port_25 = munoc_signal_37;
				end
				else
				begin
					munoc_port_53 = 1'b 1;
					munoc_port_25 = munoc_port_15;
				end
			end
		endcase
	end
end

always@(*)
begin
	munoc_signal_17 = 0;
	munoc_port_66 = 0;
	munoc_port_19 = 0;
	if(MUNOC_GPARA_2==0)
	begin
		munoc_port_66 = munoc_port_04;
		munoc_port_19 = munoc_port_34;
	end
	else
	begin
		case(munoc_signal_03)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_3:
			begin
				if(munoc_signal_26)
				begin
					munoc_signal_17 = munoc_port_04;
					munoc_port_19 = munoc_signal_49;
				end
				else
				begin
					munoc_port_66 = munoc_port_04;
					munoc_port_19 = munoc_port_34;
				end
			end
		endcase
	end
end

assign munoc_signal_24 = (MUNOC_GPARA_2==0)? 0 : (munoc_signal_50 & (munoc_signal_07) & munoc_port_54);
assign munoc_port_52 = (MUNOC_GPARA_2==0)? munoc_port_54 : (munoc_signal_50 & (~munoc_signal_07) & munoc_port_54);
assign munoc_port_31 = (MUNOC_GPARA_2==0)? munoc_port_27 : (munoc_signal_50 & (((munoc_signal_07) & munoc_signal_51) | ((~munoc_signal_07) & munoc_port_27)));

MUNOC_AXI2APB_BRIDGE
#(
	.BW_AXI_TID(MUNOC_GPARA_5),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_4),
	.BW_NODE_DATA(MUNOC_GPARA_3),
	.CHECK_WID(MUNOC_GPARA_1)
)
i_munoc_instance_2
(
	.clk(munoc_port_45),
	.rstnn(munoc_port_64),

	.rxawid(munoc_signal_11),
	.rxawaddr(munoc_signal_61),
	.rxawlen(munoc_signal_58),
	.rxawsize(munoc_signal_22),
	.rxawburst(munoc_signal_25),
	.rxawvalid(munoc_signal_19),
	.rxawready(munoc_signal_37),

	.rxwid(munoc_signal_36),
	.rxwdata(munoc_signal_54),
	.rxwstrb(munoc_signal_60),
	.rxwlast(munoc_signal_57),
	.rxwvalid(munoc_signal_17),
	.rxwready(munoc_signal_49),

	.rxbid(munoc_signal_14),
	.rxbresp(munoc_signal_32),
	.rxbvalid(munoc_signal_51),
	.rxbready(munoc_signal_24),

	.rxarid(munoc_signal_23),
	.rxaraddr(munoc_signal_29),
	.rxarlen(munoc_signal_53),
	.rxarsize(munoc_signal_20),
	.rxarburst(munoc_signal_04),
	.rxarvalid(munoc_signal_16),
	.rxarready(munoc_signal_44),

	.rxrid(munoc_signal_21),
	.rxrdata(munoc_signal_38),
	.rxrresp(munoc_signal_02),
	.rxrlast(munoc_signal_35),
	.rxrvalid(munoc_signal_18),
	.rxrready(munoc_signal_27),

	.spaddr(munoc_port_61),
	.spwrite(munoc_port_11),
	.spsel(munoc_port_02),
	.spenable(munoc_port_59),
	.spwdata(munoc_port_16),
	.sptid(),
	.sprdata(munoc_port_47),
	.spready(munoc_port_13),
	.spslverr(munoc_port_50),
	.spwstrb()
);

always@(*)
begin
	munoc_port_63 = 1;
	if(munoc_signal_42)
		if(munoc_port_51)
			munoc_port_63 = 0;
	if(munoc_signal_07)
		if(munoc_port_27)
			munoc_port_63 = 0;
end

endmodule
