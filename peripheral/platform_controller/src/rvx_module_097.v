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
`include "ervp_platform_controller_memorymap_offset.vh"
`include "ervp_string_util.vh"
`include "platform_info.vh"





module RVX_MODULE_097
(
	rvx_port_17,
	rvx_port_24,

	rvx_port_13,
	rvx_port_12,
	rvx_port_23,
	rvx_port_14,
	rvx_port_08,
	rvx_port_02,
	rvx_port_04,

	rvx_port_11,
	rvx_port_01,
	rvx_port_07,
	rvx_port_20,
	rvx_port_09,
	rvx_port_15,
	rvx_port_19,
	rvx_port_00,

	rvx_port_18,
	rvx_port_16,
	rvx_port_05,
	rvx_port_21,
	rvx_port_03,
	rvx_port_22,
	rvx_port_10,
	rvx_port_06
);





parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;
parameter RVX_GPARA_1 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"
`include "ervp_endian.vf"

localparam  RVX_LPARA_4 = 32;
localparam  RVX_LPARA_5 = 64;
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_UNSIGNED(2*RVX_GPARA_3);
localparam  RVX_LPARA_0 = RVX_GPARA_4;
localparam  RVX_LPARA_6 = 32;
localparam  RVX_LPARA_2 = 4;
localparam  RVX_LPARA_3 = `MIN(RVX_GPARA_3, RVX_LPARA_2);

input wire rvx_port_17, rvx_port_24;

input wire [`BW_BOOT_MODE-1:0] rvx_port_13;
input wire rvx_port_12;
input wire [RVX_GPARA_1-1:0] rvx_port_23;
input wire rvx_port_14;
output wire rvx_port_08;
input wire [RVX_LPARA_0*RVX_GPARA_3-1:0] rvx_port_02;
input wire [RVX_LPARA_4*RVX_GPARA_3-1:0] rvx_port_04;

input wire rvx_port_11;
input wire rvx_port_01;
input wire [RVX_GPARA_4-1:0] rvx_port_07;
input wire rvx_port_20;
input wire [RVX_LPARA_4-1:0] rvx_port_09;
output wire [RVX_LPARA_4-1:0] rvx_port_15;
output wire rvx_port_19;
output wire rvx_port_00;

input wire rvx_port_18;
input wire rvx_port_16;
input wire [RVX_GPARA_4-1:0] rvx_port_05;
input wire rvx_port_21;
input wire [RVX_LPARA_4-1:0] rvx_port_03;
output wire [RVX_LPARA_4-1:0] rvx_port_22;
output wire rvx_port_10;
output wire rvx_port_06;

genvar i;

wire [RVX_LPARA_4-1:0] rvx_signal_12;
wire [RVX_LPARA_4-1:0] rvx_signal_18;
wire [RVX_LPARA_4-1:0] rvx_signal_09;
wire [RVX_LPARA_4-1:0] rvx_signal_45;

wire rvx_signal_15;
wire rvx_signal_17;
wire [RVX_GPARA_4-1:0] rvx_signal_04;
wire rvx_signal_26;
wire [RVX_LPARA_4-1:0] rvx_signal_03;
wire [RVX_LPARA_4-1:0] rvx_signal_08;
wire rvx_signal_21;
wire rvx_signal_07;

wire rvx_signal_23;
wire [4-1:0] rvx_signal_29;
wire rvx_signal_38;
wire [1-1:0] rvx_signal_35;
wire rvx_signal_42;
wire [1-1:0] rvx_signal_22;
wire rvx_signal_47;
wire [1-1:0] rvx_signal_37;
wire rvx_signal_19;
wire [1-1:0] rvx_signal_01;
wire rvx_signal_30;
wire [32-1:0] rvx_signal_25;
wire rvx_signal_44;
wire [32-1:0] rvx_signal_00;
wire [32-1:0] rvx_signal_20;
wire rvx_signal_16;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_06;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_33;
wire [32-1:0] rvx_signal_27;
wire rvx_signal_36;
wire [32-1:0] rvx_signal_14;
wire [4-1:0] rvx_signal_41;
wire [(32)*(4)-1:0] rvx_signal_13;
wire [4-1:0] rvx_signal_40;
wire [(32)*(4)-1:0] rvx_signal_39;

