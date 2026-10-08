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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_32
(
	munoc_port_28,
	munoc_port_42,

	munoc_port_65,
	munoc_port_66,
	munoc_port_09,
	munoc_port_44,
	munoc_port_47,
	munoc_port_19,
	munoc_port_58,

	munoc_port_07,
	munoc_port_08,
	munoc_port_27,
	munoc_port_23,
	munoc_port_15,
	munoc_port_22, 

	munoc_port_35,
	munoc_port_33,
	munoc_port_59,
	munoc_port_46,

	munoc_port_04,
	munoc_port_39,
	munoc_port_52,
	munoc_port_01,
	munoc_port_36,
	munoc_port_02,
	munoc_port_43,

	munoc_port_32,
	munoc_port_20,
	munoc_port_48,
	munoc_port_45,
	munoc_port_49,
	munoc_port_14,

	munoc_port_17,
	munoc_port_57,
	munoc_port_34,
	munoc_port_29,
	munoc_port_50,
	munoc_port_26,
	munoc_port_41,

	munoc_port_18,
	munoc_port_10,
	munoc_port_24,
	munoc_port_31,
	munoc_port_21,
	munoc_port_16, 

	munoc_port_64,
	munoc_port_00,
	munoc_port_61,
	munoc_port_13,

	munoc_port_12,
	munoc_port_69,
	munoc_port_53,
	munoc_port_06,
	munoc_port_25,
	munoc_port_62,
	munoc_port_60,

	munoc_port_54,
	munoc_port_37,
	munoc_port_05,
	munoc_port_03,
	munoc_port_38,
	munoc_port_70,

	munoc_port_55,
	munoc_port_63,
	munoc_port_56,
	munoc_port_67,
	munoc_port_68,
	munoc_port_51,
	munoc_port_40,
	munoc_port_30,
	munoc_port_11
);





parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_5 = 32;
parameter MUNOC_GPARA_4 = `DEFAULT_BW_AXI_TID;

parameter MUNOC_GPARA_1 = 0;
parameter MUNOC_GPARA_3 = 4;
parameter MUNOC_GPARA_6 = 4'h f;
parameter MUNOC_GPARA_2 = 0;

localparam  MUNOC_LPARA_0 = 4;

input wire munoc_port_28;
input wire munoc_port_42;

input wire [MUNOC_GPARA_4-1:0] munoc_port_65;
input wire [MUNOC_GPARA_0-1:0] munoc_port_66;
input wire [`BW_AXI_ALEN-1:0] munoc_port_09;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_44;
input wire [`BW_AXI_ABURST-1:0] munoc_port_47;
input wire munoc_port_19;
output reg munoc_port_58;

input wire [MUNOC_GPARA_4-1:0] munoc_port_07;
input wire [MUNOC_GPARA_5-1:0] munoc_port_08;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_27;
input wire munoc_port_23;
input wire munoc_port_15;
output reg munoc_port_22;

output wire [MUNOC_GPARA_4-1:0] munoc_port_35;
output wire [`BW_AXI_BRESP-1:0] munoc_port_33;
output wire munoc_port_59;
input wire munoc_port_46;

input wire [MUNOC_GPARA_4-1:0] munoc_port_04;
input wire [MUNOC_GPARA_0-1:0] munoc_port_39;
input wire [`BW_AXI_ALEN-1:0] munoc_port_52;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_01;
input wire [`BW_AXI_ABURST-1:0] munoc_port_36;
input wire munoc_port_02;
output wire munoc_port_43;

output wire [MUNOC_GPARA_4-1:0] munoc_port_32;
output wire [MUNOC_GPARA_5-1:0] munoc_port_20;
output wire [`BW_AXI_RRESP-1:0] munoc_port_48;
output wire munoc_port_45;
output wire munoc_port_49;
input wire munoc_port_14;

output wire [MUNOC_GPARA_4-1:0] munoc_port_17;
output wire [MUNOC_GPARA_0-1:0] munoc_port_57;
output wire [`BW_AXI_ALEN-1:0] munoc_port_34;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_29;
output wire [`BW_AXI_ABURST-1:0] munoc_port_50;
output reg munoc_port_26;
input wire munoc_port_41;

output wire [MUNOC_GPARA_4-1:0] munoc_port_18;
output wire [MUNOC_GPARA_5-1:0] munoc_port_10;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_port_24;
output wire munoc_port_31;
output reg munoc_port_21;
input wire munoc_port_16;

input wire [MUNOC_GPARA_4-1:0] munoc_port_64;
input wire [`BW_AXI_BRESP-1:0] munoc_port_00;
input wire munoc_port_61;
output wire munoc_port_13;

