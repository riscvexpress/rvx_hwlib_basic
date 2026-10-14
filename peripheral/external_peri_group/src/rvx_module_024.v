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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_024
(
	rvx_port_22,
	rvx_port_16,

	rvx_port_24,
	rvx_port_19,
	rvx_port_12,
	rvx_port_04,
	rvx_port_17,
	rvx_port_31,
	rvx_port_26,
	rvx_port_33,

	rvx_port_25,
	rvx_port_05,
	rvx_port_15,
	rvx_port_03,
	rvx_port_13,
	rvx_port_07,
	rvx_port_09,
	rvx_port_00,
	rvx_port_10,
	rvx_port_20,
	rvx_port_27,
	rvx_port_35,
	rvx_port_14,
	rvx_port_34,
	rvx_port_11,
	rvx_port_21,
	rvx_port_06,
	rvx_port_18,
	rvx_port_30,
	rvx_port_01,
	rvx_port_29,
	rvx_port_23,
	rvx_port_28,
	rvx_port_02,
	rvx_port_36,
	rvx_port_32,
	rvx_port_08
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_22, rvx_port_16;
input wire rvx_port_24;
input wire rvx_port_19;
input wire [RVX_GPARA_2-1:0] rvx_port_12;
input wire rvx_port_04;
input wire [RVX_GPARA_0-1:0] rvx_port_17;
output wire [RVX_GPARA_0-1:0] rvx_port_31;
output reg rvx_port_26;
output reg rvx_port_33;

input wire rvx_port_25;

output wire [1-1:0] rvx_port_05;
output wire [1-1:0] rvx_port_15;
input wire [1-1:0] rvx_port_03;
output wire rvx_port_13;

output wire [1-1:0] rvx_port_07;
output wire [1-1:0] rvx_port_09;
input wire [1-1:0] rvx_port_00;
output wire rvx_port_10;

output wire [1-1:0] rvx_port_20;
output wire [1-1:0] rvx_port_27;
input wire [1-1:0] rvx_port_35;
output wire rvx_port_14;

output wire [1-1:0] rvx_port_34;
output wire [1-1:0] rvx_port_11;
input wire [1-1:0] rvx_port_21;
output wire rvx_port_06;

output wire [1-1:0] rvx_port_18;

output wire [1-1:0] rvx_port_30;

output wire [1-1:0] rvx_port_01;

output wire rvx_port_29;

output wire [1-1:0] rvx_port_23;

output wire [32-1:0] rvx_port_28;

output wire [32-1:0] rvx_port_02;

output wire rvx_port_36;
output wire [32-1:0] rvx_port_32;

output wire [4-1:0] rvx_port_08;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_45;
reg [RVX_GPARA_0-1:0] rvx_signal_26;
wire rvx_signal_83;
wire rvx_signal_74;
wire rvx_signal_56;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_12;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_39;
wire [RVX_GPARA_2-1:0] rvx_signal_79;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_57;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_48;
reg rvx_signal_46;
wire [RVX_GPARA_0-1:0] rvx_signal_69;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_36;
reg rvx_signal_35;
wire [RVX_GPARA_0-1:0] rvx_signal_65;
reg rvx_signal_68;
wire [RVX_GPARA_0-1:0] rvx_signal_85;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_84;
reg rvx_signal_50;
wire [RVX_GPARA_0-1:0] rvx_signal_66;
reg rvx_signal_03;
wire [RVX_GPARA_0-1:0] rvx_signal_41;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_78;
reg rvx_signal_04;
wire [RVX_GPARA_0-1:0] rvx_signal_40;
reg rvx_signal_31;
wire [RVX_GPARA_0-1:0] rvx_signal_12;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_05;
reg rvx_signal_14;
wire [1-1:0] rvx_signal_43;
reg rvx_signal_63;
wire [1-1:0] rvx_signal_25;
wire rvx_signal_34;
reg [1-1:0] rvx_signal_18;
reg rvx_signal_09;
wire [1-1:0] rvx_signal_42;
reg rvx_signal_13;
wire [1-1:0] rvx_signal_51;
wire rvx_signal_59;
reg [1-1:0] rvx_signal_73;
reg rvx_signal_29;
wire [1-1:0] rvx_signal_54;
reg rvx_signal_44;
wire [1-1:0] rvx_signal_52;
wire rvx_signal_08;
reg [1-1:0] rvx_signal_28;
reg rvx_signal_33;
wire [1-1:0] rvx_signal_24;
reg rvx_signal_76;
wire [1-1:0] rvx_signal_60;
wire rvx_signal_77;
reg rvx_signal_01;
wire [1-1:0] rvx_signal_61;
reg rvx_signal_20;
wire [1-1:0] rvx_signal_55;
wire rvx_signal_81;
reg [1-1:0] rvx_signal_21;
reg rvx_signal_64;
wire [32-1:0] rvx_signal_30;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_00;
wire rvx_signal_38;
reg [32-1:0] rvx_signal_70;
reg rvx_signal_47;
wire [32-1:0] rvx_signal_58;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_37;
wire rvx_signal_17;
reg [32-1:0] rvx_signal_71;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_80;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_23;
reg rvx_signal_53;
wire [4-1:0] rvx_signal_27;
reg rvx_signal_72;
wire [4-1:0] rvx_signal_11;
wire rvx_signal_62;
reg [4-1:0] rvx_signal_82;

assign rvx_signal_45 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_17);
assign rvx_port_31 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_26);
assign {rvx_signal_79,rvx_signal_57} = paddr_offset;
assign rvx_signal_39 = {rvx_signal_79,addr_unused};
assign rvx_signal_56 = (rvx_signal_57==0);
assign rvx_signal_83 = rvx_port_24 & rvx_port_19 & rvx_signal_56 & (~rvx_port_04);
assign rvx_signal_74 = rvx_port_24 & rvx_port_19 & rvx_signal_56 & rvx_port_04;

