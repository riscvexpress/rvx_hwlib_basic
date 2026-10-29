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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "rvx_include_19.vh"





module RVX_MODULE_020
(
	rvx_port_00,
	rvx_port_17,

	rvx_port_07,
	rvx_port_06,
	rvx_port_25,
	rvx_port_26,
	rvx_port_10,
	rvx_port_01,
	rvx_port_27,
	rvx_port_31,

	rvx_port_21,
	rvx_port_23,
	rvx_port_11,
	rvx_port_28,
	rvx_port_04,
	rvx_port_15,
	rvx_port_19,
	rvx_port_12,
	rvx_port_20,
	rvx_port_18,
	rvx_port_30,
	rvx_port_22,
	rvx_port_16,
	rvx_port_14,
	rvx_port_05,
	rvx_port_02,
	rvx_port_29,
	rvx_port_13,
	rvx_port_24,
	rvx_port_03,
	rvx_port_09,
	rvx_port_08
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_00, rvx_port_17;
input wire rvx_port_07;
input wire rvx_port_06;
input wire [RVX_GPARA_2-1:0] rvx_port_25;
input wire rvx_port_26;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
output wire [RVX_GPARA_0-1:0] rvx_port_01;
output reg rvx_port_27;
output reg rvx_port_31;

input wire rvx_port_21;

output wire rvx_port_23;
output wire [8-1:0] rvx_port_11;

output wire rvx_port_28;
input wire [5-1:0] rvx_port_04;

output wire [8-1:0] rvx_port_15;

output wire rvx_port_22;
output wire rvx_port_16;
output wire [RVX_GPARA_0-1:0] rvx_port_14;
output wire rvx_port_19;
output wire rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_20;
input wire rvx_port_18;
output wire [32-1:0] rvx_port_30;

output wire rvx_port_05;
output wire rvx_port_02;
output wire [RVX_GPARA_0-1:0] rvx_port_29;
output wire rvx_port_13;
output wire rvx_port_24;
output wire [RVX_GPARA_0-1:0] rvx_port_03;
input wire rvx_port_09;
input wire [32-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_08;
reg [RVX_GPARA_0-1:0] rvx_signal_52;
wire rvx_signal_22;
wire rvx_signal_12;
wire rvx_signal_56;

wire [`RVX_GDEF_125-1:0] paddr_offset = rvx_port_25;
wire [`RVX_GDEF_125-1:0] rvx_signal_46;
wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire [`RVX_GDEF_586-1:0] rvx_signal_35;
wire [`RVX_GDEF_586-1:0] addr_unused = 0;
reg rvx_signal_34;
wire [8-1:0] rvx_signal_53;
reg rvx_signal_50;
wire [8-1:0] rvx_signal_38;
wire rvx_signal_33;
reg rvx_signal_14;
wire [5-1:0] rvx_signal_21;
reg rvx_signal_01;
wire [5-1:0] rvx_signal_31;
wire rvx_signal_25;
reg rvx_signal_42;
wire [8-1:0] rvx_signal_10;
reg rvx_signal_51;
wire [8-1:0] rvx_signal_45;
wire rvx_signal_23;
reg [8-1:0] rvx_signal_44;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_02;
reg rvx_signal_54;
wire [32-1:0] rvx_signal_40;
wire rvx_signal_18;
wire rvx_signal_29;
wire rvx_signal_15;
wire rvx_signal_13;
wire [32-1:0] rvx_signal_60;
wire [RVX_GPARA_0-1:0] rvx_signal_07;
wire rvx_signal_58;
wire rvx_signal_00;
wire rvx_signal_03;
wire [32-1:0] rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_05;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_11;
wire rvx_signal_17;
wire rvx_signal_37;
wire rvx_signal_48;
wire rvx_signal_09;
wire [32-1:0] rvx_signal_49;
wire [RVX_GPARA_0-1:0] rvx_signal_30;
wire rvx_signal_26;
wire rvx_signal_24;
wire rvx_signal_28;
wire [32-1:0] rvx_signal_19;
wire [RVX_GPARA_0-1:0] rvx_signal_36;
reg rvx_signal_57;
wire [7-1:0] rvx_signal_47;
reg rvx_signal_59;
wire [7-1:0] rvx_signal_41;
wire rvx_signal_43;

assign rvx_signal_08 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_10);
assign rvx_port_01 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_52);
assign {rvx_signal_06,rvx_signal_35} = paddr_offset;
assign rvx_signal_46 = {rvx_signal_06,addr_unused};
assign rvx_signal_56 = (rvx_signal_35==0);
assign rvx_signal_22 = rvx_port_07 & rvx_port_06 & rvx_signal_56 & (~rvx_port_26);
assign rvx_signal_12 = rvx_port_07 & rvx_port_06 & rvx_signal_56 & rvx_port_26;

