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
`include "ervp_endian.vh"
`include "rvx_include_12.vh"
`include "rvx_include_09.vh"
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

localparam  RVX_LPARA_0 = `RVX_GDEF_604;
localparam  RVX_LPARA_2 = `RVX_GDEF_162-1;
localparam  RVX_LPARA_1 = `RVX_GDEF_575;
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

wire [RVX_LPARA_0*BW_ADDR-1:0] rvx_signal_21;
wire [RVX_LPARA_0-1:0] rvx_signal_15;
wire [RVX_LPARA_0-1:0] rvx_signal_30;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_23;
wire [RVX_LPARA_0-1:0] rvx_signal_04;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_03;
wire [RVX_LPARA_0*BW_DATA-1:0] rvx_signal_19;
wire [RVX_LPARA_0-1:0] rvx_signal_00;
wire [RVX_LPARA_0-1:0] rvx_signal_26;

wire [BW_ADDR-1:0] rvx_signal_13 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_27;
wire [RVX_LPARA_0-1:0] rvx_signal_25;
wire [BW_ADDR-1:0] rvx_signal_18 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_12;
wire [BW_DATA-1:0] rvx_signal_07 [RVX_LPARA_0-1:0];
wire [BW_DATA-1:0] rvx_signal_38 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_0-1:0] rvx_signal_35;
wire [RVX_LPARA_0-1:0] rvx_signal_24;

wire rvx_signal_34;

wire rvx_signal_01;
wire [`RVX_GDEF_456-1:0] rvx_signal_11;
wire rvx_signal_36;
wire [`RVX_GDEF_579-1:0] rvx_signal_22;
wire rvx_signal_10;
wire [`RVX_GDEF_405-1:0] rvx_signal_08;
wire rvx_signal_17;
wire rvx_signal_14;
wire [`RVX_GDEF_438-1:0] rvx_signal_06;

reg [31:0] rvx_signal_29; 

wire [NUM_LOCK*BW_LOCK_STATUS-1:0] rvx_signal_32;
wire [BW_LOCK_STATUS-1:0] rvx_signal_09;
wire [`BW_MASTER_NODE_ID+1-1:0] rvx_signal_05;
wire rvx_signal_02;
wire [NUM_LOCK-1:0] rvx_signal_33;

reg [NUM_GLOBAL_TAG-1:0] rvx_signal_16;
wire [NUM_GLOBAL_TAG-1:0] rvx_signal_31;
reg [NUM_GLOBAL_TAG-1:0] rvx_signal_20;
wire rvx_signal_28;

wire rvx_signal_37;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_0),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_2),
	.BW_SEL_INDEX(RVX_LPARA_1)
)
i_rvx_instance_3
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
	.rpbaseaddr_list(rvx_signal_21),

	.spsel_list(rvx_signal_15),
	.spenable_list(rvx_signal_30),
	.spaddr_list(rvx_signal_23),
	.spwrite_list(rvx_signal_04),
	.spwdata_list(rvx_signal_03),
	.sprdata_list(rvx_signal_19),
	.spready_list(rvx_signal_00),
	.spslverr_list(rvx_signal_26)
);

generate
	for(i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_21[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_13[i];
		assign rvx_signal_27[i] = rvx_signal_15[i];
		assign rvx_signal_25[i] = rvx_signal_30[i];
		assign rvx_signal_18[i] = rvx_signal_23[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_12[i] = rvx_signal_04[i];
		assign rvx_signal_07[i] = rvx_signal_03[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_19[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_38[i];
		assign rvx_signal_00[i] = rvx_signal_35[i];
		assign rvx_signal_26[i] = rvx_signal_24[i];
	end
endgenerate

assign rvx_signal_13[`RVX_GDEF_521] = `RVX_GDEF_531;
assign rvx_signal_13[`RVX_GDEF_372] = `RVX_GDEF_544;
assign rvx_signal_13[`RVX_GDEF_542] = `RVX_GDEF_275;
assign rvx_signal_13[`RVX_GDEF_274] = `RVX_GDEF_439;
assign rvx_signal_13[`RVX_GDEF_411] = `RVX_GDEF_144;
assign rvx_signal_13[`RVX_GDEF_082] = `RVX_GDEF_177;

always@(*)
begin
	rvx_signal_29 = 0;
	rvx_signal_29[`RVX_GDEF_289] = plic_interrupt;
	rvx_signal_29[`RVX_GDEF_543] = rvx_signal_34;
	rvx_signal_29[`RVX_GDEF_141] = sw_interrupt;
end

assign core_interrupt_vector = rvx_signal_29;

