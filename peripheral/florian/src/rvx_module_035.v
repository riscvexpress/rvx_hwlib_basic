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
`include "rvx_include_10.vh"





module RVX_MODULE_035
(
	rvx_port_18,
	rvx_port_25,

	rvx_port_02,
	rvx_port_03,
	rvx_port_14,
	rvx_port_01,
	rvx_port_20,
	rvx_port_11,
	rvx_port_13,
	rvx_port_12,

	rvx_port_30,
	rvx_port_26,
	rvx_port_07,
	rvx_port_21,
	rvx_port_04,
	rvx_port_15,
	rvx_port_17,
	rvx_port_29,
	rvx_port_27,
	rvx_port_00,
	rvx_port_09,
	rvx_port_23,
	rvx_port_10,
	rvx_port_24,
	rvx_port_16,
	rvx_port_28,
	rvx_port_08,
	rvx_port_06,
	rvx_port_05,
	rvx_port_22,
	rvx_port_19
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_18, rvx_port_25;
input wire rvx_port_02;
input wire rvx_port_03;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire rvx_port_01;
input wire [RVX_GPARA_2-1:0] rvx_port_20;
output wire [RVX_GPARA_2-1:0] rvx_port_11;
output reg rvx_port_13;
output reg rvx_port_12;

input wire rvx_port_30;

input wire rvx_port_26;
output wire rvx_port_29;
output wire rvx_port_27;
output wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire rvx_port_07;
output wire rvx_port_21;
output wire [RVX_GPARA_2-1:0] rvx_port_04;
input wire rvx_port_15;
output wire [32-1:0] rvx_port_17;
input wire rvx_port_09;

input wire rvx_port_23;
output wire rvx_port_10;
output wire rvx_port_24;
output wire [RVX_GPARA_2-1:0] rvx_port_16;
output wire rvx_port_28;
output wire rvx_port_08;
output wire [RVX_GPARA_2-1:0] rvx_port_06;
input wire rvx_port_05;
input wire [32-1:0] rvx_port_22;
input wire rvx_port_19;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_29;
reg [RVX_GPARA_2-1:0] rvx_signal_28;
wire rvx_signal_12;
wire rvx_signal_35;
wire rvx_signal_27;

wire [`RVX_GDEF_348-1:0] paddr_offset = rvx_port_14;
wire [`RVX_GDEF_348-1:0] rvx_signal_04;
wire [RVX_GPARA_0-1:0] rvx_signal_20;
wire [`RVX_GDEF_391-1:0] rvx_signal_26;
wire [`RVX_GDEF_391-1:0] addr_unused = 0;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_42;
wire rvx_signal_02;
wire rvx_signal_07;
wire rvx_signal_45;
wire rvx_signal_08;
wire rvx_signal_05;
wire [32-1:0] rvx_signal_18;
wire [RVX_GPARA_2-1:0] rvx_signal_10;
wire rvx_signal_21;
wire rvx_signal_34;
wire rvx_signal_24;
wire [32-1:0] rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_11;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_43;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_32;
wire rvx_signal_01;
wire rvx_signal_16;
wire rvx_signal_03;
wire rvx_signal_09;
wire rvx_signal_13;
wire [32-1:0] rvx_signal_40;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire rvx_signal_06;
wire rvx_signal_46;
wire rvx_signal_31;
wire [32-1:0] rvx_signal_38;
wire [RVX_GPARA_2-1:0] rvx_signal_41;
reg rvx_signal_00;
wire [2-1:0] rvx_signal_30;
reg rvx_signal_15;
wire [2-1:0] rvx_signal_44;
wire rvx_signal_14;

assign rvx_signal_29 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_20);
assign rvx_port_11 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_28);
assign {rvx_signal_20,rvx_signal_26} = paddr_offset;
assign rvx_signal_04 = {rvx_signal_20,addr_unused};
assign rvx_signal_27 = (rvx_signal_26==0);
assign rvx_signal_12 = rvx_port_02 & rvx_port_03 & rvx_signal_27 & (~rvx_port_01);
assign rvx_signal_35 = rvx_port_02 & rvx_port_03 & rvx_signal_27 & rvx_port_01;

assign rvx_signal_42 = $unsigned(rvx_port_20);
assign rvx_signal_32 = $unsigned(rvx_port_20);
assign rvx_signal_44 = $unsigned(rvx_port_20);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_28 = 0;
	rvx_port_13 = 1;

	rvx_signal_39 = 0;
	rvx_signal_23 = 0;

	rvx_signal_22 = 0;
	rvx_signal_36 = 0;

	rvx_signal_00 = 0;
	rvx_signal_15 = 0;

	if(rvx_port_02==1'b 1)
	begin
		case(rvx_signal_04)
			`RVX_GDEF_153:
			begin
				rvx_signal_39 = rvx_signal_12;
				rvx_signal_23 = rvx_signal_35;
				rvx_signal_28 = $unsigned(rvx_signal_25);
				rvx_port_13 = rvx_signal_02;
			end
			`RVX_GDEF_047:
			begin
				rvx_signal_22 = rvx_signal_12;
				rvx_signal_36 = rvx_signal_35;
				rvx_signal_28 = $unsigned(rvx_signal_43);
				rvx_port_13 = rvx_signal_01;
			end
			`RVX_GDEF_633:
			begin
				rvx_signal_00 = rvx_signal_12;
				rvx_signal_15 = rvx_signal_35;
				rvx_signal_28 = $unsigned(rvx_signal_30);
				rvx_port_13 = rvx_signal_14;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_18),
	.rstnn(rvx_port_25),
	.enable(1'b 1),
	.clear(rvx_signal_07),
	.wready(rvx_signal_45),
	.wfull(rvx_signal_08),
	.wrequest(rvx_signal_05),
	.wdata(rvx_signal_18),
	.wnum(rvx_signal_10),
	.rready(rvx_signal_21),
	.rempty(rvx_signal_34),
	.rrequest(rvx_signal_24),
	.rdata(rvx_signal_17),
	.rnum(rvx_signal_11)
);
assign rvx_signal_07 = rvx_port_26;
assign rvx_port_29 = rvx_signal_45;
assign rvx_port_27 = rvx_signal_08;
assign rvx_port_00 = rvx_signal_10;
assign rvx_port_07 = rvx_signal_21;
assign rvx_port_21 = rvx_signal_34;
assign rvx_port_04 = rvx_signal_11;
assign rvx_signal_05 = rvx_signal_23;
assign rvx_signal_18 = rvx_signal_42;
assign rvx_signal_25 = rvx_signal_10;
assign rvx_signal_24 = rvx_port_15;
assign rvx_port_17 = rvx_signal_17;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk(rvx_port_18),
	.rstnn(rvx_port_25),
	.enable(1'b 1),
	.clear(rvx_signal_16),
	.wready(rvx_signal_03),
	.wfull(rvx_signal_09),
	.wrequest(rvx_signal_13),
	.wdata(rvx_signal_40),
	.wnum(rvx_signal_19),
	.rready(rvx_signal_06),
	.rempty(rvx_signal_46),
	.rrequest(rvx_signal_31),
	.rdata(rvx_signal_38),
	.rnum(rvx_signal_41)
);
assign rvx_signal_16 = rvx_port_23;
assign rvx_port_28 = rvx_signal_03;
assign rvx_port_08 = rvx_signal_09;
assign rvx_port_06 = rvx_signal_19;
assign rvx_port_10 = rvx_signal_06;
assign rvx_port_24 = rvx_signal_46;
assign rvx_port_16 = rvx_signal_41;
assign rvx_signal_13 = rvx_port_05;
assign rvx_signal_40 = rvx_port_22;
assign rvx_signal_31 = rvx_signal_22;
assign rvx_signal_43 = rvx_signal_38;
assign rvx_signal_30 = rvx_signal_41;
assign rvx_signal_02 = rvx_port_09;
assign rvx_signal_01 = rvx_port_19;
assign rvx_signal_14 = 1;

endmodule
