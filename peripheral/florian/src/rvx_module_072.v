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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_08.vh"





module RVX_MODULE_072
(
	rvx_port_17,
	rvx_port_22,

	rvx_port_21,
	rvx_port_12,
	rvx_port_16,
	rvx_port_04,
	rvx_port_13,
	rvx_port_25,
	rvx_port_28,
	rvx_port_18,

	rvx_port_11,
	rvx_port_06,
	rvx_port_08,
	rvx_port_27,
	rvx_port_01,
	rvx_port_05,
	rvx_port_29,
	rvx_port_15,
	rvx_port_19,
	rvx_port_20,
	rvx_port_00,
	rvx_port_23,
	rvx_port_02,
	rvx_port_03,
	rvx_port_26,
	rvx_port_30,
	rvx_port_24,
	rvx_port_14,
	rvx_port_09,
	rvx_port_07,
	rvx_port_10
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_17, rvx_port_22;
input wire rvx_port_21;
input wire rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_16;
input wire rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire [RVX_GPARA_0-1:0] rvx_port_25;
output reg rvx_port_28;
output reg rvx_port_18;

input wire rvx_port_11;

input wire rvx_port_06;
output wire rvx_port_15;
output wire rvx_port_19;
output wire [RVX_GPARA_0-1:0] rvx_port_20;
output wire rvx_port_08;
output wire rvx_port_27;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
input wire rvx_port_05;
output wire [32-1:0] rvx_port_29;
input wire rvx_port_00;

input wire rvx_port_23;
output wire rvx_port_02;
output wire rvx_port_03;
output wire [RVX_GPARA_0-1:0] rvx_port_26;
output wire rvx_port_30;
output wire rvx_port_24;
output wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire rvx_port_09;
input wire [32-1:0] rvx_port_07;
input wire rvx_port_10;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_03;
reg [RVX_GPARA_0-1:0] rvx_signal_14;
wire rvx_signal_29;
wire rvx_signal_00;
wire rvx_signal_19;

wire [`RVX_GDEF_627-1:0] paddr_offset = rvx_port_16;
wire [`RVX_GDEF_627-1:0] rvx_signal_25;
wire [RVX_GPARA_2-1:0] rvx_signal_11;
wire [`RVX_GDEF_148-1:0] rvx_signal_34;
wire [`RVX_GDEF_148-1:0] addr_unused = 0;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_40;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_36;
wire rvx_signal_24;
wire rvx_signal_39;
wire rvx_signal_38;
wire rvx_signal_06;
wire [32-1:0] rvx_signal_07;
wire [RVX_GPARA_0-1:0] rvx_signal_35;
wire rvx_signal_18;
wire rvx_signal_01;
wire rvx_signal_32;
wire [32-1:0] rvx_signal_20;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_27;
wire rvx_signal_43;
wire rvx_signal_15;
wire rvx_signal_22;
wire rvx_signal_02;
wire [32-1:0] rvx_signal_04;
wire [RVX_GPARA_0-1:0] rvx_signal_44;
wire rvx_signal_13;
wire rvx_signal_12;
wire rvx_signal_16;
wire [32-1:0] rvx_signal_42;
wire [RVX_GPARA_0-1:0] rvx_signal_37;
reg rvx_signal_21;
wire [2-1:0] rvx_signal_09;
reg rvx_signal_46;
wire [2-1:0] rvx_signal_30;
wire rvx_signal_41;

assign rvx_signal_03 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_13);
assign rvx_port_25 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_14);
assign {rvx_signal_11,rvx_signal_34} = paddr_offset;
assign rvx_signal_25 = {rvx_signal_11,addr_unused};
assign rvx_signal_19 = (rvx_signal_34==0);
assign rvx_signal_29 = rvx_port_21 & rvx_port_12 & rvx_signal_19 & (~rvx_port_04);
assign rvx_signal_00 = rvx_port_21 & rvx_port_12 & rvx_signal_19 & rvx_port_04;

