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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_071
(
	rvx_port_00,
	rvx_port_33,

	rvx_port_31,
	rvx_port_05,
	rvx_port_07,
	rvx_port_09,
	rvx_port_08,
	rvx_port_23,
	rvx_port_34,
	rvx_port_19,

	rvx_port_16,
	rvx_port_27,
	rvx_port_20,
	rvx_port_18,
	rvx_port_11,
	rvx_port_14,
	rvx_port_13,
	rvx_port_30,
	rvx_port_04,
	rvx_port_01,
	rvx_port_17,
	rvx_port_36,
	rvx_port_28,
	rvx_port_32,
	rvx_port_29,
	rvx_port_26,
	rvx_port_10,
	rvx_port_35,
	rvx_port_15,
	rvx_port_03,
	rvx_port_21,
	rvx_port_22,
	rvx_port_24,
	rvx_port_12,
	rvx_port_06,
	rvx_port_02,
	rvx_port_25
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_00, rvx_port_33;
input wire rvx_port_31;
input wire rvx_port_05;
input wire [RVX_GPARA_2-1:0] rvx_port_07;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_08;
output wire [RVX_GPARA_0-1:0] rvx_port_23;
output reg rvx_port_34;
output reg rvx_port_19;

input wire rvx_port_16;

output wire [1-1:0] rvx_port_27;
output wire [1-1:0] rvx_port_20;
input wire [1-1:0] rvx_port_18;
output wire rvx_port_11;

output wire [1-1:0] rvx_port_14;
output wire [1-1:0] rvx_port_13;
input wire [1-1:0] rvx_port_30;
output wire rvx_port_04;

output wire [1-1:0] rvx_port_01;
output wire [1-1:0] rvx_port_17;
input wire [1-1:0] rvx_port_36;
output wire rvx_port_28;

output wire [1-1:0] rvx_port_32;
output wire [1-1:0] rvx_port_29;
input wire [1-1:0] rvx_port_26;
output wire rvx_port_10;

output wire [1-1:0] rvx_port_35;

output wire [1-1:0] rvx_port_15;

output wire [1-1:0] rvx_port_03;

output wire rvx_port_21;

output wire [1-1:0] rvx_port_22;

output wire [32-1:0] rvx_port_24;

output wire [32-1:0] rvx_port_12;

output wire rvx_port_06;
output wire [32-1:0] rvx_port_02;

output wire [4-1:0] rvx_port_25;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_32;
reg [RVX_GPARA_0-1:0] rvx_signal_47;
wire rvx_signal_35;
wire rvx_signal_64;
wire rvx_signal_48;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_07;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_49;
wire [RVX_GPARA_2-1:0] rvx_signal_56;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_63;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_83;
wire [RVX_GPARA_0-1:0] rvx_signal_57;
reg rvx_signal_23;
wire [RVX_GPARA_0-1:0] rvx_signal_39;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_11;
reg rvx_signal_58;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
reg rvx_signal_41;
wire [RVX_GPARA_0-1:0] rvx_signal_77;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_14;
reg rvx_signal_71;
wire [RVX_GPARA_0-1:0] rvx_signal_40;
reg rvx_signal_33;
wire [RVX_GPARA_0-1:0] rvx_signal_60;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_38;
reg rvx_signal_43;
wire [RVX_GPARA_0-1:0] rvx_signal_05;
reg rvx_signal_10;
wire [RVX_GPARA_0-1:0] rvx_signal_52;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_51;
reg rvx_signal_20;
wire [1-1:0] rvx_signal_13;
reg rvx_signal_59;
wire [1-1:0] rvx_signal_15;
wire rvx_signal_82;
reg [1-1:0] rvx_signal_73;
reg rvx_signal_17;
wire [1-1:0] rvx_signal_54;
reg rvx_signal_75;
wire [1-1:0] rvx_signal_26;
wire rvx_signal_16;
reg [1-1:0] rvx_signal_53;
reg rvx_signal_66;
wire [1-1:0] rvx_signal_44;
reg rvx_signal_04;
wire [1-1:0] rvx_signal_65;
wire rvx_signal_07;
reg [1-1:0] rvx_signal_24;
reg rvx_signal_84;
wire [1-1:0] rvx_signal_68;
reg rvx_signal_37;
wire [1-1:0] rvx_signal_28;
wire rvx_signal_30;
reg rvx_signal_09;
wire [1-1:0] rvx_signal_08;
reg rvx_signal_36;
wire [1-1:0] rvx_signal_02;
wire rvx_signal_67;
reg [1-1:0] rvx_signal_03;
reg rvx_signal_85;
wire [32-1:0] rvx_signal_78;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_22;
wire rvx_signal_01;
reg [32-1:0] rvx_signal_06;
reg rvx_signal_80;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_76;
wire [32-1:0] rvx_signal_18;
wire rvx_signal_42;
reg [32-1:0] rvx_signal_61;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_46;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_69;
wire rvx_signal_62;
reg rvx_signal_50;
wire [4-1:0] rvx_signal_72;
reg rvx_signal_34;
wire [4-1:0] rvx_signal_70;
wire rvx_signal_31;
reg [4-1:0] rvx_signal_12;

assign rvx_signal_32 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_08);
assign rvx_port_23 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_47);
assign {rvx_signal_56,rvx_signal_63} = paddr_offset;
assign rvx_signal_49 = {rvx_signal_56,addr_unused};
assign rvx_signal_48 = (rvx_signal_63==0);
assign rvx_signal_35 = rvx_port_31 & rvx_port_05 & rvx_signal_48 & (~rvx_port_09);
assign rvx_signal_64 = rvx_port_31 & rvx_port_05 & rvx_signal_48 & rvx_port_09;