wire [`BW_BOOT_MODE-1:0] rvx_signal_24;
wire rvx_signal_31;
wire rvx_signal_02;
wire [RVX_LPARA_0*RVX_GPARA_3-1:0] rvx_signal_11;
wire [RVX_LPARA_6-1:0] rvx_signal_34 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_4*RVX_GPARA_3-1:0] rvx_signal_46;
wire [RVX_LPARA_4-1:0] rvx_signal_48 [RVX_LPARA_2-1:0];

reg [RVX_LPARA_1-1:0] rvx_signal_43;
reg [`BW_BOOT_STATUS-1:0] rvx_signal_32;
reg rvx_signal_10;

assign rvx_signal_12 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_4,RVX_GPARA_2,rvx_port_09);
assign rvx_port_15 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_4,RVX_GPARA_2,rvx_signal_18);
assign rvx_signal_09 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_4,RVX_GPARA_0,rvx_port_03);
assign rvx_port_22 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_4,RVX_GPARA_0,rvx_signal_45);

RVX_MODULE_032
#(
	.RVX_GPARA_0(2),
	.RVX_GPARA_2(RVX_GPARA_4),
	.RVX_GPARA_3(RVX_LPARA_4),
	.RVX_GPARA_1(1)
)
i_rvx_instance_6
(
	.rvx_port_01(rvx_port_17),
	.rvx_port_13(rvx_port_24),

	.rvx_port_06({rvx_port_11,rvx_port_18}),
	.rvx_port_17({rvx_port_01,rvx_port_16}),
	.rvx_port_02({rvx_port_07,rvx_port_05}),
	.rvx_port_09({rvx_port_20,rvx_port_21}),
	.rvx_port_00({rvx_signal_12,rvx_signal_09}),
	.rvx_port_04(2'b 0),
	.rvx_port_15({rvx_signal_18,rvx_signal_45}),
	.rvx_port_05({rvx_port_19,rvx_port_10}),
	.rvx_port_07({rvx_port_00,rvx_port_06}),

	.rvx_port_19(rvx_signal_15),
	.rvx_port_08(rvx_signal_17),
	.rvx_port_14(rvx_signal_04),
	.rvx_port_18(rvx_signal_26),
	.rvx_port_11(rvx_signal_03),
	.rvx_port_10(),
	.rvx_port_12(rvx_signal_08),
	.rvx_port_16(rvx_signal_21),
	.rvx_port_03(rvx_signal_07)
);

RVX_MODULE_089
#(
	.RVX_GPARA_2(RVX_GPARA_4),
	.RVX_GPARA_1(RVX_LPARA_4),
	.RVX_GPARA_0(`LITTLE_ENDIAN)
)
i_rvx_instance_2
(
	.rvx_port_33(rvx_port_17),
	.rvx_port_15(rvx_port_24),

	.rvx_port_21(rvx_signal_15),
	.rvx_port_24(rvx_signal_17),
	.rvx_port_12(rvx_signal_04),
	.rvx_port_27(rvx_signal_26),
	.rvx_port_30(rvx_signal_03),
	.rvx_port_36(rvx_signal_08),
	.rvx_port_11(rvx_signal_21),
	.rvx_port_01(rvx_signal_07),

	.rvx_port_20(1'b 0),
	.rvx_port_16(rvx_signal_23),
	.rvx_port_09(rvx_signal_29),
	.rvx_port_05(rvx_signal_38),
	.rvx_port_00(rvx_signal_35),
	.rvx_port_10(rvx_signal_42),
	.rvx_port_02(rvx_signal_22),
	.rvx_port_08(rvx_signal_47),
	.rvx_port_14(rvx_signal_37),
	.rvx_port_35(rvx_signal_19),
	.rvx_port_13(rvx_signal_01),
	.rvx_port_19(rvx_signal_30),
	.rvx_port_18(rvx_signal_25),
	.rvx_port_28(rvx_signal_44),
	.rvx_port_32(rvx_signal_00),
  .rvx_port_26(rvx_signal_20),
	.rvx_port_06(rvx_signal_16),
	.rvx_port_07(rvx_signal_05),
	.rvx_port_23(rvx_signal_06),
	.rvx_port_25(rvx_signal_28),
	.rvx_port_03(rvx_signal_33),
	.rvx_port_04(rvx_signal_27),
	.rvx_port_31(rvx_signal_36),
	.rvx_port_17(rvx_signal_14),
	.rvx_port_29(rvx_signal_41),
	.rvx_port_37(rvx_signal_13),
	.rvx_port_34(rvx_signal_40),
	.rvx_port_22(rvx_signal_39)
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(`BW_BOOT_MODE)
)
i_rvx_instance_5
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.asynch_value(rvx_port_13),
	.synch_value(rvx_signal_24)
);
assign rvx_signal_29 = rvx_signal_24;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.asynch_value(rvx_port_12),
	.synch_value(rvx_signal_31)
);
assign rvx_signal_01 = rvx_signal_31;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_4
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.asynch_value(`IS_ALL_ONE({rvx_port_14,rvx_port_23})),
	.synch_value(rvx_signal_02)
);
assign rvx_signal_35 = rvx_signal_02;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_0*RVX_GPARA_3)
)
i_rvx_instance_1
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.asynch_value(rvx_port_02),
	.synch_value(rvx_signal_11)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin: i_gen_valid_pc
		assign rvx_signal_34[i] = rvx_signal_11[RVX_LPARA_0*(i+1)-1 -:RVX_LPARA_0];
	end
endgenerate

generate
	for(i=RVX_LPARA_3; i<RVX_LPARA_2; i=i+1)
	begin: i_gen_invalid_pc
		assign rvx_signal_34[i] = 32'h FFFFFFFF;
	end
endgenerate

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin: i_concat_pc
		assign rvx_signal_13[RVX_LPARA_4*(i+1)-1-:RVX_LPARA_4] = rvx_signal_34[i];
	end
endgenerate

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_4*RVX_GPARA_3)
)
i_rvx_instance_0
(
	.clk(rvx_port_17),
	.rstnn(rvx_port_24),
	.enable(1'b 1),
	.asynch_value(rvx_port_04),
	.synch_value(rvx_signal_46)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin: i_gen_valid_inst
		assign rvx_signal_48[i] = rvx_signal_46[RVX_LPARA_4*(i+1)-1 -:RVX_LPARA_4];
	end
endgenerate

generate
	for(i=RVX_LPARA_3; i<RVX_LPARA_2; i=i+1)
	begin: i_gen_invalid_inst
		assign rvx_signal_48[i] = 32'h FFFFFFFF;
	end
endgenerate

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin: i_concat_inst
		assign rvx_signal_39[RVX_LPARA_4*(i+1)-1-:RVX_LPARA_4] = rvx_signal_48[i];
	end
endgenerate

`ifdef RTL_IMP
assign rvx_signal_27 = `IMP_TYPE_RTL;
`else
`ifdef FPGA_IMP
assign rvx_signal_27 = `IMP_TYPE_FPGA;
`else
assign rvx_signal_27 = `IMP_TYPE_CHIP;
`endif
`endif

`ifdef FLASH_BASE_ADDR
assign rvx_signal_14 = `FLASH_BASE_ADDR;
`else
assign rvx_signal_14 = 0;
`endif

always@(posedge rvx_port_17, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_43 <= 0;
	else if(rvx_signal_16)
	begin
		rvx_signal_43 <= rvx_signal_43 + 1'b 1;
		`ifdef SIM_ENV
			if((rvx_signal_43+1)>RVX_GPARA_3)
				$display("\n[PROC_STATUS] %2d cores have finished @%d ns", (rvx_signal_43+1)-RVX_GPARA_3, $time);
		`endif
	end
end
assign rvx_signal_05 = rvx_signal_43;
assign rvx_signal_28 = rvx_signal_43;

always@(posedge rvx_port_17, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_32 <= `BOOT_STATUS_RESETED;
	else
		case(rvx_signal_32)
			`BOOT_STATUS_RESETED:
				if(rvx_signal_30)
					rvx_signal_32 <= `BOOT_STATUS_APP_LOAD;
			`BOOT_STATUS_APP_LOAD:
				if(rvx_signal_44)
					rvx_signal_32 <= `BOOT_STATUS_ALL_READY;
			`BOOT_STATUS_ALL_READY:
				;
		endcase
end
assign rvx_signal_25 = rvx_signal_32;

always@(posedge rvx_port_17, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_10 <= 0;
	else if(rvx_signal_47)
		rvx_signal_10 <= 1;
end
assign rvx_signal_22 = rvx_signal_10;

assign rvx_port_08 = ($unsigned(rvx_signal_43)==(2*RVX_GPARA_3));

endmodule
