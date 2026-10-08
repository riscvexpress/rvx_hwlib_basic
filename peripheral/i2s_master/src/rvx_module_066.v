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
`include "rvx_include_00.vh"





module RVX_MODULE_066
(
	rvx_port_15,
	rvx_port_04,

	rvx_port_16,
	rvx_port_22,
	rvx_port_20,
	rvx_port_11,
	rvx_port_27,
	rvx_port_30,
	rvx_port_31,
	rvx_port_02,

	rvx_port_01,
	rvx_port_14,
	rvx_port_10,
	rvx_port_26,
	rvx_port_03,
	rvx_port_18,
	rvx_port_00,
	rvx_port_05,
	rvx_port_09,
	rvx_port_23,
	rvx_port_13,
	rvx_port_08,
	rvx_port_29,
	rvx_port_24,
	rvx_port_12,
	rvx_port_07,
	rvx_port_06,
	rvx_port_21,
	rvx_port_17,
	rvx_port_19,
	rvx_port_25,
	rvx_port_28
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_04;
input wire rvx_port_16;
input wire rvx_port_22;
input wire [RVX_GPARA_2-1:0] rvx_port_20;
input wire rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_27;
output wire [RVX_GPARA_0-1:0] rvx_port_30;
output reg rvx_port_31;
output reg rvx_port_02;

input wire rvx_port_01;

output wire rvx_port_14;
output wire [8-1:0] rvx_port_10;

output wire rvx_port_26;
input wire [5-1:0] rvx_port_03;

output wire [8-1:0] rvx_port_18;

output wire rvx_port_08;
output wire rvx_port_29;
output wire [RVX_GPARA_0-1:0] rvx_port_24;
output wire rvx_port_00;
output wire rvx_port_05;
output wire [RVX_GPARA_0-1:0] rvx_port_09;
input wire rvx_port_23;
output wire [32-1:0] rvx_port_13;

output wire rvx_port_12;
output wire rvx_port_07;
output wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_21;
output wire rvx_port_17;
output wire [RVX_GPARA_0-1:0] rvx_port_19;
input wire rvx_port_25;
input wire [32-1:0] rvx_port_28;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_44;
reg [RVX_GPARA_0-1:0] rvx_signal_60;
wire rvx_signal_01;
wire rvx_signal_17;
wire rvx_signal_12;

wire [`RVX_GDEF_061-1:0] paddr_offset = rvx_port_20;
wire [`RVX_GDEF_061-1:0] rvx_signal_09;
wire [RVX_GPARA_2-1:0] rvx_signal_32;
wire [`RVX_GDEF_462-1:0] rvx_signal_30;
wire [`RVX_GDEF_462-1:0] addr_unused = 0;
reg rvx_signal_02;
wire [8-1:0] rvx_signal_46;
reg rvx_signal_58;
wire [8-1:0] rvx_signal_51;
wire rvx_signal_18;
reg rvx_signal_24;
wire [5-1:0] rvx_signal_19;
reg rvx_signal_45;
wire [5-1:0] rvx_signal_35;
wire rvx_signal_22;
reg rvx_signal_39;
wire [8-1:0] rvx_signal_56;
reg rvx_signal_13;
wire [8-1:0] rvx_signal_43;
wire rvx_signal_52;
reg [8-1:0] rvx_signal_27;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_28;
wire [32-1:0] rvx_signal_33;
wire rvx_signal_16;
wire rvx_signal_57;
wire rvx_signal_08;
wire rvx_signal_29;
wire [32-1:0] rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
wire rvx_signal_41;
wire rvx_signal_04;
wire rvx_signal_53;
wire [32-1:0] rvx_signal_31;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_49;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_15;
wire rvx_signal_34;
wire rvx_signal_59;
wire rvx_signal_48;
wire [32-1:0] rvx_signal_36;
wire [RVX_GPARA_0-1:0] rvx_signal_40;
wire rvx_signal_50;
wire rvx_signal_14;
wire rvx_signal_11;
wire [32-1:0] rvx_signal_42;
wire [RVX_GPARA_0-1:0] rvx_signal_06;
reg rvx_signal_26;
wire [7-1:0] rvx_signal_54;
reg rvx_signal_00;
wire [7-1:0] rvx_signal_05;
wire rvx_signal_47;

assign rvx_signal_44 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_27);
assign rvx_port_30 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_60);
assign {rvx_signal_32,rvx_signal_30} = paddr_offset;
assign rvx_signal_09 = {rvx_signal_32,addr_unused};
assign rvx_signal_12 = (rvx_signal_30==0);
assign rvx_signal_01 = rvx_port_16 & rvx_port_22 & rvx_signal_12 & (~rvx_port_11);
assign rvx_signal_17 = rvx_port_16 & rvx_port_22 & rvx_signal_12 & rvx_port_11;

assign rvx_signal_51 = $unsigned(rvx_port_27);
assign rvx_signal_35 = $unsigned(rvx_port_27);
assign rvx_signal_43 = $unsigned(rvx_port_27);
assign rvx_signal_33 = $unsigned(rvx_port_27);
assign rvx_signal_25 = $unsigned(rvx_port_27);
assign rvx_signal_05 = $unsigned(rvx_port_27);

always@(*)
begin
	rvx_port_02 = 0;
	rvx_signal_60 = 0;
	rvx_port_31 = 1;

	rvx_signal_02 = 0;
	rvx_signal_58 = 0;

	rvx_signal_24 = 0;
	rvx_signal_45 = 0;

	rvx_signal_39 = 0;
	rvx_signal_13 = 0;

	rvx_signal_21 = 0;
	rvx_signal_28 = 0;

	rvx_signal_03 = 0;
	rvx_signal_38 = 0;

	rvx_signal_26 = 0;
	rvx_signal_00 = 0;

	if(rvx_port_16==1'b 1)
	begin
		case(rvx_signal_09)
			`RVX_GDEF_318:
			begin
				rvx_signal_02 = rvx_signal_01;
				rvx_signal_58 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_46);
				rvx_port_31 = rvx_signal_18;
			end
			`RVX_GDEF_479:
			begin
				rvx_signal_24 = rvx_signal_01;
				rvx_signal_45 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_19);
				rvx_port_31 = rvx_signal_22;
			end
			`RVX_GDEF_469:
			begin
				rvx_signal_39 = rvx_signal_01;
				rvx_signal_13 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_56);
				rvx_port_31 = rvx_signal_52;
			end
			`RVX_GDEF_093:
			begin
				rvx_signal_21 = rvx_signal_01;
				rvx_signal_28 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_55);
				rvx_port_31 = rvx_signal_16;
			end
			`RVX_GDEF_165:
			begin
				rvx_signal_03 = rvx_signal_01;
				rvx_signal_38 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_49);
				rvx_port_31 = rvx_signal_15;
			end
			`RVX_GDEF_028:
			begin
				rvx_signal_26 = rvx_signal_01;
				rvx_signal_00 = rvx_signal_17;
				rvx_signal_60 = $unsigned(rvx_signal_54);
				rvx_port_31 = rvx_signal_47;
			end
			default:
				rvx_port_02 = 1;
		endcase
	end
end

always@(posedge rvx_port_15, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_27 <= `RVX_GDEF_428;
	else if (rvx_signal_13==1'b 1)
		rvx_signal_27 <= rvx_signal_43;
end
assign rvx_signal_56 = rvx_signal_27;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_04),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_57),
	.wfull(rvx_signal_08),
	.wrequest(rvx_signal_29),
	.wdata(rvx_signal_10),
	.wnum(rvx_signal_07),
	.rready(rvx_signal_41),
	.rempty(rvx_signal_04),
	.rrequest(rvx_signal_53),
	.rdata(rvx_signal_31),
	.rnum(rvx_signal_23)
);
assign rvx_port_08 = rvx_signal_57;
assign rvx_port_29 = rvx_signal_08;
assign rvx_port_24 = rvx_signal_07;
assign rvx_port_00 = rvx_signal_41;
assign rvx_port_05 = rvx_signal_04;
assign rvx_port_09 = rvx_signal_23;
assign rvx_signal_29 = rvx_signal_28;
assign rvx_signal_10 = rvx_signal_33;
assign rvx_signal_55 = rvx_signal_07;
assign rvx_signal_53 = rvx_port_23;
assign rvx_port_13 = rvx_signal_31;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_04),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_34),
	.wfull(rvx_signal_59),
	.wrequest(rvx_signal_48),
	.wdata(rvx_signal_36),
	.wnum(rvx_signal_40),
	.rready(rvx_signal_50),
	.rempty(rvx_signal_14),
	.rrequest(rvx_signal_11),
	.rdata(rvx_signal_42),
	.rnum(rvx_signal_06)
);
assign rvx_port_21 = rvx_signal_34;
assign rvx_port_17 = rvx_signal_59;
assign rvx_port_19 = rvx_signal_40;
assign rvx_port_12 = rvx_signal_50;
assign rvx_port_07 = rvx_signal_14;
assign rvx_port_06 = rvx_signal_06;
assign rvx_signal_48 = rvx_port_25;
assign rvx_signal_36 = rvx_port_28;
assign rvx_signal_11 = rvx_signal_03;
assign rvx_signal_49 = rvx_signal_42;
assign rvx_signal_54 = rvx_signal_06;
assign rvx_signal_46 = 0;
assign rvx_port_14 = rvx_signal_58;
assign rvx_port_10 = rvx_signal_51;
assign rvx_signal_18 = 1;
assign rvx_port_26 = rvx_signal_24;
assign rvx_signal_19 = rvx_port_03;
assign rvx_signal_22 = 1;
assign rvx_port_18 = rvx_signal_27;
assign rvx_signal_52 = 1;
assign rvx_signal_16 = 1;
assign rvx_signal_15 = 1;
assign rvx_signal_47 = 1;

endmodule
