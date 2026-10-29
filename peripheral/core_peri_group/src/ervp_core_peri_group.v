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
`include "rvx_include_23.vh"
`include "rvx_include_05.vh"
`include "munoc_extended_config.vh"
`include "platform_info.vh"



module ERVP_CORE_PERI_GROUP
(
	clk,
	rstnn,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	allows_holds,
	
	tick_1us,
	delay_notice,
	plic_interrupt,
	sw_interrupt,
	core_interrupt_vector,

	lock_status_list,
	global_tag_list,
  thread_status_list,

	tcu_spsel,
	tcu_spenable,
	tcu_spaddr,
	tcu_spwrite,
	tcu_spwdata,
	tcu_sprdata,
	tcu_spready,
	tcu_spslverr,

  florian_spsel,
	florian_spenable,
	florian_spaddr,
	florian_spwrite,
	florian_spwdata,
	florian_sprdata,
	florian_spready,
	florian_spslverr
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter PROCESS_ID = -1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 8;
parameter NUM_GLOBAL_TAG = 8;
parameter BW_LOCK_STATUS = 16;

localparam  RVX_LPARA_2 = `RVX_GDEF_425;
localparam  RVX_LPARA_0 = `RVX_GDEF_165-1;
localparam  RVX_LPARA_1 = `RVX_GDEF_568;
localparam  RVX_LPARA_3 = `MAX(0, PROCESS_ID);

input wire clk;
input wire rstnn;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

input wire allows_holds;

input wire tick_1us;
output wire delay_notice;
input wire plic_interrupt;
input wire sw_interrupt;
output wire [31:0] core_interrupt_vector;

input wire [NUM_LOCK*BW_LOCK_STATUS-1:0] lock_status_list;
input wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
input wire [32-1:0] thread_status_list;

output wire tcu_spsel;
output wire tcu_spenable;
output wire [BW_ADDR-1:0] tcu_spaddr;
output wire tcu_spwrite;
output wire [BW_DATA-1:0] tcu_spwdata;
input wire [BW_DATA-1:0] tcu_sprdata;
input wire tcu_spready;
input wire tcu_spslverr;

output wire florian_spsel;
output wire florian_spenable;
output wire [BW_ADDR-1:0] florian_spaddr;
output wire florian_spwrite;
output wire [BW_DATA-1:0] florian_spwdata;
input wire [BW_DATA-1:0] florian_sprdata;
input wire florian_spready;
input wire florian_spslverr;

genvar i;

wire [RVX_LPARA_2*BW_ADDR-1:0] rvx_signal_37;
wire [RVX_LPARA_2-1:0] rvx_signal_15;
wire [RVX_LPARA_2-1:0] rvx_signal_07;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_16;
wire [RVX_LPARA_2-1:0] rvx_signal_34;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_17;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_22;
wire [RVX_LPARA_2-1:0] rvx_signal_29;
wire [RVX_LPARA_2-1:0] rvx_signal_08;

wire [BW_ADDR-1:0] rvx_signal_01 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_19;
wire [RVX_LPARA_2-1:0] rvx_signal_25;
wire [BW_ADDR-1:0] rvx_signal_38 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_27;
wire [BW_DATA-1:0] rvx_signal_06 [RVX_LPARA_2-1:0];
wire [BW_DATA-1:0] rvx_signal_00 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_18;
wire [RVX_LPARA_2-1:0] rvx_signal_12;

wire rvx_signal_05;

wire rvx_signal_04;
wire [`RVX_GDEF_505-1:0] rvx_signal_02;
wire rvx_signal_10;
wire [`RVX_GDEF_239-1:0] rvx_signal_28;
wire rvx_signal_33;
wire [`RVX_GDEF_130-1:0] rvx_signal_20;
wire rvx_signal_26;
wire rvx_signal_30;
wire [`RVX_GDEF_275-1:0] rvx_signal_03;

reg [31:0] rvx_signal_13; 

wire [NUM_LOCK*BW_LOCK_STATUS-1:0] rvx_signal_14;
wire [BW_LOCK_STATUS-1:0] rvx_signal_24;
wire [`BW_MASTER_NODE_ID+1-1:0] rvx_signal_35;
wire rvx_signal_09;
wire [NUM_LOCK-1:0] rvx_signal_36;

reg [NUM_GLOBAL_TAG-1:0] rvx_signal_32;
wire [NUM_GLOBAL_TAG-1:0] rvx_signal_23;
reg [NUM_GLOBAL_TAG-1:0] rvx_signal_31;
wire rvx_signal_11;

wire rvx_signal_21;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_2),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_0),
	.BW_SEL_INDEX(RVX_LPARA_1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rpsel),
	.rpenable(rpenable),
	.rpaddr(rpaddr),
	.rpwrite(rpwrite),
	.rpwdata(rpwdata),
	.rprdata(rprdata),
	.rpready(rpready),
	.rpslverr(rpslverr),
	.rpbaseaddr_list(rvx_signal_37),

	.spsel_list(rvx_signal_15),
	.spenable_list(rvx_signal_07),
	.spaddr_list(rvx_signal_16),
	.spwrite_list(rvx_signal_34),
	.spwdata_list(rvx_signal_17),
	.sprdata_list(rvx_signal_22),
	.spready_list(rvx_signal_29),
	.spslverr_list(rvx_signal_08)
);

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_37[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_01[i];
		assign rvx_signal_19[i] = rvx_signal_15[i];
		assign rvx_signal_25[i] = rvx_signal_07[i];
		assign rvx_signal_38[i] = rvx_signal_16[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_27[i] = rvx_signal_34[i];
		assign rvx_signal_06[i] = rvx_signal_17[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_22[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_00[i];
		assign rvx_signal_29[i] = rvx_signal_18[i];
		assign rvx_signal_08[i] = rvx_signal_12[i];
	end
endgenerate

assign rvx_signal_01[`RVX_GDEF_476] = `RVX_GDEF_189;
assign rvx_signal_01[`RVX_GDEF_466] = `RVX_GDEF_202;
assign rvx_signal_01[`RVX_GDEF_200] = `RVX_GDEF_013;
assign rvx_signal_01[`RVX_GDEF_156] = `RVX_GDEF_359;
assign rvx_signal_01[`RVX_GDEF_528] = `RVX_GDEF_600;
assign rvx_signal_01[`RVX_GDEF_121] = `RVX_GDEF_008;

always@(*)
begin
	rvx_signal_13 = 0;
	rvx_signal_13[`RVX_GDEF_510] = plic_interrupt;
	rvx_signal_13[`RVX_GDEF_535] = rvx_signal_05;
	rvx_signal_13[`RVX_GDEF_436] = sw_interrupt;
