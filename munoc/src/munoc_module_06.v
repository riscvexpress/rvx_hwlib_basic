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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_10.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_06.vh"
`include "munoc_include_07.vh"
`include "munoc_include_04.vh"





module MUNOC_MODULE_06
(
	munoc_port_14,
	munoc_port_08,

	munoc_port_04,
	munoc_port_03,
	munoc_port_06,

	munoc_port_02,
	munoc_port_11,
	munoc_port_01,
	munoc_port_15,
	munoc_port_12,
	munoc_port_09,
	
	munoc_port_00,
	munoc_port_05,
	munoc_port_13,
	munoc_port_10,
	munoc_port_07
);





parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_3 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_2 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_4 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_1 = 1;

localparam  MUNOC_LPARA_0 = `MUNOC_GDEF_72(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_3 = `GET_AXI_SIZE(MUNOC_GPARA_0);

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire munoc_port_14, munoc_port_08;

output wire munoc_port_04;
input wire munoc_port_03;
input wire [`MUNOC_GDEF_55-1:0] munoc_port_06;

input wire [MUNOC_GPARA_3-1:0] munoc_port_02;
input wire [MUNOC_GPARA_0-1:0] munoc_port_11;
input wire [`BW_AXI_RRESP-1:0] munoc_port_01;
input wire munoc_port_15;
input wire munoc_port_12;
output wire munoc_port_09;

output wire [MUNOC_GPARA_4/MUNOC_GPARA_2-1:0] munoc_port_00;
input wire munoc_port_05;
output wire munoc_port_13;
output wire munoc_port_10;
output wire [`BW_RCHANNEL(MUNOC_GPARA_3,MUNOC_GPARA_4)-1:0] munoc_port_07;

genvar i;
integer j;

wire [`MUNOC_GDEF_55-1:0] munoc_signal_10;
wire munoc_signal_32;
wire munoc_signal_11;

wire [`MUNOC_GDEF_77-1:0] datatype;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_04;
wire [`BW_ADDR_OFFSET-1:0] munoc_signal_01;
wire [`MUNOC_GDEF_90-1:0] munoc_signal_28;

reg [`MUNOC_GDEF_90-1:0] munoc_signal_24, munoc_signal_13;

wire munoc_signal_07;
wire munoc_signal_14;
wire munoc_signal_22;

`define MUNOC_LDEF_3 2
`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_4 1
`define MUNOC_LDEF_5 2

reg [`MUNOC_LDEF_3-1:0] munoc_signal_29;
wire munoc_signal_05;
wire munoc_signal_20;
wire munoc_signal_35;

