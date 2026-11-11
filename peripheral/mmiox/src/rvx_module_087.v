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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_087
(
	rvx_port_24,
	rvx_port_41,

	rvx_port_08,
	rvx_port_29,
	rvx_port_03,
	rvx_port_25,
	rvx_port_20,
	rvx_port_14,
	rvx_port_00,
	rvx_port_09,

	rvx_port_27,
	rvx_port_01,
	rvx_port_02,
	rvx_port_32,
	rvx_port_26,
	rvx_port_28,
	rvx_port_39,
	rvx_port_13,
	rvx_port_40,
	rvx_port_15,
	rvx_port_18,
	rvx_port_30,
	rvx_port_06,
	rvx_port_17,
	rvx_port_04,
	rvx_port_12,
	rvx_port_19,
	rvx_port_07,
	rvx_port_22,
	rvx_port_36,
	rvx_port_37,
	rvx_port_21,
	rvx_port_05,
	rvx_port_35,
	rvx_port_10,
	rvx_port_11,
	rvx_port_38,
	rvx_port_23,
	rvx_port_33,
	rvx_port_16,
	rvx_port_31,
	rvx_port_34
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_24, rvx_port_41;
input wire rvx_port_08;
input wire rvx_port_29;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
input wire rvx_port_25;
input wire [RVX_GPARA_1-1:0] rvx_port_20;
output wire [RVX_GPARA_1-1:0] rvx_port_14;
output reg rvx_port_00;
output reg rvx_port_09;

input wire rvx_port_27;

output wire rvx_port_01;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_02;
output wire rvx_port_32;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_26;

output wire rvx_port_28;
input wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_39;

output wire rvx_port_13;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_40;
output wire rvx_port_15;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_18;

output wire rvx_port_30;
input wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_06;
input wire rvx_port_17;

output wire rvx_port_04;
output wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_12;
input wire rvx_port_19;

input wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_07;

output wire rvx_port_22;
output wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_36;
input wire rvx_port_37;

output wire rvx_port_21;
input wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_05;
input wire rvx_port_35;

input wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_10;

output wire rvx_port_11;
output wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_38;
input wire rvx_port_23;

output wire rvx_port_33;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_16;
output wire rvx_port_31;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_34;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_62;
reg [RVX_GPARA_1-1:0] rvx_signal_48;
wire rvx_signal_39;
wire rvx_signal_17;
wire rvx_signal_30;

wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] paddr_offset = rvx_port_03;
wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] rvx_signal_25;
wire [RVX_GPARA_2-1:0] rvx_signal_66;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] rvx_signal_61;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] addr_unused = 0;
reg rvx_signal_13;
wire [RVX_GPARA_1-1:0] rvx_signal_03;
reg rvx_signal_59;
wire [RVX_GPARA_1-1:0] rvx_signal_65;
wire rvx_signal_18;
reg rvx_signal_42;
wire [RVX_GPARA_1-1:0] rvx_signal_40;
reg rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_43;
wire rvx_signal_49;
reg rvx_signal_15;
wire [RVX_GPARA_1-1:0] rvx_signal_60;
reg rvx_signal_44;
wire [RVX_GPARA_1-1:0] rvx_signal_58;
wire rvx_signal_33;
reg rvx_signal_06;
wire [RVX_GPARA_1-1:0] rvx_signal_57;
reg rvx_signal_05;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
wire rvx_signal_50;
reg rvx_signal_09;
wire [RVX_GPARA_1-1:0] rvx_signal_20;
reg rvx_signal_37;
wire [RVX_GPARA_1-1:0] rvx_signal_00;
wire rvx_signal_26;
reg rvx_signal_64;
wire [RVX_GPARA_1-1:0] rvx_signal_41;
reg rvx_signal_12;
wire [RVX_GPARA_1-1:0] rvx_signal_23;
wire rvx_signal_32;
wire [32-1:0] rvx_signal_46;
reg rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_29;
reg rvx_signal_47;
wire [RVX_GPARA_1-1:0] rvx_signal_07;
wire rvx_signal_01;
reg rvx_signal_08;
wire [RVX_GPARA_1-1:0] rvx_signal_19;
reg rvx_signal_51;
wire [RVX_GPARA_1-1:0] rvx_signal_14;
wire rvx_signal_38;
reg rvx_signal_24;
wire [RVX_GPARA_1-1:0] rvx_signal_27;
reg rvx_signal_35;
wire [RVX_GPARA_1-1:0] rvx_signal_21;
wire rvx_signal_54;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_02;
wire [RVX_GPARA_1-1:0] rvx_signal_10;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire rvx_signal_53;
reg rvx_signal_11;
wire [RVX_GPARA_1-1:0] rvx_signal_31;
reg rvx_signal_52;
wire [RVX_GPARA_1-1:0] rvx_signal_56;
wire rvx_signal_63;