output wire [MUNOC_GPARA_4-1:0] munoc_port_12;
output wire [MUNOC_GPARA_0-1:0] munoc_port_69;
output wire [`BW_AXI_ALEN-1:0] munoc_port_53;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_06;
output wire [`BW_AXI_ABURST-1:0] munoc_port_25;
output wire munoc_port_62;
input wire munoc_port_60;

input wire [MUNOC_GPARA_4-1:0] munoc_port_54;
input wire [MUNOC_GPARA_5-1:0] munoc_port_37;
input wire [`BW_AXI_RRESP-1:0] munoc_port_05;
input wire munoc_port_03;
input wire munoc_port_38;
output wire munoc_port_70;

output wire [MUNOC_GPARA_0-1:0] munoc_port_55;
output wire munoc_port_63;
output wire munoc_port_56;
output wire munoc_port_67;
output wire [MUNOC_GPARA_5-1:0] munoc_port_68;
input wire [MUNOC_GPARA_5-1:0] munoc_port_51;
input wire munoc_port_40;
input wire munoc_port_30;
output reg munoc_port_11;

wire [MUNOC_GPARA_4-1:0] munoc_signal_02;
wire [MUNOC_GPARA_0-1:0] munoc_signal_56;
wire [`BW_AXI_ALEN-1:0] munoc_signal_43;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_22;
wire [`BW_AXI_ABURST-1:0] munoc_signal_21;
reg munoc_signal_58;
wire munoc_signal_12;

wire [MUNOC_GPARA_4-1:0] munoc_signal_46;
wire [MUNOC_GPARA_5-1:0] munoc_signal_29;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_5)-1:0] munoc_signal_54;
wire munoc_signal_11;
reg munoc_signal_17;
wire munoc_signal_18;

wire [MUNOC_GPARA_4-1:0] munoc_signal_04;
wire [`BW_AXI_BRESP-1:0] munoc_signal_26;
wire munoc_signal_50;
wire munoc_signal_13;

wire [MUNOC_GPARA_4-1:0] munoc_signal_55;
wire [MUNOC_GPARA_0-1:0] munoc_signal_51;
wire [`BW_AXI_ALEN-1:0] munoc_signal_48;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_61;
wire [`BW_AXI_ABURST-1:0] munoc_signal_23;
wire munoc_signal_39;
wire munoc_signal_30;

