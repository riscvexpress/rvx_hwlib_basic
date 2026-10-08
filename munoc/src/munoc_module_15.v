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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_09.vh"
`include "munoc_include_07.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_15
(
	munoc_port_15,
	munoc_port_04,

	munoc_port_11,
	munoc_port_06,
	munoc_port_05,

	munoc_port_00,
	munoc_port_08,
	munoc_port_12,
	munoc_port_13,
	munoc_port_02,
	munoc_port_03,
	
	munoc_port_09,
	munoc_port_01,
	munoc_port_07,
	munoc_port_10,
	munoc_port_14
);





parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_2 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_4 = 1;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_34(MUNOC_GPARA_3);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_3);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_15, munoc_port_04;

output wire munoc_port_11;
input wire munoc_port_06;
input wire [`MUNOC_GDEF_06-1:0] munoc_port_05;

input wire [MUNOC_GPARA_1-1:0] munoc_port_00;
input wire [MUNOC_GPARA_3-1:0] munoc_port_08;
input wire [`BW_AXI_RRESP-1:0] munoc_port_12;
input wire munoc_port_13;
input wire munoc_port_02;
output wire munoc_port_03;

output wire [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_port_09;
input wire munoc_port_01;
output wire munoc_port_07;
output wire munoc_port_10;
output wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_14;

genvar i;
integer j;

wire [`MUNOC_GDEF_06-1:0] munoc_signal_37;
wire munoc_signal_00;
wire munoc_signal_33;

wire [`MUNOC_GDEF_22-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_30;
wire [`BW_ADDR_OFFSET-1:0] munoc_signal_18;
wire [`MUNOC_GDEF_53-1:0] munoc_signal_05;

reg [`MUNOC_GDEF_53-1:0] munoc_signal_36, munoc_signal_32;

wire munoc_signal_25;
wire munoc_signal_04;
wire munoc_signal_15;

`define MUNOC_LDEF_22 2
`define MUNOC_LDEF_08 0
`define MUNOC_LDEF_01 1
`define MUNOC_LDEF_19 2

reg [`MUNOC_LDEF_22-1:0] munoc_signal_11;
wire munoc_signal_13;
wire munoc_signal_22;
wire munoc_signal_20;

wire munoc_signal_19;
wire munoc_signal_08;
wire munoc_signal_24;
reg [`MUNOC_GDEF_53-1:0] munoc_signal_34;

`define MUNOC_LDEF_00 4
`define MUNOC_LDEF_03 4'b 0001
`define MUNOC_LDEF_04 4'b 0010
`define MUNOC_LDEF_07 4'b 0100
`define MUNOC_LDEF_02 4'b 1000
`define MUNOC_LDEF_13 4'b 0011
`define MUNOC_LDEF_05 4'b 1100
`define MUNOC_LDEF_10 4'b 1111

reg [`MUNOC_LDEF_00-1:0] munoc_signal_06; 
wire munoc_signal_16;

`define MUNOC_LDEF_12 1
`define MUNOC_LDEF_11 0
`define MUNOC_LDEF_17 1

reg [`MUNOC_LDEF_12-1:0] munoc_signal_31;
wire munoc_signal_21;
wire munoc_signal_23;
wire munoc_signal_29;

reg [`BW_AXI_RRESP-1:0] munoc_signal_14, munoc_signal_02;

wire [MUNOC_GPARA_2-1:0] munoc_signal_12;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_10;

`define MUNOC_LDEF_20 3
`define MUNOC_LDEF_16 0
`define MUNOC_LDEF_06 1
`define MUNOC_LDEF_21 2
`define MUNOC_LDEF_09 3
`define MUNOC_LDEF_14 4
`define MUNOC_LDEF_15 5
`define MUNOC_LDEF_18 6

reg [`MUNOC_LDEF_20-1:0] munoc_signal_26;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_17;
reg [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_03;

reg [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_signal_28, munoc_signal_07;

reg [`MUNOC_GDEF_53-1:0] munoc_signal_09, munoc_signal_35;
wire munoc_signal_27;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_06),
	.DEPTH(MUNOC_GPARA_4)
)
i_munoc_instance_0
(
	.clk(munoc_port_15),
	.rstnn(munoc_port_04),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_11),
	.wrequest(munoc_port_06),
	.wdata(munoc_port_05),
	.rready(munoc_signal_00),
	.rrequest(munoc_signal_33),
	.rdata(munoc_signal_37),
	.wfull(),
	.rempty()
);

assign {munoc_signal_01,munoc_signal_30,munoc_signal_18,munoc_signal_05} = munoc_signal_37;

