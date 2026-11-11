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
// 2026-11-11
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"



module ERVP_SRAM_CONTROLLER_AXI
(
	clk,
	rstnn,

	rxawid,
	rxawaddr,
	rxawlen,
	rxawsize,
	rxawburst,
	rxawvalid,
	rxawready,

	rxwid,
	rxwdata,
	rxwstrb,
	rxwlast,
	rxwvalid,
	rxwready,

	rxbid,
	rxbresp,
	rxbvalid,
	rxbready,

	rxarid,
	rxaraddr,
	rxarlen,
	rxarsize,
	rxarburst,
	rxarvalid,
	rxarready,

	rxrid,
	rxrdata,
	rxrresp,
	rxrlast,
	rxrvalid,
	rxrready,

	cell_select_list,
	cell_index_list,
	cell_enable_list,
	cell_write_enable_list,
	cell_write_enable_byte_list,
	cell_write_enable_bit_list,
	cell_wdata_list,
	cell_read_enable_list,
	cell_rdata_list
);



parameter BW_ADDR = 1;
parameter BW_DATA = 16;
parameter BW_AXI_TID = 1;
parameter BASE_ADDR = 0;

parameter CELL_SIZE = 65536; 
parameter BW_CELL_INDEX = 0;
parameter NUM_CELL = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_5 = `NUM_BYTE(BW_DATA);
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_5);

localparam  RVX_LPARA_6 = `DIVIDERU(CELL_SIZE,RVX_LPARA_5);
localparam  RVX_LPARA_2 = REQUIRED_BITWIDTH_INDEX(RVX_LPARA_6);

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(NUM_CELL);
localparam  RVX_LPARA_4 = RVX_LPARA_0 + RVX_LPARA_2 + RVX_LPARA_1;
localparam  RVX_LPARA_3 = `MAX(RVX_LPARA_0, 1);

input wire clk, rstnn;

input wire [BW_AXI_TID-1:0] rxawid;
input wire [BW_ADDR-1:0] rxawaddr;
input wire [`BW_AXI_ALEN-1:0] rxawlen;
input wire [`BW_AXI_ASIZE-1:0] rxawsize;
input wire [`BW_AXI_ABURST-1:0] rxawburst;
input wire rxawvalid;
output wire rxawready;

input wire [BW_AXI_TID-1:0] rxwid;
input wire [BW_DATA-1:0] rxwdata;
input wire [`BW_AXI_WSTRB(BW_DATA)-1:0] rxwstrb;
input wire rxwlast;
input wire rxwvalid;
output wire rxwready;

output wire [BW_AXI_TID-1:0] rxbid;
output wire [`BW_AXI_BRESP-1:0] rxbresp;
output wire rxbvalid;
input wire rxbready;

input wire [BW_AXI_TID-1:0] rxarid;
input wire [BW_ADDR-1:0] rxaraddr;
input wire [`BW_AXI_ALEN-1:0] rxarlen;
input wire [`BW_AXI_ASIZE-1:0] rxarsize;
input wire [`BW_AXI_ABURST-1:0] rxarburst;
input wire rxarvalid;
output wire rxarready;

output wire [BW_AXI_TID-1:0] rxrid;
output wire [BW_DATA-1:0] rxrdata;
output wire [`BW_AXI_RRESP-1:0] rxrresp;
output reg rxrlast;
output reg rxrvalid;
input wire rxrready;

output wire [NUM_CELL-1:0] cell_select_list;
output wire [BW_CELL_INDEX*NUM_CELL-1:0] cell_index_list;
output wire [NUM_CELL-1:0] cell_enable_list;
output wire [NUM_CELL-1:0] cell_write_enable_list;
output wire [RVX_LPARA_5*NUM_CELL-1:0] cell_write_enable_byte_list;
output wire [BW_DATA*NUM_CELL-1:0] cell_write_enable_bit_list;
output wire [BW_DATA*NUM_CELL-1:0] cell_wdata_list;
output wire [NUM_CELL-1:0] cell_read_enable_list;
input wire [BW_DATA*NUM_CELL-1:0] cell_rdata_list;

integer i, j;
genvar k;

wire [BW_AXI_TID-1:0] rvx_signal_14;
wire [BW_ADDR-1:0] rvx_signal_38;
wire [`BW_AXI_ALEN-1:0] rvx_signal_34;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_19;
wire [`BW_AXI_ABURST-1:0] rvx_signal_11;
wire rvx_signal_31;
wire rvx_signal_35;

wire [BW_AXI_TID-1:0] rvx_signal_04;
wire [BW_ADDR-1:0] rvx_signal_29;
wire [`BW_AXI_ALEN-1:0] rvx_signal_13;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_33;
wire [`BW_AXI_ABURST-1:0] rvx_signal_20;
wire rvx_signal_39;
wire rvx_signal_17;

