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
`include "ervp_platform_controller_memorymap_offset.vh"





module RVX_MODULE_043
(
	rvx_port_07,
	rvx_port_01,
	rvx_port_04,
	rvx_port_14,
	rvx_port_03,
	rvx_port_15,
	rvx_port_16,
	rvx_port_00,
	rvx_port_11,
	rvx_port_10,

	rvx_port_12,
	rvx_port_08,
	rvx_port_13,
	rvx_port_06,
	rvx_port_05,
	rvx_port_09,
	rvx_port_17,
	rvx_port_02
);





parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_4 = 32;
parameter RVX_GPARA_3 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"

localparam  RVX_LPARA_0 = 32;
localparam  RVX_LPARA_2 = 6;
localparam  RVX_LPARA_1 = RVX_GPARA_2 + 1;

input wire rvx_port_07, rvx_port_01;
input wire [`BW_BOOT_MODE-1:0] rvx_port_04;
input wire rvx_port_14; 
input wire rvx_port_03;

output wire rvx_port_15;
output wire rvx_port_16;
output wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire [RVX_GPARA_2-1:0] rvx_port_11;
output wire rvx_port_10;

input wire rvx_port_12;
input wire rvx_port_08;
input wire [RVX_LPARA_0-1:0] rvx_port_13;
input wire rvx_port_06;
input wire [RVX_GPARA_4-1:0] rvx_port_05;
output wire [RVX_GPARA_4-1:0] rvx_port_09;
output wire rvx_port_17;
output reg rvx_port_02;

genvar i,j;
integer k;

wire rvx_signal_03;
wire rvx_signal_08;

`define RVX_LDEF_1 2
`define RVX_LDEF_2 0
`define RVX_LDEF_0 1
`define RVX_LDEF_3 2
reg [`RVX_LDEF_1-1:0] rvx_signal_25;

wire rvx_signal_00;
wire rvx_signal_22;
wire rvx_signal_07;
wire rvx_signal_19;

reg [RVX_LPARA_1-1:0] rvx_signal_06;
wire [RVX_GPARA_2-1:0] rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_04;
wire rvx_signal_24;
wire rvx_signal_16;
wire rvx_signal_13;
wire rvx_signal_02;
wire rvx_signal_11;

reg [RVX_GPARA_2-1:0] rvx_signal_05;

reg [`BW_RESET_CMD-1:0] rvx_signal_18;
reg rvx_signal_14;
reg rvx_signal_15;
wire rvx_signal_12;

wire [RVX_GPARA_4-1:0] rvx_signal_21;
reg [RVX_GPARA_4-1:0] rvx_signal_01;

