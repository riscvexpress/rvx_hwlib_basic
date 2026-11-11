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
`include "ervp_ahb_define.vh"
`include "munoc_include_08.vh"
`include "munoc_include_03.vh"





module MUNOC_MODULE_31
(
	munoc_port_24,
	munoc_port_13,

	munoc_port_03,
	munoc_port_10,
	munoc_port_05,
	munoc_port_15,
	munoc_port_29,
	munoc_port_18,
	munoc_port_08,
	munoc_port_06,	
	munoc_port_02,
	munoc_port_21,
	munoc_port_12,	

	munoc_port_27,
	munoc_port_20,
	munoc_port_19,
	munoc_port_14,
	munoc_port_26,
	munoc_port_16,
	munoc_port_11,
	munoc_port_07,
	munoc_port_23,

	munoc_port_04,
	munoc_port_25,
	munoc_port_17,
	munoc_port_31,

	munoc_port_28,
	munoc_port_22,
	munoc_port_00,
	munoc_port_09,
	munoc_port_01,
	munoc_port_30
);





parameter MUNOC_GPARA_5 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_3 = 3;
parameter MUNOC_GPARA_0 = 2;
parameter MUNOC_GPARA_4 = 0; 

input wire munoc_port_24, munoc_port_13;

input wire [MUNOC_GPARA_5-1:0] munoc_port_03;
input wire [`BW_AHB_BURST-1:0] munoc_port_10;
input wire munoc_port_05;
input wire [`BW_AHB_PROT-1:0] munoc_port_15;
input wire [`BW_AHB_SIZE-1:0] munoc_port_29;
input wire [`BW_AHB_TRANS-1:0] munoc_port_18;
input wire munoc_port_08;

input wire [MUNOC_GPARA_2-1:0] munoc_port_06;
output wire [MUNOC_GPARA_2-1:0] munoc_port_02;
output wire munoc_port_21;
output wire munoc_port_12;

output wire munoc_port_27;
output wire [`BW_ARCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_5)-1:0] munoc_port_20;
input wire munoc_port_19;

output wire munoc_port_14;
output wire [`BW_AWCHANNEL(MUNOC_GPARA_1,MUNOC_GPARA_5)-1:0] munoc_port_26;
input wire munoc_port_16;

output wire munoc_port_11;
output wire [`BW_WCHANNEL(0,MUNOC_GPARA_2)-1:0] munoc_port_07;
input wire munoc_port_23;

input wire [MUNOC_GPARA_1-1:0] munoc_port_04;
input wire [`BW_AXI_BRESP-1:0] munoc_port_25;
input wire munoc_port_17;
output wire munoc_port_31;

input wire [MUNOC_GPARA_1-1:0] munoc_port_28;
input wire [MUNOC_GPARA_2-1:0] munoc_port_22;
input wire [`BW_AXI_RRESP-1:0] munoc_port_00;
input wire munoc_port_09;
input wire munoc_port_01;
output wire munoc_port_30;

localparam  MUNOC_LPARA_0 = MUNOC_GPARA_5+`BW_AHB_BURST+`BW_AHB_SIZE+`BW_AHB_TRANS+1;

wire munoc_signal_23;
wire munoc_signal_39;
wire [MUNOC_LPARA_0-1:0] munoc_signal_04;
wire munoc_signal_00;
wire munoc_signal_37;
wire [MUNOC_LPARA_0-1:0] munoc_signal_03;

wire [MUNOC_GPARA_5-1:0] munoc_signal_32;
wire [`BW_AHB_BURST-1:0] munoc_signal_42;
wire [`BW_AHB_SIZE-1:0] munoc_signal_46;
wire [`BW_AHB_TRANS-1:0] munoc_signal_18;
wire munoc_signal_10;

localparam  MUNOC_LPARA_1 = MUNOC_GPARA_2;

wire munoc_signal_12;
wire munoc_signal_33;
wire [MUNOC_LPARA_1-1:0] munoc_signal_21;
wire munoc_signal_47;
wire munoc_signal_15;
wire [MUNOC_LPARA_1-1:0] munoc_signal_11;

wire [MUNOC_GPARA_2-1:0] munoc_signal_14;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_2)-1:0] munoc_signal_38;
wire munoc_signal_02;

localparam  MUNOC_LPARA_2 = MUNOC_GPARA_2 + 1;

wire munoc_signal_28;
wire munoc_signal_49;
wire [MUNOC_LPARA_2-1:0] munoc_signal_26;
wire munoc_signal_29;
wire munoc_signal_34;
wire [MUNOC_LPARA_2-1:0] munoc_signal_40;

wire [MUNOC_GPARA_2-1:0] munoc_signal_05;
reg munoc_signal_20;

reg munoc_signal_07;
reg munoc_signal_01;
wire munoc_signal_08;
reg munoc_signal_43;
wire munoc_signal_17;
reg munoc_signal_13;

