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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_123
(
	rvx_port_04,
	rvx_port_32,

	rvx_port_26,
	rvx_port_03,
	rvx_port_21,
	rvx_port_34,
	rvx_port_13,
	rvx_port_20,
	rvx_port_27,
	rvx_port_05,

	rvx_port_33,
	rvx_port_17,
	rvx_port_00,
	rvx_port_07,
	rvx_port_30,
	rvx_port_36,
	rvx_port_15,
	rvx_port_06,
	rvx_port_12,
	rvx_port_08,
	rvx_port_35,
	rvx_port_22,
	rvx_port_23,
	rvx_port_29,
	rvx_port_28,
	rvx_port_09,
	rvx_port_10,
	rvx_port_31,
	rvx_port_16,
	rvx_port_18,
	rvx_port_02,
	rvx_port_25,
	rvx_port_19,
	rvx_port_11,
	rvx_port_14,
	rvx_port_24,
	rvx_port_01
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_04, rvx_port_32;
input wire rvx_port_26;
input wire rvx_port_03;
input wire [RVX_GPARA_2-1:0] rvx_port_21;
input wire rvx_port_34;
input wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_20;
output reg rvx_port_27;
output reg rvx_port_05;

input wire rvx_port_33;

output wire [1-1:0] rvx_port_17;
output wire [1-1:0] rvx_port_00;
input wire [1-1:0] rvx_port_07;
output wire rvx_port_30;

output wire [1-1:0] rvx_port_36;
output wire [1-1:0] rvx_port_15;
input wire [1-1:0] rvx_port_06;
output wire rvx_port_12;

output wire [1-1:0] rvx_port_08;
output wire [1-1:0] rvx_port_35;
input wire [1-1:0] rvx_port_22;
output wire rvx_port_23;

output wire [1-1:0] rvx_port_29;
output wire [1-1:0] rvx_port_28;
input wire [1-1:0] rvx_port_09;
output wire rvx_port_10;

output wire [1-1:0] rvx_port_31;

output wire [1-1:0] rvx_port_16;

output wire [1-1:0] rvx_port_18;

output wire rvx_port_02;

output wire [1-1:0] rvx_port_25;

output wire [32-1:0] rvx_port_19;

output wire [32-1:0] rvx_port_11;

output wire rvx_port_14;
output wire [32-1:0] rvx_port_24;

output wire [4-1:0] rvx_port_01;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_46;
reg [RVX_GPARA_1-1:0] rvx_signal_80;
wire rvx_signal_65;
wire rvx_signal_83;
wire rvx_signal_21;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_21;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_68;
wire [RVX_GPARA_2-1:0] rvx_signal_82;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_19;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_15;
wire [RVX_GPARA_1-1:0] rvx_signal_64;
reg rvx_signal_85;
wire [RVX_GPARA_1-1:0] rvx_signal_08;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_38;
reg rvx_signal_20;
wire [RVX_GPARA_1-1:0] rvx_signal_31;
reg rvx_signal_00;
wire [RVX_GPARA_1-1:0] rvx_signal_54;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_45;
reg rvx_signal_57;
wire [RVX_GPARA_1-1:0] rvx_signal_59;
reg rvx_signal_58;
wire [RVX_GPARA_1-1:0] rvx_signal_42;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_51;
reg rvx_signal_71;
wire [RVX_GPARA_1-1:0] rvx_signal_49;
reg rvx_signal_53;
wire [RVX_GPARA_1-1:0] rvx_signal_18;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_30;
reg rvx_signal_32;
wire [1-1:0] rvx_signal_29;
reg rvx_signal_40;
wire [1-1:0] rvx_signal_43;
wire rvx_signal_69;
reg [1-1:0] rvx_signal_28;
reg rvx_signal_02;
wire [1-1:0] rvx_signal_84;
reg rvx_signal_52;
wire [1-1:0] rvx_signal_70;
wire rvx_signal_62;
reg [1-1:0] rvx_signal_35;
reg rvx_signal_06;
wire [1-1:0] rvx_signal_66;
reg rvx_signal_07;
wire [1-1:0] rvx_signal_73;
wire rvx_signal_47;
reg [1-1:0] rvx_signal_33;
reg rvx_signal_77;
wire [1-1:0] rvx_signal_50;
reg rvx_signal_78;
wire [1-1:0] rvx_signal_41;
wire rvx_signal_24;
reg rvx_signal_22;
wire [1-1:0] rvx_signal_34;
reg rvx_signal_25;
wire [1-1:0] rvx_signal_13;
wire rvx_signal_39;
reg [1-1:0] rvx_signal_44;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_63;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_81;
wire rvx_signal_76;
reg [32-1:0] rvx_signal_60;
reg rvx_signal_74;
wire [32-1:0] rvx_signal_09;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_14;
wire rvx_signal_55;
reg [32-1:0] rvx_signal_79;
reg rvx_signal_75;
wire [32-1:0] rvx_signal_56;
reg rvx_signal_61;
wire [32-1:0] rvx_signal_67;
wire rvx_signal_37;
reg rvx_signal_26;
wire [4-1:0] rvx_signal_27;
reg rvx_signal_23;
wire [4-1:0] rvx_signal_01;
wire rvx_signal_10;
reg [4-1:0] rvx_signal_16;

assign rvx_signal_46 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_13);
assign rvx_port_20 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_80);
assign {rvx_signal_82,rvx_signal_19} = paddr_offset;
assign rvx_signal_68 = {rvx_signal_82,addr_unused};
assign rvx_signal_21 = (rvx_signal_19==0);
assign rvx_signal_65 = rvx_port_26 & rvx_port_03 & rvx_signal_21 & (~rvx_port_34);
assign rvx_signal_83 = rvx_port_26 & rvx_port_03 & rvx_signal_21 & rvx_port_34;