assign rvx_signal_39 = $unsigned(rvx_port_08);
assign rvx_signal_77 = $unsigned(rvx_port_08);
assign rvx_signal_60 = $unsigned(rvx_port_08);
assign rvx_signal_52 = $unsigned(rvx_port_08);
assign rvx_signal_15 = $unsigned(rvx_port_08);
assign rvx_signal_26 = $unsigned(rvx_port_08);
assign rvx_signal_65 = $unsigned(rvx_port_08);
assign rvx_signal_28 = $unsigned(rvx_port_08);
assign rvx_signal_02 = $unsigned(rvx_port_08);
assign rvx_signal_22 = $unsigned(rvx_port_08);
assign rvx_signal_18 = $unsigned(rvx_port_08);
assign rvx_signal_69 = $unsigned(rvx_port_08);
assign rvx_signal_70 = $unsigned(rvx_port_08);

always@(*)
begin
	rvx_port_19 = 0;
	rvx_signal_47 = 0;
	rvx_port_34 = 1;

	rvx_signal_83 = 0;
	rvx_signal_23 = 0;

	rvx_signal_58 = 0;
	rvx_signal_41 = 0;

	rvx_signal_71 = 0;
	rvx_signal_33 = 0;

	rvx_signal_43 = 0;
	rvx_signal_10 = 0;

	rvx_signal_20 = 0;
	rvx_signal_59 = 0;

	rvx_signal_17 = 0;
	rvx_signal_75 = 0;

	rvx_signal_66 = 0;
	rvx_signal_04 = 0;

	rvx_signal_84 = 0;
	rvx_signal_37 = 0;

	rvx_signal_09 = 0;
	rvx_signal_36 = 0;

	rvx_signal_85 = 0;
	rvx_signal_29 = 0;

	rvx_signal_80 = 0;
	rvx_signal_76 = 0;

	rvx_signal_21 = 0;
	rvx_signal_00 = 0;

	rvx_signal_50 = 0;
	rvx_signal_34 = 0;

	if(rvx_port_31==1'b 1)
	begin
		case(rvx_signal_49)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_83 = rvx_signal_35;
				rvx_signal_23 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_57);
				rvx_port_34 = rvx_signal_11;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_58 = rvx_signal_35;
				rvx_signal_41 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_27);
				rvx_port_34 = rvx_signal_14;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_71 = rvx_signal_35;
				rvx_signal_33 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_40);
				rvx_port_34 = rvx_signal_38;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_43 = rvx_signal_35;
				rvx_signal_10 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_05);
				rvx_port_34 = rvx_signal_51;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_20 = rvx_signal_35;
				rvx_signal_59 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_13);
				rvx_port_34 = rvx_signal_82;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_17 = rvx_signal_35;
				rvx_signal_75 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_54);
				rvx_port_34 = rvx_signal_16;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_66 = rvx_signal_35;
				rvx_signal_04 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_44);
				rvx_port_34 = rvx_signal_07;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_84 = rvx_signal_35;
				rvx_signal_37 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_68);
				rvx_port_34 = rvx_signal_30;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_09 = rvx_signal_35;
				rvx_signal_36 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_08);
				rvx_port_34 = rvx_signal_67;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_85 = rvx_signal_35;
				rvx_signal_29 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_78);
				rvx_port_34 = rvx_signal_01;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_80 = rvx_signal_35;
				rvx_signal_76 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_25);
				rvx_port_34 = rvx_signal_42;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_21 = rvx_signal_35;
				rvx_signal_00 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_46);
				rvx_port_34 = rvx_signal_62;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_50 = rvx_signal_35;
				rvx_signal_34 = rvx_signal_64;
				rvx_signal_47 = $unsigned(rvx_signal_72);
				rvx_port_34 = rvx_signal_31;
			end
			default:
				rvx_port_19 = 1;
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
	.clk(rvx_port_00),
	.rstnn(rvx_port_33),
	.rwenable(rvx_signal_23),
	.rwdata(rvx_signal_39),
	.rrenable(rvx_signal_83),
	.rrdata(rvx_signal_57),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_11),
	.tick_gpio(rvx_port_16),
	.gpio_soe(rvx_port_27),
	.gpio_soval(rvx_port_20),
	.gpio_sival(rvx_port_18)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_33),
	.rwenable(rvx_signal_41),
	.rwdata(rvx_signal_77),
	.rrenable(rvx_signal_58),
	.rrdata(rvx_signal_27),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_04),
	.tick_gpio(rvx_port_16),
	.gpio_soe(rvx_port_14),
	.gpio_soval(rvx_port_13),
	.gpio_sival(rvx_port_30)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_33),
	.rwenable(rvx_signal_33),
	.rwdata(rvx_signal_60),
	.rrenable(rvx_signal_71),
	.rrdata(rvx_signal_40),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_28),
	.tick_gpio(rvx_port_16),
	.gpio_soe(rvx_port_01),
	.gpio_soval(rvx_port_17),
	.gpio_sival(rvx_port_36)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_0),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_00),
	.rstnn(rvx_port_33),
	.rwenable(rvx_signal_10),
	.rwdata(rvx_signal_52),
	.rrenable(rvx_signal_43),
	.rrdata(rvx_signal_05),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_10),
	.tick_gpio(rvx_port_16),
	.gpio_soe(rvx_port_32),
	.gpio_soval(rvx_port_29),
	.gpio_sival(rvx_port_26)
);
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_73 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_73 <= rvx_signal_15;
end
assign rvx_signal_13 = rvx_signal_73;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_53 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_75==1'b 1)
		rvx_signal_53 <= rvx_signal_26;