wire [MUNOC_GPARA_1-1:0] munoc_signal_27;
wire [MUNOC_GPARA_5-1:0] munoc_signal_24;
reg [`BW_AXI_ALEN-1:0] munoc_signal_06;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_30;
reg [`BW_AXI_ABURST-1:0] munoc_signal_45;

wire munoc_signal_16;
wire munoc_signal_48;
wire [`BW_AXI_ALEN-1:0] munoc_signal_19;

wire munoc_signal_36;
wire munoc_signal_22;
reg munoc_signal_44;
reg munoc_signal_25;
wire munoc_signal_41;
wire munoc_signal_35;
wire munoc_signal_31;
wire munoc_signal_09;

MUNOC_MODULE_25
#(
	.MUNOC_GPARA_0(MUNOC_LPARA_0),
	.MUNOC_GPARA_1(2)
)
i_munoc_instance_0
(
	.munoc_port_7(munoc_port_24),
	.munoc_port_1(munoc_port_13),
	.munoc_port_6(munoc_signal_23),
	.munoc_port_0(munoc_signal_39),
	.munoc_port_5(munoc_signal_04),
	.munoc_port_3(munoc_signal_00),
	.munoc_port_4(munoc_signal_37),
	.munoc_port_2(munoc_signal_03)
);

assign munoc_signal_39 = munoc_signal_43 & (munoc_port_18==`AHB_TRANS_NONSEQ);
assign munoc_signal_04 = {munoc_port_03,munoc_port_10,munoc_port_29,munoc_port_18,munoc_port_08};
assign {munoc_signal_32,munoc_signal_42,munoc_signal_46,munoc_signal_18,munoc_signal_10} = munoc_signal_03;
assign munoc_signal_37 = munoc_signal_09;

MUNOC_MODULE_25
#(
	.MUNOC_GPARA_0(MUNOC_LPARA_1),
	.MUNOC_GPARA_1(MUNOC_GPARA_3)
)
i_munoc_instance_3
(
	.munoc_port_7(munoc_port_24),
	.munoc_port_1(munoc_port_13),
	.munoc_port_6(munoc_signal_12),
	.munoc_port_0(munoc_signal_33),
	.munoc_port_5(munoc_signal_21),
	.munoc_port_3(munoc_signal_47),
	.munoc_port_4(munoc_signal_15),
	.munoc_port_2(munoc_signal_11)
);

assign munoc_signal_33 = munoc_signal_43 & munoc_signal_07 & (munoc_signal_01==1);
assign munoc_signal_21 = munoc_port_06;
assign munoc_signal_14 = munoc_signal_11;
assign munoc_signal_15 = munoc_port_23;

MUNOC_MODULE_25
#(
	.MUNOC_GPARA_0(MUNOC_LPARA_2),
	.MUNOC_GPARA_1(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.munoc_port_7(munoc_port_24),
	.munoc_port_1(munoc_port_13),
	.munoc_port_6(munoc_signal_28),
	.munoc_port_0(munoc_signal_49),
	.munoc_port_5(munoc_signal_26),
	.munoc_port_3(munoc_signal_29),
	.munoc_port_4(munoc_signal_34),
	.munoc_port_2(munoc_signal_40)
);

assign {munoc_port_02, munoc_port_21} = munoc_signal_40;
assign munoc_signal_34 = munoc_signal_43 & munoc_signal_07 & (munoc_signal_01==0);
assign munoc_signal_26 = {munoc_signal_05, munoc_signal_20};
assign munoc_signal_49 = munoc_port_01;

