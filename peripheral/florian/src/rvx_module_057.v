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
`include "rvx_include_03.vh"





module RVX_MODULE_057
(
	rvx_port_16,
	rvx_port_21,

	rvx_port_08,
	rvx_port_30,
	rvx_port_12,
	rvx_port_17,
	rvx_port_27,
	rvx_port_01,
	rvx_port_03,
	rvx_port_26,

	rvx_port_11,
	rvx_port_20,
	rvx_port_25,
	rvx_port_06,
	rvx_port_15,
	rvx_port_29,
	rvx_port_00,
	rvx_port_19,
	rvx_port_05,
	rvx_port_24,
	rvx_port_07,
	rvx_port_18,
	rvx_port_04,
	rvx_port_23,
	rvx_port_13,
	rvx_port_09,
	rvx_port_22,
	rvx_port_10,
	rvx_port_02,
	rvx_port_14,
	rvx_port_28
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_16, rvx_port_21;
input wire rvx_port_08;
input wire rvx_port_30;
input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_17;
input wire [RVX_GPARA_1-1:0] rvx_port_27;
output wire [RVX_GPARA_1-1:0] rvx_port_01;
output reg rvx_port_03;
output reg rvx_port_26;

input wire rvx_port_11;

input wire rvx_port_20;
output wire rvx_port_19;
output wire rvx_port_05;
output wire [RVX_GPARA_1-1:0] rvx_port_24;
output wire rvx_port_25;
output wire rvx_port_06;
output wire [RVX_GPARA_1-1:0] rvx_port_15;
input wire rvx_port_29;
output wire [32-1:0] rvx_port_00;
input wire rvx_port_07;

input wire rvx_port_18;
output wire rvx_port_04;
output wire rvx_port_23;
output wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire rvx_port_09;
output wire rvx_port_22;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
input wire rvx_port_02;
input wire [32-1:0] rvx_port_14;
input wire rvx_port_28;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_07;
reg [RVX_GPARA_1-1:0] rvx_signal_12;
wire rvx_signal_02;
wire rvx_signal_06;
wire rvx_signal_25;

wire [`RVX_GDEF_585-1:0] paddr_offset = rvx_port_12;
wire [`RVX_GDEF_585-1:0] rvx_signal_05;
wire [RVX_GPARA_2-1:0] rvx_signal_28;
wire [`RVX_GDEF_609-1:0] rvx_signal_26;
wire [`RVX_GDEF_609-1:0] addr_unused = 0;
reg rvx_signal_41;
wire [32-1:0] rvx_signal_19;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_13;
wire rvx_signal_37;
wire rvx_signal_08;
wire rvx_signal_01;
wire rvx_signal_33;
wire rvx_signal_18;
wire [32-1:0] rvx_signal_45;
wire [RVX_GPARA_1-1:0] rvx_signal_30;
wire rvx_signal_36;
wire rvx_signal_20;
wire rvx_signal_15;
wire [32-1:0] rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_04;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_24;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_23;
wire rvx_signal_46;
wire rvx_signal_21;
wire rvx_signal_39;
wire rvx_signal_14;
wire rvx_signal_10;
wire [32-1:0] rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_43;
wire rvx_signal_32;
wire rvx_signal_03;
wire rvx_signal_22;
wire [32-1:0] rvx_signal_40;
wire [RVX_GPARA_1-1:0] rvx_signal_31;
reg rvx_signal_38;
wire [2-1:0] rvx_signal_42;
reg rvx_signal_35;
wire [2-1:0] rvx_signal_27;
wire rvx_signal_44;

assign rvx_signal_07 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_27);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_12);
assign {rvx_signal_28,rvx_signal_26} = paddr_offset;
assign rvx_signal_05 = {rvx_signal_28,addr_unused};
assign rvx_signal_25 = (rvx_signal_26==0);
assign rvx_signal_02 = rvx_port_08 & rvx_port_30 & rvx_signal_25 & (~rvx_port_17);
assign rvx_signal_06 = rvx_port_08 & rvx_port_30 & rvx_signal_25 & rvx_port_17;

assign rvx_signal_13 = $unsigned(rvx_port_27);
assign rvx_signal_23 = $unsigned(rvx_port_27);
assign rvx_signal_27 = $unsigned(rvx_port_27);

always@(*)
begin
	rvx_port_26 = 0;
	rvx_signal_12 = 0;
	rvx_port_03 = 1;

	rvx_signal_41 = 0;
	rvx_signal_29 = 0;

	rvx_signal_17 = 0;
	rvx_signal_11 = 0;

	rvx_signal_38 = 0;
	rvx_signal_35 = 0;

	if(rvx_port_08==1'b 1)
	begin
		case(rvx_signal_05)
			`RVX_GDEF_244:
			begin
				rvx_signal_41 = rvx_signal_02;
				rvx_signal_29 = rvx_signal_06;
				rvx_signal_12 = $unsigned(rvx_signal_19);
				rvx_port_03 = rvx_signal_37;
			end
			`RVX_GDEF_278:
			begin
				rvx_signal_17 = rvx_signal_02;
				rvx_signal_11 = rvx_signal_06;
				rvx_signal_12 = $unsigned(rvx_signal_24);
				rvx_port_03 = rvx_signal_46;
			end
			`RVX_GDEF_132:
			begin
				rvx_signal_38 = rvx_signal_02;
				rvx_signal_35 = rvx_signal_06;
				rvx_signal_12 = $unsigned(rvx_signal_42);
				rvx_port_03 = rvx_signal_44;
			end
			default:
				rvx_port_26 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_16),
	.rstnn(rvx_port_21),
	.enable(1'b 1),
	.clear(rvx_signal_08),
	.wready(rvx_signal_01),
	.wfull(rvx_signal_33),
	.wrequest(rvx_signal_18),
	.wdata(rvx_signal_45),
	.wnum(rvx_signal_30),
	.rready(rvx_signal_36),
	.rempty(rvx_signal_20),
	.rrequest(rvx_signal_15),
	.rdata(rvx_signal_34),
	.rnum(rvx_signal_04)
);
assign rvx_signal_08 = rvx_port_20;
assign rvx_port_19 = rvx_signal_01;
assign rvx_port_05 = rvx_signal_33;
assign rvx_port_24 = rvx_signal_30;
assign rvx_port_25 = rvx_signal_36;
assign rvx_port_06 = rvx_signal_20;
assign rvx_port_15 = rvx_signal_04;
assign rvx_signal_18 = rvx_signal_29;
assign rvx_signal_45 = rvx_signal_13;
assign rvx_signal_19 = rvx_signal_30;
assign rvx_signal_15 = rvx_port_29;
assign rvx_port_00 = rvx_signal_34;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_16),
	.rstnn(rvx_port_21),
	.enable(1'b 1),
	.clear(rvx_signal_21),
	.wready(rvx_signal_39),
	.wfull(rvx_signal_14),
	.wrequest(rvx_signal_10),
	.wdata(rvx_signal_09),
	.wnum(rvx_signal_43),
	.rready(rvx_signal_32),
	.rempty(rvx_signal_03),
	.rrequest(rvx_signal_22),
	.rdata(rvx_signal_40),
	.rnum(rvx_signal_31)
);
assign rvx_signal_21 = rvx_port_18;
assign rvx_port_09 = rvx_signal_39;
assign rvx_port_22 = rvx_signal_14;
assign rvx_port_10 = rvx_signal_43;
assign rvx_port_04 = rvx_signal_32;
assign rvx_port_23 = rvx_signal_03;
assign rvx_port_13 = rvx_signal_31;
assign rvx_signal_10 = rvx_port_02;
assign rvx_signal_09 = rvx_port_14;
assign rvx_signal_22 = rvx_signal_17;
assign rvx_signal_24 = rvx_signal_40;
assign rvx_signal_42 = rvx_signal_31;
assign rvx_signal_37 = rvx_port_07;
assign rvx_signal_46 = rvx_port_28;
assign rvx_signal_44 = 1;

endmodule
