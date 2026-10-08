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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_110
(
	rvx_port_36,
	rvx_port_25,

	rvx_port_12,
	rvx_port_09,
	rvx_port_33,
	rvx_port_34,
	rvx_port_02,
	rvx_port_31,
	rvx_port_08,
	rvx_port_11,

	rvx_port_03,
	rvx_port_40,
	rvx_port_39,
	rvx_port_26,
	rvx_port_16,
	rvx_port_27,
	rvx_port_23,
	rvx_port_18,
	rvx_port_29,
	rvx_port_24,
	rvx_port_32,
	rvx_port_00,
	rvx_port_10,
	rvx_port_21,
	rvx_port_30,
	rvx_port_17,
	rvx_port_04,
	rvx_port_41,
	rvx_port_06,
	rvx_port_01,
	rvx_port_38,
	rvx_port_15,
	rvx_port_20,
	rvx_port_35,
	rvx_port_13,
	rvx_port_28,
	rvx_port_22,
	rvx_port_37,
	rvx_port_07,
	rvx_port_05,
	rvx_port_19,
	rvx_port_14
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_36, rvx_port_25;
input wire rvx_port_12;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_33;
input wire rvx_port_34;
input wire [RVX_GPARA_2-1:0] rvx_port_02;
output wire [RVX_GPARA_2-1:0] rvx_port_31;
output reg rvx_port_08;
output reg rvx_port_11;

input wire rvx_port_03;

output wire rvx_port_40;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_39;
output wire rvx_port_26;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_16;

output wire rvx_port_27;
input wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_23;

output wire rvx_port_18;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_29;
output wire rvx_port_24;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_32;

output wire rvx_port_00;
input wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_10;
input wire rvx_port_21;

output wire rvx_port_30;
output wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_17;
input wire rvx_port_04;

input wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_41;

output wire rvx_port_06;
output wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_01;
input wire rvx_port_38;

output wire rvx_port_15;
input wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_20;
input wire rvx_port_35;

input wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_13;

output wire rvx_port_28;
output wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_22;
input wire rvx_port_37;

output wire rvx_port_07;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_05;
output wire rvx_port_19;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_14;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_50;
reg [RVX_GPARA_2-1:0] rvx_signal_64;
wire rvx_signal_06;
wire rvx_signal_29;
wire rvx_signal_57;

wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] paddr_offset = rvx_port_33;
wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] rvx_signal_49;
wire [RVX_GPARA_0-1:0] rvx_signal_25;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] rvx_signal_30;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] addr_unused = 0;
reg rvx_signal_54;
wire [RVX_GPARA_2-1:0] rvx_signal_51;
reg rvx_signal_55;
wire [RVX_GPARA_2-1:0] rvx_signal_60;
wire rvx_signal_59;
reg rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_61;
reg rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_00;
wire rvx_signal_40;
reg rvx_signal_39;
wire [RVX_GPARA_2-1:0] rvx_signal_21;
reg rvx_signal_07;
wire [RVX_GPARA_2-1:0] rvx_signal_56;
wire rvx_signal_65;
reg rvx_signal_20;
wire [RVX_GPARA_2-1:0] rvx_signal_37;
reg rvx_signal_13;
wire [RVX_GPARA_2-1:0] rvx_signal_09;
wire rvx_signal_08;
reg rvx_signal_33;
wire [RVX_GPARA_2-1:0] rvx_signal_01;
reg rvx_signal_63;
wire [RVX_GPARA_2-1:0] rvx_signal_05;
wire rvx_signal_44;
reg rvx_signal_35;
wire [RVX_GPARA_2-1:0] rvx_signal_47;
reg rvx_signal_24;
wire [RVX_GPARA_2-1:0] rvx_signal_42;
wire rvx_signal_36;
wire [32-1:0] rvx_signal_04;
reg rvx_signal_52;
wire [RVX_GPARA_2-1:0] rvx_signal_02;
reg rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_16;
wire rvx_signal_03;
reg rvx_signal_14;
wire [RVX_GPARA_2-1:0] rvx_signal_62;
reg rvx_signal_19;
wire [RVX_GPARA_2-1:0] rvx_signal_43;
wire rvx_signal_45;
reg rvx_signal_28;
wire [RVX_GPARA_2-1:0] rvx_signal_46;
reg rvx_signal_12;
wire [RVX_GPARA_2-1:0] rvx_signal_27;
wire rvx_signal_53;
wire [32-1:0] rvx_signal_48;
reg rvx_signal_22;
wire [RVX_GPARA_2-1:0] rvx_signal_34;
reg rvx_signal_10;
wire [RVX_GPARA_2-1:0] rvx_signal_18;
wire rvx_signal_41;
reg rvx_signal_38;
wire [RVX_GPARA_2-1:0] rvx_signal_26;
reg rvx_signal_23;
wire [RVX_GPARA_2-1:0] rvx_signal_58;
wire rvx_signal_31;

