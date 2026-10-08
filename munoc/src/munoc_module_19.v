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
`include "munoc_include_00.vh"
`include "munoc_include_05.vh"





module MUNOC_MODULE_19
(
	munoc_port_03,
	munoc_port_08,
	munoc_port_05,
	munoc_port_02,
	
	munoc_port_07,
	munoc_port_00,
	munoc_port_01,
	munoc_port_06,
	munoc_port_09,

	munoc_port_10,
	munoc_port_11,
	munoc_port_04,
	munoc_port_12
);





parameter MUNOC_GPARA_1 = `REQUIRED_BW_OF_SLAVE_TID;
parameter MUNOC_GPARA_2 = `BW_LONGEST_MASTER_DATA;
parameter MUNOC_GPARA_0 = `LLIMIT_OF_DATA_WIDTH;
parameter MUNOC_GPARA_3 = 1;
parameter MUNOC_GPARA_4 = 1;

localparam  MUNOC_LPARA_0 = MUNOC_GPARA_1+`BW_AXI_RLAST+`BW_AXI_RRESP;

input wire munoc_port_03, munoc_port_08;
input wire munoc_port_05, munoc_port_02;

input wire [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_port_07;
output reg [MUNOC_GPARA_4-1:0] munoc_port_00;
input wire munoc_port_01;
input wire munoc_port_06;
input wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_09;

output reg munoc_port_10;
input wire [`MUNOC_GDEF_22-1:0] munoc_port_11;
input wire munoc_port_04;
output wire [`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1:0] munoc_port_12;

genvar i,k;
integer j;

wire [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_signal_00;
wire [MUNOC_GPARA_4-1:0] munoc_signal_04 [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0];
wire munoc_signal_05;
wire [MUNOC_GPARA_4-1:0] munoc_signal_03;
reg [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_signal_09;
reg [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_signal_01;
reg munoc_signal_07;
reg munoc_signal_02;

wire [`ULIMIT_OF_DATA_WIDTH/MUNOC_GPARA_0-1:0] munoc_signal_06;
wire [MUNOC_GPARA_2/MUNOC_GPARA_0-1:0] munoc_signal_08 [MUNOC_GPARA_4-1:0];

generate
	for(i=0; i<MUNOC_GPARA_2/MUNOC_GPARA_0; i=i+1)
	begin : i_gen_rdata_buffer
		ERVP_ASYNCH_FIFO
		#(
			.BW_DATA(MUNOC_GPARA_0),
			.DEPTH(MUNOC_GPARA_3),
			.WRITE_READY_SIZE(MUNOC_GPARA_4)
		)
		i_munoc_instance_0
		(
			.wclk(munoc_port_03),
			.wrstnn(munoc_port_08),
			.wready(munoc_signal_04[i]),
			.wrequest(munoc_signal_01[i]),
			.wdata(munoc_port_09[(i+1)*MUNOC_GPARA_0-1-:MUNOC_GPARA_0]),
			.rclk(munoc_port_05),
			.rrstnn(munoc_port_02),
			.rready(munoc_signal_00[i]),
			.rrequest(munoc_signal_09[i]),
			.rdata(munoc_port_12[(i+1)*MUNOC_GPARA_0-1-:MUNOC_GPARA_0]),
			.wfull(),
			.rempty()
		);
	end
endgenerate

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(MUNOC_LPARA_0),
	.DEPTH(MUNOC_GPARA_3),
	.WRITE_READY_SIZE(MUNOC_GPARA_4)
)
i_munoc_instance_1
(
	.wclk(munoc_port_03),
	.wrstnn(munoc_port_08),
	.wready(munoc_signal_03),
	.wrequest(munoc_signal_02),
	.wdata(munoc_port_09[`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1-:MUNOC_LPARA_0]),
	.rclk(munoc_port_05),
	.rrstnn(munoc_port_02),
	.rready(munoc_signal_05),
	.rrequest(munoc_signal_07),
	.rdata(munoc_port_12[`BW_RCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_2)-1-:MUNOC_LPARA_0]),
	.wfull(),
	.rempty()
);

assign munoc_signal_06 = $unsigned(munoc_signal_00);

always@(*)
begin
	munoc_port_10 = 0;
	if(munoc_signal_05)
	begin
		case(munoc_port_11)
			`MUNOC_GDEF_80:
				if(MUNOC_GPARA_2>=32)
					munoc_port_10 = `IS_ALL_ONE(munoc_signal_06[32/MUNOC_GPARA_0-1:0]);
			`MUNOC_GDEF_14:
				if(MUNOC_GPARA_2>=64)
					munoc_port_10 = `IS_ALL_ONE(munoc_signal_06[64/MUNOC_GPARA_0-1:0]);
			`MUNOC_GDEF_24:
				if(MUNOC_GPARA_2>=128)
					munoc_port_10 = `IS_ALL_ONE(munoc_signal_06[128/MUNOC_GPARA_0-1:0]);
		endcase
	end
end

always@(*)
begin
	munoc_signal_07 = 0;
	munoc_signal_09 = 0;
	if(munoc_port_04)
	begin
		munoc_signal_07 = 1;
		case(munoc_port_11)
			`MUNOC_GDEF_80:
				if(MUNOC_GPARA_2>=32)
					for(j=0; j<32/MUNOC_GPARA_0; j=j+1)
						munoc_signal_09[j] = 1;
			`MUNOC_GDEF_14:
				if(MUNOC_GPARA_2>=64)
					for(j=0; j<64/MUNOC_GPARA_0; j=j+1)
						munoc_signal_09[j] = 1;
			`MUNOC_GDEF_24:
				if(MUNOC_GPARA_2>=128)
					for(j=0; j<128/MUNOC_GPARA_0; j=j+1)
						munoc_signal_09[j] = 1;
		endcase
	end
end

generate
for(k=0; k<MUNOC_GPARA_4; k=k+1)
begin : i_gen_k_rdata_wready
	for(i=0; i<MUNOC_GPARA_2/MUNOC_GPARA_0; i=i+1)
	begin : i_gen_i_rdata_wready
		assign munoc_signal_08[k][i] = munoc_signal_04[i][k];
	end
end
endgenerate

always@(*)
begin
	munoc_port_00 = 0;
	for(j=0; j<MUNOC_GPARA_4; j=j+1)
		if(munoc_signal_03[j])
			if(`IS_ALL_ONE((munoc_signal_08[j] & munoc_port_07) | (~munoc_port_07)))
				munoc_port_00[j] = 1;
end

always@(*)
begin
	munoc_signal_02 = 0;
	munoc_signal_01 = 0;
	if(munoc_port_00[0] && munoc_port_06)
	begin
		munoc_signal_01 = munoc_port_07;
		munoc_signal_02 = munoc_port_01;
	end
end

endmodule