end

assign core_interrupt_vector = rvx_signal_13;

`ifdef INCLUDE_TIMER

ERVP_TIMER
#(
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.ENDIAN_TYPE(ENDIAN_TYPE)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_19[`RVX_GDEF_476]),
	.rpenable(rvx_signal_25[`RVX_GDEF_476]),
	.rpaddr(rvx_signal_38[`RVX_GDEF_476]),
	.rpwrite(rvx_signal_27[`RVX_GDEF_476]),
	.rpwdata(rvx_signal_06[`RVX_GDEF_476]),
	.rprdata(rvx_signal_00[`RVX_GDEF_476]),
	.rpready(rvx_signal_18[`RVX_GDEF_476]),
	.rpslverr(rvx_signal_12[`RVX_GDEF_476]),

	.tick_1us(tick_1us),
	.delay_notice(delay_notice),
	.timer_interrupt(rvx_signal_05)
);

`else

assign rvx_signal_05 = 0;
assign rvx_signal_18[`RVX_GDEF_476] = 0;
assign rvx_signal_00[`RVX_GDEF_476] = 0;
assign rvx_signal_12[`RVX_GDEF_476] = 1;

`endif

`ifdef INCLUDE_MULTICORE

RVX_MODULE_092
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_0(BW_DATA)
)
i_rvx_instance_2
(
	.rvx_port_01(clk),
	.rvx_port_10(rstnn),

	.rvx_port_07(rvx_signal_19[`RVX_GDEF_466]),
	.rvx_port_05(rvx_signal_25[`RVX_GDEF_466]),
	.rvx_port_17(rvx_signal_38[`RVX_GDEF_466]),
	.rvx_port_04(rvx_signal_27[`RVX_GDEF_466]),
	.rvx_port_13(rvx_signal_06[`RVX_GDEF_466]),
	.rvx_port_18(rvx_signal_00[`RVX_GDEF_466]),
	.rvx_port_06(rvx_signal_18[`RVX_GDEF_466]),
	.rvx_port_19(rvx_signal_12[`RVX_GDEF_466]),

	.rvx_port_08(1'b 0),
	.rvx_port_12(rvx_signal_04),
	.rvx_port_02(rvx_signal_02),
	.rvx_port_16(rvx_signal_10),
	.rvx_port_14(rvx_signal_28),
	.rvx_port_00(rvx_signal_33),
	.rvx_port_03(rvx_signal_20),
	.rvx_port_11(rvx_signal_26),
  .rvx_port_15(rvx_signal_30),
  .rvx_port_09(rvx_signal_03)
);

assign rvx_signal_02 = PROCESS_ID;
assign rvx_signal_03 = thread_status_list;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_GLOBAL_TAG)
)
i_rvx_instance_4
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(global_tag_list),
	.synch_value(rvx_signal_23)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_32 <= 0;
		rvx_signal_31 <= 0;
	end
	else if(rvx_signal_10)
	begin
		rvx_signal_32 <= rvx_signal_28;
		rvx_signal_31 <= rvx_signal_23;
	end
end

assign rvx_signal_11 = (((rvx_signal_23 ~^ rvx_signal_31) & rvx_signal_32)!=0);

assign rvx_signal_20 = rvx_signal_11;
assign rvx_signal_26 = allows_holds? (~(rvx_signal_33 & rvx_signal_11)) : 1;

`else

assign rvx_signal_18[`RVX_GDEF_466] = 0;
assign rvx_signal_00[`RVX_GDEF_466] = 0;
assign rvx_signal_12[`RVX_GDEF_466] = 1;

`endif

`ifdef INCLUDE_MULTICORE

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_LOCK*BW_LOCK_STATUS)
)
i_rvx_instance_5
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(lock_status_list),
	.synch_value(rvx_signal_14)
);

assign rvx_signal_36 = rvx_signal_38[`RVX_GDEF_200][`RVX_GDEF_120-1:`RVX_GDEF_610];

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_LOCK_STATUS),
  .NUM_DATA(NUM_LOCK)
)
i_rvx_instance_3
(
	.data_input_list(rvx_signal_14),
	.select(rvx_signal_36),
	.data_output(rvx_signal_24)
);

assign {rvx_signal_35,rvx_signal_09} = rvx_signal_24;

assign rvx_signal_21 = rvx_signal_09 | (rvx_signal_35==PROCESS_ID);
assign rvx_signal_18[`RVX_GDEF_200] = allows_holds? rvx_signal_21 : 1;
assign rvx_signal_00[`RVX_GDEF_200] = rvx_signal_21;
assign rvx_signal_12[`RVX_GDEF_200] = 0;

`else

assign rvx_signal_18[`RVX_GDEF_200] = 0;
assign rvx_signal_00[`RVX_GDEF_200] = 0;
assign rvx_signal_12[`RVX_GDEF_200] = 1;

`endif

`ifdef INCLUDE_TCACHING

assign tcu_spsel = rvx_signal_19[`RVX_GDEF_156];
assign tcu_spenable = rvx_signal_25[`RVX_GDEF_156];
assign tcu_spaddr = rvx_signal_38[`RVX_GDEF_156];
assign tcu_spwrite = rvx_signal_27[`RVX_GDEF_156];
assign tcu_spwdata = rvx_signal_06[`RVX_GDEF_156];

`else

assign tcu_spsel = 0;
assign tcu_spenable = 0;
assign tcu_spaddr = 0;
assign tcu_spwrite = 0;
assign tcu_spwdata = 0;

`endif

assign rvx_signal_00[`RVX_GDEF_156] = tcu_sprdata;
assign rvx_signal_18[`RVX_GDEF_156] = tcu_spready;
assign rvx_signal_12[`RVX_GDEF_156] = tcu_spslverr;

`ifdef INCLUDE_FLORIAN

assign florian_spsel = rvx_signal_19[`RVX_GDEF_528];
assign florian_spenable = rvx_signal_25[`RVX_GDEF_528];
assign florian_spaddr = rvx_signal_38[`RVX_GDEF_528];
assign florian_spwrite = rvx_signal_27[`RVX_GDEF_528];
assign florian_spwdata = rvx_signal_06[`RVX_GDEF_528];

`else

assign florian_spsel = 0;
assign florian_spenable = 0;
assign florian_spaddr = 0;
assign florian_spwrite = 0;
assign florian_spwdata = 0;

`endif

assign rvx_signal_00[`RVX_GDEF_528] = florian_sprdata;
assign rvx_signal_18[`RVX_GDEF_528] = florian_spready;
assign rvx_signal_12[`RVX_GDEF_528] = florian_spslverr;

assign rvx_signal_18[`RVX_GDEF_121] = 0;
assign rvx_signal_00[`RVX_GDEF_121] = 0;
assign rvx_signal_12[`RVX_GDEF_121] = 0;

endmodule