wire munoc_signal_19;
wire munoc_signal_39;
wire munoc_signal_08;
reg [`MUNOC_GDEF_90-1:0] munoc_signal_30;

localparam  MUNOC_LPARA_2 = `ULIMIT_OF_DATA_WIDTH/32;
localparam  MUNOC_LPARA_4 = MUNOC_GPARA_0/32;
localparam [MUNOC_LPARA_2-1:0] NODE_LANE_MASK = {MUNOC_LPARA_2{1'b 1}} >> (MUNOC_LPARA_2-MUNOC_LPARA_4);
localparam  MUNOC_LPARA_1 = REQUIRED_BITWIDTH_INDEX(MUNOC_LPARA_2);

reg [MUNOC_LPARA_2-1:0] munoc_signal_12; 
reg [MUNOC_LPARA_2-1:0] munoc_signal_06;
wire munoc_signal_17;

`define MUNOC_LDEF_2 1
`define MUNOC_LDEF_6 0
`define MUNOC_LDEF_0 1

reg [`MUNOC_LDEF_2-1:0] munoc_signal_03;
wire munoc_signal_38;
wire munoc_signal_26;
wire munoc_signal_27;

reg [`BW_AXI_RRESP-1:0] munoc_signal_31, munoc_signal_00;

wire [MUNOC_GPARA_4-1:0] munoc_signal_23;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_21;

reg [MUNOC_LPARA_1-1:0] munoc_signal_15, munoc_signal_36;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_34;
wire [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_09;
reg [`ULIMIT_OF_DATA_WIDTH-1:0] munoc_signal_37;

reg [MUNOC_GPARA_4/MUNOC_GPARA_2-1:0] munoc_signal_16, munoc_signal_25;

reg [`MUNOC_GDEF_90-1:0] munoc_signal_33, munoc_signal_02;
wire munoc_signal_18;

ERVP_SMALL_FIFO
#(
	.BW_DATA(`MUNOC_GDEF_55),
	.DEPTH(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.clk(munoc_port_14),
	.rstnn(munoc_port_08),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_04),
	.wrequest(munoc_port_03),
	.wdata(munoc_port_06),
	.rready(munoc_signal_32),
	.rrequest(munoc_signal_11),
	.rdata(munoc_signal_10),
	.wfull(),
	.rempty()
);

assign {datatype,munoc_signal_04,munoc_signal_01,munoc_signal_28} = munoc_signal_10;

assign munoc_signal_19 = munoc_port_09 & munoc_port_12;
assign munoc_signal_39 = munoc_signal_19 & munoc_signal_08;
assign munoc_signal_11 = munoc_signal_39;

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_30 <= 0;
	else if(munoc_signal_19)
  begin
    if(munoc_signal_08)
      munoc_signal_30 <= 0;
    else
      munoc_signal_30 <= munoc_signal_30 + 1'b 1;
  end
end

assign munoc_signal_08 = (munoc_signal_30==munoc_signal_28);

`ifndef __MUNOC_USE_SINGLE_DATA_WIDTH

assign munoc_signal_07 = ($unsigned(munoc_signal_04) < $unsigned(MUNOC_LPARA_3));
assign munoc_signal_14 = ($unsigned(munoc_signal_04) == $unsigned(MUNOC_LPARA_3));
assign munoc_signal_22 = ($unsigned(munoc_signal_04) > $unsigned(MUNOC_LPARA_3));

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_29 <= `MUNOC_LDEF_1;
	else if(munoc_signal_05)
		munoc_signal_29 <= `MUNOC_LDEF_4;
	else if(munoc_signal_20)
		munoc_signal_29 <= `MUNOC_LDEF_5;
	else if(munoc_signal_39)
		munoc_signal_29 <= `MUNOC_LDEF_1;
end

assign munoc_signal_05 = (munoc_signal_29==`MUNOC_LDEF_1)  & munoc_signal_32 & munoc_signal_22;
assign munoc_signal_20 = (munoc_signal_29==`MUNOC_LDEF_1) & munoc_signal_32 & (munoc_signal_07|munoc_signal_14);
assign munoc_signal_35 = munoc_signal_05 | munoc_signal_20;

assign munoc_port_09 = (munoc_signal_29!=`MUNOC_LDEF_1) & munoc_port_05;

always@(*)
begin
	munoc_signal_06 = 0;
	for(j=0; j<MUNOC_LPARA_2; j=j+1)
		if(j<(1<<datatype))
			munoc_signal_06[j] = 1;
end

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_12 <= NODE_LANE_MASK;
	else if(munoc_signal_35)
	begin
		if(munoc_signal_20)
			munoc_signal_12 <= munoc_signal_06;
		else
			munoc_signal_12 <= NODE_LANE_MASK;
	end
	else if((munoc_signal_29==`MUNOC_LDEF_4) && munoc_signal_19 && (!munoc_signal_08) && munoc_signal_27)
	begin
		
		if(|(munoc_signal_12 & (~(munoc_signal_06>>1))))
			munoc_signal_12 <= NODE_LANE_MASK;
		else
			munoc_signal_12 <= munoc_signal_12 << MUNOC_LPARA_4;
	end
end

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_24 <= 0;
	else if(munoc_signal_35)
		munoc_signal_24 <= munoc_signal_13;
end

always@(*)
begin
	munoc_signal_13 = -1;
	if(munoc_signal_04 <= MUNOC_LPARA_3)
		;
	else
		for(j=0; j<`MUNOC_GDEF_90; j=j+1)
			if(j<($unsigned(munoc_signal_04)-MUNOC_LPARA_3))
				munoc_signal_13[j] = 0;
end

assign munoc_port_13 = ($signed((munoc_signal_30|munoc_signal_24))==(-1));
assign munoc_signal_17 = munoc_signal_19 & munoc_port_13;

always@(*)
begin
	munoc_signal_25 = 0;
	for(j=0; j<(MUNOC_GPARA_4/MUNOC_GPARA_2); j=j+1)
		if(j<((32<<datatype)/MUNOC_GPARA_2))
			munoc_signal_25[j] = 1;
end

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_16 <= 0;
	else if(munoc_signal_35)
		munoc_signal_16 <= munoc_signal_25;
	else if(munoc_port_10)
	begin
		if(munoc_port_13)
			munoc_signal_16 <= munoc_signal_25;
		else
			munoc_signal_16 <= munoc_signal_16 & (~munoc_port_00);
	end
end

generate
	for(i=0; i<MUNOC_GPARA_4/MUNOC_GPARA_2; i=i+1)
	begin: i_gen_rdata_write_request
		assign munoc_port_00[i] = (munoc_port_13)? munoc_signal_16[i] : munoc_signal_12[i/(32/MUNOC_GPARA_2)];
	end
endgenerate
assign munoc_port_10 = munoc_signal_19;

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_31 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_17)
		munoc_signal_31 <= `AXI_RESPONSE_OKAY;
	else if(munoc_signal_19)
		munoc_signal_31 <= munoc_signal_00;
end

always@(*)
begin
	munoc_signal_00 = munoc_port_01;
	case(munoc_signal_31)
		`AXI_RESPONSE_OKAY,
		`AXI_RESPONSE_EXOKAY:
			munoc_signal_00 = munoc_port_01;
		`AXI_RESPONSE_SLVERR,
		`AXI_RESPONSE_DECERR:
			munoc_signal_00 = munoc_signal_31;
	endcase
end

assign munoc_port_07 = {munoc_port_02,munoc_signal_08,munoc_signal_00,munoc_signal_23};

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_03 <= `MUNOC_LDEF_6;
	else if(munoc_signal_35)
	begin
		if(munoc_signal_38)
			munoc_signal_03 <= `MUNOC_LDEF_0;
		else
			munoc_signal_03 <= `MUNOC_LDEF_6;
	end
