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





module RVX_MODULE_016
(
	rvx_port_24,
	rvx_port_12,

	rvx_port_09,
	rvx_port_07,
	rvx_port_32,
	rvx_port_22,
	rvx_port_20,
	rvx_port_15,
	rvx_port_29,
	rvx_port_02,

	rvx_port_19,
	rvx_port_06,
	rvx_port_08,
	rvx_port_26,
	rvx_port_28,
	rvx_port_34,
	rvx_port_11,
	rvx_port_23,
	rvx_port_17,
	rvx_port_27,
	rvx_port_35,
	rvx_port_14,
	rvx_port_05,
	rvx_port_01,
	rvx_port_00,
	rvx_port_30,
	rvx_port_21,
	rvx_port_04,
	rvx_port_16,
	rvx_port_03,
	rvx_port_36,
	rvx_port_18,
	rvx_port_25,
	rvx_port_31,
	rvx_port_33,
	rvx_port_13,
	rvx_port_10
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_24, rvx_port_12;
input wire rvx_port_09;
input wire rvx_port_07;
input wire [RVX_GPARA_2-1:0] rvx_port_32;
input wire rvx_port_22;
input wire [RVX_GPARA_1-1:0] rvx_port_20;
output wire [RVX_GPARA_1-1:0] rvx_port_15;
output reg rvx_port_29;
output reg rvx_port_02;

input wire rvx_port_19;

output wire [1-1:0] rvx_port_06;
output wire [1-1:0] rvx_port_08;
input wire [1-1:0] rvx_port_26;
output wire rvx_port_28;

output wire [1-1:0] rvx_port_34;
output wire [1-1:0] rvx_port_11;
input wire [1-1:0] rvx_port_23;
output wire rvx_port_17;

output wire [1-1:0] rvx_port_27;
output wire [1-1:0] rvx_port_35;
input wire [1-1:0] rvx_port_14;
output wire rvx_port_05;

output wire [1-1:0] rvx_port_01;
output wire [1-1:0] rvx_port_00;
input wire [1-1:0] rvx_port_30;
output wire rvx_port_21;

output wire [1-1:0] rvx_port_04;

output wire [1-1:0] rvx_port_16;

output wire [1-1:0] rvx_port_03;

output wire rvx_port_36;

output wire [1-1:0] rvx_port_18;

output wire [32-1:0] rvx_port_25;

output wire [32-1:0] rvx_port_31;

output wire rvx_port_33;
output wire [32-1:0] rvx_port_13;

output wire [4-1:0] rvx_port_10;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_27;
reg [RVX_GPARA_1-1:0] rvx_signal_64;
wire rvx_signal_72;
wire rvx_signal_77;
wire rvx_signal_61;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_32;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_08;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_59;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_76;
wire [RVX_GPARA_1-1:0] rvx_signal_58;
reg rvx_signal_57;
wire [RVX_GPARA_1-1:0] rvx_signal_53;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_73;
reg rvx_signal_30;
wire [RVX_GPARA_1-1:0] rvx_signal_45;
reg rvx_signal_28;
wire [RVX_GPARA_1-1:0] rvx_signal_19;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_85;
reg rvx_signal_12;
wire [RVX_GPARA_1-1:0] rvx_signal_46;
reg rvx_signal_55;
wire [RVX_GPARA_1-1:0] rvx_signal_01;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_36;
reg rvx_signal_23;
wire [RVX_GPARA_1-1:0] rvx_signal_21;
reg rvx_signal_31;
wire [RVX_GPARA_1-1:0] rvx_signal_48;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_00;
reg rvx_signal_84;
wire [1-1:0] rvx_signal_67;
reg rvx_signal_22;
wire [1-1:0] rvx_signal_33;
wire rvx_signal_15;
reg [1-1:0] rvx_signal_18;
reg rvx_signal_39;
wire [1-1:0] rvx_signal_42;
reg rvx_signal_04;
wire [1-1:0] rvx_signal_82;
wire rvx_signal_68;
reg [1-1:0] rvx_signal_56;
reg rvx_signal_65;
wire [1-1:0] rvx_signal_25;
reg rvx_signal_49;
wire [1-1:0] rvx_signal_40;
wire rvx_signal_37;
reg [1-1:0] rvx_signal_24;
reg rvx_signal_74;
wire [1-1:0] rvx_signal_03;
reg rvx_signal_69;
wire [1-1:0] rvx_signal_06;
wire rvx_signal_44;
reg rvx_signal_79;
wire [1-1:0] rvx_signal_41;
reg rvx_signal_43;
wire [1-1:0] rvx_signal_20;
wire rvx_signal_50;
reg [1-1:0] rvx_signal_62;
reg rvx_signal_81;
wire [32-1:0] rvx_signal_07;
reg rvx_signal_66;
wire [32-1:0] rvx_signal_71;
wire rvx_signal_70;
reg [32-1:0] rvx_signal_35;
reg rvx_signal_10;
wire [32-1:0] rvx_signal_09;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_16;
reg [32-1:0] rvx_signal_52;
reg rvx_signal_13;
wire [32-1:0] rvx_signal_75;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_51;
wire rvx_signal_54;
reg rvx_signal_29;
wire [4-1:0] rvx_signal_11;
reg rvx_signal_47;
wire [4-1:0] rvx_signal_14;
wire rvx_signal_34;
reg [4-1:0] rvx_signal_63;

assign rvx_signal_27 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_20);
assign rvx_port_15 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_64);
assign {rvx_signal_08,rvx_signal_59} = paddr_offset;
assign rvx_signal_17 = {rvx_signal_08,addr_unused};
assign rvx_signal_61 = (rvx_signal_59==0);
assign rvx_signal_72 = rvx_port_09 & rvx_port_07 & rvx_signal_61 & (~rvx_port_22);
assign rvx_signal_77 = rvx_port_09 & rvx_port_07 & rvx_signal_61 & rvx_port_22;

