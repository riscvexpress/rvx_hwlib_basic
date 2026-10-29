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
`include "ervp_axi_define.vh"



module MUNOC_XMI2TLUL
(
	clk,
	rstnn,

	rlxqdready,
	rlxqvalid,
	rlxqlast,
	rlxqwrite,
	rlxqlen,
	rlxqsize,
	rlxqburst,
	rlxqwstrb,
	rlxqwdata,
	rlxqaddr,
	rlxqburden,

	rlxydready,
	rlxyvalid,
	rlxylast,
	rlxywreply,
	rlxyresp,
	rlxyrdata,
	rlxyburden,

	stlavalid,
	stlaready,
	stlaopcode,
	stlaparam,
	stlasize,
	stlasource,
	stlaaddress,
	stlamask,
	stladata,

	stldvalid,
	stldready,
	stldopcode,
	stldparam,
	stldsize,
	stldsource,
	stldsink,
	stlddata,
	stlderror
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_BURDEN = 1;
parameter BW_TLUL_SIZE = 2;
parameter BW_TLUL_SOURCE = 8;
parameter BW_TLUL_SINK = 1;

`include "lpit_function.vb"
`include "lpixm_function.vb"
`include "lpixs_function.vb"

localparam  RVX_LPARA_01 = `NUM_BYTE(BW_DATA);
localparam  RVX_LPARA_05 = (BW_TLUL_SOURCE>=BW_BURDEN);
localparam  RVX_LPARA_09 = `PLOG2(RVX_LPARA_01);

localparam  RVX_LPARA_08 = BW_LPIXM_QPARCEL(BW_ADDR,BW_DATA);
localparam  RVX_LPARA_13 = BW_LPIXM_YPARCEL(BW_DATA);
localparam  RVX_LPARA_06 = BW_LPI_DATA(BW_BURDEN,RVX_LPARA_08);
localparam  RVX_LPARA_12 = BW_LPI_DATA(BW_BURDEN,RVX_LPARA_13);

localparam  RVX_LPARA_11 = BW_LPIXS_QPARCEL(BW_ADDR,BW_DATA);
localparam  RVX_LPARA_04 = BW_LPIXS_YPARCEL(BW_DATA);
localparam  RVX_LPARA_16 = BW_LPI_DATA(BW_BURDEN,RVX_LPARA_11);
localparam  RVX_LPARA_07 = BW_LPI_DATA(BW_BURDEN,RVX_LPARA_04);

localparam  RVX_LPARA_14 = 3'h 0;
localparam  RVX_LPARA_17 = 3'h 1;
localparam  RVX_LPARA_15 = 3'h 4;

input wire clk;
input wire rstnn;

output wire [2-1:0] rlxqdready;
input wire rlxqvalid;
input wire rlxqlast;
input wire rlxqwrite;
input wire [`BW_AXI_ALEN-1:0] rlxqlen;
input wire [`BW_AXI_ASIZE-1:0] rlxqsize;
input wire [`BW_AXI_ABURST-1:0] rlxqburst;
input wire [RVX_LPARA_01-1:0] rlxqwstrb;
input wire [BW_DATA-1:0] rlxqwdata;
input wire [BW_ADDR-1:0] rlxqaddr;
input wire [BW_BURDEN-1:0] rlxqburden;

input wire [2-1:0] rlxydready;
output wire rlxyvalid;
output wire rlxylast;
output wire rlxywreply;
output wire [`BW_AXI_RESP-1:0] rlxyresp;
output wire [BW_DATA-1:0] rlxyrdata;
output wire [BW_BURDEN-1:0] rlxyburden;

output wire stlavalid;
input wire stlaready;
output reg [3-1:0] stlaopcode;
output wire [3-1:0] stlaparam;
output reg [BW_TLUL_SIZE-1:0] stlasize;
output wire [BW_TLUL_SOURCE-1:0] stlasource;
output reg [BW_ADDR-1:0] stlaaddress;
output reg [RVX_LPARA_01-1:0] stlamask;
output reg [BW_DATA-1:0] stladata;

input wire stldvalid;
output wire stldready;
input wire [3-1:0] stldopcode;
input wire [3-1:0] stldparam;
input wire [BW_TLUL_SIZE-1:0] stldsize;
input wire [BW_TLUL_SOURCE-1:0] stldsource;
input wire [BW_TLUL_SINK-1:0] stldsink;
input wire [BW_DATA-1:0] stlddata;
input wire stlderror;