assign munoc_signal_19 = munoc_port_03 & munoc_port_02;
assign munoc_signal_08 = munoc_signal_19 & munoc_signal_24;
assign munoc_signal_33 = munoc_signal_08;

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_34 <= 0;
	else if(munoc_signal_19)
  begin
    if(munoc_signal_24)
      munoc_signal_34 <= 0;
    else
      munoc_signal_34 <= munoc_signal_34 + 1'b 1;
  end
end

assign munoc_signal_24 = (munoc_signal_34==munoc_signal_05);

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

assign munoc_signal_25 = ($unsigned(munoc_signal_30) < $unsigned(MUNOC_LPARA_1));
assign munoc_signal_04 = ($unsigned(munoc_signal_30) == $unsigned(MUNOC_LPARA_1));
assign munoc_signal_15 = ($unsigned(munoc_signal_30) > $unsigned(MUNOC_LPARA_1));

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_11 <= `MUNOC_LDEF_08;
	else if(munoc_signal_13)
		munoc_signal_11 <= `MUNOC_LDEF_01;
	else if(munoc_signal_22)
		munoc_signal_11 <= `MUNOC_LDEF_19;
	else if(munoc_signal_08)
		munoc_signal_11 <= `MUNOC_LDEF_08;
end

assign munoc_signal_13 = (munoc_signal_11==`MUNOC_LDEF_08)  & munoc_signal_00 & munoc_signal_15;
assign munoc_signal_22 = (munoc_signal_11==`MUNOC_LDEF_08) & munoc_signal_00 & (munoc_signal_25|munoc_signal_04);
assign munoc_signal_20 = munoc_signal_13 | munoc_signal_22;