assign rvx_signal_69 = $unsigned(rvx_port_17);
assign rvx_signal_85 = $unsigned(rvx_port_17);
assign rvx_signal_41 = $unsigned(rvx_port_17);
assign rvx_signal_12 = $unsigned(rvx_port_17);
assign rvx_signal_25 = $unsigned(rvx_port_17);
assign rvx_signal_51 = $unsigned(rvx_port_17);
assign rvx_signal_52 = $unsigned(rvx_port_17);
assign rvx_signal_60 = $unsigned(rvx_port_17);
assign rvx_signal_55 = $unsigned(rvx_port_17);
assign rvx_signal_00 = $unsigned(rvx_port_17);
assign rvx_signal_37 = $unsigned(rvx_port_17);
assign rvx_signal_06 = $unsigned(rvx_port_17);
assign rvx_signal_11 = $unsigned(rvx_port_17);

always@(*)
begin
	rvx_port_33 = 0;
	rvx_signal_26 = 0;
	rvx_port_26 = 1;

	rvx_signal_10 = 0;
	rvx_signal_46 = 0;

	rvx_signal_35 = 0;
	rvx_signal_68 = 0;

	rvx_signal_50 = 0;
	rvx_signal_03 = 0;

	rvx_signal_04 = 0;
	rvx_signal_31 = 0;

	rvx_signal_14 = 0;
	rvx_signal_63 = 0;

	rvx_signal_09 = 0;
	rvx_signal_13 = 0;

	rvx_signal_29 = 0;
	rvx_signal_44 = 0;

	rvx_signal_33 = 0;
	rvx_signal_76 = 0;

	rvx_signal_01 = 0;
	rvx_signal_20 = 0;

	rvx_signal_64 = 0;
	rvx_signal_49 = 0;

	rvx_signal_47 = 0;
	rvx_signal_32 = 0;

	rvx_signal_02 = 0;
	rvx_signal_80 = 0;

	rvx_signal_53 = 0;
	rvx_signal_72 = 0;

	if(rvx_port_24==1'b 1)
	begin
		case(rvx_signal_39)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_10 = rvx_signal_83;
				rvx_signal_46 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_48);
				rvx_port_26 = rvx_signal_36;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_35 = rvx_signal_83;
				rvx_signal_68 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_65);
				rvx_port_26 = rvx_signal_84;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_50 = rvx_signal_83;
				rvx_signal_03 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_66);
				rvx_port_26 = rvx_signal_78;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_04 = rvx_signal_83;
				rvx_signal_31 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_40);
				rvx_port_26 = rvx_signal_05;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_14 = rvx_signal_83;
				rvx_signal_63 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_43);
				rvx_port_26 = rvx_signal_34;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_09 = rvx_signal_83;
				rvx_signal_13 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_42);
				rvx_port_26 = rvx_signal_59;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_29 = rvx_signal_83;
				rvx_signal_44 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_54);
				rvx_port_26 = rvx_signal_08;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_33 = rvx_signal_83;
				rvx_signal_76 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_24);
				rvx_port_26 = rvx_signal_77;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_01 = rvx_signal_83;
				rvx_signal_20 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_61);
				rvx_port_26 = rvx_signal_81;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_64 = rvx_signal_83;
				rvx_signal_49 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_30);
				rvx_port_26 = rvx_signal_38;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_47 = rvx_signal_83;
				rvx_signal_32 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_58);
				rvx_port_26 = rvx_signal_17;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_02 = rvx_signal_83;
				rvx_signal_80 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_15);
				rvx_port_26 = rvx_signal_23;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_53 = rvx_signal_83;
				rvx_signal_72 = rvx_signal_74;
				rvx_signal_26 = $unsigned(rvx_signal_27);
				rvx_port_26 = rvx_signal_62;
			end
			default:
				rvx_port_33 = 1;
		endcase
	end
