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
`include "rvx_include_19.vh"
`include "platform_info.vh"



module ERVP_I2S_MASTER
(
	clk,
	rstnn,

	i2s_tx_mclk,
	i2s_tx_lrck,
	i2s_tx_sclk,
	i2s_tx_dout,
	i2s_rx_mclk,
	i2s_rx_lrck,
	i2s_rx_sclk,
	i2s_rx_din,
	rx_interrupt,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);



parameter BW_ADDR = `PLATFORM_ADDR;
parameter BW_DATA = 32;
parameter SAMPLING_RATE = `I2S_SAMPLING_RATE;

localparam  RVX_LPARA_08 = SAMPLING_RATE*256;
localparam  RVX_LPARA_04 = SAMPLING_RATE;

localparam  RVX_LPARA_03 = 32*2;
localparam  RVX_LPARA_06 = RVX_LPARA_08/(RVX_LPARA_04*RVX_LPARA_03);
localparam  RVX_LPARA_01 = 24;
localparam  RVX_LPARA_02 = 16;

input wire clk, rstnn;

output wire i2s_tx_mclk;
output wire i2s_tx_lrck;
output wire i2s_tx_sclk;
output wire i2s_tx_dout;
output wire i2s_rx_mclk;
output wire i2s_rx_lrck;
output wire i2s_rx_sclk;
input wire i2s_rx_din;
output reg rx_interrupt;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

wire rvx_signal_34;
wire [8-1:0] rvx_signal_28;

wire rvx_signal_27;
wire [5-1:0] rvx_signal_04;

wire [8-1:0] rvx_signal_06;

wire rvx_signal_35;
wire rvx_signal_15;
wire [32-1:0] rvx_signal_03;
wire rvx_signal_24;
wire rvx_signal_12;
wire [32-1:0] rvx_signal_25;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_20;

wire rvx_signal_07;
wire rvx_signal_10;
wire [32-1:0] rvx_signal_21;
wire rvx_signal_33;
wire rvx_signal_14;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_00;

wire [8-1:0] rvx_signal_36;
wire rvx_signal_13;
reg rvx_signal_30;
reg rvx_signal_22;
wire rvx_signal_29;

localparam  RVX_LPARA_00 = 2;
localparam  RVX_LPARA_05 = 0;
localparam  RVX_LPARA_09 = 2;
localparam  RVX_LPARA_07 = 3;

reg [RVX_LPARA_00-1:0] rvx_signal_08;
reg rvx_signal_02;
reg rvx_signal_05;

wire rvx_signal_16;

wire [RVX_LPARA_01-1:0] rvx_signal_11;
wire [RVX_LPARA_01-1:0] rvx_signal_26;
wire [RVX_LPARA_01-1:0] rvx_signal_23;
reg [RVX_LPARA_02-1:0] rvx_signal_31;
reg [RVX_LPARA_02-1:0] rvx_signal_09;

reg rvx_signal_17;
reg rvx_signal_01;

RVX_MODULE_020
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_0(BW_DATA)
)
i_rvx_instance_0
(
	.rvx_port_00(clk),
	.rvx_port_17(rstnn),

	.rvx_port_07(rpsel),
	.rvx_port_06(rpenable),
	.rvx_port_25(rpaddr),
	.rvx_port_26(rpwrite),
	.rvx_port_10(rpwdata),
	.rvx_port_01(rprdata),
	.rvx_port_27(rpready),
	.rvx_port_31(rpslverr),

	.rvx_port_21(1'b 0),
	.rvx_port_23(rvx_signal_34),
	.rvx_port_11(rvx_signal_28),
	.rvx_port_28(rvx_signal_27),
	.rvx_port_04(rvx_signal_04),
	.rvx_port_15(rvx_signal_06),
	.rvx_port_19(rvx_signal_24),
	.rvx_port_12(rvx_signal_12),
	.rvx_port_20(rvx_signal_25),
	.rvx_port_18(rvx_signal_19),
	.rvx_port_30(rvx_signal_20),
	.rvx_port_22(rvx_signal_35),
	.rvx_port_16(rvx_signal_15),
	.rvx_port_14(rvx_signal_03),

	.rvx_port_05(rvx_signal_07),
	.rvx_port_02(rvx_signal_10),
	.rvx_port_29(rvx_signal_21),
	.rvx_port_13(rvx_signal_33),
	.rvx_port_24(rvx_signal_14),
	.rvx_port_03(rvx_signal_18),
	.rvx_port_09(rvx_signal_32),
	.rvx_port_08(rvx_signal_00)
);

assign rvx_signal_36 = (rvx_signal_34==1'b 1)? rvx_signal_28 : 0;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_08 <= RVX_LPARA_05;
	else if(rvx_signal_36[`RVX_GDEF_211])
		rvx_signal_08 <= RVX_LPARA_05;
	else
		case(rvx_signal_08)
			RVX_LPARA_05:
				if(rvx_signal_36[`RVX_GDEF_581])
					rvx_signal_08 <= RVX_LPARA_09;
			RVX_LPARA_09:
				if(~rvx_signal_12)
					rvx_signal_08 <= RVX_LPARA_07;
		endcase
end

assign rvx_signal_13 = rvx_signal_08[1];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_30 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_573])
		rvx_signal_30 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_069])
		rvx_signal_30 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_22 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_075])
		rvx_signal_22 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_049])
		rvx_signal_22 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rx_interrupt <= 0;
	else if(rvx_signal_36[`RVX_GDEF_330])
		rx_interrupt <= 0;
	else if(rvx_signal_22 && (rx_interrupt==0) && rvx_signal_29)
		rx_interrupt <= 1;
end

assign rvx_signal_29 = (rvx_signal_21 >= rvx_signal_06);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_02 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_037])
		rvx_signal_02 <= 0;
	else if((rvx_signal_02==0) && (rvx_signal_08==RVX_LPARA_07) && rvx_signal_19 && rvx_signal_12)
		rvx_signal_02 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_05 <= 0;
	else if(rvx_signal_36[`RVX_GDEF_037])
		rvx_signal_05 <= 0;
	else if((rvx_signal_02==0) && rvx_signal_32 && rvx_signal_14) 
		rvx_signal_05 <= 1;