wire [MUNOC_GPARA_4-1:0] munoc_signal_25;
wire [MUNOC_GPARA_5-1:0] munoc_signal_20;
wire [`BW_AXI_RRESP-1:0] munoc_signal_06;
wire munoc_signal_57;
wire munoc_signal_35;
wire munoc_signal_49;

wire munoc_signal_59;
wire munoc_signal_01;
wire munoc_signal_10;
wire munoc_signal_28;
wire munoc_signal_36;

`define MUNOC_LDEF_6 2
`define MUNOC_LDEF_0 3
`define MUNOC_LDEF_4 0
`define MUNOC_LDEF_5 1
`define MUNOC_LDEF_2 2
`define MUNOC_LDEF_3 3
`define MUNOC_LDEF_1 4

reg [`MUNOC_LDEF_6-1:0] munoc_signal_41;
reg munoc_signal_62;
wire munoc_signal_14;
wire munoc_signal_24;

wire munoc_signal_27;
wire munoc_signal_47;
wire munoc_signal_08;
wire munoc_signal_03;

wire munoc_signal_15;
wire munoc_signal_31;
wire munoc_signal_52;
wire munoc_signal_32;

wire munoc_signal_00;
wire munoc_signal_09;

reg [`MUNOC_LDEF_0-1:0] munoc_signal_34;
reg munoc_signal_07;
wire munoc_signal_40;
wire munoc_signal_37;

wire munoc_signal_60;
wire munoc_signal_33;
wire munoc_signal_16;
wire munoc_signal_05;

wire munoc_signal_42;
wire munoc_signal_38;
wire munoc_signal_45;
wire munoc_signal_19;

wire munoc_signal_53;
wire munoc_signal_44;

assign munoc_signal_02 = munoc_port_65;
assign munoc_signal_56 = munoc_port_66;
assign munoc_signal_43 = munoc_port_09;
assign munoc_signal_22 = munoc_port_44;
assign munoc_signal_21 = munoc_port_47;

assign munoc_signal_46 = munoc_port_07;
assign munoc_signal_29 = munoc_port_08;
assign munoc_signal_54 = munoc_port_27;
assign munoc_signal_11 = munoc_port_23;

assign munoc_signal_55 = munoc_port_04;
assign munoc_signal_51 = munoc_port_39;
assign munoc_signal_48 = munoc_port_52;
assign munoc_signal_61 = munoc_port_01;
assign munoc_signal_23 = munoc_port_36;

assign munoc_port_17 = munoc_port_65;
assign munoc_port_57 = munoc_port_66;
assign munoc_port_34 = munoc_port_09;
assign munoc_port_29 = munoc_port_44;
assign munoc_port_50 = munoc_port_47;

assign munoc_port_18 = munoc_port_07;
assign munoc_port_10 = munoc_port_08;
assign munoc_port_24 = munoc_port_27;
assign munoc_port_31 = munoc_port_23;

assign munoc_port_12 = munoc_port_04;
assign munoc_port_69 = munoc_port_39;
assign munoc_port_53 = munoc_port_52;
assign munoc_port_06 = munoc_port_01;
assign munoc_port_25 = munoc_port_36;

assign munoc_port_35 = munoc_signal_37? munoc_signal_04 : munoc_port_64;
assign munoc_port_33 = munoc_signal_37? munoc_signal_26 : munoc_port_00;

assign munoc_port_32 = munoc_signal_24? munoc_signal_25 : munoc_port_54;
assign munoc_port_20 = munoc_signal_24? munoc_signal_20 : munoc_port_37;
assign munoc_port_48 = munoc_signal_24? munoc_signal_06 : munoc_port_05;
assign munoc_port_45 = munoc_signal_24? munoc_signal_57 : munoc_port_03;

assign munoc_signal_59 = munoc_port_02 & munoc_port_43;
assign munoc_signal_01 = munoc_port_49 & munoc_port_14 & munoc_port_45;
assign munoc_signal_10 = munoc_port_19 & munoc_port_58;
assign munoc_signal_28 = munoc_port_15 & munoc_port_22 & munoc_port_23;
assign munoc_signal_36 = munoc_port_59 & munoc_port_46;

always@(posedge munoc_port_28, negedge munoc_port_42)
begin
	if(munoc_port_42==0)
	begin
		munoc_signal_41 <= `MUNOC_LDEF_4;
		munoc_signal_62 <= 0;
	end
	else
	begin
		case(munoc_signal_41)
			`MUNOC_LDEF_4:
				if(munoc_port_02)
				begin
					munoc_signal_62 <= munoc_signal_14;
					if(munoc_signal_14)
					begin
						if(munoc_signal_00)
							munoc_signal_41 <= `MUNOC_LDEF_2;
						else
							munoc_signal_41 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_09)
							munoc_signal_41 <= `MUNOC_LDEF_2;
						else
							munoc_signal_41 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_62)
				begin
					if(munoc_signal_00)
						munoc_signal_41 <= `MUNOC_LDEF_2;
				end
				else
				begin
					if(munoc_signal_09)
						munoc_signal_41 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_2:
				if(munoc_signal_59)
					munoc_signal_41 <= `MUNOC_LDEF_4;
		endcase
	end
end

assign munoc_signal_14 = (munoc_port_39[MUNOC_GPARA_0-1-:MUNOC_GPARA_3]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_1
(
	.clk(munoc_port_28),
	.rstnn(munoc_port_42),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_27),
	.wfull(munoc_signal_08),
	.wrequest(munoc_signal_47),
	.wdata(munoc_signal_03),
	.rready(munoc_signal_15),
	.rempty(munoc_signal_52),
	.rrequest(munoc_signal_31),
	.rdata(munoc_signal_32)
);

