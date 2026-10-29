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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_08.vh"
`include "munoc_include_06.vh"
`include "munoc_include_02.vh"





module MUNOC_MODULE_46
(
	munoc_port_02,
	munoc_port_05,

	munoc_port_03,
	munoc_port_01,
	munoc_port_13,

	munoc_port_11,
	munoc_port_10,
	munoc_port_00,
	munoc_port_15,
	munoc_port_04,
	munoc_port_07,
	
	munoc_port_09,
	munoc_port_14,
	munoc_port_06,
	munoc_port_08,
	munoc_port_12
);





parameter MUNOC_GPARA_4 = 8;
parameter MUNOC_GPARA_3 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_1 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_2 = 1;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_25(MUNOC_GPARA_4);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_4);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_02, munoc_port_05;

output wire munoc_port_03;
input wire munoc_port_01;
input wire [`MUNOC_GDEF_68-1:0] munoc_port_13;

input wire [MUNOC_GPARA_3-1:0] munoc_port_11;
input wire [MUNOC_GPARA_4-1:0] munoc_port_10;
input wire [`BW_AXI_RRESP-1:0] munoc_port_00;
input wire munoc_port_15;
input wire munoc_port_04;
output wire munoc_port_07;

output wire [MUNOC_GPARA_1/MUNOC_GPARA_0-1:0] munoc_port_09;
input wire munoc_port_14;
output wire munoc_port_06;
output wire munoc_port_08;
output wire [`BW_RCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_1)-1:0] munoc_port_12;

genvar i;
integer j;

wire [`MUNOC_GDEF_68-1:0] munoc_signal_29;
wire munoc_signal_25;
wire munoc_signal_32;

wire [`MUNOC_GDEF_75-1:0] datatype;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_11;
wire [`BW_ADDR_OFFSET-1:0] munoc_signal_31;
wire [`MUNOC_GDEF_45-1:0] munoc_signal_23;

reg [`MUNOC_GDEF_45-1:0] munoc_signal_07, munoc_signal_04;

wire munoc_signal_24;
wire munoc_signal_03;
wire munoc_signal_08;

`define MUNOC_LDEF_01 2
`define MUNOC_LDEF_11 0
`define MUNOC_LDEF_16 1
`define MUNOC_LDEF_02 2

reg [`MUNOC_LDEF_01-1:0] munoc_signal_36;
wire munoc_signal_30;
wire munoc_signal_18;
wire munoc_signal_16;

wire munoc_signal_02;
wire munoc_signal_14;
wire munoc_signal_19;
reg [`MUNOC_GDEF_45-1:0] munoc_signal_21;

`define MUNOC_LDEF_03 4
`define MUNOC_LDEF_17 4'b 0001
`define MUNOC_LDEF_09 4'b 0010
`define MUNOC_LDEF_18 4'b 0100
`define MUNOC_LDEF_19 4'b 1000
`define MUNOC_LDEF_14 4'b 0011
`define MUNOC_LDEF_12 4'b 1100
`define MUNOC_LDEF_13 4'b 1111

reg [`MUNOC_LDEF_03-1:0] munoc_signal_12; 
wire munoc_signal_10;

`define MUNOC_LDEF_04 1
`define MUNOC_LDEF_15 0
`define MUNOC_LDEF_07 1

reg [`MUNOC_LDEF_04-1:0] munoc_signal_22;
wire munoc_signal_17;
wire munoc_signal_09;
wire munoc_signal_13;

reg [`BW_AXI_RRESP-1:0] munoc_signal_01, munoc_signal_28;

wire [MUNOC_GPARA_1-1:0] munoc_signal_27;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_35;

`define MUNOC_LDEF_00 3
`define MUNOC_LDEF_22 0
`define MUNOC_LDEF_08 1
`define MUNOC_LDEF_05 2
`define MUNOC_LDEF_20 3
`define MUNOC_LDEF_06 4
`define MUNOC_LDEF_10 5
`define MUNOC_LDEF_21 6

reg [`MUNOC_LDEF_00-1:0] munoc_signal_05;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_15;
reg [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_00;

reg [MUNOC_GPARA_1/MUNOC_GPARA_0-1:0] munoc_signal_26, munoc_signal_06;

reg [`MUNOC_GDEF_45-1:0] munoc_signal_34, munoc_signal_33;
wire munoc_signal_20;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_68),
	.DEPTH(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.clk(munoc_port_02),
	.rstnn(munoc_port_05),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_03),
	.wrequest(munoc_port_01),
	.wdata(munoc_port_13),
	.rready(munoc_signal_25),
	.rrequest(munoc_signal_32),
	.rdata(munoc_signal_29),
	.wfull(),
	.rempty()
);