assign rvx_signal_50 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_02);
assign rvx_port_31 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_64);
assign {rvx_signal_25,rvx_signal_30} = paddr_offset;
assign rvx_signal_49 = {rvx_signal_25,addr_unused};
assign rvx_signal_57 = (rvx_signal_30==0);
assign rvx_signal_06 = rvx_port_12 & rvx_port_09 & rvx_signal_57 & (~rvx_port_34);
assign rvx_signal_29 = rvx_port_12 & rvx_port_09 & rvx_signal_57 & rvx_port_34;

assign rvx_signal_60 = $unsigned(rvx_port_02);
assign rvx_signal_00 = $unsigned(rvx_port_02);
assign rvx_signal_56 = $unsigned(rvx_port_02);
assign rvx_signal_09 = $unsigned(rvx_port_02);
assign rvx_signal_05 = $unsigned(rvx_port_02);
assign rvx_signal_42 = $unsigned(rvx_port_02);
assign rvx_signal_16 = $unsigned(rvx_port_02);
assign rvx_signal_43 = $unsigned(rvx_port_02);
assign rvx_signal_27 = $unsigned(rvx_port_02);
assign rvx_signal_18 = $unsigned(rvx_port_02);
assign rvx_signal_58 = $unsigned(rvx_port_02);