genvar i;

wire [2-1:0] rvx_signal_08;
wire rvx_signal_42;
wire rvx_signal_09;
wire rvx_signal_06;
wire rvx_signal_20;
wire [RVX_LPARA_06-1:0] rvx_signal_17;

wire [2-1:0] rvx_signal_00;
wire rvx_signal_24;
wire rvx_signal_21;
wire rvx_signal_35;
wire [RVX_LPARA_12-1:0] rvx_signal_31;
wire rvx_signal_07;

wire [2-1:0] rvx_signal_39;
wire rvx_signal_13;
wire rvx_signal_44;
wire rvx_signal_15;
wire rvx_signal_04;
wire [RVX_LPARA_16-1:0] rvx_signal_32;

wire [2-1:0] rvx_signal_40;
wire rvx_signal_37;
wire rvx_signal_02;
wire rvx_signal_38;
wire [RVX_LPARA_07-1:0] rvx_signal_33;

wire [BW_BURDEN-1:0] rvx_signal_26;
wire rvx_signal_34;
wire rvx_signal_03;
wire [`BW_AXI_ALEN-1:0] rvx_signal_18;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_19;
wire [`BW_AXI_ABURST-1:0] rvx_signal_10;
wire [RVX_LPARA_01-1:0] rvx_signal_25;
wire [BW_DATA-1:0] rvx_signal_14;
wire [BW_ADDR-1:0] rvx_signal_28;

wire [RVX_LPARA_01-1:0] rvx_signal_43;
reg [BW_ADDR-1:0] rvx_signal_05;
wire [RVX_LPARA_01-1:0] rvx_signal_27;

localparam  RVX_LPARA_10 = 2;
localparam  RVX_LPARA_00 = 0;
localparam  RVX_LPARA_03 = 1;
localparam  RVX_LPARA_02 = 2;

reg [RVX_LPARA_10-1:0] rvx_signal_23;

wire rvx_signal_29;
wire rvx_signal_30;

reg [BW_BURDEN-1:0] burden;
wire [BW_BURDEN-1:0] rvx_signal_11;
reg rvx_signal_16;
reg rvx_signal_41;
reg rvx_signal_01;

