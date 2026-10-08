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





module RVX_MODULE_086
(
	rvx_port_07,
	rvx_port_02,
	rvx_port_14,
	rvx_port_12,
	rvx_port_17,
	rvx_port_06,
	rvx_port_15,
	rvx_port_04,
	rvx_port_10,
	rvx_port_05,

	rvx_port_16,
	rvx_port_03,
	rvx_port_11,
	rvx_port_01,
	rvx_port_00,
	rvx_port_09,
	rvx_port_13,
	rvx_port_08
);





parameter RVX_GPARA_2 = 0;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"

localparam  RVX_LPARA_1 = 32;
localparam  RVX_LPARA_2 = 6;
localparam  RVX_LPARA_0 = RVX_GPARA_1 + 1;

input wire rvx_port_07, rvx_port_02;
input wire [`BW_BOOT_MODE-1:0] rvx_port_14;
input wire rvx_port_12; 
input wire rvx_port_17;

output wire rvx_port_06;
output wire rvx_port_15;
output wire [RVX_GPARA_1-1:0] rvx_port_04;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
output wire rvx_port_05;

input wire rvx_port_16;
input wire rvx_port_03;
input wire [RVX_LPARA_1-1:0] rvx_port_11;
input wire rvx_port_01;
input wire [RVX_GPARA_4-1:0] rvx_port_00;
output wire [RVX_GPARA_4-1:0] rvx_port_09;
output wire rvx_port_13;
output reg rvx_port_08;

genvar i,j;
integer k;

wire rvx_signal_17;
wire rvx_signal_18;

`define RVX_LDEF_0 2
`define RVX_LDEF_3 0
`define RVX_LDEF_1 1
`define RVX_LDEF_2 2
reg [`RVX_LDEF_0-1:0] rvx_signal_09;

wire rvx_signal_01;
wire rvx_signal_20;
wire rvx_signal_16;
wire rvx_signal_23;

reg [RVX_LPARA_0-1:0] rvx_signal_14;
wire [RVX_GPARA_1-1:0] rvx_signal_22;
wire [RVX_GPARA_1-1:0] rvx_signal_15;
wire rvx_signal_24;
wire rvx_signal_25;
wire rvx_signal_07;
wire rvx_signal_08;
wire rvx_signal_21;

reg [RVX_GPARA_1-1:0] rvx_signal_11;

reg [`BW_RESET_CMD-1:0] rvx_signal_03;
reg rvx_signal_06;
reg rvx_signal_13;
wire rvx_signal_04;

wire [RVX_GPARA_4-1:0] rvx_signal_19;
reg [RVX_GPARA_4-1:0] rvx_signal_02;

wire [`BW_MMAP_SUBOFFSET_RESET-1:0] rvx_signal_00;
wire rvx_signal_05;
reg rvx_signal_12;
reg rvx_signal_10;

assign rvx_signal_17 = (RVX_GPARA_2==1)? (~rvx_port_02) : rvx_port_02;

RESET_BUF
i_rvx_instance_0
(
  .I(rvx_signal_17),
  .O(rvx_port_06)
);

assign rvx_port_15 = ~rvx_port_06;
assign rvx_signal_18 =  rvx_port_06 & (rvx_port_17);

