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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_17.vh"





module RVX_MODULE_056
(
	rvx_port_22,
	rvx_port_05,

	rvx_port_13,
	rvx_port_01,
	rvx_port_04,
	rvx_port_26,
	rvx_port_03,
	rvx_port_14,
	rvx_port_08,
	rvx_port_07,

	rvx_port_25,
	rvx_port_17,
	rvx_port_31,
	rvx_port_19,
	rvx_port_18,
	rvx_port_28,
	rvx_port_16,
	rvx_port_27,
	rvx_port_09,
	rvx_port_06,
	rvx_port_15,
	rvx_port_02,
	rvx_port_21,
	rvx_port_23,
	rvx_port_10,
	rvx_port_20,
	rvx_port_24,
	rvx_port_29,
	rvx_port_00,
	rvx_port_12,
	rvx_port_11,
	rvx_port_30
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_22, rvx_port_05;
input wire rvx_port_13;
input wire rvx_port_01;
input wire [RVX_GPARA_2-1:0] rvx_port_04;
input wire rvx_port_26;
input wire [RVX_GPARA_1-1:0] rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_14;
output reg rvx_port_08;
output reg rvx_port_07;

input wire rvx_port_25;

output wire rvx_port_17;
output wire [8-1:0] rvx_port_31;

output wire rvx_port_19;
input wire [5-1:0] rvx_port_18;

output wire [8-1:0] rvx_port_28;

output wire rvx_port_02;
output wire rvx_port_21;
output wire [RVX_GPARA_1-1:0] rvx_port_23;
output wire rvx_port_16;
output wire rvx_port_27;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
input wire rvx_port_06;
output wire [32-1:0] rvx_port_15;

output wire rvx_port_10;
output wire rvx_port_20;
output wire [RVX_GPARA_1-1:0] rvx_port_24;
output wire rvx_port_29;
output wire rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_12;
input wire rvx_port_11;
input wire [32-1:0] rvx_port_30;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_29;
reg [RVX_GPARA_1-1:0] rvx_signal_48;
wire rvx_signal_25;
wire rvx_signal_20;
wire rvx_signal_50;

wire [`RVX_GDEF_143-1:0] paddr_offset = rvx_port_04;
wire [`RVX_GDEF_143-1:0] rvx_signal_07;
wire [RVX_GPARA_2-1:0] rvx_signal_40;
wire [`RVX_GDEF_426-1:0] rvx_signal_10;
wire [`RVX_GDEF_426-1:0] addr_unused = 0;
reg rvx_signal_47;
wire [8-1:0] rvx_signal_37;
reg rvx_signal_18;
wire [8-1:0] rvx_signal_27;
wire rvx_signal_11;
reg rvx_signal_17;
wire [5-1:0] rvx_signal_26;
reg rvx_signal_24;
wire [5-1:0] rvx_signal_35;
wire rvx_signal_15;
reg rvx_signal_04;
wire [8-1:0] rvx_signal_43;
reg rvx_signal_46;
wire [8-1:0] rvx_signal_57;
wire rvx_signal_14;
reg [8-1:0] rvx_signal_32;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_44;
reg rvx_signal_54;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_34;
wire rvx_signal_05;
wire rvx_signal_02;
wire rvx_signal_41;
wire [32-1:0] rvx_signal_55;
wire [RVX_GPARA_1-1:0] rvx_signal_19;
wire rvx_signal_59;
wire rvx_signal_49;
wire rvx_signal_23;
wire [32-1:0] rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_58;
reg rvx_signal_12;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_60;
wire rvx_signal_53;
wire rvx_signal_16;
wire rvx_signal_01;
wire rvx_signal_21;
wire [32-1:0] rvx_signal_56;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire rvx_signal_31;
wire rvx_signal_33;
wire rvx_signal_03;
wire [32-1:0] rvx_signal_39;
wire [RVX_GPARA_1-1:0] rvx_signal_52;
reg rvx_signal_42;
wire [7-1:0] rvx_signal_09;
reg rvx_signal_28;
wire [7-1:0] rvx_signal_30;
wire rvx_signal_36;

assign rvx_signal_29 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_03);
assign rvx_port_14 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_48);
assign {rvx_signal_40,rvx_signal_10} = paddr_offset;
assign rvx_signal_07 = {rvx_signal_40,addr_unused};
assign rvx_signal_50 = (rvx_signal_10==0);
assign rvx_signal_25 = rvx_port_13 & rvx_port_01 & rvx_signal_50 & (~rvx_port_26);
assign rvx_signal_20 = rvx_port_13 & rvx_port_01 & rvx_signal_50 & rvx_port_26;