reg rvx_signal_36;
wire rvx_signal_12;
wire [`BW_AXI_RESP-1:0] rvx_signal_22;

assign rlxqdready = rvx_signal_08;
assign rvx_signal_42 = rlxqvalid;
assign rvx_signal_09 = 0;
assign rvx_signal_06 = rlxqlast;
assign rvx_signal_20 = (~rlxqwrite) | rlxqlast;
assign rvx_signal_17 = {rlxqburden,rlxqlast,rlxqwrite,rlxqlen,rlxqsize,rlxqburst,rlxqwstrb,rlxqwdata,rlxqaddr};

assign rvx_signal_00 = rlxydready;
assign rlxyvalid = rvx_signal_24;
assign rlxylast = rvx_signal_35;
assign {rlxyburden,rvx_signal_07,rlxywreply,rlxyresp,rlxyrdata} = rvx_signal_31;

RVX_MODULE_012
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.HAS_LPI_BURDEN(1),
	.BW_LPI_BURDEN(BW_BURDEN)
)
i_rvx_instance_0
(
	.rvx_port_16(clk),
	.rvx_port_13(rstnn),
	.rvx_port_17(1'b 0),
	.rvx_port_25(1'b 1),

	.rvx_port_00(rvx_signal_08),
	.rvx_port_06(rvx_signal_42),
	.rvx_port_19(rvx_signal_09),
	.rvx_port_20(rvx_signal_06),
	.rvx_port_10(rvx_signal_20),
	.rvx_port_12(rvx_signal_17),

	.rvx_port_18(rvx_signal_00),
	.rvx_port_14(rvx_signal_24),
	.rvx_port_08(rvx_signal_21),
	.rvx_port_01(rvx_signal_35),
	.rvx_port_22(rvx_signal_31),

	.rvx_port_04(rvx_signal_39),
	.rvx_port_23(rvx_signal_13),
	.rvx_port_03(rvx_signal_44),
	.rvx_port_15(rvx_signal_15),
	.rvx_port_24(rvx_signal_04),
	.rvx_port_11(rvx_signal_32),

	.rvx_port_21(rvx_signal_40),
	.rvx_port_07(rvx_signal_37),
	.rvx_port_05(rvx_signal_02),
	.rvx_port_09(rvx_signal_38),
	.rvx_port_02(rvx_signal_33)
);

assign {rvx_signal_26,rvx_signal_34,rvx_signal_03,rvx_signal_18,rvx_signal_19,rvx_signal_10,rvx_signal_25,rvx_signal_14,rvx_signal_28} = rvx_signal_32;

generate
for(i=0; i<RVX_LPARA_01; i=i+1)
begin : generate_natural_mask
	assign rvx_signal_43[i] = ((i>>rvx_signal_19)==(rvx_signal_28[RVX_LPARA_09-1:0]>>rvx_signal_19));
end
endgenerate

always@(*)
begin
	rvx_signal_05 = rvx_signal_28;
	rvx_signal_05[RVX_LPARA_09-1:0] = (rvx_signal_28[RVX_LPARA_09-1:0]>>rvx_signal_19)<<rvx_signal_19;
end

assign rvx_signal_27 = rvx_signal_25 & rvx_signal_43;

assign rvx_signal_29 = (rvx_signal_23==RVX_LPARA_00) & rvx_signal_13 & (rvx_signal_40[0] | (~rvx_signal_04));
assign rvx_signal_39 = {1'b 0, rvx_signal_29};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		stlaopcode <= RVX_LPARA_15;
		stlasize <= 0;
		stlaaddress <= 0;
		stlamask <= 0;
		stladata <= 0;
		burden <= 0;
		rvx_signal_16 <= 0;
		rvx_signal_41 <= 0;
		rvx_signal_01 <= 0;
	end
	else if(rvx_signal_29)
	begin
		if(rvx_signal_03)
			stlaopcode <= (rvx_signal_27==rvx_signal_43)? RVX_LPARA_14 : RVX_LPARA_17;
		else
			stlaopcode <= RVX_LPARA_15;
		stlasize <= rvx_signal_19;
		stlaaddress <= rvx_signal_05;
		stlamask <= rvx_signal_03? rvx_signal_27 : rvx_signal_43;
		stladata <= rvx_signal_14;
		burden <= rvx_signal_26;
		rvx_signal_16 <= rvx_signal_34;
		rvx_signal_41 <= rvx_signal_03;
		rvx_signal_01 <= rvx_signal_04;
	end
end

assign stlaparam = 0;
generate
if(RVX_LPARA_05)
begin : burden_in_source
	assign stlasource = burden;
	assign rvx_signal_11 = stldsource[BW_BURDEN-1:0];
end
else
begin : burden_in_register
	assign stlasource = 0;
	assign rvx_signal_11 = burden;
end
endgenerate

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_23 <= RVX_LPARA_00;
	else
		case(rvx_signal_23)
			RVX_LPARA_00:
				if(rvx_signal_29)
					rvx_signal_23 <= RVX_LPARA_03;
			RVX_LPARA_03:
				if(stlaready)
					rvx_signal_23 <= RVX_LPARA_02;
			RVX_LPARA_02:
				if(rvx_signal_30)
					rvx_signal_23 <= RVX_LPARA_00;
		endcase
end

assign stlavalid = (rvx_signal_23==RVX_LPARA_03);
assign stldready = (rvx_signal_23==RVX_LPARA_02) & ((~rvx_signal_01) | rvx_signal_40[0]);
assign rvx_signal_30 = stldvalid & stldready;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_36 <= 0;
	else if(rvx_signal_30 && rvx_signal_41)
	begin
		if(rvx_signal_01)
			rvx_signal_36 <= 0;
		else
			rvx_signal_36 <= rvx_signal_36 | stlderror;
	end
end

assign rvx_signal_12 = stlderror | (rvx_signal_41 & rvx_signal_36);
assign rvx_signal_22 = rvx_signal_12? `AXI_RESPONSE_SLVERR : `AXI_RESPONSE_OKAY;

assign rvx_signal_37 = rvx_signal_30 & rvx_signal_01;
assign rvx_signal_02 = 0;
assign rvx_signal_38 = 1;
assign rvx_signal_33 = {rvx_signal_11, rvx_signal_16, rvx_signal_41, rvx_signal_22, stlddata};

endmodule