end
assign rvx_signal_54 = rvx_signal_53;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_24 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_04==1'b 1)
		rvx_signal_24 <= rvx_signal_65;
end
assign rvx_signal_44 = rvx_signal_24;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_03 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_36==1'b 1)
		rvx_signal_03 <= rvx_signal_02;
end
assign rvx_signal_08 = rvx_signal_03;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_06 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_29==1'b 1)
		rvx_signal_06 <= rvx_signal_22;
end
assign rvx_signal_78 = rvx_signal_06;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_61 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_76==1'b 1)
		rvx_signal_61 <= rvx_signal_18;
end
assign rvx_signal_25 = rvx_signal_61;
always@(posedge rvx_port_00, negedge rvx_port_33)
begin
	if(rvx_port_33==0)
		rvx_signal_12 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_34==1'b 1)
		rvx_signal_12 <= rvx_signal_70;
end
assign rvx_signal_72 = rvx_signal_12;
assign rvx_signal_11 = 1;
assign rvx_signal_14 = 1;
assign rvx_signal_38 = 1;
assign rvx_signal_51 = 1;
assign rvx_port_35 = rvx_signal_73;
assign rvx_signal_82 = 1;
assign rvx_port_15 = rvx_signal_53;
assign rvx_signal_16 = 1;
assign rvx_port_03 = rvx_signal_24;
assign rvx_signal_07 = 1;
assign rvx_port_21 = rvx_signal_37;
assign rvx_signal_68 = 0;
assign rvx_signal_30 = 1;
assign rvx_port_22 = rvx_signal_03;
assign rvx_signal_67 = 1;
assign rvx_port_24 = rvx_signal_06;
assign rvx_signal_01 = 1;
assign rvx_port_12 = rvx_signal_61;
assign rvx_signal_42 = 1;
assign rvx_signal_46 = 0;
assign rvx_port_06 = rvx_signal_00;
assign rvx_port_02 = rvx_signal_69;
assign rvx_signal_62 = 1;
assign rvx_port_25 = rvx_signal_12;
assign rvx_signal_31 = 1;

endmodule