assign munoc_port_03 = (munoc_signal_11!=`MUNOC_LDEF_08) & munoc_port_01;

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_80: munoc_signal_06 <= `MUNOC_LDEF_03;
			`MUNOC_GDEF_14: munoc_signal_06 <= `MUNOC_LDEF_13;
			`MUNOC_GDEF_24: munoc_signal_06 <= `MUNOC_LDEF_10;
		endcase
	else if(munoc_signal_20)
	begin
		if(munoc_signal_22)
			case(munoc_signal_01)
				`MUNOC_GDEF_80: munoc_signal_06 <= `MUNOC_LDEF_03;
				`MUNOC_GDEF_14: munoc_signal_06 <= `MUNOC_LDEF_13;
				`MUNOC_GDEF_24: munoc_signal_06 <= `MUNOC_LDEF_10;
			endcase
		else
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_80: munoc_signal_06 <= `MUNOC_LDEF_03;
				`MUNOC_GDEF_14: munoc_signal_06 <= `MUNOC_LDEF_13;
				`MUNOC_GDEF_24: ;
			endcase
	end
	else if((munoc_signal_11==`MUNOC_LDEF_01) && munoc_signal_19 && (!munoc_signal_24))
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_80:
				case(munoc_signal_01)
					`MUNOC_GDEF_80:
						;
					`MUNOC_GDEF_14:
						case(munoc_signal_06)
							`MUNOC_LDEF_03: munoc_signal_06 <= `MUNOC_LDEF_04;
							`MUNOC_LDEF_04: munoc_signal_06 <= `MUNOC_LDEF_03;
						endcase
					`MUNOC_GDEF_24:
						case(munoc_signal_06)
							`MUNOC_LDEF_03: munoc_signal_06 <= `MUNOC_LDEF_04;
							`MUNOC_LDEF_04: munoc_signal_06 <= `MUNOC_LDEF_07;
							`MUNOC_LDEF_07: munoc_signal_06 <= `MUNOC_LDEF_02;
							`MUNOC_LDEF_02: munoc_signal_06 <= `MUNOC_LDEF_03;
						endcase
				endcase
			`MUNOC_GDEF_14:
				case(munoc_signal_01)
					`MUNOC_GDEF_80,
					`MUNOC_GDEF_14:
						;
					`MUNOC_GDEF_24:
						case(munoc_signal_06)
							`MUNOC_LDEF_13: munoc_signal_06 <= `MUNOC_LDEF_05;
							`MUNOC_LDEF_05: munoc_signal_06 <= `MUNOC_LDEF_13;
						endcase
				endcase
			`MUNOC_GDEF_24:
				;
		endcase
end

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_36 <= 0;
	else if(munoc_signal_20)
		munoc_signal_36 <= munoc_signal_32;
end

always@(*)
begin
	munoc_signal_32 = -1;
	if(munoc_signal_30 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_GDEF_53; j=j+1)
			if(j<($unsigned(munoc_signal_30)-MUNOC_LPARA_1))
				munoc_signal_32[j] = 0;
end

assign munoc_port_07 = ($signed((munoc_signal_34|munoc_signal_36))==(-1));
assign munoc_signal_16 = munoc_signal_19 & munoc_port_07;

always@(*)
begin
	munoc_signal_07 = 0;
	for(j=0; j<(MUNOC_GPARA_2/MUNOC_GPARA_0); j=j+1)
		case(munoc_signal_01)
			`MUNOC_GDEF_80:
				if(j<(32/MUNOC_GPARA_0))
					munoc_signal_07[j] = 1;
			`MUNOC_GDEF_14:
				if(j<(64/MUNOC_GPARA_0))
					munoc_signal_07[j] = 1;
			`MUNOC_GDEF_24:
				if(j<(128/MUNOC_GPARA_0))
					munoc_signal_07[j] = 1;
		endcase
end

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_28 <= 0;
	else if(munoc_signal_20)
		munoc_signal_28 <= munoc_signal_07;
	else if(munoc_port_10)
	begin
		if(munoc_port_07)
			munoc_signal_28 <= munoc_signal_07;
		else
			munoc_signal_28 <= munoc_signal_28 & (~munoc_port_09);
	end
end

generate
	for(i=0; i<MUNOC_GPARA_2/MUNOC_GPARA_0; i=i+1)
	begin: i_gen_rdata_write_request
		assign munoc_port_09[i] = (munoc_port_07)? munoc_signal_28[i] : munoc_signal_06[i/(32/MUNOC_GPARA_0)];
	end
endgenerate
assign munoc_port_10 = munoc_signal_19;

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_14 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_16)
		munoc_signal_14 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_19)
		munoc_signal_14 <= munoc_signal_02;
end

always@(*)
begin
	munoc_signal_02 = munoc_port_12;
	case(munoc_signal_14)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_02 = munoc_port_12;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_02 = munoc_signal_14;
	endcase
end

assign munoc_port_14 = {munoc_port_00,munoc_signal_24,munoc_signal_02,munoc_signal_12};

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_31 <= `MUNOC_LDEF_11;
	else if(munoc_signal_20)
	begin
		if(munoc_signal_21)
			munoc_signal_31 <= `MUNOC_LDEF_17;
		else
			munoc_signal_31 <= `MUNOC_LDEF_11;
	end
end

assign munoc_signal_21 = ($unsigned(munoc_signal_01) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_23 = ($unsigned(munoc_signal_01) == $unsigned(MUNOC_LPARA_0));
assign munoc_signal_29 = ($unsigned(munoc_signal_01) > $unsigned(MUNOC_LPARA_0));

generate
	for(i=0; i<`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_3; i=i+1)
	begin: i_duplicate_rdata
		assign munoc_signal_10[(i+1)*MUNOC_GPARA_3-1-:MUNOC_GPARA_3] = munoc_port_08;
	end
