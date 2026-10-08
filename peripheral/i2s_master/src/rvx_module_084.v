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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_23.vh"





module RVX_MODULE_084
(
	rvx_port_18,
	rvx_port_23,

	rvx_port_04,
	rvx_port_27,
	rvx_port_06,
	rvx_port_12,
	rvx_port_24,
	rvx_port_21,
	rvx_port_19,
	rvx_port_15,

	rvx_port_28,
	rvx_port_25,
	rvx_port_05,
	rvx_port_14,
	rvx_port_03,
	rvx_port_08,
	rvx_port_09,
	rvx_port_31,
	rvx_port_20,
	rvx_port_00,
	rvx_port_26,
	rvx_port_29,
	rvx_port_13,
	rvx_port_11,
	rvx_port_02,
	rvx_port_30,
	rvx_port_07,
	rvx_port_22,
	rvx_port_10,
	rvx_port_01,
	rvx_port_16,
	rvx_port_17
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_18, rvx_port_23;
input wire rvx_port_04;
input wire rvx_port_27;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_24;
output wire [RVX_GPARA_1-1:0] rvx_port_21;
output reg rvx_port_19;
output reg rvx_port_15;

input wire rvx_port_28;

output wire rvx_port_25;
output wire [8-1:0] rvx_port_05;

output wire rvx_port_14;
input wire [5-1:0] rvx_port_03;

output wire [8-1:0] rvx_port_08;

output wire rvx_port_29;
output wire rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
output wire rvx_port_09;
output wire rvx_port_31;
output wire [RVX_GPARA_1-1:0] rvx_port_20;
input wire rvx_port_00;
output wire [32-1:0] rvx_port_26;

output wire rvx_port_02;
output wire rvx_port_30;
output wire [RVX_GPARA_1-1:0] rvx_port_07;
output wire rvx_port_22;
output wire rvx_port_10;
output wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire rvx_port_16;
input wire [32-1:0] rvx_port_17;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_04;
reg [RVX_GPARA_1-1:0] rvx_signal_57;
wire rvx_signal_09;
wire rvx_signal_37;
wire rvx_signal_56;

wire [`RVX_GDEF_106-1:0] paddr_offset = rvx_port_06;
wire [`RVX_GDEF_106-1:0] rvx_signal_32;
wire [RVX_GPARA_0-1:0] rvx_signal_54;
wire [`RVX_GDEF_689-1:0] rvx_signal_47;
wire [`RVX_GDEF_689-1:0] addr_unused = 0;
reg rvx_signal_08;
wire [8-1:0] rvx_signal_60;
reg rvx_signal_03;
wire [8-1:0] rvx_signal_52;
wire rvx_signal_41;
reg rvx_signal_55;
wire [5-1:0] rvx_signal_25;
reg rvx_signal_28;
wire [5-1:0] rvx_signal_34;
wire rvx_signal_35;
reg rvx_signal_42;
wire [8-1:0] rvx_signal_44;
reg rvx_signal_24;
wire [8-1:0] rvx_signal_53;
wire rvx_signal_29;
reg [8-1:0] rvx_signal_46;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_01;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_19;
wire rvx_signal_02;
wire rvx_signal_40;
wire rvx_signal_06;
wire rvx_signal_51;
wire [32-1:0] rvx_signal_48;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire rvx_signal_05;
wire rvx_signal_18;
wire rvx_signal_45;
wire [32-1:0] rvx_signal_17;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_12;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_14;
wire rvx_signal_23;
wire rvx_signal_00;
wire rvx_signal_27;
wire rvx_signal_38;
wire [32-1:0] rvx_signal_50;
wire [RVX_GPARA_1-1:0] rvx_signal_43;
wire rvx_signal_59;
wire rvx_signal_33;
wire rvx_signal_21;
wire [32-1:0] rvx_signal_58;
wire [RVX_GPARA_1-1:0] rvx_signal_49;
reg rvx_signal_20;
wire [7-1:0] rvx_signal_16;
reg rvx_signal_11;
wire [7-1:0] rvx_signal_26;
wire rvx_signal_31;

assign rvx_signal_04 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_24);
assign rvx_port_21 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_57);
assign {rvx_signal_54,rvx_signal_47} = paddr_offset;
assign rvx_signal_32 = {rvx_signal_54,addr_unused};
assign rvx_signal_56 = (rvx_signal_47==0);
assign rvx_signal_09 = rvx_port_04 & rvx_port_27 & rvx_signal_56 & (~rvx_port_12);
assign rvx_signal_37 = rvx_port_04 & rvx_port_27 & rvx_signal_56 & rvx_port_12;

assign rvx_signal_52 = $unsigned(rvx_port_24);
assign rvx_signal_34 = $unsigned(rvx_port_24);
assign rvx_signal_53 = $unsigned(rvx_port_24);
assign rvx_signal_19 = $unsigned(rvx_port_24);
assign rvx_signal_14 = $unsigned(rvx_port_24);
assign rvx_signal_26 = $unsigned(rvx_port_24);