assign rvx_signal_62 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_20);
assign rvx_port_14 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_48);
assign {rvx_signal_66,rvx_signal_61} = paddr_offset;
assign rvx_signal_25 = {rvx_signal_66,addr_unused};
assign rvx_signal_30 = (rvx_signal_61==0);
assign rvx_signal_39 = rvx_port_08 & rvx_port_29 & rvx_signal_30 & (~rvx_port_25);
assign rvx_signal_17 = rvx_port_08 & rvx_port_29 & rvx_signal_30 & rvx_port_25;

assign rvx_signal_65 = $unsigned(rvx_port_20);
assign rvx_signal_43 = $unsigned(rvx_port_20);
assign rvx_signal_58 = $unsigned(rvx_port_20);
assign rvx_signal_36 = $unsigned(rvx_port_20);
assign rvx_signal_00 = $unsigned(rvx_port_20);
assign rvx_signal_23 = $unsigned(rvx_port_20);
assign rvx_signal_07 = $unsigned(rvx_port_20);
assign rvx_signal_14 = $unsigned(rvx_port_20);
assign rvx_signal_21 = $unsigned(rvx_port_20);
assign rvx_signal_22 = $unsigned(rvx_port_20);
assign rvx_signal_56 = $unsigned(rvx_port_20);