assign munoc_signal_47 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_59;
assign munoc_signal_03 = munoc_signal_14;
assign munoc_signal_31 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_01;
assign munoc_signal_24 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_32;

assign munoc_signal_00 = (~munoc_signal_08);
assign munoc_signal_09 = (~munoc_signal_08);

always@(posedge munoc_port_28, negedge munoc_port_42)
begin
	if(munoc_port_42==0)
	begin
		munoc_signal_34 <= `MUNOC_LDEF_4;
		munoc_signal_07 <= 0;
	end
	else
	begin
		case(munoc_signal_34)
			`MUNOC_LDEF_4:
				if(munoc_port_19)
				begin
					munoc_signal_07 <= munoc_signal_40;
					if(munoc_signal_40)
					begin
						if(munoc_signal_53)
							munoc_signal_34 <= `MUNOC_LDEF_2;
						else
							munoc_signal_34 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_44)
							munoc_signal_34 <= `MUNOC_LDEF_2;
						else
							munoc_signal_34 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_07)
				begin
					if(munoc_signal_53)
						munoc_signal_34 <= `MUNOC_LDEF_2;
				end
				else
				begin
					if(munoc_signal_44)
						munoc_signal_34 <= `MUNOC_LDEF_2;
				end
			`MUNOC_LDEF_2:
				if(munoc_signal_10 && munoc_signal_28)
					munoc_signal_34 <= `MUNOC_LDEF_4;
				else if(munoc_signal_10)
					munoc_signal_34 <= `MUNOC_LDEF_1;
				else if(munoc_signal_28)
					munoc_signal_34 <= `MUNOC_LDEF_3;
			`MUNOC_LDEF_3:
				if(munoc_signal_10)
					munoc_signal_34 <= `MUNOC_LDEF_4;
			`MUNOC_LDEF_1:
				if(munoc_signal_28)
					munoc_signal_34 <= `MUNOC_LDEF_4;
		endcase
	end
end

assign munoc_signal_40 = (munoc_port_66[MUNOC_GPARA_0-1-:MUNOC_GPARA_3]==MUNOC_GPARA_6);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_0
(
	.clk(munoc_port_28),
	.rstnn(munoc_port_42),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_60),
	.wfull(munoc_signal_16),
	.wrequest(munoc_signal_33),
	.wdata(munoc_signal_05),
	.rready(munoc_signal_42),
	.rempty(munoc_signal_45),
	.rrequest(munoc_signal_38),
	.rdata(munoc_signal_19)
);

assign munoc_signal_33 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_10;
assign munoc_signal_05 = munoc_signal_40;
assign munoc_signal_38 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_36;
assign munoc_signal_37 = (MUNOC_GPARA_1==0)? 0 : munoc_signal_19;

assign munoc_signal_53 = (~munoc_signal_16);
assign munoc_signal_44 = (~munoc_signal_16);