end

assign munoc_signal_38 = ($unsigned(datatype) < $unsigned(MUNOC_LPARA_0));
assign munoc_signal_26 = ($unsigned(datatype) == $unsigned(MUNOC_LPARA_0));
assign munoc_signal_27 = ($unsigned(datatype) > $unsigned(MUNOC_LPARA_0));

generate
	for(i=0; i<`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_0; i=i+1)
	begin: i_duplicate_rdata
		assign munoc_signal_21[(i+1)*MUNOC_GPARA_0-1-:MUNOC_GPARA_0] = munoc_port_11;
	end
endgenerate

always@(*)
begin
	
	munoc_signal_36 = 0;
	for(j=0; j<MUNOC_LPARA_1; j=j+1)
		if((j>=$unsigned(datatype)) && (j<(MUNOC_LPARA_3-`AXI_SIZE_004BYTE)))
			munoc_signal_36[j] = munoc_signal_01[j+2];
end

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_15 <= 0;
	else if(munoc_signal_35 && munoc_signal_38)
		munoc_signal_15 <= munoc_signal_36;
	else if((munoc_signal_03==`MUNOC_LDEF_0)&&munoc_signal_18)
	begin
		if(munoc_signal_19 && (!munoc_signal_08))
			munoc_signal_15 <= (munoc_signal_15 + (1<<datatype)) & (MUNOC_LPARA_4-1);
	end
end

always@(posedge munoc_port_14, negedge munoc_port_08)
begin
	if(munoc_port_08==0)
		munoc_signal_33 <= 0;
	else if(munoc_signal_35 && munoc_signal_38)
		munoc_signal_33 <= munoc_signal_02;
end

always@(*)
begin
	munoc_signal_02 = -1;
	for(j=0; j<`MUNOC_GDEF_90; j=j+1)
		if(j<($unsigned(datatype)-`MUNOC_GDEF_74 - ($unsigned(munoc_signal_04)-`AXI_SIZE_004BYTE)))
			munoc_signal_02[j] = 0;
end

assign munoc_signal_18 = ($signed((munoc_signal_30|munoc_signal_33))==(-1));

assign munoc_signal_34 = $unsigned(munoc_port_11);

assign munoc_signal_09 = munoc_signal_34 >> (munoc_signal_15*32);

always@(*)
begin
	munoc_signal_37 = munoc_signal_34;
	for(j=0; j<`ULIMIT_OF_DATA_WIDTH; j=j+1)
		if(j<(32<<datatype))
			munoc_signal_37[j] = munoc_signal_09[j];
end

assign munoc_signal_23 = (munoc_signal_03==`MUNOC_LDEF_0)? munoc_signal_37 : munoc_signal_21;

`else

assign munoc_port_09 = munoc_signal_32 & munoc_port_05;
assign munoc_port_00 = -1;
assign munoc_port_13 = 1;
assign munoc_port_10 = munoc_port_09 & munoc_port_12;
assign munoc_port_07 = {munoc_port_02, munoc_signal_08, munoc_port_01, munoc_port_11};

`endif

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_3
`undef MUNOC_LDEF_6
`undef MUNOC_LDEF_4
`undef MUNOC_LDEF_5
`undef MUNOC_LDEF_1
`undef MUNOC_LDEF_0
endmodule