assign {datatype,munoc_signal_11,munoc_signal_31,munoc_signal_23} = munoc_signal_29;

assign munoc_signal_02 = munoc_port_07 & munoc_port_04;
assign munoc_signal_14 = munoc_signal_02 & munoc_signal_19;
assign munoc_signal_32 = munoc_signal_14;

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_21 <= 0;
	else if(munoc_signal_02)
  begin
    if(munoc_signal_19)
      munoc_signal_21 <= 0;
    else
      munoc_signal_21 <= munoc_signal_21 + 1'b 1;
  end
end

assign munoc_signal_19 = (munoc_signal_21==munoc_signal_23);

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

assign munoc_signal_24 = ($unsigned(munoc_signal_11) < $unsigned(MUNOC_LPARA_1));
assign munoc_signal_03 = ($unsigned(munoc_signal_11) == $unsigned(MUNOC_LPARA_1));
assign munoc_signal_08 = ($unsigned(munoc_signal_11) > $unsigned(MUNOC_LPARA_1));

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_36 <= `MUNOC_LDEF_11;
	else if(munoc_signal_30)
		munoc_signal_36 <= `MUNOC_LDEF_16;
	else if(munoc_signal_18)
		munoc_signal_36 <= `MUNOC_LDEF_02;
	else if(munoc_signal_14)
		munoc_signal_36 <= `MUNOC_LDEF_11;
end

assign munoc_signal_30 = (munoc_signal_36==`MUNOC_LDEF_11)  & munoc_signal_25 & munoc_signal_08;
assign munoc_signal_18 = (munoc_signal_36==`MUNOC_LDEF_11) & munoc_signal_25 & (munoc_signal_24|munoc_signal_03);
assign munoc_signal_16 = munoc_signal_30 | munoc_signal_18;