assign rvx_signal_28 = $unsigned(rvx_port_13);
assign rvx_signal_17 = $unsigned(rvx_port_13);
assign rvx_signal_30 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_18 = 0;
	rvx_signal_14 = 0;
	rvx_port_28 = 1;

	rvx_signal_08 = 0;
	rvx_signal_10 = 0;

	rvx_signal_45 = 0;
	rvx_signal_31 = 0;

	rvx_signal_21 = 0;
	rvx_signal_46 = 0;

	if(rvx_port_21==1'b 1)
	begin
		case(rvx_signal_25)
			`RVX_GDEF_403:
			begin
				rvx_signal_08 = rvx_signal_29;
				rvx_signal_10 = rvx_signal_00;
				rvx_signal_14 = $unsigned(rvx_signal_40);
				rvx_port_28 = rvx_signal_36;
			end
			`RVX_GDEF_499:
			begin
				rvx_signal_45 = rvx_signal_29;
				rvx_signal_31 = rvx_signal_00;
				rvx_signal_14 = $unsigned(rvx_signal_26);
				rvx_port_28 = rvx_signal_27;
			end
			`RVX_GDEF_200:
			begin
				rvx_signal_21 = rvx_signal_29;
				rvx_signal_46 = rvx_signal_00;
				rvx_signal_14 = $unsigned(rvx_signal_09);
				rvx_port_28 = rvx_signal_41;
			end
			default:
				rvx_port_18 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_22),
	.enable(1'b 1),
	.clear(rvx_signal_24),
	.wready(rvx_signal_39),
	.wfull(rvx_signal_38),
	.wrequest(rvx_signal_06),
	.wdata(rvx_signal_07),
	.wnum(rvx_signal_35),
	.rready(rvx_signal_18),
	.rempty(rvx_signal_01),
	.rrequest(rvx_signal_32),
	.rdata(rvx_signal_20),
	.rnum(rvx_signal_23)
);
assign rvx_signal_24 = rvx_port_06;
assign rvx_port_15 = rvx_signal_39;
assign rvx_port_19 = rvx_signal_38;
assign rvx_port_20 = rvx_signal_35;
assign rvx_port_08 = rvx_signal_18;
assign rvx_port_27 = rvx_signal_01;
assign rvx_port_01 = rvx_signal_23;
assign rvx_signal_06 = rvx_signal_10;
assign rvx_signal_07 = rvx_signal_28;
assign rvx_signal_40 = rvx_signal_35;
assign rvx_signal_32 = rvx_port_05;
assign rvx_port_29 = rvx_signal_20;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_22),
	.enable(1'b 1),
	.clear(rvx_signal_43),
	.wready(rvx_signal_15),
	.wfull(rvx_signal_22),
	.wrequest(rvx_signal_02),
	.wdata(rvx_signal_04),
	.wnum(rvx_signal_44),
	.rready(rvx_signal_13),
	.rempty(rvx_signal_12),
	.rrequest(rvx_signal_16),
	.rdata(rvx_signal_42),
	.rnum(rvx_signal_37)
);
assign rvx_signal_43 = rvx_port_23;
assign rvx_port_30 = rvx_signal_15;
assign rvx_port_24 = rvx_signal_22;
assign rvx_port_14 = rvx_signal_44;
assign rvx_port_02 = rvx_signal_13;
assign rvx_port_03 = rvx_signal_12;
assign rvx_port_26 = rvx_signal_37;
assign rvx_signal_02 = rvx_port_09;
assign rvx_signal_04 = rvx_port_07;
assign rvx_signal_16 = rvx_signal_45;
assign rvx_signal_26 = rvx_signal_42;
assign rvx_signal_09 = rvx_signal_37;
assign rvx_signal_36 = rvx_port_00;
assign rvx_signal_27 = rvx_port_10;
assign rvx_signal_41 = 1;

endmodule