assign rvx_signal_27 = $unsigned(rvx_port_03);
assign rvx_signal_35 = $unsigned(rvx_port_03);
assign rvx_signal_57 = $unsigned(rvx_port_03);
assign rvx_signal_08 = $unsigned(rvx_port_03);
assign rvx_signal_60 = $unsigned(rvx_port_03);
assign rvx_signal_30 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_07 = 0;
	rvx_signal_48 = 0;
	rvx_port_08 = 1;

	rvx_signal_47 = 0;
	rvx_signal_18 = 0;

	rvx_signal_17 = 0;
	rvx_signal_24 = 0;

	rvx_signal_04 = 0;
	rvx_signal_46 = 0;

	rvx_signal_38 = 0;
	rvx_signal_54 = 0;

	rvx_signal_12 = 0;
	rvx_signal_13 = 0;

	rvx_signal_42 = 0;
	rvx_signal_28 = 0;

	if(rvx_port_13==1'b 1)
	begin
		case(rvx_signal_07)
			`RVX_GDEF_631:
			begin
				rvx_signal_47 = rvx_signal_25;
				rvx_signal_18 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_37);
				rvx_port_08 = rvx_signal_11;
			end
			`RVX_GDEF_280:
			begin
				rvx_signal_17 = rvx_signal_25;
				rvx_signal_24 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_26);
				rvx_port_08 = rvx_signal_15;
			end
			`RVX_GDEF_437:
			begin
				rvx_signal_04 = rvx_signal_25;
				rvx_signal_46 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_43);
				rvx_port_08 = rvx_signal_14;
			end
			`RVX_GDEF_450:
			begin
				rvx_signal_38 = rvx_signal_25;
				rvx_signal_54 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_44);
				rvx_port_08 = rvx_signal_34;
			end
			`RVX_GDEF_555:
			begin
				rvx_signal_12 = rvx_signal_25;
				rvx_signal_13 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_06);
				rvx_port_08 = rvx_signal_53;
			end
			`RVX_GDEF_551:
			begin
				rvx_signal_42 = rvx_signal_25;
				rvx_signal_28 = rvx_signal_20;
				rvx_signal_48 = $unsigned(rvx_signal_09);
				rvx_port_08 = rvx_signal_36;
			end
			default:
				rvx_port_07 = 1;
		endcase
	end
end

always@(posedge rvx_port_22, negedge rvx_port_05)
begin
	if(rvx_port_05==0)
		rvx_signal_32 <= `RVX_GDEF_154;
	else if (rvx_signal_46==1'b 1)
		rvx_signal_32 <= rvx_signal_57;
end
assign rvx_signal_43 = rvx_signal_32;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_05),
	.wfull(rvx_signal_02),
	.wrequest(rvx_signal_41),
	.wdata(rvx_signal_55),
	.wnum(rvx_signal_19),
	.rready(rvx_signal_59),
	.rempty(rvx_signal_49),
	.rrequest(rvx_signal_23),
	.rdata(rvx_signal_00),
	.rnum(rvx_signal_58)
);
assign rvx_port_02 = rvx_signal_05;
assign rvx_port_21 = rvx_signal_02;
assign rvx_port_23 = rvx_signal_19;
assign rvx_port_16 = rvx_signal_59;
assign rvx_port_27 = rvx_signal_49;
assign rvx_port_09 = rvx_signal_58;
assign rvx_signal_41 = rvx_signal_54;
assign rvx_signal_55 = rvx_signal_08;
assign rvx_signal_44 = rvx_signal_19;
assign rvx_signal_23 = rvx_port_06;
assign rvx_port_15 = rvx_signal_00;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_05),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_16),
	.wfull(rvx_signal_01),
	.wrequest(rvx_signal_21),
	.wdata(rvx_signal_56),
	.wnum(rvx_signal_22),
	.rready(rvx_signal_31),
	.rempty(rvx_signal_33),
	.rrequest(rvx_signal_03),
	.rdata(rvx_signal_39),
	.rnum(rvx_signal_52)
);
assign rvx_port_29 = rvx_signal_16;
assign rvx_port_00 = rvx_signal_01;
assign rvx_port_12 = rvx_signal_22;
assign rvx_port_10 = rvx_signal_31;
assign rvx_port_20 = rvx_signal_33;
assign rvx_port_24 = rvx_signal_52;
assign rvx_signal_21 = rvx_port_11;
assign rvx_signal_56 = rvx_port_30;
assign rvx_signal_03 = rvx_signal_12;
assign rvx_signal_06 = rvx_signal_39;
assign rvx_signal_09 = rvx_signal_52;
assign rvx_signal_37 = 0;
assign rvx_port_17 = rvx_signal_18;
assign rvx_port_31 = rvx_signal_27;
assign rvx_signal_11 = 1;
assign rvx_port_19 = rvx_signal_17;
assign rvx_signal_26 = rvx_port_18;
assign rvx_signal_15 = 1;
assign rvx_port_28 = rvx_signal_32;
assign rvx_signal_14 = 1;
assign rvx_signal_34 = 1;
assign rvx_signal_53 = 1;
assign rvx_signal_36 = 1;

endmodule