always@(*)
begin
	rvx_port_09 = 0;
	rvx_signal_48 = 0;
	rvx_port_00 = 1;

	rvx_signal_13 = 0;
	rvx_signal_59 = 0;

	rvx_signal_42 = 0;
	rvx_signal_34 = 0;

	rvx_signal_15 = 0;
	rvx_signal_44 = 0;

	rvx_signal_06 = 0;
	rvx_signal_05 = 0;

	rvx_signal_09 = 0;
	rvx_signal_37 = 0;

	rvx_signal_64 = 0;
	rvx_signal_12 = 0;

	rvx_signal_16 = 0;
	rvx_signal_47 = 0;

	rvx_signal_08 = 0;
	rvx_signal_51 = 0;

	rvx_signal_24 = 0;
	rvx_signal_35 = 0;

	rvx_signal_02 = 0;
	rvx_signal_28 = 0;

	rvx_signal_11 = 0;
	rvx_signal_52 = 0;

	if(rvx_port_08==1'b 1)
	begin
		case(rvx_signal_25)
			`MMAP_OFFSET_MMIO_CORE_CONFIG_SAWD:
			begin
				rvx_signal_13 = rvx_signal_39;
				rvx_signal_59 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_03);
				rvx_port_00 = rvx_signal_18;
			end
			`MMAP_OFFSET_MMIO_CORE_STATUS_SAWD:
			begin
				rvx_signal_42 = rvx_signal_39;
				rvx_signal_34 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_40);
				rvx_port_00 = rvx_signal_49;
			end
			`MMAP_OFFSET_MMIO_CORE_CLEAR:
			begin
				rvx_signal_15 = rvx_signal_39;
				rvx_signal_44 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_60);
				rvx_port_00 = rvx_signal_33;
			end
			`MMAP_OFFSET_MMIO_LOG_FIFO_SAWD:
			begin
				rvx_signal_06 = rvx_signal_39;
				rvx_signal_05 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_57);
				rvx_port_00 = rvx_signal_50;
			end
			`MMAP_OFFSET_MMIO_INST_FIFO_SAWD:
			begin
				rvx_signal_09 = rvx_signal_39;
				rvx_signal_37 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_20);
				rvx_port_00 = rvx_signal_26;
			end
			`MMAP_OFFSET_MMIO_INST_STATUS:
			begin
				rvx_signal_64 = rvx_signal_39;
				rvx_signal_12 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_41);
				rvx_port_00 = rvx_signal_32;
			end
			`MMAP_OFFSET_MMIO_INPUT_FIFO_SAWD:
			begin
				rvx_signal_16 = rvx_signal_39;
				rvx_signal_47 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_29);
				rvx_port_00 = rvx_signal_01;
			end
			`MMAP_OFFSET_MMIO_OUTPUT_FIFO_SAWD:
			begin
				rvx_signal_08 = rvx_signal_39;
				rvx_signal_51 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_19);
				rvx_port_00 = rvx_signal_38;
			end
			`MMAP_OFFSET_MMIO_FIFO_STATUS:
			begin
				rvx_signal_24 = rvx_signal_39;
				rvx_signal_35 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_27);
				rvx_port_00 = rvx_signal_54;
			end
			`MMAP_OFFSET_MMIO_ITR_REQUEST:
			begin
				rvx_signal_02 = rvx_signal_39;
				rvx_signal_28 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_10);
				rvx_port_00 = rvx_signal_53;
			end
			`MMAP_OFFSET_MMIO_ITR_STATUS:
			begin
				rvx_signal_11 = rvx_signal_39;
				rvx_signal_52 = rvx_signal_17;
				rvx_signal_48 = $unsigned(rvx_signal_31);
				rvx_port_00 = rvx_signal_63;
			end
			default:
				rvx_port_09 = 1;
		endcase
	end
end

ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_1),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_0
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_41),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_64),
	.mmio_rdata(rvx_signal_41),
	.wide_data_in(rvx_signal_46)
);
ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_1),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_1
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_41),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_24),
	.mmio_rdata(rvx_signal_27),
	.wide_data_in(rvx_signal_55)
);
assign rvx_port_01 = rvx_signal_13;
assign rvx_signal_03 = rvx_port_02;
assign rvx_port_32 = rvx_signal_59;
assign rvx_port_26 = rvx_signal_65;
assign rvx_signal_18 = 1;
assign rvx_port_28 = rvx_signal_42;
assign rvx_signal_40 = rvx_port_39;
assign rvx_signal_49 = 1;
assign rvx_port_13 = rvx_signal_15;
assign rvx_signal_60 = rvx_port_40;
assign rvx_port_15 = rvx_signal_44;
assign rvx_port_18 = rvx_signal_58;
assign rvx_signal_33 = 1;
assign rvx_port_30 = rvx_signal_06;
assign rvx_signal_57 = rvx_port_06;
assign rvx_signal_50 = rvx_port_17;
assign rvx_signal_20 = 0;
assign rvx_port_04 = rvx_signal_37;
assign rvx_port_12 = rvx_signal_00;
assign rvx_signal_26 = rvx_port_19;
assign rvx_signal_46 = rvx_port_07;
assign rvx_signal_32 = 1;
assign rvx_signal_29 = 0;
assign rvx_port_22 = rvx_signal_47;
assign rvx_port_36 = rvx_signal_07;
assign rvx_signal_01 = rvx_port_37;
assign rvx_port_21 = rvx_signal_08;
assign rvx_signal_19 = rvx_port_05;
assign rvx_signal_38 = rvx_port_35;
assign rvx_signal_55 = rvx_port_10;
assign rvx_signal_54 = 1;
assign rvx_signal_10 = 0;
assign rvx_port_11 = rvx_signal_28;
assign rvx_port_38 = rvx_signal_22;
assign rvx_signal_53 = rvx_port_23;
assign rvx_port_33 = rvx_signal_11;
assign rvx_signal_31 = rvx_port_16;
assign rvx_port_31 = rvx_signal_52;
assign rvx_port_34 = rvx_signal_56;
assign rvx_signal_63 = 1;

endmodule