end

ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_16),
	.rwenable(rvx_signal_46),
	.rwdata(rvx_signal_69),
	.rrenable(rvx_signal_10),
	.rrdata(rvx_signal_48),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_13),
	.tick_gpio(rvx_port_25),
	.gpio_soe(rvx_port_05),
	.gpio_soval(rvx_port_15),
	.gpio_sival(rvx_port_03)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_16),
	.rwenable(rvx_signal_68),
	.rwdata(rvx_signal_85),
	.rrenable(rvx_signal_35),
	.rrdata(rvx_signal_65),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_10),
	.tick_gpio(rvx_port_25),
	.gpio_soe(rvx_port_07),
	.gpio_soval(rvx_port_09),
	.gpio_sival(rvx_port_00)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_16),
	.rwenable(rvx_signal_03),
	.rwdata(rvx_signal_41),
	.rrenable(rvx_signal_50),
	.rrdata(rvx_signal_66),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_14),
	.tick_gpio(rvx_port_25),
	.gpio_soe(rvx_port_20),
	.gpio_soval(rvx_port_27),
	.gpio_sival(rvx_port_35)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_22),
	.rstnn(rvx_port_16),
	.rwenable(rvx_signal_31),
	.rwdata(rvx_signal_12),
	.rrenable(rvx_signal_04),
	.rrdata(rvx_signal_40),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_06),
	.tick_gpio(rvx_port_25),
	.gpio_soe(rvx_port_34),
	.gpio_soval(rvx_port_11),
	.gpio_sival(rvx_port_21)
);
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_18 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_63==1'b 1)
		rvx_signal_18 <= rvx_signal_25;
end
assign rvx_signal_43 = rvx_signal_18;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_73 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_13==1'b 1)
		rvx_signal_73 <= rvx_signal_51;
end
assign rvx_signal_42 = rvx_signal_73;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_28 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_44==1'b 1)
		rvx_signal_28 <= rvx_signal_52;
end
assign rvx_signal_54 = rvx_signal_28;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_21 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_20==1'b 1)
		rvx_signal_21 <= rvx_signal_55;
end
assign rvx_signal_61 = rvx_signal_21;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_70 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_49==1'b 1)
		rvx_signal_70 <= rvx_signal_00;
end
assign rvx_signal_30 = rvx_signal_70;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_71 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_32==1'b 1)
		rvx_signal_71 <= rvx_signal_37;
end
assign rvx_signal_58 = rvx_signal_71;
always@(posedge rvx_port_22, negedge rvx_port_16)
begin
	if(rvx_port_16==0)
		rvx_signal_82 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_72==1'b 1)
		rvx_signal_82 <= rvx_signal_11;
end
assign rvx_signal_27 = rvx_signal_82;
assign rvx_signal_36 = 1;
assign rvx_signal_84 = 1;
assign rvx_signal_78 = 1;
assign rvx_signal_05 = 1;
assign rvx_port_18 = rvx_signal_18;
assign rvx_signal_34 = 1;
assign rvx_port_30 = rvx_signal_73;
assign rvx_signal_59 = 1;
assign rvx_port_01 = rvx_signal_28;
assign rvx_signal_08 = 1;
assign rvx_port_29 = rvx_signal_76;
assign rvx_signal_24 = 0;
assign rvx_signal_77 = 1;
assign rvx_port_23 = rvx_signal_21;
assign rvx_signal_81 = 1;
assign rvx_port_28 = rvx_signal_70;
assign rvx_signal_38 = 1;
assign rvx_port_02 = rvx_signal_71;
assign rvx_signal_17 = 1;
assign rvx_signal_15 = 0;
assign rvx_port_36 = rvx_signal_80;
assign rvx_port_32 = rvx_signal_06;
assign rvx_signal_23 = 1;
assign rvx_port_08 = rvx_signal_82;
assign rvx_signal_62 = 1;

endmodule