assign rvx_signal_08 = $unsigned(rvx_port_13);
assign rvx_signal_54 = $unsigned(rvx_port_13);
assign rvx_signal_42 = $unsigned(rvx_port_13);
assign rvx_signal_18 = $unsigned(rvx_port_13);
assign rvx_signal_43 = $unsigned(rvx_port_13);
assign rvx_signal_70 = $unsigned(rvx_port_13);
assign rvx_signal_73 = $unsigned(rvx_port_13);
assign rvx_signal_41 = $unsigned(rvx_port_13);
assign rvx_signal_13 = $unsigned(rvx_port_13);
assign rvx_signal_81 = $unsigned(rvx_port_13);
assign rvx_signal_14 = $unsigned(rvx_port_13);
assign rvx_signal_67 = $unsigned(rvx_port_13);
assign rvx_signal_01 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_05 = 0;
	rvx_signal_80 = 0;
	rvx_port_27 = 1;

	rvx_signal_15 = 0;
	rvx_signal_85 = 0;

	rvx_signal_20 = 0;
	rvx_signal_00 = 0;

	rvx_signal_57 = 0;
	rvx_signal_58 = 0;

	rvx_signal_71 = 0;
	rvx_signal_53 = 0;

	rvx_signal_32 = 0;
	rvx_signal_40 = 0;

	rvx_signal_02 = 0;
	rvx_signal_52 = 0;

	rvx_signal_06 = 0;
	rvx_signal_07 = 0;

	rvx_signal_77 = 0;
	rvx_signal_78 = 0;

	rvx_signal_22 = 0;
	rvx_signal_25 = 0;

	rvx_signal_03 = 0;
	rvx_signal_17 = 0;

	rvx_signal_74 = 0;
	rvx_signal_11 = 0;

	rvx_signal_75 = 0;
	rvx_signal_61 = 0;

	rvx_signal_26 = 0;
	rvx_signal_23 = 0;

	if(rvx_port_26==1'b 1)
	begin
		case(rvx_signal_68)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_15 = rvx_signal_65;
				rvx_signal_85 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_64);
				rvx_port_27 = rvx_signal_38;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_20 = rvx_signal_65;
				rvx_signal_00 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_31);
				rvx_port_27 = rvx_signal_45;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_57 = rvx_signal_65;
				rvx_signal_58 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_59);
				rvx_port_27 = rvx_signal_51;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_71 = rvx_signal_65;
				rvx_signal_53 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_49);
				rvx_port_27 = rvx_signal_30;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_32 = rvx_signal_65;
				rvx_signal_40 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_29);
				rvx_port_27 = rvx_signal_69;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_02 = rvx_signal_65;
				rvx_signal_52 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_84);
				rvx_port_27 = rvx_signal_62;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_06 = rvx_signal_65;
				rvx_signal_07 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_66);
				rvx_port_27 = rvx_signal_47;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_77 = rvx_signal_65;
				rvx_signal_78 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_50);
				rvx_port_27 = rvx_signal_24;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_22 = rvx_signal_65;
				rvx_signal_25 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_34);
				rvx_port_27 = rvx_signal_39;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_03 = rvx_signal_65;
				rvx_signal_17 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_63);
				rvx_port_27 = rvx_signal_76;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_74 = rvx_signal_65;
				rvx_signal_11 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_09);
				rvx_port_27 = rvx_signal_55;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_75 = rvx_signal_65;
				rvx_signal_61 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_56);
				rvx_port_27 = rvx_signal_37;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_26 = rvx_signal_65;
				rvx_signal_23 = rvx_signal_83;
				rvx_signal_80 = $unsigned(rvx_signal_27);
				rvx_port_27 = rvx_signal_10;
			end
			default:
				rvx_port_05 = 1;
		endcase
	end