assign rvx_signal_38 = $unsigned(rvx_port_10);
assign rvx_signal_31 = $unsigned(rvx_port_10);
assign rvx_signal_45 = $unsigned(rvx_port_10);
assign rvx_signal_40 = $unsigned(rvx_port_10);
assign rvx_signal_11 = $unsigned(rvx_port_10);
assign rvx_signal_41 = $unsigned(rvx_port_10);

always@(*)
begin
	rvx_port_31 = 0;
	rvx_signal_52 = 0;
	rvx_port_27 = 1;

	rvx_signal_34 = 0;
	rvx_signal_50 = 0;

	rvx_signal_14 = 0;
	rvx_signal_01 = 0;

	rvx_signal_42 = 0;
	rvx_signal_51 = 0;

	rvx_signal_39 = 0;
	rvx_signal_54 = 0;

	rvx_signal_20 = 0;
	rvx_signal_27 = 0;

	rvx_signal_57 = 0;
	rvx_signal_59 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_46)
			`RVX_GDEF_016:
			begin
				rvx_signal_34 = rvx_signal_22;
				rvx_signal_50 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_53);
				rvx_port_27 = rvx_signal_33;
			end
			`RVX_GDEF_026:
			begin
				rvx_signal_14 = rvx_signal_22;
				rvx_signal_01 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_21);
				rvx_port_27 = rvx_signal_25;
			end
			`RVX_GDEF_258:
			begin
				rvx_signal_42 = rvx_signal_22;
				rvx_signal_51 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_10);
				rvx_port_27 = rvx_signal_23;
			end
			`RVX_GDEF_511:
			begin
				rvx_signal_39 = rvx_signal_22;
				rvx_signal_54 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_02);
				rvx_port_27 = rvx_signal_18;
			end
			`RVX_GDEF_183:
			begin
				rvx_signal_20 = rvx_signal_22;
				rvx_signal_27 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_55);
				rvx_port_27 = rvx_signal_17;
			end
			`RVX_GDEF_264:
			begin
				rvx_signal_57 = rvx_signal_22;
				rvx_signal_59 = rvx_signal_12;
				rvx_signal_52 = $unsigned(rvx_signal_47);
				rvx_port_27 = rvx_signal_43;
			end
			default:
				rvx_port_31 = 1;
		endcase
	end
end

always@(posedge rvx_port_00, negedge rvx_port_17)
begin
	if(rvx_port_17==0)
		rvx_signal_44 <= `RVX_GDEF_500;
	else if (rvx_signal_51==1'b 1)
		rvx_signal_44 <= rvx_signal_45;
end
assign rvx_signal_10 = rvx_signal_44;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_29),
	.wfull(rvx_signal_15),
	.wrequest(rvx_signal_13),
	.wdata(rvx_signal_60),
	.wnum(rvx_signal_07),
	.rready(rvx_signal_58),
	.rempty(rvx_signal_00),
	.rrequest(rvx_signal_03),
	.rdata(rvx_signal_16),
	.rnum(rvx_signal_05)
);
assign rvx_port_22 = rvx_signal_29;
assign rvx_port_16 = rvx_signal_15;
assign rvx_port_14 = rvx_signal_07;
assign rvx_port_19 = rvx_signal_58;
assign rvx_port_12 = rvx_signal_00;
assign rvx_port_20 = rvx_signal_05;
assign rvx_signal_13 = rvx_signal_54;
assign rvx_signal_60 = rvx_signal_40;
assign rvx_signal_02 = rvx_signal_07;
assign rvx_signal_03 = rvx_port_18;
assign rvx_port_30 = rvx_signal_16;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_17),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_37),
	.wfull(rvx_signal_48),
	.wrequest(rvx_signal_09),
	.wdata(rvx_signal_49),
	.wnum(rvx_signal_30),
	.rready(rvx_signal_26),
	.rempty(rvx_signal_24),
	.rrequest(rvx_signal_28),
	.rdata(rvx_signal_19),
	.rnum(rvx_signal_36)
);
assign rvx_port_13 = rvx_signal_37;
assign rvx_port_24 = rvx_signal_48;
assign rvx_port_03 = rvx_signal_30;
assign rvx_port_05 = rvx_signal_26;
assign rvx_port_02 = rvx_signal_24;
assign rvx_port_29 = rvx_signal_36;
assign rvx_signal_09 = rvx_port_09;
assign rvx_signal_49 = rvx_port_08;
assign rvx_signal_28 = rvx_signal_20;
assign rvx_signal_55 = rvx_signal_19;
assign rvx_signal_47 = rvx_signal_36;
assign rvx_signal_53 = 0;
assign rvx_port_23 = rvx_signal_50;
assign rvx_port_11 = rvx_signal_38;
assign rvx_signal_33 = 1;
assign rvx_port_28 = rvx_signal_14;
assign rvx_signal_21 = rvx_port_04;
assign rvx_signal_25 = 1;
assign rvx_port_15 = rvx_signal_44;
assign rvx_signal_23 = 1;
assign rvx_signal_18 = 1;
assign rvx_signal_17 = 1;
assign rvx_signal_43 = 1;

endmodule
