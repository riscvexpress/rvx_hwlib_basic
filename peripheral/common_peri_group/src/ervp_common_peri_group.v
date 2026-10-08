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
// 2026-10-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_13.vh"
`include "munoc_extended_config.vh"
`include "platform_info.vh"



module ERVP_COMMON_PERI_GROUP
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
  rptid,
  rpwstrb,
	
	lock_status_list,
  thread_status_list,
	real_clock,
	global_tag_list,
	system_tick_config,
	core_tick_config,
	sw_interrupt_list
);



parameter BW_ADDR = 1;
parameter BW_DATA = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_LOCK = 1;
parameter NUM_AUTO_ID = 1;
parameter NUM_GLOBAL_TAG = 1;
parameter BW_LOCK_STATUS = 16;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_08 = `RVX_GDEF_380;
localparam  RVX_LPARA_03 = `RVX_GDEF_571-1;
localparam  RVX_LPARA_05 = `RVX_GDEF_121;

localparam  RVX_LPARA_00 = 8;
localparam  RVX_LPARA_02 = 64;

localparam  RVX_LPARA_06 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_04 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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
input wire [`REQUIRED_BW_OF_SLAVE_TID-1:0] rptid;
input wire [`BW_AXI_WSTRB(BW_DATA)-1:0] rpwstrb;

output wire [NUM_LOCK*BW_LOCK_STATUS-1:0] lock_status_list;
output wire [32-1:0] thread_status_list;
input wire [RVX_LPARA_02-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;
output wire [32-1:0] sw_interrupt_list;

genvar i;

wire [RVX_LPARA_08*BW_ADDR-1:0] rvx_signal_05;
wire [RVX_LPARA_08-1:0] rvx_signal_48;
wire [RVX_LPARA_08-1:0] rvx_signal_42;
wire [RVX_LPARA_08*BW_DATA-1:0] rvx_signal_38;
wire [RVX_LPARA_08-1:0] rvx_signal_21;
wire [RVX_LPARA_08*BW_DATA-1:0] rvx_signal_09;
wire [RVX_LPARA_08*BW_DATA-1:0] rvx_signal_06;
wire [RVX_LPARA_08-1:0] rvx_signal_23;
wire [RVX_LPARA_08-1:0] rvx_signal_33;

wire [BW_ADDR-1:0] rvx_signal_14 [RVX_LPARA_08-1:0];
wire [RVX_LPARA_08-1:0] rvx_signal_29;
wire [RVX_LPARA_08-1:0] rvx_signal_40;
wire [BW_ADDR-1:0] rvx_signal_30 [RVX_LPARA_08-1:0];
wire [RVX_LPARA_08-1:0] rvx_signal_07;
wire [BW_DATA-1:0] rvx_signal_26 [RVX_LPARA_08-1:0];
wire [BW_DATA-1:0] rvx_signal_17 [RVX_LPARA_08-1:0];
wire [RVX_LPARA_08-1:0] rvx_signal_22;
wire [RVX_LPARA_08-1:0] rvx_signal_02;

wire [`BW_MASTER_NODE_ID-1:0] rvx_signal_37;

localparam  RVX_LPARA_07 = `BW_MASTER_NODE_ID;
localparam  RVX_LPARA_01 = 8;

wire [NUM_LOCK-1:0] rvx_signal_39;

reg [NUM_LOCK-1:0] rvx_signal_04;
reg [NUM_LOCK-1:0] rvx_signal_15;
wire [NUM_LOCK-1:0] rvx_signal_34;

reg [NUM_AUTO_ID-1:0] rvx_signal_20;
reg [NUM_AUTO_ID-1:0] rvx_signal_16;
wire [RVX_LPARA_00-1:0] rvx_signal_45 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_10;

wire [RVX_LPARA_00*NUM_AUTO_ID-1:0] rvx_signal_44;
wire [RVX_LPARA_00-1:0] rvx_signal_03;

wire rvx_signal_13;
wire [`RVX_GDEF_093-1:0] rvx_signal_08;
wire rvx_signal_01;
wire [`RVX_GDEF_093-1:0] rvx_signal_25;
wire [`RVX_GDEF_432-1:0] rvx_signal_31;
wire [`RVX_GDEF_515-1:0] rvx_signal_12;
wire rvx_signal_18;
wire [`RVX_GDEF_387-1:0] rvx_signal_32;
wire rvx_signal_41;
wire [`RVX_GDEF_387-1:0] rvx_signal_27;
wire rvx_signal_11;
wire [`RVX_GDEF_080-1:0] rvx_signal_24;
wire rvx_signal_28;
wire [`RVX_GDEF_080-1:0] rvx_signal_36;

reg [`NUM_CORE_PHYSICAL-1:0] rvx_signal_19;

