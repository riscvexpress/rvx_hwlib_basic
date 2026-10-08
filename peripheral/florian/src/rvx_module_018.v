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
`include "rvx_include_12.vh"





module RVX_MODULE_018
(
	rvx_port_24,
	rvx_port_28,

	rvx_port_21,
	rvx_port_07,
	rvx_port_22,
	rvx_port_02,
	rvx_port_18,
	rvx_port_30,
	rvx_port_01,
	rvx_port_06,

	rvx_port_29,
	rvx_port_10,
	rvx_port_17,
	rvx_port_05,
	rvx_port_09,
	rvx_port_26,
	rvx_port_00,
	rvx_port_13,
	rvx_port_15,
	rvx_port_04,
	rvx_port_03,
	rvx_port_27,
	rvx_port_19,
	rvx_port_25,
	rvx_port_14,
	rvx_port_23,
	rvx_port_12,
	rvx_port_16,
	rvx_port_20,
	rvx_port_08,
	rvx_port_11
);





parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_24, rvx_port_28;
input wire rvx_port_21;
input wire rvx_port_07;
input wire [RVX_GPARA_1-1:0] rvx_port_22;
input wire rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_18;
output wire [RVX_GPARA_2-1:0] rvx_port_30;
output reg rvx_port_01;
output reg rvx_port_06;

input wire rvx_port_29;

input wire rvx_port_10;
output wire rvx_port_13;
output wire rvx_port_15;
output wire [RVX_GPARA_2-1:0] rvx_port_04;
output wire rvx_port_17;
output wire rvx_port_05;
output wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_26;
output wire [32-1:0] rvx_port_00;
input wire rvx_port_03;

input wire rvx_port_27;
output wire rvx_port_19;
output wire rvx_port_25;
output wire [RVX_GPARA_2-1:0] rvx_port_14;
output wire rvx_port_23;
output wire rvx_port_12;
output wire [RVX_GPARA_2-1:0] rvx_port_16;
input wire rvx_port_20;
input wire [32-1:0] rvx_port_08;
input wire rvx_port_11;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_43;
reg [RVX_GPARA_2-1:0] rvx_signal_41;
wire rvx_signal_14;
wire rvx_signal_24;
wire rvx_signal_37;

wire [`RVX_GDEF_189-1:0] paddr_offset = rvx_port_22;
wire [`RVX_GDEF_189-1:0] rvx_signal_46;
wire [RVX_GPARA_1-1:0] rvx_signal_40;
wire [`RVX_GDEF_224-1:0] rvx_signal_19;
wire [`RVX_GDEF_224-1:0] addr_unused = 0;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_09;
wire rvx_signal_44;
wire rvx_signal_29;
wire rvx_signal_22;
wire rvx_signal_21;
wire rvx_signal_32;
wire [32-1:0] rvx_signal_38;
wire [RVX_GPARA_2-1:0] rvx_signal_04;
wire rvx_signal_23;
wire rvx_signal_17;
wire rvx_signal_02;
wire [32-1:0] rvx_signal_12;
wire [RVX_GPARA_2-1:0] rvx_signal_34;
reg rvx_signal_18;
wire [32-1:0] rvx_signal_35;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_39;
wire rvx_signal_36;
wire rvx_signal_31;
wire rvx_signal_27;
wire rvx_signal_30;
wire rvx_signal_07;
wire [32-1:0] rvx_signal_10;
wire [RVX_GPARA_2-1:0] rvx_signal_00;
wire rvx_signal_06;
wire rvx_signal_05;
wire rvx_signal_28;
wire [32-1:0] rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_20;
reg rvx_signal_45;
wire [2-1:0] rvx_signal_15;
reg rvx_signal_03;
wire [2-1:0] rvx_signal_33;
wire rvx_signal_08;

assign rvx_signal_43 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_18);
assign rvx_port_30 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_41);
assign {rvx_signal_40,rvx_signal_19} = paddr_offset;
assign rvx_signal_46 = {rvx_signal_40,addr_unused};
assign rvx_signal_37 = (rvx_signal_19==0);
assign rvx_signal_14 = rvx_port_21 & rvx_port_07 & rvx_signal_37 & (~rvx_port_02);
assign rvx_signal_24 = rvx_port_21 & rvx_port_07 & rvx_signal_37 & rvx_port_02;

assign rvx_signal_09 = $unsigned(rvx_port_18);
assign rvx_signal_39 = $unsigned(rvx_port_18);
assign rvx_signal_33 = $unsigned(rvx_port_18);

always@(*)
begin
	rvx_port_06 = 0;
	rvx_signal_41 = 0;
	rvx_port_01 = 1;

	rvx_signal_13 = 0;
	rvx_signal_16 = 0;

	rvx_signal_18 = 0;
	rvx_signal_42 = 0;

	rvx_signal_45 = 0;
	rvx_signal_03 = 0;

	if(rvx_port_21==1'b 1)
	begin
		case(rvx_signal_46)
			`RVX_GDEF_241:
			begin
				rvx_signal_13 = rvx_signal_14;
				rvx_signal_16 = rvx_signal_24;
				rvx_signal_41 = $unsigned(rvx_signal_25);
				rvx_port_01 = rvx_signal_44;
			end
			`RVX_GDEF_120:
			begin
				rvx_signal_18 = rvx_signal_14;
				rvx_signal_42 = rvx_signal_24;
				rvx_signal_41 = $unsigned(rvx_signal_35);
				rvx_port_01 = rvx_signal_36;
			end
			`RVX_GDEF_590:
			begin
				rvx_signal_45 = rvx_signal_14;
				rvx_signal_03 = rvx_signal_24;
				rvx_signal_41 = $unsigned(rvx_signal_15);
				rvx_port_01 = rvx_signal_08;
			end
			default:
				rvx_port_06 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_28),
	.enable(1'b 1),
	.clear(rvx_signal_29),
	.wready(rvx_signal_22),
	.wfull(rvx_signal_21),
	.wrequest(rvx_signal_32),
	.wdata(rvx_signal_38),
	.wnum(rvx_signal_04),
	.rready(rvx_signal_23),
	.rempty(rvx_signal_17),
	.rrequest(rvx_signal_02),
	.rdata(rvx_signal_12),
	.rnum(rvx_signal_34)
);
assign rvx_signal_29 = rvx_port_10;
assign rvx_port_13 = rvx_signal_22;
assign rvx_port_15 = rvx_signal_21;
assign rvx_port_04 = rvx_signal_04;
assign rvx_port_17 = rvx_signal_23;
assign rvx_port_05 = rvx_signal_17;
assign rvx_port_09 = rvx_signal_34;
assign rvx_signal_32 = rvx_signal_16;
assign rvx_signal_38 = rvx_signal_09;
assign rvx_signal_25 = rvx_signal_04;
assign rvx_signal_02 = rvx_port_26;
assign rvx_port_00 = rvx_signal_12;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_28),
	.enable(1'b 1),
	.clear(rvx_signal_31),
	.wready(rvx_signal_27),
	.wfull(rvx_signal_30),
	.wrequest(rvx_signal_07),
	.wdata(rvx_signal_10),
	.wnum(rvx_signal_00),
	.rready(rvx_signal_06),
	.rempty(rvx_signal_05),
	.rrequest(rvx_signal_28),
	.rdata(rvx_signal_11),
	.rnum(rvx_signal_20)
);
assign rvx_signal_31 = rvx_port_27;
assign rvx_port_23 = rvx_signal_27;
assign rvx_port_12 = rvx_signal_30;
assign rvx_port_16 = rvx_signal_00;
assign rvx_port_19 = rvx_signal_06;
assign rvx_port_25 = rvx_signal_05;
assign rvx_port_14 = rvx_signal_20;
assign rvx_signal_07 = rvx_port_20;
assign rvx_signal_10 = rvx_port_08;
assign rvx_signal_28 = rvx_signal_18;
assign rvx_signal_35 = rvx_signal_11;
assign rvx_signal_15 = rvx_signal_20;
assign rvx_signal_44 = rvx_port_03;
assign rvx_signal_36 = rvx_port_11;
assign rvx_signal_08 = 1;

endmodule