assign munoc_signal_39 = (MUNOC_GPARA_1==0)? 0 : ((munoc_signal_41==`MUNOC_LDEF_2) & munoc_signal_62);
assign munoc_port_62 = (MUNOC_GPARA_1==0)? munoc_port_02 : ((munoc_signal_41==`MUNOC_LDEF_2) & (~munoc_signal_62));
assign munoc_port_43 = (MUNOC_GPARA_1==0)? munoc_port_60 : (munoc_signal_41==`MUNOC_LDEF_2) & (((munoc_signal_62) & munoc_signal_30) | ((~munoc_signal_62) & munoc_port_60));

assign munoc_signal_49 = (MUNOC_GPARA_1==0)? 0 : (munoc_signal_15 & (munoc_signal_24) & munoc_port_14);
assign munoc_port_70 = (MUNOC_GPARA_1==0)? munoc_port_14 : (munoc_signal_15 & (~munoc_signal_24) & munoc_port_14);
assign munoc_port_49 = (MUNOC_GPARA_1==0)? munoc_port_38 : (munoc_signal_15 & (((munoc_signal_24) & munoc_signal_35) | ((~munoc_signal_24) & munoc_port_38)));

always@(*)
begin
	munoc_signal_58 = 0;
	munoc_port_26 = 0;
	munoc_port_58 = 0;
	if(MUNOC_GPARA_1==0)
	begin
		munoc_port_26 = munoc_port_19;
		munoc_port_58 = munoc_port_41;
	end
	else
	begin
		case(munoc_signal_34)
			`MUNOC_LDEF_2,
			`MUNOC_LDEF_3:
			begin
				if(munoc_signal_07)
				begin
					munoc_signal_58 = 1'b 1;
					munoc_port_58 = munoc_signal_12;
				end
				else
				begin
					munoc_port_26 = 1'b 1;
					munoc_port_58 = munoc_port_41;
				end
			end
		endcase
	end
end

always@(*)
begin
	munoc_signal_17 = 0;
	munoc_port_21 = 0;
	munoc_port_22 = 0;
	if(MUNOC_GPARA_1==0)
	begin
		munoc_port_21 = munoc_port_15;
		munoc_port_22 = munoc_port_16;
	end
	else
	begin
		case(munoc_signal_34)
			`MUNOC_LDEF_2,
			`MUNOC_LDEF_1:
			begin
				if(munoc_signal_07)
				begin
					munoc_signal_17 = munoc_port_15;
					munoc_port_22 = munoc_signal_18;
				end
				else
				begin
					munoc_port_21 = munoc_port_15;
					munoc_port_22 = munoc_port_16;
				end
			end
		endcase
	end
end

assign munoc_signal_13 = (MUNOC_GPARA_1==0)? 0 : (munoc_signal_42 & (munoc_signal_37) & munoc_port_46);
assign munoc_port_13 = (MUNOC_GPARA_1==0)? munoc_port_46 : (munoc_signal_42 & (~munoc_signal_37) & munoc_port_46);
assign munoc_port_59 = (MUNOC_GPARA_1==0)? munoc_port_61 : (munoc_signal_42 & (((munoc_signal_37) & munoc_signal_50) | ((~munoc_signal_37) & munoc_port_61)));

MUNOC_AXI2APB_BRIDGE
#(
	.BW_AXI_TID(MUNOC_GPARA_4),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_0),
	.BW_NODE_DATA(MUNOC_GPARA_5),
	.CHECK_WID(MUNOC_GPARA_2)
)
i_munoc_instance_2
(
	.clk(munoc_port_28),
	.rstnn(munoc_port_42),

	.rxawid(munoc_signal_02),
	.rxawaddr(munoc_signal_56),
	.rxawlen(munoc_signal_43),
	.rxawsize(munoc_signal_22),
	.rxawburst(munoc_signal_21),
	.rxawvalid(munoc_signal_58),
	.rxawready(munoc_signal_12),

	.rxwid(munoc_signal_46),
	.rxwdata(munoc_signal_29),
	.rxwstrb(munoc_signal_54),
	.rxwlast(munoc_signal_11),
	.rxwvalid(munoc_signal_17),
	.rxwready(munoc_signal_18),

	.rxbid(munoc_signal_04),
	.rxbresp(munoc_signal_26),
	.rxbvalid(munoc_signal_50),
	.rxbready(munoc_signal_13),

	.rxarid(munoc_signal_55),
	.rxaraddr(munoc_signal_51),
	.rxarlen(munoc_signal_48),
	.rxarsize(munoc_signal_61),
	.rxarburst(munoc_signal_23),
	.rxarvalid(munoc_signal_39),
	.rxarready(munoc_signal_30),

	.rxrid(munoc_signal_25),
	.rxrdata(munoc_signal_20),
	.rxrresp(munoc_signal_06),
	.rxrlast(munoc_signal_57),
	.rxrvalid(munoc_signal_35),
	.rxrready(munoc_signal_49),

	.spaddr(munoc_port_55),
	.spwrite(munoc_port_63),
	.spsel(munoc_port_56),
	.spenable(munoc_port_67),
	.spwdata(munoc_port_68),
	.sptid(),
	.sprdata(munoc_port_51),
	.spready(munoc_port_40),
	.spslverr(munoc_port_30),
	.spwstrb()
);

always@(*)
begin
	munoc_port_11 = 1;
	if(munoc_signal_24)
		if(munoc_port_38)
			munoc_port_11 = 0;
	if(munoc_signal_37)
		if(munoc_port_61)
			munoc_port_11 = 0;
end

endmodule