assign munoc_port_07 = (munoc_signal_36!=`MUNOC_LDEF_11) & munoc_port_14;

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_37: munoc_signal_12 <= `MUNOC_LDEF_17;
			`MUNOC_GDEF_83: munoc_signal_12 <= `MUNOC_LDEF_14;
			`MUNOC_GDEF_49: munoc_signal_12 <= `MUNOC_LDEF_13;
		endcase
	else if(munoc_signal_16)
	begin
		if(munoc_signal_18)
			case(datatype)
				`MUNOC_GDEF_37: munoc_signal_12 <= `MUNOC_LDEF_17;
				`MUNOC_GDEF_83: munoc_signal_12 <= `MUNOC_LDEF_14;
				`MUNOC_GDEF_49: munoc_signal_12 <= `MUNOC_LDEF_13;
			endcase
		else
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_37: munoc_signal_12 <= `MUNOC_LDEF_17;
				`MUNOC_GDEF_83: munoc_signal_12 <= `MUNOC_LDEF_14;
				`MUNOC_GDEF_49: ;
			endcase
	end
	else if((munoc_signal_36==`MUNOC_LDEF_16) && munoc_signal_02 && (!munoc_signal_19))
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_37:
				case(datatype)
					`MUNOC_GDEF_37:
						;
					`MUNOC_GDEF_83:
						case(munoc_signal_12)
							`MUNOC_LDEF_17: munoc_signal_12 <= `MUNOC_LDEF_09;
							`MUNOC_LDEF_09: munoc_signal_12 <= `MUNOC_LDEF_17;
						endcase
					`MUNOC_GDEF_49:
						case(munoc_signal_12)
							`MUNOC_LDEF_17: munoc_signal_12 <= `MUNOC_LDEF_09;
							`MUNOC_LDEF_09: munoc_signal_12 <= `MUNOC_LDEF_18;
							`MUNOC_LDEF_18: munoc_signal_12 <= `MUNOC_LDEF_19;
							`MUNOC_LDEF_19: munoc_signal_12 <= `MUNOC_LDEF_17;
						endcase
				endcase
			`MUNOC_GDEF_83:
				case(datatype)
					`MUNOC_GDEF_37,
					`MUNOC_GDEF_83:
						;
					`MUNOC_GDEF_49:
						case(munoc_signal_12)
							`MUNOC_LDEF_14: munoc_signal_12 <= `MUNOC_LDEF_12;
							`MUNOC_LDEF_12: munoc_signal_12 <= `MUNOC_LDEF_14;
						endcase
				endcase
			`MUNOC_GDEF_49:
				;
		endcase
end

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_07 <= 0;
	else if(munoc_signal_16)
		munoc_signal_07 <= munoc_signal_04;
end

always@(*)
begin
	munoc_signal_04 = -1;
	if(munoc_signal_11 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_GDEF_45; j=j+1)
			if(j<($unsigned(munoc_signal_11)-MUNOC_LPARA_1))
				munoc_signal_04[j] = 0;
end

assign munoc_port_06 = ($signed((munoc_signal_21|munoc_signal_07))==(-1));
assign munoc_signal_10 = munoc_signal_02 & munoc_port_06;

always@(*)
begin
	munoc_signal_06 = 0;
	for(j=0; j<(MUNOC_GPARA_1/MUNOC_GPARA_0); j=j+1)
		case(datatype)
			`MUNOC_GDEF_37:
				if(j<(32/MUNOC_GPARA_0))
					munoc_signal_06[j] = 1;
			`MUNOC_GDEF_83:
				if(j<(64/MUNOC_GPARA_0))
					munoc_signal_06[j] = 1;
			`MUNOC_GDEF_49:
				if(j<(128/MUNOC_GPARA_0))
					munoc_signal_06[j] = 1;
		endcase
end

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_26 <= 0;
	else if(munoc_signal_16)
		munoc_signal_26 <= munoc_signal_06;
	else if(munoc_port_08)
	begin
		if(munoc_port_06)
			munoc_signal_26 <= munoc_signal_06;
		else
			munoc_signal_26 <= munoc_signal_26 & (~munoc_port_09);
	end
end

generate
	for(i=0; i<MUNOC_GPARA_1/MUNOC_GPARA_0; i=i+1)
	begin: i_gen_rdata_write_request
		assign munoc_port_09[i] = (munoc_port_06)? munoc_signal_26[i] : munoc_signal_12[i/(32/MUNOC_GPARA_0)];
	end
endgenerate
assign munoc_port_08 = munoc_signal_02;

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_01 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_10)
		munoc_signal_01 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_02)
		munoc_signal_01 <= munoc_signal_28;
end

always@(*)
begin
	munoc_signal_28 = munoc_port_00;
	case(munoc_signal_01)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_28 = munoc_port_00;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_28 = munoc_signal_01;
	endcase
end

assign munoc_port_12 = {munoc_port_11,munoc_signal_19,munoc_signal_28,munoc_signal_27};

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_22 <= `MUNOC_LDEF_15;
	else if(munoc_signal_16)
	begin
		if(munoc_signal_17)
			munoc_signal_22 <= `MUNOC_LDEF_07;
		else
			munoc_signal_22 <= `MUNOC_LDEF_15;
	end
end

assign munoc_signal_17 = ($unsigned(datatype) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_09 = ($unsigned(datatype) == $unsigned(MUNOC_LPARA_0));
assign munoc_signal_13 = ($unsigned(datatype) > $unsigned(MUNOC_LPARA_0));

generate
	for(i=0; i<`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_4; i=i+1)
	begin: i_duplicate_rdata
		assign munoc_signal_35[(i+1)*MUNOC_GPARA_4-1-:MUNOC_GPARA_4] = munoc_port_10;
	end