wire [RVX_LPARA_4-1:0] rvx_signal_18;
wire [`BW_AXI_ALEN-1:0] rvx_signal_43;
wire [`BW_AXI_ASIZE-1:0] rvx_signal_24;
wire [`BW_AXI_ABURST-1:0] rvx_signal_22;
wire rvx_signal_07;
reg rvx_signal_09;
wire [RVX_LPARA_4-1:0] rvx_signal_37;
wire rvx_signal_03;
wire rvx_signal_40;

`define RVX_LDEF_7 4
`define RVX_LDEF_3 0
`define RVX_LDEF_4 1
`define RVX_LDEF_0 2
`define RVX_LDEF_5 3
`define RVX_LDEF_6 4
`define RVX_LDEF_1 5
`define RVX_LDEF_8 6
`define RVX_LDEF_2 7

reg [`RVX_LDEF_7-1:0] rvx_signal_30;
reg [BW_AXI_TID-1:0] rvx_signal_01;

wire rvx_signal_42;
wire rvx_signal_05;
wire rvx_signal_32;

wire rvx_signal_27;
wire rvx_signal_41;
reg rvx_signal_21;
wire rvx_signal_10;
reg rvx_signal_23;

wire [RVX_LPARA_1-1:0] rvx_signal_00;

wire rvx_signal_08;
reg rvx_signal_02;
reg [BW_DATA-1:0] rvx_signal_36;

wire [(RVX_LPARA_0+RVX_LPARA_2)-1:0] rvx_signal_16;
wire rvx_signal_06;
wire [RVX_LPARA_5-1:0] rvx_signal_15;
reg [BW_DATA-1:0] rvx_signal_26;
wire [BW_DATA-1:0] rvx_signal_12;
wire rvx_signal_28;
wire [BW_DATA-1:0] rvx_signal_25;

ERVP_FIFO
#(
	.BW_DATA(`BW_AWCHANNEL(BW_AXI_TID,BW_ADDR)),
	.DEPTH(1)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(rxawready),
	.wrequest(rxawvalid),
	.wdata({rxawid,rxawaddr,rxawlen,rxawsize,rxawburst}),
	.wnum(),
	.rready(rvx_signal_39),
	.rrequest(rvx_signal_17),
	.rdata({rvx_signal_04,rvx_signal_29,rvx_signal_13,rvx_signal_33,rvx_signal_20}),
	.wfull(),
	.rempty(),
	.rnum()
);

assign {rvx_signal_31,rvx_signal_14,rvx_signal_38,rvx_signal_34,rvx_signal_19,rvx_signal_11} = {rxarvalid,rxarid,rxaraddr,rxarlen,rxarsize,rxarburst};
assign rxarready = rvx_signal_35;

RVX_MODULE_115
#(
	.RVX_GPARA_0(RVX_LPARA_4)
)
i_rvx_instance_1
(
	.rvx_port_06(clk),
	.rvx_port_00(rstnn),
	.rvx_port_02(rvx_signal_18),
	.rvx_port_10(rvx_signal_43),
	.rvx_port_11(rvx_signal_24),
	.rvx_port_08(rvx_signal_22),
	.rvx_port_04(rvx_signal_07),
	.rvx_port_05(rvx_signal_09),
	.rvx_port_01(rvx_signal_37),
	.rvx_port_03(rvx_signal_03),
	.rvx_port_07(),
	.rvx_port_09(rvx_signal_40)
);

assign rvx_signal_18 = ((rvx_signal_10==1)? rvx_signal_29 : rvx_signal_38) - BASE_ADDR;
assign rvx_signal_43 = (rvx_signal_10==1)? rvx_signal_13 : rvx_signal_34;
assign rvx_signal_24 = (rvx_signal_10==1)? rvx_signal_33 : rvx_signal_19;
assign rvx_signal_22 = (rvx_signal_10==1)? rvx_signal_20 : rvx_signal_11;

assign rvx_signal_07 = rvx_signal_21 | rvx_signal_10;
always@(*)
begin
	rvx_signal_09 = 0;
	case(rvx_signal_30)
		`RVX_LDEF_0:
			if(!rvx_signal_08)
				rvx_signal_09 = 1;
		`RVX_LDEF_5:
			if(rvx_signal_05)
				rvx_signal_09 = 1;
	endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_30 <= `RVX_LDEF_3;
	else
		case(rvx_signal_30)
			`RVX_LDEF_3:
				if(rvx_signal_21)
					rvx_signal_30 <= `RVX_LDEF_0;
				else if(rvx_signal_23)
					rvx_signal_30 <= `RVX_LDEF_4;
			`RVX_LDEF_0:
				if(rvx_signal_42 & rxrlast)
					rvx_signal_30 <= `RVX_LDEF_3;
			`RVX_LDEF_4:
				if(rvx_signal_10)
					rvx_signal_30 <= `RVX_LDEF_5;
			`RVX_LDEF_5:
				if(rvx_signal_27)
					rvx_signal_30 <= `RVX_LDEF_1;
				else if(rvx_signal_41)
					rvx_signal_30 <= `RVX_LDEF_2;
				else if(rvx_signal_05 & rvx_signal_40)
					rvx_signal_30 <= `RVX_LDEF_6;
			`RVX_LDEF_6:
				if(rvx_signal_32)
					rvx_signal_30 <= `RVX_LDEF_3;
		endcase