endgenerate

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_26 <= `MUNOC_LDEF_16;
	else if(munoc_signal_20 && munoc_signal_21)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_80:
				munoc_signal_26 <= `MUNOC_LDEF_16;
			`MUNOC_GDEF_14:
				case(munoc_signal_01)
					`MUNOC_GDEF_80:
						case(munoc_signal_18[2])
							0: munoc_signal_26 <= `MUNOC_LDEF_16;
							1: munoc_signal_26 <= `MUNOC_LDEF_06;
						endcase
					`MUNOC_GDEF_14,
					`MUNOC_GDEF_24: munoc_signal_26 <= `MUNOC_LDEF_14;
				endcase
			`MUNOC_GDEF_24:
				case(munoc_signal_01)
					`MUNOC_GDEF_80:
						case(munoc_signal_18[3:2])
							0: munoc_signal_26 <= `MUNOC_LDEF_16;
							1: munoc_signal_26 <= `MUNOC_LDEF_06;
							2: munoc_signal_26 <= `MUNOC_LDEF_21;
							3: munoc_signal_26 <= `MUNOC_LDEF_09;
						endcase
					`MUNOC_GDEF_14:
						case(munoc_signal_18[3])
							0: munoc_signal_26 <= `MUNOC_LDEF_14;
							1: munoc_signal_26 <= `MUNOC_LDEF_15;
						endcase
					`MUNOC_GDEF_24: munoc_signal_26 <= `MUNOC_LDEF_18;
				endcase
		endcase
	else if((munoc_signal_31==`MUNOC_LDEF_17)&&munoc_signal_27)
	begin
		if(munoc_signal_19 && (!munoc_signal_24))
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_80:
					;
				`MUNOC_GDEF_14:
					case(munoc_signal_26)
						`MUNOC_LDEF_16: munoc_signal_26 <= `MUNOC_LDEF_06;
						`MUNOC_LDEF_06: munoc_signal_26 <= `MUNOC_LDEF_16;
					endcase
				`MUNOC_GDEF_24:
					case(munoc_signal_26)
						`MUNOC_LDEF_16: munoc_signal_26 <= `MUNOC_LDEF_06;
						`MUNOC_LDEF_06: munoc_signal_26 <= `MUNOC_LDEF_21;
						`MUNOC_LDEF_21: munoc_signal_26 <= `MUNOC_LDEF_09;
						`MUNOC_LDEF_09: munoc_signal_26 <= `MUNOC_LDEF_16;
						`MUNOC_LDEF_14: munoc_signal_26 <= `MUNOC_LDEF_15;
						`MUNOC_LDEF_15: munoc_signal_26 <= `MUNOC_LDEF_14;
					endcase
			endcase
	end
end

always@(posedge munoc_port_15, negedge munoc_port_04)
begin
	if(munoc_port_04==0)
		munoc_signal_09 <= 0;
	else if(munoc_signal_20 && munoc_signal_21)
		munoc_signal_09 <= munoc_signal_35;
end

always@(*)
begin
	munoc_signal_35 = -1;
	for(j=0; j<`MUNOC_GDEF_53; j=j+1)
		if(j<($unsigned(munoc_signal_01)-`MUNOC_GDEF_80 - ($unsigned(munoc_signal_30)-`AXI_SIZE_004BYTE)))
			munoc_signal_35[j] = 0;
end

assign munoc_signal_27 = ($signed((munoc_signal_34|munoc_signal_09))==(-1));

assign munoc_signal_17 = $unsigned(munoc_port_08);

always@(*)
begin
	munoc_signal_03 = munoc_signal_17;
	case(munoc_signal_26)
		`MUNOC_LDEF_16: munoc_signal_03[32-1:0] = $unsigned(munoc_signal_17[32*(1+0)-1-:32]);
		`MUNOC_LDEF_06: munoc_signal_03[32-1:0] = $unsigned(munoc_signal_17[32*(1+1)-1-:32]);
		`MUNOC_LDEF_21: munoc_signal_03[32-1:0] = $unsigned(munoc_signal_17[32*(1+2)-1-:32]);
		`MUNOC_LDEF_09: munoc_signal_03[32-1:0] = $unsigned(munoc_signal_17[32*(1+3)-1-:32]);
		`MUNOC_LDEF_14: munoc_signal_03[64-1:0] = $unsigned(munoc_signal_17[64*(1+0)-1-:64]);
		`MUNOC_LDEF_15: munoc_signal_03[64-1:0] = $unsigned(munoc_signal_17[64*(1+1)-1-:64]);
		`MUNOC_LDEF_18: munoc_signal_03[128-1:0] = $unsigned(munoc_signal_17[128*(1+0)-1-:128]);
	endcase
end

assign munoc_signal_12 = (munoc_signal_31==`MUNOC_LDEF_17)? munoc_signal_03 : munoc_signal_10;

`else

assign munoc_port_03 = munoc_signal_00 & munoc_port_01;
assign munoc_port_09 = -1;
assign munoc_port_07 = 1;
assign munoc_port_10 = munoc_port_03 & munoc_port_02;
assign munoc_port_14 = {munoc_port_00, munoc_signal_24, munoc_port_12, munoc_port_08};

`endif

`undef MUNOC_LDEF_12
`undef MUNOC_LDEF_22
`undef MUNOC_LDEF_07
`undef MUNOC_LDEF_04
`undef MUNOC_LDEF_14
`undef MUNOC_LDEF_11
`undef MUNOC_LDEF_21
`undef MUNOC_LDEF_01
`undef MUNOC_LDEF_02
`undef MUNOC_LDEF_19
`undef MUNOC_LDEF_16
`undef MUNOC_LDEF_03
`undef MUNOC_LDEF_13
`undef MUNOC_LDEF_15
`undef MUNOC_LDEF_10
`undef MUNOC_LDEF_18
`undef MUNOC_LDEF_20
`undef MUNOC_LDEF_05
`undef MUNOC_LDEF_00
`undef MUNOC_LDEF_08
`undef MUNOC_LDEF_06
`undef MUNOC_LDEF_17
`undef MUNOC_LDEF_09
endmodule