end

assign rvx_signal_04[`RVX_GDEF_012] = rvx_signal_13;
assign rvx_signal_04[`RVX_GDEF_213] = rvx_signal_30;
assign rvx_signal_04[`RVX_GDEF_531] = rvx_signal_22;
assign rvx_signal_04[`RVX_GDEF_569] = rvx_signal_02;
assign rvx_signal_04[`RVX_GDEF_384] = rvx_signal_05;

assign rvx_signal_16 = clk;

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_17 <= 0;
		rvx_signal_01 <= 0;
	end
	else
	begin
		rvx_signal_17 <= i2s_rx_lrck;
		rvx_signal_01 <= i2s_tx_lrck;
	end
end

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_32 <= 0;
		rvx_signal_19 <= 0;
	end
	else
	begin
		if(rvx_signal_17 & ~i2s_rx_lrck)
			rvx_signal_32 <= 1;
		else
			rvx_signal_32 <= 0;
		if(~rvx_signal_01 & i2s_tx_lrck)
			rvx_signal_19 <= 1;
		else
			rvx_signal_19 <= 0;
	end
end

assign i2s_rx_mclk = rvx_signal_16 & rvx_signal_30;

i2s_transceiver
#(
	.mclk_sclk_ratio(RVX_LPARA_06),
	.sclk_ws_ratio(RVX_LPARA_03),
	.d_width(RVX_LPARA_01)
)
i_rvx_instance_1
(
	.reset_n(rstnn),
	.enable(rvx_signal_30),
	.mclk(i2s_rx_mclk),
	.sclk(i2s_rx_sclk),
	.ws(i2s_rx_lrck),
	.sd_rx(i2s_rx_din),
	.l_data_rx(rvx_signal_11),
	.r_data_rx(rvx_signal_26),
	.sd_tx(),
	.l_data_tx(rvx_signal_23),
	.r_data_tx(rvx_signal_23)
);

assign rvx_signal_23 = 0;
assign rvx_signal_00 = {rvx_signal_11[RVX_LPARA_01-1:8], rvx_signal_26[RVX_LPARA_01-1:8]};

assign i2s_tx_mclk = rvx_signal_16 & rvx_signal_13;
assign i2s_tx_sclk = 0;

RVX_MODULE_065
#(
	.RVX_GPARA_2(RVX_LPARA_08),
	.RVX_GPARA_0(RVX_LPARA_04),
	.RVX_GPARA_1(RVX_LPARA_02)
)
i_rvx_instance_2
(
	.rvx_port_7(rstnn)
	,.rvx_port_1(rvx_signal_13)
	,.rvx_port_2(i2s_tx_mclk)
	,.rvx_port_5(i2s_tx_lrck)
	,.rvx_port_3()
	,.rvx_port_0(i2s_tx_dout)
	,.rvx_port_6(rvx_signal_31)
	,.rvx_port_4(rvx_signal_09)
);

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_31 <= 0;
		rvx_signal_09 <= 0;
	end
	else
	begin
		if(rvx_signal_19)
		begin
			if(rvx_signal_24)
			begin
				rvx_signal_31 <= rvx_signal_20[31:16];
				rvx_signal_09 <= rvx_signal_20[15:0];
			end
			else
			begin
				rvx_signal_31 <= 0;
				rvx_signal_09 <= 0;
			end
		end
	end
end

endmodule