endgenerate

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_05 <= `MUNOC_LDEF_22;
	else if(munoc_signal_16 && munoc_signal_17)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_37:
				munoc_signal_05 <= `MUNOC_LDEF_22;
			`MUNOC_GDEF_83:
				case(datatype)
					`MUNOC_GDEF_37:
						case(munoc_signal_31[2])
							0: munoc_signal_05 <= `MUNOC_LDEF_22;
							1: munoc_signal_05 <= `MUNOC_LDEF_08;
						endcase
					`MUNOC_GDEF_83,
					`MUNOC_GDEF_49: munoc_signal_05 <= `MUNOC_LDEF_06;
				endcase
			`MUNOC_GDEF_49:
				case(datatype)
					`MUNOC_GDEF_37:
						case(munoc_signal_31[3:2])
							0: munoc_signal_05 <= `MUNOC_LDEF_22;
							1: munoc_signal_05 <= `MUNOC_LDEF_08;
							2: munoc_signal_05 <= `MUNOC_LDEF_05;
							3: munoc_signal_05 <= `MUNOC_LDEF_20;
						endcase
					`MUNOC_GDEF_83:
						case(munoc_signal_31[3])
							0: munoc_signal_05 <= `MUNOC_LDEF_06;
							1: munoc_signal_05 <= `MUNOC_LDEF_10;
						endcase
					`MUNOC_GDEF_49: munoc_signal_05 <= `MUNOC_LDEF_21;
				endcase
		endcase
	else if((munoc_signal_22==`MUNOC_LDEF_07)&&munoc_signal_20)
	begin
		if(munoc_signal_02 && (!munoc_signal_19))
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_37:
					;
				`MUNOC_GDEF_83:
					case(munoc_signal_05)
						`MUNOC_LDEF_22: munoc_signal_05 <= `MUNOC_LDEF_08;
						`MUNOC_LDEF_08: munoc_signal_05 <= `MUNOC_LDEF_22;
					endcase
				`MUNOC_GDEF_49:
					case(munoc_signal_05)
						`MUNOC_LDEF_22: munoc_signal_05 <= `MUNOC_LDEF_08;
						`MUNOC_LDEF_08: munoc_signal_05 <= `MUNOC_LDEF_05;
						`MUNOC_LDEF_05: munoc_signal_05 <= `MUNOC_LDEF_20;
						`MUNOC_LDEF_20: munoc_signal_05 <= `MUNOC_LDEF_22;
						`MUNOC_LDEF_06: munoc_signal_05 <= `MUNOC_LDEF_10;
						`MUNOC_LDEF_10: munoc_signal_05 <= `MUNOC_LDEF_06;
					endcase
			endcase
	end
end

always@(posedge munoc_port_02, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_34 <= 0;
	else if(munoc_signal_16 && munoc_signal_17)
		munoc_signal_34 <= munoc_signal_33;
end

always@(*)
begin
	munoc_signal_33 = -1;
	for(j=0; j<`MUNOC_GDEF_45; j=j+1)
		if(j<($unsigned(datatype)-`MUNOC_GDEF_37 - ($unsigned(munoc_signal_11)-`AXI_SIZE_004BYTE)))
			munoc_signal_33[j] = 0;
end

assign munoc_signal_20 = ($signed((munoc_signal_21|munoc_signal_34))==(-1));

assign munoc_signal_15 = $unsigned(munoc_port_10);

always@(*)
begin
	munoc_signal_00 = munoc_signal_15;
	case(munoc_signal_05)
		`MUNOC_LDEF_22: munoc_signal_00[32-1:0] = $unsigned(munoc_signal_15[32*(1+0)-1-:32]);
		`MUNOC_LDEF_08: munoc_signal_00[32-1:0] = $unsigned(munoc_signal_15[32*(1+1)-1-:32]);
		`MUNOC_LDEF_05: munoc_signal_00[32-1:0] = $unsigned(munoc_signal_15[32*(1+2)-1-:32]);
		`MUNOC_LDEF_20: munoc_signal_00[32-1:0] = $unsigned(munoc_signal_15[32*(1+3)-1-:32]);
		`MUNOC_LDEF_06: munoc_signal_00[64-1:0] = $unsigned(munoc_signal_15[64*(1+0)-1-:64]);
		`MUNOC_LDEF_10: munoc_signal_00[64-1:0] = $unsigned(munoc_signal_15[64*(1+1)-1-:64]);
		`MUNOC_LDEF_21: munoc_signal_00[128-1:0] = $unsigned(munoc_signal_15[128*(1+0)-1-:128]);
	endcase
end

assign munoc_signal_27 = (munoc_signal_22==`MUNOC_LDEF_07)? munoc_signal_00 : munoc_signal_35;

`else

assign munoc_port_07 = munoc_signal_25 & munoc_port_14;
assign munoc_port_09 = -1;
assign munoc_port_06 = 1;
assign munoc_port_08 = munoc_port_07 & munoc_port_04;
assign munoc_port_12 = {munoc_port_11, munoc_signal_19, munoc_port_00, munoc_port_10};

`endif

`undef MUNOC_LDEF_04
`undef MUNOC_LDEF_01
`undef MUNOC_LDEF_18
`undef MUNOC_LDEF_09
`undef MUNOC_LDEF_06
`undef MUNOC_LDEF_15
`undef MUNOC_LDEF_05
`undef MUNOC_LDEF_16
`undef MUNOC_LDEF_19
`undef MUNOC_LDEF_02
`undef MUNOC_LDEF_22
`undef MUNOC_LDEF_17
`undef MUNOC_LDEF_14
`undef MUNOC_LDEF_10
`undef MUNOC_LDEF_13
`undef MUNOC_LDEF_21
`undef MUNOC_LDEF_00
`undef MUNOC_LDEF_12
`undef MUNOC_LDEF_03
`undef MUNOC_LDEF_11
`undef MUNOC_LDEF_08
`undef MUNOC_LDEF_07
`undef MUNOC_LDEF_20
endmodule