end

ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_04),
	.rstnn(rvx_port_32),
	.rwenable(rvx_signal_85),
	.rwdata(rvx_signal_08),
	.rrenable(rvx_signal_15),
	.rrdata(rvx_signal_64),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_30),
	.tick_gpio(rvx_port_33),
	.gpio_soe(rvx_port_17),
	.gpio_soval(rvx_port_00),
	.gpio_sival(rvx_port_07)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_04),
	.rstnn(rvx_port_32),
	.rwenable(rvx_signal_00),
	.rwdata(rvx_signal_54),
	.rrenable(rvx_signal_20),
	.rrdata(rvx_signal_31),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_12),
	.tick_gpio(rvx_port_33),
	.gpio_soe(rvx_port_36),
	.gpio_soval(rvx_port_15),
	.gpio_sival(rvx_port_06)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_04),
	.rstnn(rvx_port_32),
	.rwenable(rvx_signal_58),
	.rwdata(rvx_signal_42),
	.rrenable(rvx_signal_57),
	.rrdata(rvx_signal_59),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_23),
	.tick_gpio(rvx_port_33),
	.gpio_soe(rvx_port_08),
	.gpio_soval(rvx_port_35),
	.gpio_sival(rvx_port_22)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_04),
	.rstnn(rvx_port_32),
	.rwenable(rvx_signal_53),
	.rwdata(rvx_signal_18),
	.rrenable(rvx_signal_71),
	.rrdata(rvx_signal_49),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_10),
	.tick_gpio(rvx_port_33),
	.gpio_soe(rvx_port_29),
	.gpio_soval(rvx_port_28),
	.gpio_sival(rvx_port_09)
);
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_28 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_40==1'b 1)
		rvx_signal_28 <= rvx_signal_43;
end
assign rvx_signal_29 = rvx_signal_28;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_35 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_52==1'b 1)
		rvx_signal_35 <= rvx_signal_70;
end
assign rvx_signal_84 = rvx_signal_35;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_33 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_07==1'b 1)
		rvx_signal_33 <= rvx_signal_73;
end
assign rvx_signal_66 = rvx_signal_33;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_44 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_25==1'b 1)
		rvx_signal_44 <= rvx_signal_13;
end
assign rvx_signal_34 = rvx_signal_44;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_60 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_17==1'b 1)
		rvx_signal_60 <= rvx_signal_81;
end
assign rvx_signal_63 = rvx_signal_60;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_79 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_11==1'b 1)
		rvx_signal_79 <= rvx_signal_14;
end
assign rvx_signal_09 = rvx_signal_79;
always@(posedge rvx_port_04, negedge rvx_port_32)
begin
	if(rvx_port_32==0)
		rvx_signal_16 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_23==1'b 1)
		rvx_signal_16 <= rvx_signal_01;
end
assign rvx_signal_27 = rvx_signal_16;
assign rvx_signal_38 = 1;
assign rvx_signal_45 = 1;
assign rvx_signal_51 = 1;
assign rvx_signal_30 = 1;
assign rvx_port_31 = rvx_signal_28;
assign rvx_signal_69 = 1;
assign rvx_port_16 = rvx_signal_35;
assign rvx_signal_62 = 1;
assign rvx_port_18 = rvx_signal_33;
assign rvx_signal_47 = 1;
assign rvx_port_02 = rvx_signal_78;
assign rvx_signal_50 = 0;
assign rvx_signal_24 = 1;
assign rvx_port_25 = rvx_signal_44;
assign rvx_signal_39 = 1;
assign rvx_port_19 = rvx_signal_60;
assign rvx_signal_76 = 1;
assign rvx_port_11 = rvx_signal_79;
assign rvx_signal_55 = 1;
assign rvx_signal_56 = 0;
assign rvx_port_14 = rvx_signal_61;
assign rvx_port_24 = rvx_signal_67;
assign rvx_signal_37 = 1;
assign rvx_port_01 = rvx_signal_16;
assign rvx_signal_10 = 1;

endmodule