`ifdef INCLUDE_TIMER

ERVP_TIMER
#(
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.ENDIAN_TYPE(ENDIAN_TYPE)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_27[`RVX_GDEF_521]),
	.rpenable(rvx_signal_25[`RVX_GDEF_521]),
	.rpaddr(rvx_signal_18[`RVX_GDEF_521]),
	.rpwrite(rvx_signal_12[`RVX_GDEF_521]),
	.rpwdata(rvx_signal_07[`RVX_GDEF_521]),
	.rprdata(rvx_signal_38[`RVX_GDEF_521]),
	.rpready(rvx_signal_35[`RVX_GDEF_521]),
	.rpslverr(rvx_signal_24[`RVX_GDEF_521]),

	.tick_1us(tick_1us),
	.delay_notice(delay_notice),
	.timer_interrupt(rvx_signal_34)
);

`else

assign rvx_signal_34 = 0;
assign rvx_signal_35[`RVX_GDEF_521] = 0;
assign rvx_signal_38[`RVX_GDEF_521] = 0;
assign rvx_signal_24[`RVX_GDEF_521] = 1;

`endif

`ifdef INCLUDE_MULTICORE

RVX_MODULE_134
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_1(BW_DATA)
)
i_rvx_instance_5
(
	.rvx_port_15(clk),
	.rvx_port_08(rstnn),

	.rvx_port_01(rvx_signal_27[`RVX_GDEF_372]),
	.rvx_port_12(rvx_signal_25[`RVX_GDEF_372]),
	.rvx_port_06(rvx_signal_18[`RVX_GDEF_372]),
	.rvx_port_09(rvx_signal_12[`RVX_GDEF_372]),
	.rvx_port_03(rvx_signal_07[`RVX_GDEF_372]),
	.rvx_port_02(rvx_signal_38[`RVX_GDEF_372]),
	.rvx_port_07(rvx_signal_35[`RVX_GDEF_372]),
	.rvx_port_04(rvx_signal_24[`RVX_GDEF_372]),

	.rvx_port_10(1'b 0),
	.rvx_port_14(rvx_signal_01),
	.rvx_port_11(rvx_signal_11),
	.rvx_port_00(rvx_signal_36),
	.rvx_port_18(rvx_signal_22),
	.rvx_port_13(rvx_signal_10),
	.rvx_port_19(rvx_signal_08),
	.rvx_port_05(rvx_signal_17),
  .rvx_port_17(rvx_signal_14),
  .rvx_port_16(rvx_signal_06)
);

assign rvx_signal_11 = PROCESS_ID;
assign rvx_signal_06 = thread_status_list;

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
	.synch_value(rvx_signal_31)
);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_16 <= 0;
		rvx_signal_20 <= 0;
	end
	else if(rvx_signal_36)
	begin
		rvx_signal_16 <= rvx_signal_22;
		rvx_signal_20 <= rvx_signal_31;
	end
end

assign rvx_signal_28 = (((rvx_signal_31 ~^ rvx_signal_20) & rvx_signal_16)!=0);

assign rvx_signal_08 = rvx_signal_28;
assign rvx_signal_17 = allows_holds? (~(rvx_signal_10 & rvx_signal_28)) : 1;

`else

assign rvx_signal_35[`RVX_GDEF_372] = 0;
assign rvx_signal_38[`RVX_GDEF_372] = 0;
assign rvx_signal_24[`RVX_GDEF_372] = 1;

`endif

`ifdef INCLUDE_MULTICORE

ERVP_SYNCHRONIZER
#(
	.BW_DATA(NUM_LOCK*BW_LOCK_STATUS)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.asynch_value(lock_status_list),
	.synch_value(rvx_signal_32)
);

assign rvx_signal_33 = rvx_signal_18[`RVX_GDEF_542][`RVX_GDEF_160-1:`RVX_GDEF_153];

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(BW_LOCK_STATUS),
  .NUM_DATA(NUM_LOCK)
)
i_rvx_instance_1
(
	.data_input_list(rvx_signal_32),
	.select(rvx_signal_33),
	.data_output(rvx_signal_09)
);

assign {rvx_signal_05,rvx_signal_02} = rvx_signal_09;

assign rvx_signal_37 = rvx_signal_02 | (rvx_signal_05==PROCESS_ID);
assign rvx_signal_35[`RVX_GDEF_542] = allows_holds? rvx_signal_37 : 1;
assign rvx_signal_38[`RVX_GDEF_542] = rvx_signal_37;
assign rvx_signal_24[`RVX_GDEF_542] = 0;

`else

assign rvx_signal_35[`RVX_GDEF_542] = 0;
assign rvx_signal_38[`RVX_GDEF_542] = 0;
assign rvx_signal_24[`RVX_GDEF_542] = 1;

`endif

`ifdef INCLUDE_TCACHING

assign tcu_spsel = rvx_signal_27[`RVX_GDEF_274];
assign tcu_spenable = rvx_signal_25[`RVX_GDEF_274];
assign tcu_spaddr = rvx_signal_18[`RVX_GDEF_274];
assign tcu_spwrite = rvx_signal_12[`RVX_GDEF_274];
assign tcu_spwdata = rvx_signal_07[`RVX_GDEF_274];

`else

assign tcu_spsel = 0;
assign tcu_spenable = 0;
assign tcu_spaddr = 0;
assign tcu_spwrite = 0;
assign tcu_spwdata = 0;

`endif

assign rvx_signal_38[`RVX_GDEF_274] = tcu_sprdata;
assign rvx_signal_35[`RVX_GDEF_274] = tcu_spready;
assign rvx_signal_24[`RVX_GDEF_274] = tcu_spslverr;

`ifdef INCLUDE_FLORIAN

assign florian_spsel = rvx_signal_27[`RVX_GDEF_411];
assign florian_spenable = rvx_signal_25[`RVX_GDEF_411];
assign florian_spaddr = rvx_signal_18[`RVX_GDEF_411];
assign florian_spwrite = rvx_signal_12[`RVX_GDEF_411];
assign florian_spwdata = rvx_signal_07[`RVX_GDEF_411];

`else

assign florian_spsel = 0;
assign florian_spenable = 0;
assign florian_spaddr = 0;
assign florian_spwrite = 0;
assign florian_spwdata = 0;

`endif

assign rvx_signal_38[`RVX_GDEF_411] = florian_sprdata;
assign rvx_signal_35[`RVX_GDEF_411] = florian_spready;
assign rvx_signal_24[`RVX_GDEF_411] = florian_spslverr;

assign rvx_signal_35[`RVX_GDEF_082] = 0;
assign rvx_signal_38[`RVX_GDEF_082] = 0;
assign rvx_signal_24[`RVX_GDEF_082] = 0;

endmodule
