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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_01.vh"
`include "munoc_include_05.vh"
`include "munoc_include_09.vh"





module MUNOC_MODULE_03
(
	munoc_port_05,
	munoc_port_02,

	munoc_port_08,
	munoc_port_06,
	munoc_port_03,

	munoc_port_15,
	munoc_port_14,
	munoc_port_01,
	munoc_port_09,
	munoc_port_00,
	munoc_port_07,
	
	munoc_port_11,
	munoc_port_12,
	munoc_port_04,
	munoc_port_10,
	munoc_port_13
);





parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_0 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_4 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_3 = 1;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_51(MUNOC_GPARA_2);
localparam  MUNOC_LPARA_1 = `GET_AXI_SIZE(MUNOC_GPARA_2);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_05, munoc_port_02;

output wire munoc_port_08;
input wire munoc_port_06;
input wire [`MUNOC_GDEF_21-1:0] munoc_port_03;

input wire [MUNOC_GPARA_1-1:0] munoc_port_15;
input wire [MUNOC_GPARA_2-1:0] munoc_port_14;
input wire [`BW_AXI_RRESP-1:0] munoc_port_01;
input wire munoc_port_09;
input wire munoc_port_00;
output wire munoc_port_07;

output wire [MUNOC_GPARA_4/MUNOC_GPARA_0-1:0] munoc_port_11;
input wire munoc_port_12;
output wire munoc_port_04;
output wire munoc_port_10;
output wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_4)-1:0] munoc_port_13;

genvar i;
integer j;

wire [`MUNOC_GDEF_21-1:0] munoc_signal_22;
wire munoc_signal_30;
wire munoc_signal_09;

wire [`MUNOC_GDEF_60-1:0] munoc_signal_36;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_15;
wire [`BW_ADDR_OFFSET-1:0] munoc_signal_11;
wire [`MUNOC_GDEF_05-1:0] munoc_signal_14;

reg [`MUNOC_GDEF_05-1:0] munoc_signal_13, munoc_signal_29;

wire munoc_signal_07;
wire munoc_signal_23;
wire munoc_signal_05;

`define MUNOC_LDEF_02 2
`define MUNOC_LDEF_15 0
`define MUNOC_LDEF_00 1
`define MUNOC_LDEF_11 2

reg [`MUNOC_LDEF_02-1:0] munoc_signal_01;
wire munoc_signal_21;
wire munoc_signal_00;
wire munoc_signal_27;

wire munoc_signal_26;
wire munoc_signal_06;
wire munoc_signal_35;
reg [`MUNOC_GDEF_05-1:0] munoc_signal_32;

`define MUNOC_LDEF_17 4
`define MUNOC_LDEF_19 4'b 0001
`define MUNOC_LDEF_01 4'b 0010
`define MUNOC_LDEF_03 4'b 0100
`define MUNOC_LDEF_14 4'b 1000
`define MUNOC_LDEF_06 4'b 0011
`define MUNOC_LDEF_21 4'b 1100
`define MUNOC_LDEF_13 4'b 1111

reg [`MUNOC_LDEF_17-1:0] munoc_signal_33; 
wire munoc_signal_31;

`define MUNOC_LDEF_07 1
`define MUNOC_LDEF_22 0
`define MUNOC_LDEF_04 1

reg [`MUNOC_LDEF_07-1:0] munoc_signal_12;
wire munoc_signal_19;
wire munoc_signal_18;
wire munoc_signal_25;

reg [`BW_AXI_RRESP-1:0] munoc_signal_28, munoc_signal_03;

wire [MUNOC_GPARA_4-1:0] munoc_signal_02;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_17;

`define MUNOC_LDEF_20 3
`define MUNOC_LDEF_18 0
`define MUNOC_LDEF_09 1
`define MUNOC_LDEF_16 2
`define MUNOC_LDEF_10 3
`define MUNOC_LDEF_05 4
`define MUNOC_LDEF_12 5
`define MUNOC_LDEF_08 6

reg [`MUNOC_LDEF_20-1:0] munoc_signal_24;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_08;
reg [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_04;

reg [MUNOC_GPARA_4/MUNOC_GPARA_0-1:0] munoc_signal_10, munoc_signal_16;

reg [`MUNOC_GDEF_05-1:0] munoc_signal_37, munoc_signal_34;
wire munoc_signal_20;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_21),
	.DEPTH(MUNOC_GPARA_3)
)
i_munoc_instance_0
(
	.clk(munoc_port_05),
	.rstnn(munoc_port_02),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_08),
	.wrequest(munoc_port_06),
	.wdata(munoc_port_03),
	.rready(munoc_signal_30),
	.rrequest(munoc_signal_09),
	.rdata(munoc_signal_22),
	.wfull(),
	.rempty()
);