always@(*)
begin
	rvx_port_15 = 0;
	rvx_signal_57 = 0;
	rvx_port_19 = 1;

	rvx_signal_08 = 0;
	rvx_signal_03 = 0;

	rvx_signal_55 = 0;
	rvx_signal_28 = 0;

	rvx_signal_42 = 0;
	rvx_signal_24 = 0;

	rvx_signal_30 = 0;
	rvx_signal_07 = 0;

	rvx_signal_13 = 0;
	rvx_signal_10 = 0;

	rvx_signal_20 = 0;
	rvx_signal_11 = 0;

	if(rvx_port_04==1'b 1)
	begin
		case(rvx_signal_32)
			`RVX_GDEF_527:
			begin
				rvx_signal_08 = rvx_signal_09;
				rvx_signal_03 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_60);
				rvx_port_19 = rvx_signal_41;
			end
			`RVX_GDEF_561:
			begin
				rvx_signal_55 = rvx_signal_09;
				rvx_signal_28 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_25);
				rvx_port_19 = rvx_signal_35;
			end
			`RVX_GDEF_572:
			begin
				rvx_signal_42 = rvx_signal_09;
				rvx_signal_24 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_44);
				rvx_port_19 = rvx_signal_29;
			end
			`RVX_GDEF_167:
			begin
				rvx_signal_30 = rvx_signal_09;
				rvx_signal_07 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_01);
				rvx_port_19 = rvx_signal_02;
			end
			`RVX_GDEF_357:
			begin
				rvx_signal_13 = rvx_signal_09;
				rvx_signal_10 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_12);
				rvx_port_19 = rvx_signal_23;
			end
			`RVX_GDEF_389:
			begin
				rvx_signal_20 = rvx_signal_09;
				rvx_signal_11 = rvx_signal_37;
				rvx_signal_57 = $unsigned(rvx_signal_16);
				rvx_port_19 = rvx_signal_31;
			end
			default:
				rvx_port_15 = 1;
		endcase
	end
end

always@(posedge rvx_port_18, negedge rvx_port_23)
begin
	if(rvx_port_23==0)
		rvx_signal_46 <= `RVX_GDEF_414;
	else if (rvx_signal_24==1'b 1)
		rvx_signal_46 <= rvx_signal_53;
end
assign rvx_signal_44 = rvx_signal_46;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_18),
	.rstnn(rvx_port_23),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_40),
	.wfull(rvx_signal_06),
	.wrequest(rvx_signal_51),
	.wdata(rvx_signal_48),
	.wnum(rvx_signal_22),
	.rready(rvx_signal_05),
	.rempty(rvx_signal_18),
	.rrequest(rvx_signal_45),
	.rdata(rvx_signal_17),
	.rnum(rvx_signal_36)
);
assign rvx_port_29 = rvx_signal_40;
assign rvx_port_13 = rvx_signal_06;
assign rvx_port_11 = rvx_signal_22;
assign rvx_port_09 = rvx_signal_05;
assign rvx_port_31 = rvx_signal_18;
assign rvx_port_20 = rvx_signal_36;
assign rvx_signal_51 = rvx_signal_07;
assign rvx_signal_48 = rvx_signal_19;
assign rvx_signal_01 = rvx_signal_22;
assign rvx_signal_45 = rvx_port_00;
assign rvx_port_26 = rvx_signal_17;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_18),
	.rstnn(rvx_port_23),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_00),
	.wfull(rvx_signal_27),
	.wrequest(rvx_signal_38),
	.wdata(rvx_signal_50),
	.wnum(rvx_signal_43),
	.rready(rvx_signal_59),
	.rempty(rvx_signal_33),
	.rrequest(rvx_signal_21),
	.rdata(rvx_signal_58),
	.rnum(rvx_signal_49)
);
assign rvx_port_22 = rvx_signal_00;
assign rvx_port_10 = rvx_signal_27;
assign rvx_port_01 = rvx_signal_43;
assign rvx_port_02 = rvx_signal_59;
assign rvx_port_30 = rvx_signal_33;
assign rvx_port_07 = rvx_signal_49;
assign rvx_signal_38 = rvx_port_16;
assign rvx_signal_50 = rvx_port_17;
assign rvx_signal_21 = rvx_signal_13;
assign rvx_signal_12 = rvx_signal_58;
assign rvx_signal_16 = rvx_signal_49;
assign rvx_signal_60 = 0;
assign rvx_port_25 = rvx_signal_03;
assign rvx_port_05 = rvx_signal_52;
assign rvx_signal_41 = 1;
assign rvx_port_14 = rvx_signal_55;
assign rvx_signal_25 = rvx_port_03;
assign rvx_signal_35 = 1;
assign rvx_port_08 = rvx_signal_46;
assign rvx_signal_29 = 1;
assign rvx_signal_02 = 1;
assign rvx_signal_23 = 1;
assign rvx_signal_31 = 1;

endmodule
