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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_079
(
	rvx_port_06,
	rvx_port_12,

	rvx_port_16,
	rvx_port_09,
	rvx_port_34,
	rvx_port_27,
	rvx_port_00,
	rvx_port_17,
	rvx_port_02,
	rvx_port_19,

	rvx_port_21,
	rvx_port_29,
	rvx_port_22,
	rvx_port_20,
	rvx_port_05,
	rvx_port_15,
	rvx_port_28,
	rvx_port_26,
	rvx_port_07,
	rvx_port_03,
	rvx_port_11,
	rvx_port_32,
	rvx_port_24,
	rvx_port_04,
	rvx_port_13,
	rvx_port_23,
	rvx_port_08,
	rvx_port_18,
	rvx_port_14,
	rvx_port_31,
	rvx_port_25,
	rvx_port_10,
	rvx_port_30,
	rvx_port_01,
	rvx_port_33,
	rvx_port_35
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_06, rvx_port_12;
input wire rvx_port_16;
input wire rvx_port_09;
input wire [RVX_GPARA_2-1:0] rvx_port_34;
input wire rvx_port_27;
input wire [RVX_GPARA_1-1:0] rvx_port_00;
output wire [RVX_GPARA_1-1:0] rvx_port_17;
output reg rvx_port_02;
output reg rvx_port_19;

input wire rvx_port_21;

output wire [`BW_SPIO_OLED_DCSEL-1:0] rvx_port_29;
output wire [`BW_SPIO_OLED_DCSEL-1:0] rvx_port_22;
input wire [`BW_SPIO_OLED_DCSEL-1:0] rvx_port_20;
output wire rvx_port_05;

output wire [`BW_SPIO_OLED_RSTNN-1:0] rvx_port_15;
output wire [`BW_SPIO_OLED_RSTNN-1:0] rvx_port_28;
input wire [`BW_SPIO_OLED_RSTNN-1:0] rvx_port_26;
output wire rvx_port_07;

output wire [`BW_SPIO_OLED_VBAT-1:0] rvx_port_03;
output wire [`BW_SPIO_OLED_VBAT-1:0] rvx_port_11;
input wire [`BW_SPIO_OLED_VBAT-1:0] rvx_port_32;
output wire rvx_port_24;

output wire [`BW_SPIO_OLED_VDD-1:0] rvx_port_04;
output wire [`BW_SPIO_OLED_VDD-1:0] rvx_port_13;
input wire [`BW_SPIO_OLED_VDD-1:0] rvx_port_23;
output wire rvx_port_08;

output wire [`BW_SPIO_WIFI_RSTNN-1:0] rvx_port_18;

output wire [`BW_SPIO_WIFI_WP-1:0] rvx_port_14;

output wire [`BW_SPIO_WIFI_HIBERNATE-1:0] rvx_port_31;

output wire rvx_port_25;

output wire [`BW_SPIO_WIFI_ITR_PENDING-1:0] rvx_port_10;

output wire [`BW_SPIO_SPI_CS_POLARITY-1:0] rvx_port_30;

output wire rvx_port_01;
output wire [`BW_SPIO_AIOIF_CONFIG-1:0] rvx_port_33;

output wire [`BW_SPIO_SERIAL_COMM_CONTROL-1:0] rvx_port_35;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_18;
reg [RVX_GPARA_1-1:0] rvx_signal_10;
wire rvx_signal_25;
wire rvx_signal_19;
wire rvx_signal_12;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_34;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_78;
wire [RVX_GPARA_2-1:0] rvx_signal_55;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_35;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_64;
wire [RVX_GPARA_1-1:0] rvx_signal_09;
reg rvx_signal_68;
wire [RVX_GPARA_1-1:0] rvx_signal_61;
wire rvx_signal_74;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
reg rvx_signal_37;
wire [RVX_GPARA_1-1:0] rvx_signal_57;
reg rvx_signal_07;
wire [RVX_GPARA_1-1:0] rvx_signal_26;
wire rvx_signal_13;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
reg rvx_signal_29;
wire [RVX_GPARA_1-1:0] rvx_signal_73;
reg rvx_signal_15;
wire [RVX_GPARA_1-1:0] rvx_signal_62;
wire rvx_signal_40;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
reg rvx_signal_76;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
reg rvx_signal_69;
wire [RVX_GPARA_1-1:0] rvx_signal_71;
wire rvx_signal_24;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
reg rvx_signal_33;
wire [RVX_GPARA_1-1:0] rvx_signal_48;
reg rvx_signal_54;
wire [RVX_GPARA_1-1:0] rvx_signal_77;
wire rvx_signal_44;
reg [1-1:0] rvx_signal_50;
reg rvx_signal_51;
wire [RVX_GPARA_1-1:0] rvx_signal_02;
reg rvx_signal_47;
wire [RVX_GPARA_1-1:0] rvx_signal_39;
wire rvx_signal_46;
reg [1-1:0] rvx_signal_65;
reg rvx_signal_38;
wire [RVX_GPARA_1-1:0] rvx_signal_75;
reg rvx_signal_53;
wire [RVX_GPARA_1-1:0] rvx_signal_58;
wire rvx_signal_20;
reg [1-1:0] rvx_signal_63;
reg rvx_signal_34;
wire [RVX_GPARA_1-1:0] rvx_signal_21;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_41;
wire rvx_signal_70;
reg rvx_signal_52;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
reg rvx_signal_59;
wire [RVX_GPARA_1-1:0] rvx_signal_49;
wire rvx_signal_30;
reg [1-1:0] rvx_signal_79;
reg rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_00;
reg rvx_signal_06;
wire [RVX_GPARA_1-1:0] rvx_signal_66;
wire rvx_signal_27;
reg [32-1:0] rvx_signal_05;
reg rvx_signal_60;
wire [RVX_GPARA_1-1:0] rvx_signal_67;
reg rvx_signal_17;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire rvx_signal_43;
reg rvx_signal_31;
wire [RVX_GPARA_1-1:0] rvx_signal_23;
reg rvx_signal_32;
wire [RVX_GPARA_1-1:0] rvx_signal_08;
wire rvx_signal_14;
reg [4-1:0] rvx_signal_04;

assign rvx_signal_18 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_00);
assign rvx_port_17 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_10);
assign {rvx_signal_55,rvx_signal_35} = paddr_offset;
assign rvx_signal_78 = {rvx_signal_55,addr_unused};
assign rvx_signal_12 = (rvx_signal_35==0);
assign rvx_signal_25 = rvx_port_16 & rvx_port_09 & rvx_signal_12 & (~rvx_port_27);
assign rvx_signal_19 = rvx_port_16 & rvx_port_09 & rvx_signal_12 & rvx_port_27;

assign rvx_signal_61 = $unsigned(rvx_port_00);
assign rvx_signal_26 = $unsigned(rvx_port_00);
assign rvx_signal_62 = $unsigned(rvx_port_00);
assign rvx_signal_71 = $unsigned(rvx_port_00);
assign rvx_signal_77 = $unsigned(rvx_port_00);
assign rvx_signal_39 = $unsigned(rvx_port_00);
assign rvx_signal_58 = $unsigned(rvx_port_00);
assign rvx_signal_41 = $unsigned(rvx_port_00);
assign rvx_signal_49 = $unsigned(rvx_port_00);
assign rvx_signal_66 = $unsigned(rvx_port_00);
assign rvx_signal_22 = $unsigned(rvx_port_00);
assign rvx_signal_08 = $unsigned(rvx_port_00);

always@(*)
begin
	rvx_port_19 = 0;
	rvx_signal_10 = 0;
	rvx_port_02 = 1;

	rvx_signal_64 = 0;
	rvx_signal_68 = 0;

	rvx_signal_37 = 0;
	rvx_signal_07 = 0;

	rvx_signal_29 = 0;
	rvx_signal_15 = 0;

	rvx_signal_76 = 0;
	rvx_signal_69 = 0;

	rvx_signal_33 = 0;
	rvx_signal_54 = 0;

	rvx_signal_51 = 0;
	rvx_signal_47 = 0;

	rvx_signal_38 = 0;
	rvx_signal_53 = 0;

	rvx_signal_34 = 0;
	rvx_signal_28 = 0;

	rvx_signal_52 = 0;
	rvx_signal_59 = 0;

	rvx_signal_16 = 0;
	rvx_signal_06 = 0;

	rvx_signal_60 = 0;
	rvx_signal_17 = 0;

	rvx_signal_31 = 0;
	rvx_signal_32 = 0;

	if(rvx_port_16==1'b 1)
	begin
		case(rvx_signal_78)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_64 = rvx_signal_25;
				rvx_signal_68 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_09);
				rvx_port_02 = rvx_signal_74;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_37 = rvx_signal_25;
				rvx_signal_07 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_57);
				rvx_port_02 = rvx_signal_13;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_29 = rvx_signal_25;
				rvx_signal_15 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_73);
				rvx_port_02 = rvx_signal_40;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_76 = rvx_signal_25;
				rvx_signal_69 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_36);
				rvx_port_02 = rvx_signal_24;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_33 = rvx_signal_25;
				rvx_signal_54 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_48);
				rvx_port_02 = rvx_signal_44;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_51 = rvx_signal_25;
				rvx_signal_47 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_02);
				rvx_port_02 = rvx_signal_46;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_38 = rvx_signal_25;
				rvx_signal_53 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_75);
				rvx_port_02 = rvx_signal_20;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_34 = rvx_signal_25;
				rvx_signal_28 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_21);
				rvx_port_02 = rvx_signal_70;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_52 = rvx_signal_25;
				rvx_signal_59 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_01);
				rvx_port_02 = rvx_signal_30;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_POLARITY:
			begin
				rvx_signal_16 = rvx_signal_25;
				rvx_signal_06 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_00);
				rvx_port_02 = rvx_signal_27;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_60 = rvx_signal_25;
				rvx_signal_17 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_67);
				rvx_port_02 = rvx_signal_43;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_31 = rvx_signal_25;
				rvx_signal_32 = rvx_signal_19;
				rvx_signal_10 = $unsigned(rvx_signal_23);
				rvx_port_02 = rvx_signal_14;
			end
			default:
				rvx_port_19 = 1;
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
	.clk(rvx_port_06),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_68),
	.rwdata(rvx_signal_61),
	.rrenable(rvx_signal_64),
	.rrdata(rvx_signal_09),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_05),
	.tick_gpio(rvx_port_21),
	.gpio_soe(rvx_port_29),
	.gpio_soval(rvx_port_22),
	.gpio_sival(rvx_port_20)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_06),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_07),
	.rwdata(rvx_signal_26),
	.rrenable(rvx_signal_37),
	.rrdata(rvx_signal_57),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_07),
	.tick_gpio(rvx_port_21),
	.gpio_soe(rvx_port_15),
	.gpio_soval(rvx_port_28),
	.gpio_sival(rvx_port_26)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_06),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_15),
	.rwdata(rvx_signal_62),
	.rrenable(rvx_signal_29),
	.rrdata(rvx_signal_73),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_24),
	.tick_gpio(rvx_port_21),
	.gpio_soe(rvx_port_03),
	.gpio_soval(rvx_port_11),
	.gpio_sival(rvx_port_32)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_06),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_69),
	.rwdata(rvx_signal_71),
	.rrenable(rvx_signal_76),
	.rrdata(rvx_signal_36),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_08),
	.tick_gpio(rvx_port_21),
	.gpio_soe(rvx_port_04),
	.gpio_soval(rvx_port_13),
	.gpio_sival(rvx_port_23)
);
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_50 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_54==1'b 1)
		rvx_signal_50 <= rvx_signal_77;
end
assign rvx_signal_48 = rvx_signal_50;
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_65 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_47==1'b 1)
		rvx_signal_65 <= rvx_signal_39;
end
assign rvx_signal_02 = rvx_signal_65;
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_63 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_53==1'b 1)
		rvx_signal_63 <= rvx_signal_58;
end
assign rvx_signal_75 = rvx_signal_63;
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_79 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_79 <= rvx_signal_49;
end
assign rvx_signal_01 = rvx_signal_79;
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_05 <= `SPIO_SPI_CS_POLARITY_DEFAULT_VALUE;
	else if (rvx_signal_06==1'b 1)
		rvx_signal_05 <= rvx_signal_66;
end
assign rvx_signal_00 = rvx_signal_05;
always@(posedge rvx_port_06, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_04 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_32==1'b 1)
		rvx_signal_04 <= rvx_signal_08;
end
assign rvx_signal_23 = rvx_signal_04;
assign rvx_signal_74 = 1;
assign rvx_signal_13 = 1;
assign rvx_signal_40 = 1;
assign rvx_signal_24 = 1;
assign rvx_port_18 = rvx_signal_50;
assign rvx_signal_44 = 1;
assign rvx_port_14 = rvx_signal_65;
assign rvx_signal_46 = 1;
assign rvx_port_31 = rvx_signal_63;
assign rvx_signal_20 = 1;
assign rvx_port_25 = rvx_signal_28;
assign rvx_signal_21 = 0;
assign rvx_signal_70 = 1;
assign rvx_port_10 = rvx_signal_79;
assign rvx_signal_30 = 1;
assign rvx_port_30 = rvx_signal_05;
assign rvx_signal_27 = 1;
assign rvx_signal_67 = 0;
assign rvx_port_01 = rvx_signal_17;
assign rvx_port_33 = rvx_signal_22;
assign rvx_signal_43 = 1;
assign rvx_port_35 = rvx_signal_04;
assign rvx_signal_14 = 1;

endmodule