assign {munoc_signal_36,munoc_signal_15,munoc_signal_11,munoc_signal_14} = munoc_signal_22;

assign munoc_signal_26 = munoc_port_07 & munoc_port_00;
assign munoc_signal_06 = munoc_signal_26 & munoc_signal_35;
assign munoc_signal_09 = munoc_signal_06;

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_32 <= 0;
	else if(munoc_signal_26)
  begin
    if(munoc_signal_35)
      munoc_signal_32 <= 0;
    else
      munoc_signal_32 <= munoc_signal_32 + 1'b 1;
  end
end

assign munoc_signal_35 = (munoc_signal_32==munoc_signal_14);

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

assign munoc_signal_07 = ($unsigned(munoc_signal_15) < $unsigned(MUNOC_LPARA_1));
assign munoc_signal_23 = ($unsigned(munoc_signal_15) == $unsigned(MUNOC_LPARA_1));
assign munoc_signal_05 = ($unsigned(munoc_signal_15) > $unsigned(MUNOC_LPARA_1));

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_01 <= `MUNOC_LDEF_15;
	else if(munoc_signal_21)
		munoc_signal_01 <= `MUNOC_LDEF_00;
	else if(munoc_signal_00)
		munoc_signal_01 <= `MUNOC_LDEF_11;
	else if(munoc_signal_06)
		munoc_signal_01 <= `MUNOC_LDEF_15;
end

assign munoc_signal_21 = (munoc_signal_01==`MUNOC_LDEF_15)  & munoc_signal_30 & munoc_signal_05;
assign munoc_signal_00 = (munoc_signal_01==`MUNOC_LDEF_15) & munoc_signal_30 & (munoc_signal_07|munoc_signal_23);
assign munoc_signal_27 = munoc_signal_21 | munoc_signal_00;