always@(*)
begin
	rvx_port_11 = 0;
	rvx_signal_64 = 0;
	rvx_port_08 = 1;

	rvx_signal_54 = 0;
	rvx_signal_55 = 0;

	rvx_signal_15 = 0;
	rvx_signal_11 = 0;

	rvx_signal_39 = 0;
	rvx_signal_07 = 0;

	rvx_signal_20 = 0;
	rvx_signal_13 = 0;

	rvx_signal_33 = 0;
	rvx_signal_63 = 0;

	rvx_signal_35 = 0;
	rvx_signal_24 = 0;

	rvx_signal_52 = 0;
	rvx_signal_17 = 0;

	rvx_signal_14 = 0;
	rvx_signal_19 = 0;

	rvx_signal_28 = 0;
	rvx_signal_12 = 0;

	rvx_signal_22 = 0;
	rvx_signal_10 = 0;

	rvx_signal_38 = 0;
	rvx_signal_23 = 0;

	if(rvx_port_12==1'b 1)
	begin
		case(rvx_signal_49)
			`MMAP_OFFSET_MMIO_CORE_CONFIG_SAWD:
			begin
				rvx_signal_54 = rvx_signal_06;
				rvx_signal_55 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_51);
				rvx_port_08 = rvx_signal_59;
			end
			`MMAP_OFFSET_MMIO_CORE_STATUS_SAWD:
			begin
				rvx_signal_15 = rvx_signal_06;
				rvx_signal_11 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_61);
				rvx_port_08 = rvx_signal_40;
			end
			`MMAP_OFFSET_MMIO_CORE_CLEAR:
			begin
				rvx_signal_39 = rvx_signal_06;
				rvx_signal_07 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_21);
				rvx_port_08 = rvx_signal_65;
			end
			`MMAP_OFFSET_MMIO_LOG_FIFO_SAWD:
			begin
				rvx_signal_20 = rvx_signal_06;
				rvx_signal_13 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_37);
				rvx_port_08 = rvx_signal_08;
			end
			`MMAP_OFFSET_MMIO_INST_FIFO_SAWD:
			begin
				rvx_signal_33 = rvx_signal_06;
				rvx_signal_63 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_01);
				rvx_port_08 = rvx_signal_44;
			end
			`MMAP_OFFSET_MMIO_INST_STATUS:
			begin
				rvx_signal_35 = rvx_signal_06;
				rvx_signal_24 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_47);
				rvx_port_08 = rvx_signal_36;
			end
			`MMAP_OFFSET_MMIO_INPUT_FIFO_SAWD:
			begin
				rvx_signal_52 = rvx_signal_06;
				rvx_signal_17 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_02);
				rvx_port_08 = rvx_signal_03;
			end
			`MMAP_OFFSET_MMIO_OUTPUT_FIFO_SAWD:
			begin
				rvx_signal_14 = rvx_signal_06;
				rvx_signal_19 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_62);
				rvx_port_08 = rvx_signal_45;
			end
			`MMAP_OFFSET_MMIO_FIFO_STATUS:
			begin
				rvx_signal_28 = rvx_signal_06;
				rvx_signal_12 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_46);
				rvx_port_08 = rvx_signal_53;
			end
			`MMAP_OFFSET_MMIO_ITR_REQUEST:
			begin
				rvx_signal_22 = rvx_signal_06;
				rvx_signal_10 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_34);
				rvx_port_08 = rvx_signal_41;
			end
			`MMAP_OFFSET_MMIO_ITR_STATUS:
			begin
				rvx_signal_38 = rvx_signal_06;
				rvx_signal_23 = rvx_signal_29;
				rvx_signal_64 = $unsigned(rvx_signal_26);
				rvx_port_08 = rvx_signal_31;
			end
			default:
				rvx_port_11 = 1;
		endcase
	end
end

ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_2),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_0
(
	.clk(rvx_port_36),
	.rstnn(rvx_port_25),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_35),
	.mmio_rdata(rvx_signal_47),
	.wide_data_in(rvx_signal_04)
);
ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_2),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_1
(
	.clk(rvx_port_36),
	.rstnn(rvx_port_25),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_28),
	.mmio_rdata(rvx_signal_46),
	.wide_data_in(rvx_signal_48)
);
assign rvx_port_40 = rvx_signal_54;
assign rvx_signal_51 = rvx_port_39;
assign rvx_port_26 = rvx_signal_55;
assign rvx_port_16 = rvx_signal_60;
assign rvx_signal_59 = 1;
assign rvx_port_27 = rvx_signal_15;
assign rvx_signal_61 = rvx_port_23;
assign rvx_signal_40 = 1;
assign rvx_port_18 = rvx_signal_39;
assign rvx_signal_21 = rvx_port_29;
assign rvx_port_24 = rvx_signal_07;
assign rvx_port_32 = rvx_signal_56;
assign rvx_signal_65 = 1;
assign rvx_port_00 = rvx_signal_20;
assign rvx_signal_37 = rvx_port_10;
assign rvx_signal_08 = rvx_port_21;
assign rvx_signal_01 = 0;
assign rvx_port_30 = rvx_signal_63;
assign rvx_port_17 = rvx_signal_05;
assign rvx_signal_44 = rvx_port_04;
assign rvx_signal_04 = rvx_port_41;
assign rvx_signal_36 = 1;
assign rvx_signal_02 = 0;
assign rvx_port_06 = rvx_signal_17;
assign rvx_port_01 = rvx_signal_16;
assign rvx_signal_03 = rvx_port_38;
assign rvx_port_15 = rvx_signal_14;
assign rvx_signal_62 = rvx_port_20;
assign rvx_signal_45 = rvx_port_35;
assign rvx_signal_48 = rvx_port_13;
assign rvx_signal_53 = 1;
assign rvx_signal_34 = 0;
assign rvx_port_28 = rvx_signal_10;
assign rvx_port_22 = rvx_signal_18;
assign rvx_signal_41 = rvx_port_37;
assign rvx_port_07 = rvx_signal_38;
assign rvx_signal_26 = rvx_port_05;
assign rvx_port_19 = rvx_signal_23;
assign rvx_port_14 = rvx_signal_58;
assign rvx_signal_31 = 1;

endmodule