wire [`BW_MMAP_SUBOFFSET_RESET-1:0] rvx_signal_10;
wire rvx_signal_09;
reg rvx_signal_23;
reg rvx_signal_20;

assign rvx_signal_03 = (RVX_GPARA_1==1)? (~rvx_port_01) : rvx_port_01;

RESET_BUF
i_rvx_instance_3
(
  .I(rvx_signal_03),
  .O(rvx_port_15)
);

assign rvx_port_16 = ~rvx_port_15;
assign rvx_signal_08 =  rvx_port_15 & (rvx_port_03);

always@(posedge rvx_port_07, negedge rvx_signal_08)
begin
	if(rvx_signal_08==0)
	begin
		rvx_signal_25 <= `RVX_LDEF_2;
		rvx_signal_06 <= {RVX_LPARA_1{1'b 1}};
	end
	else if(rvx_signal_16)
	begin
		rvx_signal_25 <= `RVX_LDEF_2;
		rvx_signal_06 <= {RVX_LPARA_1{1'b 1}};
	end
	else
		case(rvx_signal_25)
			`RVX_LDEF_2:
			begin
				rvx_signal_25 <= `RVX_LDEF_0;
				rvx_signal_06 <= {RVX_LPARA_1{1'b 0}};
			end
			`RVX_LDEF_0:
				rvx_signal_25 <= `RVX_LDEF_3;
			`RVX_LDEF_3:
				if(rvx_signal_24)
					rvx_signal_06 <= {rvx_signal_06,1'b1};
		endcase
end

assign {rvx_signal_11,rvx_signal_17} = rvx_signal_06;
assign rvx_signal_02 = rvx_signal_17[RVX_GPARA_2-1];
assign rvx_signal_16 = rvx_signal_12;
assign rvx_signal_24 = rvx_signal_15 & rvx_signal_19;
assign rvx_signal_13 = ~rvx_signal_17[RVX_GPARA_0-1];

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_2),
	.CIRCULAR(0)
)
i_rvx_instance_1
(
	.clk(rvx_port_07),
	.rstnn(rvx_signal_08),
	.enable(1'b 1),
	.init(rvx_signal_22),
	.count(rvx_signal_00),
	.value(),
	.is_first_count(rvx_signal_07),
	.is_last_count(rvx_signal_19)
);

assign rvx_signal_22 = rvx_signal_14 | rvx_signal_24;
assign rvx_signal_00 = rvx_signal_15 & (~rvx_signal_24);

`ifdef SIM_ENV
initial
begin
	wait(rvx_signal_11==0);
	wait(rvx_signal_11==1);
	$display("[RESET CONTROLLER] all resets are released");
end
`endif

always@(posedge rvx_port_07, negedge rvx_signal_08)
begin
	if(rvx_signal_08==0)
		rvx_signal_18 <= `RESET_CMD_IDLE;
	else if(rvx_signal_23)
		rvx_signal_18 <= $unsigned(rvx_signal_21);
	else if(rvx_signal_14)
		rvx_signal_18 <= `RESET_CMD_IDLE_WITH_ERROR;
	else
		case(rvx_signal_18)
			`RESET_CMD_INIT:
				rvx_signal_18 <= `RESET_CMD_IDLE;
			`RESET_CMD_AUTO_INCR:
				if(rvx_signal_24 && rvx_signal_02)
					rvx_signal_18 <= `RESET_CMD_IDLE;
			`RESET_CMD_NEXT_STEP:
				if(rvx_signal_24)
					rvx_signal_18 <= `RESET_CMD_IDLE;
		endcase
end

assign rvx_signal_12 = (rvx_signal_18==`RESET_CMD_INIT);

always@(*)
begin
	rvx_signal_14 = 0;
	case(rvx_signal_18)
		`RESET_CMD_NEXT_STEP:
			if(rvx_signal_11)
				rvx_signal_14 = 1;
	endcase
end

assign rvx_signal_04 = rvx_signal_17 | rvx_signal_05;

always@(*)
begin
	rvx_signal_15 = 0;
	if((!rvx_signal_11) & (!rvx_signal_14))
	begin
		if(rvx_port_14==1)
			rvx_signal_15 = 1;
		else
			case(rvx_signal_18)
				`RESET_CMD_NEXT_STEP,
				`RESET_CMD_AUTO_INCR:
					rvx_signal_15 = 1;
				`RESET_CMD_IDLE:
					case(rvx_port_04)
						`BOOT_MODE_STAND_ALONE:
							rvx_signal_15 = 1;
						`BOOT_MODE_OCD:
							rvx_signal_15 = rvx_signal_13;
					endcase
			endcase
	end
end

generate
for(i=0; i<RVX_GPARA_2; i=i+1)
begin : i_gen_buf
  RESET_BUF
  i_rvx_instance_2
  (
    .I(rvx_signal_04[i]),
    .O(rvx_port_00[i])
  );
  RESET_NOT
  i_rvx_instance_0
  (
    .I(rvx_port_00[i]),
    .O(rvx_port_11[i])
  );
end
endgenerate

always@(posedge rvx_port_07, negedge rvx_signal_08)
begin
	if(rvx_signal_08==0)
		rvx_signal_05 <= 0;
	else if(rvx_signal_20)
		rvx_signal_05 <= rvx_signal_21;
end

assign rvx_signal_21 = CHANGE_ENDIAN_BUS2MAN(32,RVX_GPARA_3,rvx_port_05);
assign rvx_port_09 = CHANGE_ENDIAN_MAN2BUS(32,RVX_GPARA_3,rvx_signal_01);

assign rvx_signal_10 = {rvx_port_13[`BW_MMAP_SUBOFFSET_RESET-1:2],2'b 00};
assign rvx_signal_09 = rvx_port_12 & rvx_port_08 & rvx_port_06;
always@(*)
begin
	rvx_port_02 = 0;
	rvx_signal_01 = $unsigned(rvx_signal_18);
	rvx_signal_23 = 0;
	rvx_signal_20 = 0;
	
	case(rvx_signal_10)
		`MMAP_SUBOFFSET_RESET_CMD:
		begin
			rvx_signal_01 = $unsigned(rvx_signal_18);
			rvx_signal_23 = rvx_signal_09;
		end
		`MMAP_SUBOFFSET_RESET_MASK:
		begin
			rvx_signal_01 = $unsigned(rvx_signal_05);
			rvx_signal_20 = rvx_signal_09;
		end
		`MMAP_SUBOFFSET_RESET_SEQUENCE:
		begin
			rvx_signal_01 = -1;
			rvx_signal_01[RVX_GPARA_2-1:0] = rvx_signal_17;
		end
		default:
			rvx_port_02 = 1;
	endcase
end

assign rvx_port_17 = 1;
assign rvx_port_10 = rvx_signal_11;

`undef RVX_LDEF_0
`undef RVX_LDEF_2
`undef RVX_LDEF_3
`undef RVX_LDEF_1
endmodule