assign munoc_port_07 = (munoc_signal_01!=`MUNOC_LDEF_15) & munoc_port_12;

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_34: munoc_signal_33 <= `MUNOC_LDEF_19;
			`MUNOC_GDEF_79: munoc_signal_33 <= `MUNOC_LDEF_06;
			`MUNOC_GDEF_95: munoc_signal_33 <= `MUNOC_LDEF_13;
		endcase
	else if(munoc_signal_27)
	begin
		if(munoc_signal_00)
			case(munoc_signal_36)
				`MUNOC_GDEF_34: munoc_signal_33 <= `MUNOC_LDEF_19;
				`MUNOC_GDEF_79: munoc_signal_33 <= `MUNOC_LDEF_06;
				`MUNOC_GDEF_95: munoc_signal_33 <= `MUNOC_LDEF_13;
			endcase
		else
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_34: munoc_signal_33 <= `MUNOC_LDEF_19;
				`MUNOC_GDEF_79: munoc_signal_33 <= `MUNOC_LDEF_06;
				`MUNOC_GDEF_95: ;
			endcase
	end
	else if((munoc_signal_01==`MUNOC_LDEF_00) && munoc_signal_26 && (!munoc_signal_35))
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_34:
				case(munoc_signal_36)
					`MUNOC_GDEF_34:
						;
					`MUNOC_GDEF_79:
						case(munoc_signal_33)
							`MUNOC_LDEF_19: munoc_signal_33 <= `MUNOC_LDEF_01;
							`MUNOC_LDEF_01: munoc_signal_33 <= `MUNOC_LDEF_19;
						endcase
					`MUNOC_GDEF_95:
						case(munoc_signal_33)
							`MUNOC_LDEF_19: munoc_signal_33 <= `MUNOC_LDEF_01;
							`MUNOC_LDEF_01: munoc_signal_33 <= `MUNOC_LDEF_03;
							`MUNOC_LDEF_03: munoc_signal_33 <= `MUNOC_LDEF_14;
							`MUNOC_LDEF_14: munoc_signal_33 <= `MUNOC_LDEF_19;
						endcase
				endcase
			`MUNOC_GDEF_79:
				case(munoc_signal_36)
					`MUNOC_GDEF_34,
					`MUNOC_GDEF_79:
						;
					`MUNOC_GDEF_95:
						case(munoc_signal_33)
							`MUNOC_LDEF_06: munoc_signal_33 <= `MUNOC_LDEF_21;
							`MUNOC_LDEF_21: munoc_signal_33 <= `MUNOC_LDEF_06;
						endcase
				endcase
			`MUNOC_GDEF_95:
				;
		endcase
end

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_13 <= 0;
	else if(munoc_signal_27)
		munoc_signal_13 <= munoc_signal_29;
end

always@(*)
begin
	munoc_signal_29 = -1;
	if(munoc_signal_15 <= MUNOC_LPARA_1)
		;
	else
		for(j=0; j<`MUNOC_GDEF_05; j=j+1)
			if(j<($unsigned(munoc_signal_15)-MUNOC_LPARA_1))
				munoc_signal_29[j] = 0;
end

assign munoc_port_04 = ($signed((munoc_signal_32|munoc_signal_13))==(-1));
assign munoc_signal_31 = munoc_signal_26 & munoc_port_04;

always@(*)
begin
	munoc_signal_16 = 0;
	for(j=0; j<(MUNOC_GPARA_4/MUNOC_GPARA_0); j=j+1)
		case(munoc_signal_36)
			`MUNOC_GDEF_34:
				if(j<(32/MUNOC_GPARA_0))
					munoc_signal_16[j] = 1;
			`MUNOC_GDEF_79:
				if(j<(64/MUNOC_GPARA_0))
					munoc_signal_16[j] = 1;
			`MUNOC_GDEF_95:
				if(j<(128/MUNOC_GPARA_0))
					munoc_signal_16[j] = 1;
		endcase
end

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_10 <= 0;
	else if(munoc_signal_27)
		munoc_signal_10 <= munoc_signal_16;
	else if(munoc_port_10)
	begin
		if(munoc_port_04)
			munoc_signal_10 <= munoc_signal_16;
		else
			munoc_signal_10 <= munoc_signal_10 & (~munoc_port_11);
	end
end

generate
	for(i=0; i<MUNOC_GPARA_4/MUNOC_GPARA_0; i=i+1)
	begin: i_gen_rdata_write_request
		assign munoc_port_11[i] = (munoc_port_04)? munoc_signal_10[i] : munoc_signal_33[i/(32/MUNOC_GPARA_0)];
	end
endgenerate
assign munoc_port_10 = munoc_signal_26;

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_28 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_31)
		munoc_signal_28 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_26)
		munoc_signal_28 <= munoc_signal_03;
end

always@(*)
begin
	munoc_signal_03 = munoc_port_01;
	case(munoc_signal_28)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_03 = munoc_port_01;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_03 = munoc_signal_28;
	endcase
end

assign munoc_port_13 = {munoc_port_15,munoc_signal_35,munoc_signal_03,munoc_signal_02};

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_12 <= `MUNOC_LDEF_22;
	else if(munoc_signal_27)
	begin
		if(munoc_signal_19)
			munoc_signal_12 <= `MUNOC_LDEF_04;
		else
			munoc_signal_12 <= `MUNOC_LDEF_22;
	end
end

assign munoc_signal_19 = ($unsigned(munoc_signal_36) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_18 = ($unsigned(munoc_signal_36) == $unsigned(MUNOC_LPARA_0));
assign munoc_signal_25 = ($unsigned(munoc_signal_36) > $unsigned(MUNOC_LPARA_0));

generate
	for(i=0; i<`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_2; i=i+1)
	begin: i_duplicate_rdata
		assign munoc_signal_17[(i+1)*MUNOC_GPARA_2-1-:MUNOC_GPARA_2] = munoc_port_14;
	end
endgenerate

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_24 <= `MUNOC_LDEF_18;
	else if(munoc_signal_27 && munoc_signal_19)
		case(MUNOC_LPARA_0)
			`MUNOC_GDEF_34:
				munoc_signal_24 <= `MUNOC_LDEF_18;
			`MUNOC_GDEF_79:
				case(munoc_signal_36)
					`MUNOC_GDEF_34:
						case(munoc_signal_11[2])
							0: munoc_signal_24 <= `MUNOC_LDEF_18;
							1: munoc_signal_24 <= `MUNOC_LDEF_09;
						endcase
					`MUNOC_GDEF_79,
					`MUNOC_GDEF_95: munoc_signal_24 <= `MUNOC_LDEF_05;
				endcase
			`MUNOC_GDEF_95:
				case(munoc_signal_36)
					`MUNOC_GDEF_34:
						case(munoc_signal_11[3:2])
							0: munoc_signal_24 <= `MUNOC_LDEF_18;
							1: munoc_signal_24 <= `MUNOC_LDEF_09;
							2: munoc_signal_24 <= `MUNOC_LDEF_16;
							3: munoc_signal_24 <= `MUNOC_LDEF_10;
						endcase
					`MUNOC_GDEF_79:
						case(munoc_signal_11[3])
							0: munoc_signal_24 <= `MUNOC_LDEF_05;
							1: munoc_signal_24 <= `MUNOC_LDEF_12;
						endcase
					`MUNOC_GDEF_95: munoc_signal_24 <= `MUNOC_LDEF_08;
				endcase
		endcase
	else if((munoc_signal_12==`MUNOC_LDEF_04)&&munoc_signal_20)
	begin
		if(munoc_signal_26 && (!munoc_signal_35))
			case(MUNOC_LPARA_0)
				`MUNOC_GDEF_34:
					;
				`MUNOC_GDEF_79:
					case(munoc_signal_24)
						`MUNOC_LDEF_18: munoc_signal_24 <= `MUNOC_LDEF_09;
						`MUNOC_LDEF_09: munoc_signal_24 <= `MUNOC_LDEF_18;
					endcase
				`MUNOC_GDEF_95:
					case(munoc_signal_24)
						`MUNOC_LDEF_18: munoc_signal_24 <= `MUNOC_LDEF_09;
						`MUNOC_LDEF_09: munoc_signal_24 <= `MUNOC_LDEF_16;
						`MUNOC_LDEF_16: munoc_signal_24 <= `MUNOC_LDEF_10;
						`MUNOC_LDEF_10: munoc_signal_24 <= `MUNOC_LDEF_18;
						`MUNOC_LDEF_05: munoc_signal_24 <= `MUNOC_LDEF_12;
						`MUNOC_LDEF_12: munoc_signal_24 <= `MUNOC_LDEF_05;
					endcase
			endcase
	end
end

always@(posedge munoc_port_05, negedge munoc_port_02)
begin
	if(munoc_port_02==0)
		munoc_signal_37 <= 0;
	else if(munoc_signal_27 && munoc_signal_19)
		munoc_signal_37 <= munoc_signal_34;
end

always@(*)
begin
	munoc_signal_34 = -1;
	for(j=0; j<`MUNOC_GDEF_05; j=j+1)
		if(j<($unsigned(munoc_signal_36)-`MUNOC_GDEF_34 - ($unsigned(munoc_signal_15)-`AXI_SIZE_004BYTE)))
			munoc_signal_34[j] = 0;
end

assign munoc_signal_20 = ($signed((munoc_signal_32|munoc_signal_37))==(-1));

assign munoc_signal_08 = $unsigned(munoc_port_14);

always@(*)
begin
	munoc_signal_04 = munoc_signal_08;
	case(munoc_signal_24)
		`MUNOC_LDEF_18: munoc_signal_04[32-1:0] = $unsigned(munoc_signal_08[32*(1+0)-1-:32]);
		`MUNOC_LDEF_09: munoc_signal_04[32-1:0] = $unsigned(munoc_signal_08[32*(1+1)-1-:32]);
		`MUNOC_LDEF_16: munoc_signal_04[32-1:0] = $unsigned(munoc_signal_08[32*(1+2)-1-:32]);
		`MUNOC_LDEF_10: munoc_signal_04[32-1:0] = $unsigned(munoc_signal_08[32*(1+3)-1-:32]);
		`MUNOC_LDEF_05: munoc_signal_04[64-1:0] = $unsigned(munoc_signal_08[64*(1+0)-1-:64]);
		`MUNOC_LDEF_12: munoc_signal_04[64-1:0] = $unsigned(munoc_signal_08[64*(1+1)-1-:64]);
		`MUNOC_LDEF_08: munoc_signal_04[128-1:0] = $unsigned(munoc_signal_08[128*(1+0)-1-:128]);
	endcase
end

assign munoc_signal_02 = (munoc_signal_12==`MUNOC_LDEF_04)? munoc_signal_04 : munoc_signal_17;

`else

assign munoc_port_07 = munoc_signal_30 & munoc_port_12;
assign munoc_port_11 = -1;
assign munoc_port_04 = 1;
assign munoc_port_10 = munoc_port_07 & munoc_port_00;
assign munoc_port_13 = {munoc_port_15, munoc_signal_35, munoc_port_01, munoc_port_14};

`endif

`undef MUNOC_LDEF_07
`undef MUNOC_LDEF_02
`undef MUNOC_LDEF_03
`undef MUNOC_LDEF_01
`undef MUNOC_LDEF_05
`undef MUNOC_LDEF_22
`undef MUNOC_LDEF_16
`undef MUNOC_LDEF_00
`undef MUNOC_LDEF_14
`undef MUNOC_LDEF_11
`undef MUNOC_LDEF_18
`undef MUNOC_LDEF_19
`undef MUNOC_LDEF_06
`undef MUNOC_LDEF_12
`undef MUNOC_LDEF_13
`undef MUNOC_LDEF_08
`undef MUNOC_LDEF_20
`undef MUNOC_LDEF_21
`undef MUNOC_LDEF_17
`undef MUNOC_LDEF_15
`undef MUNOC_LDEF_09
`undef MUNOC_LDEF_04
`undef MUNOC_LDEF_10
endmodule