assign rvx_signal_53 = $unsigned(rvx_port_20);
assign rvx_signal_19 = $unsigned(rvx_port_20);
assign rvx_signal_01 = $unsigned(rvx_port_20);
assign rvx_signal_48 = $unsigned(rvx_port_20);
assign rvx_signal_33 = $unsigned(rvx_port_20);
assign rvx_signal_82 = $unsigned(rvx_port_20);
assign rvx_signal_40 = $unsigned(rvx_port_20);
assign rvx_signal_06 = $unsigned(rvx_port_20);
assign rvx_signal_20 = $unsigned(rvx_port_20);
assign rvx_signal_71 = $unsigned(rvx_port_20);
assign rvx_signal_05 = $unsigned(rvx_port_20);
assign rvx_signal_51 = $unsigned(rvx_port_20);
assign rvx_signal_14 = $unsigned(rvx_port_20);

always@(*)
begin
	rvx_port_02 = 0;
	rvx_signal_64 = 0;
	rvx_port_29 = 1;

	rvx_signal_76 = 0;
	rvx_signal_57 = 0;

	rvx_signal_30 = 0;
	rvx_signal_28 = 0;

	rvx_signal_12 = 0;
	rvx_signal_55 = 0;

	rvx_signal_23 = 0;
	rvx_signal_31 = 0;

	rvx_signal_84 = 0;
	rvx_signal_22 = 0;

	rvx_signal_39 = 0;
	rvx_signal_04 = 0;

	rvx_signal_65 = 0;
	rvx_signal_49 = 0;

	rvx_signal_74 = 0;
	rvx_signal_69 = 0;

	rvx_signal_79 = 0;
	rvx_signal_43 = 0;

	rvx_signal_81 = 0;
	rvx_signal_66 = 0;

	rvx_signal_10 = 0;
	rvx_signal_02 = 0;

	rvx_signal_13 = 0;
	rvx_signal_83 = 0;

	rvx_signal_29 = 0;
	rvx_signal_47 = 0;

	if(rvx_port_09==1'b 1)
	begin
		case(rvx_signal_17)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_76 = rvx_signal_72;
				rvx_signal_57 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_58);
				rvx_port_29 = rvx_signal_73;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_30 = rvx_signal_72;
				rvx_signal_28 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_45);
				rvx_port_29 = rvx_signal_85;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_12 = rvx_signal_72;
				rvx_signal_55 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_46);
				rvx_port_29 = rvx_signal_36;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_23 = rvx_signal_72;
				rvx_signal_31 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_21);
				rvx_port_29 = rvx_signal_00;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_84 = rvx_signal_72;
				rvx_signal_22 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_67);
				rvx_port_29 = rvx_signal_15;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_39 = rvx_signal_72;
				rvx_signal_04 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_42);
				rvx_port_29 = rvx_signal_68;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_65 = rvx_signal_72;
				rvx_signal_49 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_25);
				rvx_port_29 = rvx_signal_37;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_74 = rvx_signal_72;
				rvx_signal_69 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_03);
				rvx_port_29 = rvx_signal_44;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_79 = rvx_signal_72;
				rvx_signal_43 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_41);
				rvx_port_29 = rvx_signal_50;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_81 = rvx_signal_72;
				rvx_signal_66 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_07);
				rvx_port_29 = rvx_signal_70;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_10 = rvx_signal_72;
				rvx_signal_02 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_09);
				rvx_port_29 = rvx_signal_16;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_13 = rvx_signal_72;
				rvx_signal_83 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_75);
				rvx_port_29 = rvx_signal_54;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_29 = rvx_signal_72;
				rvx_signal_47 = rvx_signal_77;
				rvx_signal_64 = $unsigned(rvx_signal_11);
				rvx_port_29 = rvx_signal_34;
			end
			default:
				rvx_port_02 = 1;
		endcase
	end
