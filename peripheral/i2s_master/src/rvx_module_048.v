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
`include "rvx_include_16.vh"





module RVX_MODULE_048
(
	rvx_port_15,
	rvx_port_16,

	rvx_port_30,
	rvx_port_01,
	rvx_port_09,
	rvx_port_06,
	rvx_port_13,
	rvx_port_29,
	rvx_port_10,
	rvx_port_31,

	rvx_port_27,
	rvx_port_20,
	rvx_port_02,
	rvx_port_22,
	rvx_port_03,
	rvx_port_24,
	rvx_port_26,
	rvx_port_11,
	rvx_port_08,
	rvx_port_18,
	rvx_port_23,
	rvx_port_28,
	rvx_port_25,
	rvx_port_04,
	rvx_port_19,
	rvx_port_12,
	rvx_port_17,
	rvx_port_00,
	rvx_port_21,
	rvx_port_05,
	rvx_port_14,
	rvx_port_07
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_16;
input wire rvx_port_30;
input wire rvx_port_01;
input wire [RVX_GPARA_2-1:0] rvx_port_09;
input wire rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire [RVX_GPARA_0-1:0] rvx_port_29;
output reg rvx_port_10;
output reg rvx_port_31;

input wire rvx_port_27;

output wire rvx_port_20;
output wire [8-1:0] rvx_port_02;

output wire rvx_port_22;
input wire [5-1:0] rvx_port_03;

output wire [8-1:0] rvx_port_24;

output wire rvx_port_28;
output wire rvx_port_25;
output wire [RVX_GPARA_0-1:0] rvx_port_04;
output wire rvx_port_26;
output wire rvx_port_11;
output wire [RVX_GPARA_0-1:0] rvx_port_08;
input wire rvx_port_18;
output wire [32-1:0] rvx_port_23;

output wire rvx_port_19;
output wire rvx_port_12;
output wire [RVX_GPARA_0-1:0] rvx_port_17;
output wire rvx_port_00;
output wire rvx_port_21;
output wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire rvx_port_14;
input wire [32-1:0] rvx_port_07;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_31;
reg [RVX_GPARA_0-1:0] rvx_signal_00;
wire rvx_signal_29;
wire rvx_signal_22;
wire rvx_signal_11;

wire [`RVX_GDEF_511-1:0] paddr_offset = rvx_port_09;
wire [`RVX_GDEF_511-1:0] rvx_signal_32;
wire [RVX_GPARA_2-1:0] rvx_signal_27;
wire [`RVX_GDEF_341-1:0] rvx_signal_26;
wire [`RVX_GDEF_341-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [8-1:0] rvx_signal_21;
reg rvx_signal_41;
wire [8-1:0] rvx_signal_35;
wire rvx_signal_43;
reg rvx_signal_18;
wire [5-1:0] rvx_signal_47;
reg rvx_signal_34;
wire [5-1:0] rvx_signal_23;
wire rvx_signal_54;
reg rvx_signal_15;
wire [8-1:0] rvx_signal_10;
reg rvx_signal_59;
wire [8-1:0] rvx_signal_36;
wire rvx_signal_40;
reg [8-1:0] rvx_signal_56;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_49;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_44;
wire rvx_signal_04;
wire rvx_signal_13;
wire rvx_signal_39;
wire rvx_signal_07;
wire [32-1:0] rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_24;
wire rvx_signal_52;
wire rvx_signal_57;
wire rvx_signal_37;
wire [32-1:0] rvx_signal_55;
wire [RVX_GPARA_0-1:0] rvx_signal_28;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_05;
reg rvx_signal_42;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_08;
wire rvx_signal_58;
wire rvx_signal_30;
wire rvx_signal_20;
wire [32-1:0] rvx_signal_45;
wire [RVX_GPARA_0-1:0] rvx_signal_51;
wire rvx_signal_19;
wire rvx_signal_01;
wire rvx_signal_09;
wire [32-1:0] rvx_signal_12;
wire [RVX_GPARA_0-1:0] rvx_signal_46;
reg rvx_signal_48;
wire [7-1:0] rvx_signal_53;
reg rvx_signal_60;
wire [7-1:0] rvx_signal_50;
wire rvx_signal_33;

assign rvx_signal_31 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_13);
assign rvx_port_29 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_00);
assign {rvx_signal_27,rvx_signal_26} = paddr_offset;
assign rvx_signal_32 = {rvx_signal_27,addr_unused};
assign rvx_signal_11 = (rvx_signal_26==0);
assign rvx_signal_29 = rvx_port_30 & rvx_port_01 & rvx_signal_11 & (~rvx_port_06);
assign rvx_signal_22 = rvx_port_30 & rvx_port_01 & rvx_signal_11 & rvx_port_06;

assign rvx_signal_35 = $unsigned(rvx_port_13);
assign rvx_signal_23 = $unsigned(rvx_port_13);
assign rvx_signal_36 = $unsigned(rvx_port_13);
assign rvx_signal_44 = $unsigned(rvx_port_13);
assign rvx_signal_06 = $unsigned(rvx_port_13);
assign rvx_signal_50 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_31 = 0;
	rvx_signal_00 = 0;
	rvx_port_10 = 1;

	rvx_signal_25 = 0;
	rvx_signal_41 = 0;

	rvx_signal_18 = 0;
	rvx_signal_34 = 0;

	rvx_signal_15 = 0;
	rvx_signal_59 = 0;

	rvx_signal_38 = 0;
	rvx_signal_02 = 0;

	rvx_signal_03 = 0;
	rvx_signal_42 = 0;

	rvx_signal_48 = 0;
	rvx_signal_60 = 0;

	if(rvx_port_30==1'b 1)
	begin
		case(rvx_signal_32)
			`RVX_GDEF_462:
			begin
				rvx_signal_25 = rvx_signal_29;
				rvx_signal_41 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_21);
				rvx_port_10 = rvx_signal_43;
			end
			`RVX_GDEF_289:
			begin
				rvx_signal_18 = rvx_signal_29;
				rvx_signal_34 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_47);
				rvx_port_10 = rvx_signal_54;
			end
			`RVX_GDEF_214:
			begin
				rvx_signal_15 = rvx_signal_29;
				rvx_signal_59 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_10);
				rvx_port_10 = rvx_signal_40;
			end
			`RVX_GDEF_181:
			begin
				rvx_signal_38 = rvx_signal_29;
				rvx_signal_02 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_49);
				rvx_port_10 = rvx_signal_04;
			end
			`RVX_GDEF_625:
			begin
				rvx_signal_03 = rvx_signal_29;
				rvx_signal_42 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_05);
				rvx_port_10 = rvx_signal_08;
			end
			`RVX_GDEF_173:
			begin
				rvx_signal_48 = rvx_signal_29;
				rvx_signal_60 = rvx_signal_22;
				rvx_signal_00 = $unsigned(rvx_signal_53);
				rvx_port_10 = rvx_signal_33;
			end
			default:
				rvx_port_31 = 1;
		endcase
	end
end

always@(posedge rvx_port_15, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_56 <= `RVX_GDEF_396;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_56 <= rvx_signal_36;
end
assign rvx_signal_10 = rvx_signal_56;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_16),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_13),
	.wfull(rvx_signal_39),
	.wrequest(rvx_signal_07),
	.wdata(rvx_signal_16),
	.wnum(rvx_signal_24),
	.rready(rvx_signal_52),
	.rempty(rvx_signal_57),
	.rrequest(rvx_signal_37),
	.rdata(rvx_signal_55),
	.rnum(rvx_signal_28)
);
assign rvx_port_28 = rvx_signal_13;
assign rvx_port_25 = rvx_signal_39;
assign rvx_port_04 = rvx_signal_24;
assign rvx_port_26 = rvx_signal_52;
assign rvx_port_11 = rvx_signal_57;
assign rvx_port_08 = rvx_signal_28;
assign rvx_signal_07 = rvx_signal_02;
assign rvx_signal_16 = rvx_signal_44;
assign rvx_signal_49 = rvx_signal_24;
assign rvx_signal_37 = rvx_port_18;
assign rvx_port_23 = rvx_signal_55;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_0)
)
i_rvx_instance_1
(
	.clk(rvx_port_15),
	.rstnn(rvx_port_16),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_58),
	.wfull(rvx_signal_30),
	.wrequest(rvx_signal_20),
	.wdata(rvx_signal_45),
	.wnum(rvx_signal_51),
	.rready(rvx_signal_19),
	.rempty(rvx_signal_01),
	.rrequest(rvx_signal_09),
	.rdata(rvx_signal_12),
	.rnum(rvx_signal_46)
);
assign rvx_port_00 = rvx_signal_58;
assign rvx_port_21 = rvx_signal_30;
assign rvx_port_05 = rvx_signal_51;
assign rvx_port_19 = rvx_signal_19;
assign rvx_port_12 = rvx_signal_01;
assign rvx_port_17 = rvx_signal_46;
assign rvx_signal_20 = rvx_port_14;
assign rvx_signal_45 = rvx_port_07;
assign rvx_signal_09 = rvx_signal_03;
assign rvx_signal_05 = rvx_signal_12;
assign rvx_signal_53 = rvx_signal_46;
assign rvx_signal_21 = 0;
assign rvx_port_20 = rvx_signal_41;
assign rvx_port_02 = rvx_signal_35;
assign rvx_signal_43 = 1;
assign rvx_port_22 = rvx_signal_18;
assign rvx_signal_47 = rvx_port_03;
assign rvx_signal_54 = 1;
assign rvx_port_24 = rvx_signal_56;
assign rvx_signal_40 = 1;
assign rvx_signal_04 = 1;
assign rvx_signal_08 = 1;
assign rvx_signal_33 = 1;

endmodule