end

assign rvx_signal_42 = rxrvalid & rxrready;
assign rvx_signal_05 = rxwvalid & rxwready;
assign rvx_signal_32 = rxbvalid & rxbready;

assign rvx_signal_27 = (rvx_signal_30==`RVX_LDEF_5) & rvx_signal_05 & (rvx_signal_01!=rxwid);
assign rvx_signal_41 = (rvx_signal_30==`RVX_LDEF_5) & rvx_signal_05 & (rvx_signal_40!=rxwlast);

always@(*)
begin
	rvx_signal_21 = 0;
	rvx_signal_23 = 0;
	if(rvx_signal_30==`RVX_LDEF_3)
	begin
		if(rvx_signal_31)
			rvx_signal_21 = 1;
		else if(rvx_signal_39)
			rvx_signal_23 = 1;
	end
end
assign rvx_signal_10 = (rvx_signal_30==`RVX_LDEF_4);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_01 <= 0;
	else if(rvx_signal_21)
		rvx_signal_01 <= rvx_signal_14;
	else if(rvx_signal_10)
		rvx_signal_01 <= rvx_signal_04;
end

assign rvx_signal_35 = (rvx_signal_30==`RVX_LDEF_3);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		rxrvalid <= 0;
		rxrlast <= 0;
	end
	else if(rvx_signal_30==`RVX_LDEF_0)
	begin
		if(!rvx_signal_08)
		begin
			rxrvalid <= rvx_signal_03;
			rxrlast <= rvx_signal_40;
		end
	end
end
assign rvx_signal_08 = rxrvalid & (~rxrready);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_02 <= 0;
	else if(rvx_signal_30==`RVX_LDEF_0)
		rvx_signal_02 <= rvx_signal_08;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_36 <= 0;
	else if((~rvx_signal_02)&&rvx_signal_08)
		rvx_signal_36 <= rvx_signal_25;
end

assign rxrdata = (rvx_signal_02==1)? rvx_signal_36 : rvx_signal_25;
assign rxrid = rvx_signal_01;
assign rxrresp = `AXI_RESPONSE_OKAY;

assign rvx_signal_17 = (rvx_signal_30==`RVX_LDEF_4);

assign rxwready = (rvx_signal_30==`RVX_LDEF_5);

assign rxbvalid = (rvx_signal_30==`RVX_LDEF_6);
assign rxbresp = `AXI_RESPONSE_OKAY;
assign rxbid = rvx_signal_01;

assign rvx_signal_06 = (rvx_signal_30==`RVX_LDEF_5) & rxwvalid;
assign rvx_signal_15 = (rvx_signal_06==1)? rxwstrb : 0;
assign {rvx_signal_16,rvx_signal_00} = rvx_signal_37;
assign rvx_signal_12 = rxwdata;
assign rvx_signal_28 = (rvx_signal_30==`RVX_LDEF_0) & rvx_signal_03;

always@(*)
begin
	rvx_signal_26 = 0;
	if(rvx_signal_06)
	begin
		for(i=0; i<RVX_LPARA_5; i=i+1)
		begin
			for(j=0; j<`BW_BYTE; j=j+1)
			begin
				rvx_signal_26[(`BW_BYTE*i)+j] = rvx_signal_15[i];
			end
		end
	end
end

generate
for(k=0; k<NUM_CELL; k=k+1)
	begin : generate_each_cell
		assign cell_select_list[k] = (NUM_CELL<=1)? 1 : (rvx_signal_16[(RVX_LPARA_0+RVX_LPARA_2)-1-:RVX_LPARA_3]==k);
		assign cell_index_list[BW_CELL_INDEX*(k+1)-1 -:BW_CELL_INDEX] = rvx_signal_16[RVX_LPARA_2-1:0];
		assign cell_write_enable_list[k] = (cell_select_list[k]==1)? rvx_signal_06 : 0;
		assign cell_write_enable_byte_list[RVX_LPARA_5*(k+1)-1 -:RVX_LPARA_5] = (cell_select_list[k]==1)? rvx_signal_15 : 0;
		assign cell_write_enable_bit_list[BW_DATA*(k+1)-1 -:BW_DATA] = (cell_select_list[k]==1)? rvx_signal_26 : 0;
		assign cell_wdata_list[BW_DATA*(k+1)-1 -:BW_DATA] = rvx_signal_12;
		assign cell_read_enable_list[k] = (cell_select_list[k]==1)? rvx_signal_28 : 0;
		assign cell_enable_list[k] = cell_write_enable_list[k] | cell_read_enable_list[k];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(BW_DATA),
	.NUM_DATA(NUM_CELL)
)
i_rvx_instance_0
(
	.data_input_list(cell_rdata_list),
	.select(cell_select_list),
	.data_output(rvx_signal_25)
);

`undef RVX_LDEF_2
`undef RVX_LDEF_0
`undef RVX_LDEF_8
`undef RVX_LDEF_7
`undef RVX_LDEF_5
`undef RVX_LDEF_4
`undef RVX_LDEF_3
`undef RVX_LDEF_1
`undef RVX_LDEF_6
endmodule