reg rvx_signal_35;
wire rvx_signal_47;
reg [RVX_LPARA_02-1:0] rvx_signal_43;
wire [RVX_LPARA_02-1:0] rvx_signal_46;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_08),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_03),
	.BW_SEL_INDEX(RVX_LPARA_05)
)
i_rvx_instance_2
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
	.rpbaseaddr_list(rvx_signal_05),

	.spsel_list(rvx_signal_48),
	.spenable_list(rvx_signal_42),
	.spaddr_list(rvx_signal_38),
	.spwrite_list(rvx_signal_21),
	.spwdata_list(rvx_signal_09),
	.sprdata_list(rvx_signal_06),
	.spready_list(rvx_signal_23),
	.spslverr_list(rvx_signal_33)
);

generate
	for(i=0; i<RVX_LPARA_08; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_05[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_14[i];
		assign rvx_signal_29[i] = rvx_signal_48[i];
		assign rvx_signal_40[i] = rvx_signal_42[i];
		assign rvx_signal_30[i] = rvx_signal_38[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_07[i] = rvx_signal_21[i];
		assign rvx_signal_26[i] = rvx_signal_09[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_06[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_17[i];
		assign rvx_signal_23[i] = rvx_signal_22[i];
		assign rvx_signal_33[i] = rvx_signal_02[i];
	end
endgenerate

assign rvx_signal_14[`RVX_GDEF_442] = `RVX_GDEF_259;
assign rvx_signal_14[`RVX_GDEF_296] = `RVX_GDEF_110;
assign rvx_signal_14[`RVX_GDEF_657] = `RVX_GDEF_346;
assign rvx_signal_14[`RVX_GDEF_254] = `RVX_GDEF_409;
assign rvx_signal_14[`RVX_GDEF_441] = `RVX_GDEF_462;

assign rvx_signal_37 = rptid[`REQUIRED_BW_OF_SLAVE_TID-1-:`BW_MASTER_NODE_ID];

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_4
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_29[`RVX_GDEF_442]),
	.rpenable(rvx_signal_40[`RVX_GDEF_442]),
	.rpaddr(rvx_signal_30[`RVX_GDEF_442]),
	.rpwrite(rvx_signal_07[`RVX_GDEF_442]),
	.rpwdata(rvx_signal_26[`RVX_GDEF_442]),
	.rprdata(rvx_signal_17[`RVX_GDEF_442]),
	.rpready(rvx_signal_22[`RVX_GDEF_442]),
	.rpslverr(rvx_signal_02[`RVX_GDEF_442])
);

`else

assign rvx_signal_22[`RVX_GDEF_442] = 0;
assign rvx_signal_17[`RVX_GDEF_442] = -1;
assign rvx_signal_02[`RVX_GDEF_442] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_116
    #(
      .RVX_GPARA_0(RVX_LPARA_07),
      .RVX_GPARA_1(RVX_LPARA_01),
      .RVX_GPARA_2(BW_LOCK_STATUS)
    )
		i_rvx_instance_3
		(
			.rvx_port_4(clk),
			.rvx_port_1(rstnn),
      .rvx_port_3(rvx_signal_37),
			.rvx_port_5(rvx_signal_04[i]),
			.rvx_port_6(rvx_signal_15[i]),
			.rvx_port_2(rvx_signal_34[i]),
			.rvx_port_0(lock_status_list[BW_LOCK_STATUS*(i+1)-1 -:BW_LOCK_STATUS])
		);
	end
endgenerate

assign rvx_signal_39 = rvx_signal_30[`RVX_GDEF_296][`RVX_GDEF_540-1:`RVX_GDEF_613];

always@(*)
begin
	rvx_signal_04 = 0;
	rvx_signal_15 = 0;
	if(rvx_signal_29[`RVX_GDEF_296] && rvx_signal_40[`RVX_GDEF_296])
	begin
		if(rvx_signal_07[`RVX_GDEF_296])
			rvx_signal_15 = rvx_signal_39;
		else
			rvx_signal_04 = rvx_signal_39;
	end
end

assign rvx_signal_22[`RVX_GDEF_296] = 1;
assign rvx_signal_17[`RVX_GDEF_296] = rvx_signal_34 & rvx_signal_39;
assign rvx_signal_02[`RVX_GDEF_296] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_22[`RVX_GDEF_296] = 0;
assign rvx_signal_17[`RVX_GDEF_296] = -1;
assign rvx_signal_02[`RVX_GDEF_296] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_00),
			.CIRCULAR(0)
		)
		i_rvx_instance_1
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_20[i]),
			.count(rvx_signal_16[i]),
			.value(rvx_signal_45[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_10 = rvx_signal_30[`RVX_GDEF_657][`RVX_GDEF_155-1:`RVX_GDEF_137];

always@(*)
begin
	rvx_signal_20 = 0;
	rvx_signal_16 = 0;
	if(rvx_signal_29[`RVX_GDEF_657] && rvx_signal_40[`RVX_GDEF_657])
	begin
		if(rvx_signal_07[`RVX_GDEF_657])
			rvx_signal_20 = rvx_signal_10;
		else
			rvx_signal_16 = rvx_signal_10;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_44[(i+1)*RVX_LPARA_00-1-:RVX_LPARA_00] = rvx_signal_45[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_00),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_6
(
	.data_input_list(rvx_signal_44),
	.select(rvx_signal_10),
	.data_output(rvx_signal_03)
);

assign rvx_signal_22[`RVX_GDEF_657] = 1;
assign rvx_signal_17[`RVX_GDEF_657] = rvx_signal_03;
assign rvx_signal_02[`RVX_GDEF_657] = 0;

`else

assign rvx_signal_22[`RVX_GDEF_657] = 0;
assign rvx_signal_17[`RVX_GDEF_657] = -1;
assign rvx_signal_02[`RVX_GDEF_657] = 1;

`endif

RVX_MODULE_099
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_4(RVX_LPARA_06),
	.RVX_GPARA_3(RVX_LPARA_04)
)
i_rvx_instance_0
(
	.rvx_port_24(clk),
	.rvx_port_06(rstnn),

	.rvx_port_08(rvx_signal_29[`RVX_GDEF_254]),
	.rvx_port_21(rvx_signal_40[`RVX_GDEF_254]),
	.rvx_port_03(rvx_signal_30[`RVX_GDEF_254]),
	.rvx_port_22(rvx_signal_07[`RVX_GDEF_254]),
	.rvx_port_01(rvx_signal_26[`RVX_GDEF_254]),
	.rvx_port_18(rvx_signal_17[`RVX_GDEF_254]),
	.rvx_port_16(rvx_signal_22[`RVX_GDEF_254]),
	.rvx_port_13(rvx_signal_02[`RVX_GDEF_254]),

	.rvx_port_12(1'b 0),
	.rvx_port_17(rvx_signal_13),
	.rvx_port_14(rvx_signal_08),
	.rvx_port_10(rvx_signal_01),
	.rvx_port_04(rvx_signal_25),
	.rvx_port_23(rvx_signal_31),
	.rvx_port_20(rvx_signal_12),
  .rvx_port_15(rvx_signal_18),
	.rvx_port_07(rvx_signal_32),
	.rvx_port_11(rvx_signal_41),
	.rvx_port_02(rvx_signal_27),
	.rvx_port_19(rvx_signal_11),
	.rvx_port_00(rvx_signal_24),
	.rvx_port_05(rvx_signal_28),
	.rvx_port_09(rvx_signal_36)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_044
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_5
(
	.rvx_port_3(clk),
	.rvx_port_1(rstnn),

	.rvx_port_0(global_tag_list),
	.rvx_port_4(rvx_signal_01),
	.rvx_port_2(rvx_signal_25[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_08 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_08 = -1;

`endif

assign system_tick_config = rvx_signal_31;
assign core_tick_config = rvx_signal_12;

`ifdef INCLUDE_MULTICORE

reg [`RVX_GDEF_387-1:0] rvx_signal_00;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_00 <= 0;
  else if(rvx_signal_41)
    rvx_signal_00 <= rvx_signal_00 ^ rvx_signal_27;
end

assign rvx_signal_32 = rvx_signal_00;
assign thread_status_list = rvx_signal_00;

`else

assign thread_status_list = 0;

`endif

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_19 <= 0;
	else if(rvx_signal_28)
	begin
		if(rvx_signal_36[`RVX_GDEF_080-1]==`RVX_GDEF_205)
			rvx_signal_19 <= rvx_signal_19 | rvx_signal_36[`NUM_CORE_PHYSICAL-1:0];
		else
			rvx_signal_19 <= rvx_signal_19 & (~rvx_signal_36[`NUM_CORE_PHYSICAL-1:0]);
	end
end

assign rvx_signal_24 = rvx_signal_19;
assign sw_interrupt_list = rvx_signal_19;

localparam  RVX_LPARA_10 = 0;
localparam  RVX_LPARA_09 = 1;

assign rvx_signal_47 = rvx_signal_29[`RVX_GDEF_441] & rvx_signal_40[`RVX_GDEF_441];
assign rvx_signal_46 = (rvx_signal_35==RVX_LPARA_10)? real_clock : rvx_signal_43; 

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_35 <= RVX_LPARA_10;
	else if(rvx_signal_47)
		rvx_signal_35 <= ~rvx_signal_35;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_43 <= 0;
	else if((rvx_signal_35==RVX_LPARA_10) && rvx_signal_47)
		rvx_signal_43 <= real_clock;
end

assign rvx_signal_22[`RVX_GDEF_441] = 1;
assign rvx_signal_17[`RVX_GDEF_441] = rvx_signal_30[`RVX_GDEF_441][2]? rvx_signal_46[RVX_LPARA_02-1-:BW_DATA] : rvx_signal_46[BW_DATA-1-:BW_DATA];

assign rvx_signal_02[`RVX_GDEF_441] = rvx_signal_07[`RVX_GDEF_441];

endmodule