always@(posedge munoc_port_24, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
	begin
		munoc_signal_07 <= 0;
		munoc_signal_01 <= 0;
	end
	else if(munoc_signal_43)
	begin
		munoc_signal_07 <= munoc_signal_08;
		munoc_signal_01 <= munoc_port_08;
	end
end

assign munoc_signal_08 = (munoc_port_18==`AHB_TRANS_NONSEQ) | (munoc_port_18==`AHB_TRANS_SEQ);

assign munoc_port_12 = munoc_signal_17 & munoc_signal_13;

assign munoc_signal_17 = munoc_signal_23;

always@(*)
begin
	munoc_signal_13 = 0;
	if(munoc_signal_07)
	begin
		if(munoc_signal_01)
			munoc_signal_13 = munoc_signal_12;
		else
			munoc_signal_13 = munoc_signal_29;
	end
	else
		munoc_signal_13 = 1;
end

always@(*)
begin
	munoc_signal_43 = 0;
	if(munoc_port_12)
		case(munoc_port_18)
			`AHB_TRANS_NONSEQ,
			`AHB_TRANS_SEQ:
				munoc_signal_43 = 1;
			`AHB_TRANS_BUSY:
				munoc_signal_43 = 0;
			`AHB_TRANS_IDLE:
				munoc_signal_43 = munoc_signal_07;
		endcase
end

assign munoc_signal_05 = munoc_port_22;

always@(*)
begin
	munoc_signal_20 = `AHB_RESPONSE_OKAY;
	if(munoc_signal_01==0)
		case(munoc_signal_20)
			`AXI_RESPONSE_OKAY,
			`AXI_RESPONSE_EXOKAY:
				munoc_signal_20 = `AHB_RESPONSE_OKAY;
			`AXI_RESPONSE_SLVERR,
			`AXI_RESPONSE_DECERR:
				munoc_signal_20 = `AHB_RESPONSE_ERROR;
		endcase
end

assign munoc_signal_36 = munoc_signal_00;

assign munoc_port_20 = {munoc_signal_27,munoc_signal_24,munoc_signal_06,munoc_signal_30,munoc_signal_45};
assign munoc_port_26 = {munoc_signal_27,munoc_signal_24,munoc_signal_06,munoc_signal_30,munoc_signal_45};
assign munoc_signal_27 = 0;
assign munoc_signal_24 = munoc_signal_32;
assign munoc_signal_30 = munoc_signal_46;

always@(posedge munoc_port_24, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_44 <= 0;
	else if(munoc_signal_09)
		munoc_signal_44 <= 0;
	else if(munoc_signal_22)
		munoc_signal_44 <= 1;
end

always@(posedge munoc_port_24, negedge munoc_port_13)
begin
	if(munoc_port_13==0)
		munoc_signal_25 <= 0;
	else if(munoc_signal_09)
		munoc_signal_25 <= 0;
	else if(munoc_signal_31)
		munoc_signal_25 <= 1;
end

assign munoc_signal_22 = (munoc_port_19 & munoc_port_27) | (munoc_port_16 & munoc_port_14);
assign munoc_port_27 = (~munoc_signal_44) & munoc_signal_00 & (munoc_signal_10==0);
assign munoc_port_14 = (~munoc_signal_44) & munoc_signal_00 & (munoc_signal_10==1);

always@(*)
begin
	munoc_signal_06 = `AXI_LENGTH_01;
	munoc_signal_45 = `AXI_BURST_FIXED;
	case(munoc_signal_42)
		
		`AHB_BURST_SINGLE:
		begin
			munoc_signal_06 = `AXI_LENGTH_01;
			munoc_signal_45 = `AXI_BURST_FIXED;
		end
		`AHB_BURST_WRAP4:
		begin
			munoc_signal_06 = `AXI_LENGTH_04;
			munoc_signal_45 = `AXI_BURST_WRAP;
		end
		`AHB_BURST_INCR4:
		begin
			munoc_signal_06 = `AXI_LENGTH_04;
			munoc_signal_45 = `AXI_BURST_INCR;
		end
		`AHB_BURST_WRAP8:
		begin
			munoc_signal_06 = `AXI_LENGTH_08;
			munoc_signal_45 = `AXI_BURST_WRAP;
		end
		`AHB_BURST_INCR8:
		begin
			munoc_signal_06 = `AXI_LENGTH_08;
			munoc_signal_45 = `AXI_BURST_INCR;
		end
		`AHB_BURST_WRAP16:
		begin
			munoc_signal_06 = `AXI_LENGTH_16;
			munoc_signal_45 = `AXI_BURST_WRAP;
		end
		`AHB_BURST_INCR16:
		begin
			munoc_signal_06 = `AXI_LENGTH_16;
			munoc_signal_45 = `AXI_BURST_INCR;
		end
	endcase
end

ERVP_COUNTER
#(
	.BW_COUNTER(`BW_AXI_ALEN),
	.COUNT_AMOUNT(1)
)
i_munoc_instance_2
(
	.clk(munoc_port_24),
	.rstnn(munoc_port_13),
	.enable(1'b 1),
	.init(munoc_signal_16),
	.count(munoc_signal_48),
	.value(munoc_signal_19),
	.is_first_count(),
	.is_last_count()
);

assign munoc_signal_16 = munoc_signal_09;
assign munoc_signal_48 = munoc_signal_41;
assign munoc_signal_35 = (munoc_signal_19==munoc_signal_06);

assign munoc_signal_38 = `ALL_ONE;
assign munoc_signal_02 = munoc_signal_35;
assign munoc_port_07 = {munoc_signal_14,munoc_signal_38,munoc_signal_02};
assign munoc_port_11 = (~munoc_signal_25) & munoc_signal_47;

assign munoc_port_30 = (~munoc_signal_25) & munoc_signal_28;

assign munoc_signal_41 = (munoc_port_23 & munoc_port_11) | (munoc_port_01 & munoc_port_30);
assign munoc_signal_31 = munoc_signal_41 & munoc_signal_35;
assign munoc_signal_09 = (munoc_signal_22 | munoc_signal_44) & (munoc_signal_31 | munoc_signal_25);

assign munoc_port_31 = 1;

endmodule