always@(posedge rvx_port_07, negedge rvx_signal_18)
begin
	if(rvx_signal_18==0)
	begin
		rvx_signal_09 <= `RVX_LDEF_3;
		rvx_signal_14 <= {RVX_LPARA_0{1'b 1}};
	end
	else if(rvx_signal_25)
	begin
		rvx_signal_09 <= `RVX_LDEF_3;
		rvx_signal_14 <= {RVX_LPARA_0{1'b 1}};
	end
	else
		case(rvx_signal_09)
			`RVX_LDEF_3:
			begin
				rvx_signal_09 <= `RVX_LDEF_1;
				rvx_signal_14 <= {RVX_LPARA_0{1'b 0}};
			end
			`RVX_LDEF_1:
				rvx_signal_09 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_24)
					rvx_signal_14 <= {rvx_signal_14,1'b1};
		endcase
end

assign {rvx_signal_21,rvx_signal_22} = rvx_signal_14;
assign rvx_signal_08 = rvx_signal_22[RVX_GPARA_1-1];
assign rvx_signal_25 = rvx_signal_04;
assign rvx_signal_24 = rvx_signal_13 & rvx_signal_23;
assign rvx_signal_07 = ~rvx_signal_22[RVX_GPARA_3-1];

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_2),
	.CIRCULAR(0)
)
i_rvx_instance_1
(
	.clk(rvx_port_07),
	.rstnn(rvx_signal_18),
	.enable(1'b 1),
	.init(rvx_signal_20),
	.count(rvx_signal_01),
	.value(),
	.is_first_count(rvx_signal_16),
	.is_last_count(rvx_signal_23)
);

assign rvx_signal_20 = rvx_signal_06 | rvx_signal_24;
assign rvx_signal_01 = rvx_signal_13 & (~rvx_signal_24);

`ifdef SIM_ENV
initial
begin
	wait(rvx_signal_21==0);
	wait(rvx_signal_21==1);
	$display("[RESET CONTROLLER] all resets are released");
end
`endif

always@(posedge rvx_port_07, negedge rvx_signal_18)
begin
	if(rvx_signal_18==0)
		rvx_signal_03 <= `RESET_CMD_IDLE;
	else if(rvx_signal_12)
		rvx_signal_03 <= $unsigned(rvx_signal_19);
	else if(rvx_signal_06)
		rvx_signal_03 <= `RESET_CMD_IDLE_WITH_ERROR;
	else
		case(rvx_signal_03)
			`RESET_CMD_INIT:
				rvx_signal_03 <= `RESET_CMD_IDLE;
			`RESET_CMD_AUTO_INCR:
				if(rvx_signal_24 && rvx_signal_08)
					rvx_signal_03 <= `RESET_CMD_IDLE;
			`RESET_CMD_NEXT_STEP:
				if(rvx_signal_24)
					rvx_signal_03 <= `RESET_CMD_IDLE;
		endcase
end

assign rvx_signal_04 = (rvx_signal_03==`RESET_CMD_INIT);

always@(*)
begin
	rvx_signal_06 = 0;
	case(rvx_signal_03)
		`RESET_CMD_NEXT_STEP:
			if(rvx_signal_21)
				rvx_signal_06 = 1;
	endcase
end

assign rvx_signal_15 = rvx_signal_22 | rvx_signal_11;

always@(*)
begin
	rvx_signal_13 = 0;
	if((!rvx_signal_21) & (!rvx_signal_06))
	begin
		if(rvx_port_12==1)
			rvx_signal_13 = 1;
		else
			case(rvx_signal_03)
				`RESET_CMD_NEXT_STEP,
				`RESET_CMD_AUTO_INCR:
					rvx_signal_13 = 1;
				`RESET_CMD_IDLE:
					case(rvx_port_14)
						`BOOT_MODE_STAND_ALONE:
							rvx_signal_13 = 1;
						`BOOT_MODE_OCD:
							rvx_signal_13 = rvx_signal_07;
					endcase
			endcase
	end
end

generate
for(i=0; i<RVX_GPARA_1; i=i+1)
begin : i_gen_buf
  RESET_BUF
  i_rvx_instance_3
  (
    .I(rvx_signal_15[i]),
    .O(rvx_port_04[i])
  );
  RESET_NOT
  i_rvx_instance_2
  (
    .I(rvx_port_04[i]),
    .O(rvx_port_10[i])
  );
end
endgenerate

always@(posedge rvx_port_07, negedge rvx_signal_18)
begin
	if(rvx_signal_18==0)
		rvx_signal_11 <= 0;
	else if(rvx_signal_10)
		rvx_signal_11 <= rvx_signal_19;
end

assign rvx_signal_19 = CHANGE_ENDIAN_BUS2MAN(32,RVX_GPARA_0,rvx_port_00);
assign rvx_port_09 = CHANGE_ENDIAN_MAN2BUS(32,RVX_GPARA_0,rvx_signal_02);

assign rvx_signal_00 = {rvx_port_11[`BW_MMAP_SUBOFFSET_RESET-1:2],2'b 00};
assign rvx_signal_05 = rvx_port_16 & rvx_port_03 & rvx_port_01;
always@(*)
begin
	rvx_port_08 = 0;
	rvx_signal_02 = $unsigned(rvx_signal_03);
	rvx_signal_12 = 0;
	rvx_signal_10 = 0;
	
	case(rvx_signal_00)
		`MMAP_SUBOFFSET_RESET_CMD:
		begin
			rvx_signal_02 = $unsigned(rvx_signal_03);
			rvx_signal_12 = rvx_signal_05;
		end
		`MMAP_SUBOFFSET_RESET_MASK:
		begin
			rvx_signal_02 = $unsigned(rvx_signal_11);
			rvx_signal_10 = rvx_signal_05;
		end
		`MMAP_SUBOFFSET_RESET_SEQUENCE:
		begin
			rvx_signal_02 = -1;
			rvx_signal_02[RVX_GPARA_1-1:0] = rvx_signal_22;
		end
		default:
			rvx_port_08 = 1;
	endcase
end

assign rvx_port_13 = 1;
assign rvx_port_05 = rvx_signal_21;

`undef RVX_LDEF_1
`undef RVX_LDEF_3
`undef RVX_LDEF_2
`undef RVX_LDEF_0
endmodule