end

ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_57),
	.rwdata(rvx_signal_53),
	.rrenable(rvx_signal_76),
	.rrdata(rvx_signal_58),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_28),
	.tick_gpio(rvx_port_19),
	.gpio_soe(rvx_port_06),
	.gpio_soval(rvx_port_08),
	.gpio_sival(rvx_port_26)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_28),
	.rwdata(rvx_signal_19),
	.rrenable(rvx_signal_30),
	.rrdata(rvx_signal_45),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_17),
	.tick_gpio(rvx_port_19),
	.gpio_soe(rvx_port_34),
	.gpio_soval(rvx_port_11),
	.gpio_sival(rvx_port_23)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_55),
	.rwdata(rvx_signal_01),
	.rrenable(rvx_signal_12),
	.rrdata(rvx_signal_46),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_05),
	.tick_gpio(rvx_port_19),
	.gpio_soe(rvx_port_27),
	.gpio_soval(rvx_port_35),
	.gpio_sival(rvx_port_14)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_24),
	.rstnn(rvx_port_12),
	.rwenable(rvx_signal_31),
	.rwdata(rvx_signal_48),
	.rrenable(rvx_signal_23),
	.rrdata(rvx_signal_21),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_21),
	.tick_gpio(rvx_port_19),
	.gpio_soe(rvx_port_01),
	.gpio_soval(rvx_port_00),
	.gpio_sival(rvx_port_30)
);
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_18 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_22==1'b 1)
		rvx_signal_18 <= rvx_signal_33;
end
assign rvx_signal_67 = rvx_signal_18;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_56 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_56 <= rvx_signal_82;
end
assign rvx_signal_42 = rvx_signal_56;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_24 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_49==1'b 1)
		rvx_signal_24 <= rvx_signal_40;
end
assign rvx_signal_25 = rvx_signal_24;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_62 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_43==1'b 1)
		rvx_signal_62 <= rvx_signal_20;
end
assign rvx_signal_41 = rvx_signal_62;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_35 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_66==1'b 1)
		rvx_signal_35 <= rvx_signal_71;
end
assign rvx_signal_07 = rvx_signal_35;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_52 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_02==1'b 1)
		rvx_signal_52 <= rvx_signal_05;
end
assign rvx_signal_09 = rvx_signal_52;
always@(posedge rvx_port_24, negedge rvx_port_12)
begin
	if(rvx_port_12==0)
		rvx_signal_63 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_47==1'b 1)
		rvx_signal_63 <= rvx_signal_14;
end
assign rvx_signal_11 = rvx_signal_63;
assign rvx_signal_73 = 1;
assign rvx_signal_85 = 1;
assign rvx_signal_36 = 1;
assign rvx_signal_00 = 1;
assign rvx_port_04 = rvx_signal_18;
assign rvx_signal_15 = 1;
assign rvx_port_16 = rvx_signal_56;
assign rvx_signal_68 = 1;
assign rvx_port_03 = rvx_signal_24;
assign rvx_signal_37 = 1;
assign rvx_port_36 = rvx_signal_69;
assign rvx_signal_03 = 0;
assign rvx_signal_44 = 1;
assign rvx_port_18 = rvx_signal_62;
assign rvx_signal_50 = 1;
assign rvx_port_25 = rvx_signal_35;
assign rvx_signal_70 = 1;
assign rvx_port_31 = rvx_signal_52;
assign rvx_signal_16 = 1;
assign rvx_signal_75 = 0;
assign rvx_port_33 = rvx_signal_83;
assign rvx_port_13 = rvx_signal_51;
assign rvx_signal_54 = 1;
assign rvx_port_10 = rvx_signal_63;
assign rvx_signal_34 = 1;

endmodule
