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
`include "ervp_axi_define.vh"
`include "rvx_include_20.vh"
`include "munoc_extended_config.vh"
`include "munoc_node_id.vh"
`include "munoc_process_id.vh"
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

localparam  RVX_LPARA_3 = `RVX_GDEF_363;
localparam  RVX_LPARA_7 = `RVX_GDEF_131-1;
localparam  RVX_LPARA_0 = `RVX_GDEF_118;

localparam  RVX_LPARA_8 = 8;
localparam  RVX_LPARA_5 = 64;

localparam  RVX_LPARA_6 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_4 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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
input wire [RVX_LPARA_5-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;
output wire [32-1:0] sw_interrupt_list;

genvar i;

wire [RVX_LPARA_3*BW_ADDR-1:0] rvx_signal_11;
wire [RVX_LPARA_3-1:0] rvx_signal_06;
wire [RVX_LPARA_3-1:0] rvx_signal_27;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_37;
wire [RVX_LPARA_3-1:0] rvx_signal_02;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_28;
wire [RVX_LPARA_3*BW_DATA-1:0] rvx_signal_07;
wire [RVX_LPARA_3-1:0] rvx_signal_43;
wire [RVX_LPARA_3-1:0] rvx_signal_45;

wire [BW_ADDR-1:0] rvx_signal_36 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_16;
wire [RVX_LPARA_3-1:0] rvx_signal_44;
wire [BW_ADDR-1:0] rvx_signal_00 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_22;
wire [BW_DATA-1:0] rvx_signal_04 [RVX_LPARA_3-1:0];
wire [BW_DATA-1:0] rvx_signal_15 [RVX_LPARA_3-1:0];
wire [RVX_LPARA_3-1:0] rvx_signal_18;
wire [RVX_LPARA_3-1:0] rvx_signal_38;

wire [`BW_MASTER_NODE_ID-1:0] rvx_signal_09;

localparam  RVX_LPARA_1 = `BW_MASTER_NODE_ID + 1;
localparam  RVX_LPARA_2 = 8;

wire [NUM_LOCK-1:0] rvx_signal_24;

reg [NUM_LOCK-1:0] rvx_signal_10;
reg [NUM_LOCK-1:0] rvx_signal_35;
wire [NUM_LOCK-1:0] rvx_signal_39;

reg [NUM_AUTO_ID-1:0] rvx_signal_33;
reg [NUM_AUTO_ID-1:0] rvx_signal_05;
wire [RVX_LPARA_8-1:0] rvx_signal_26 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_13;

wire [RVX_LPARA_8*NUM_AUTO_ID-1:0] rvx_signal_46;
wire [RVX_LPARA_8-1:0] rvx_signal_25;

wire rvx_signal_08;
wire [`RVX_GDEF_004-1:0] rvx_signal_01;
wire rvx_signal_03;
wire [`RVX_GDEF_004-1:0] rvx_signal_19;
wire [`RVX_GDEF_577-1:0] rvx_signal_30;
wire [`RVX_GDEF_471-1:0] rvx_signal_32;
wire rvx_signal_20;
wire [`RVX_GDEF_434-1:0] rvx_signal_31;
wire rvx_signal_17;
wire [`RVX_GDEF_434-1:0] rvx_signal_42;
wire rvx_signal_29;
wire [`RVX_GDEF_209-1:0] rvx_signal_40;
wire rvx_signal_34;
wire [`RVX_GDEF_209-1:0] rvx_signal_12;

reg [`NUM_CORE_PHYSICAL-1:0] rvx_signal_14;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_3),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_7),
	.BW_SEL_INDEX(RVX_LPARA_0)
)
i_rvx_instance_1
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
	.rpbaseaddr_list(rvx_signal_11),

	.spsel_list(rvx_signal_06),
	.spenable_list(rvx_signal_27),
	.spaddr_list(rvx_signal_37),
	.spwrite_list(rvx_signal_02),
	.spwdata_list(rvx_signal_28),
	.sprdata_list(rvx_signal_07),
	.spready_list(rvx_signal_43),
	.spslverr_list(rvx_signal_45)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_11[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_36[i];
		assign rvx_signal_16[i] = rvx_signal_06[i];
		assign rvx_signal_44[i] = rvx_signal_27[i];
		assign rvx_signal_00[i] = rvx_signal_37[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_22[i] = rvx_signal_02[i];
		assign rvx_signal_04[i] = rvx_signal_28[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_07[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_15[i];
		assign rvx_signal_43[i] = rvx_signal_18[i];
		assign rvx_signal_45[i] = rvx_signal_38[i];
	end
endgenerate

assign rvx_signal_36[`RVX_GDEF_295] = `RVX_GDEF_591;
assign rvx_signal_36[`RVX_GDEF_057] = `RVX_GDEF_106;
assign rvx_signal_36[`RVX_GDEF_373] = `RVX_GDEF_161;
assign rvx_signal_36[`RVX_GDEF_624] = `RVX_GDEF_068;
assign rvx_signal_36[`RVX_GDEF_287] = `RVX_GDEF_344;

assign rvx_signal_09 = rptid[`REQUIRED_BW_OF_SLAVE_TID-1-:`BW_MASTER_NODE_ID];

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_16[`RVX_GDEF_295]),
	.rpenable(rvx_signal_44[`RVX_GDEF_295]),
	.rpaddr(rvx_signal_00[`RVX_GDEF_295]),
	.rpwrite(rvx_signal_22[`RVX_GDEF_295]),
	.rpwdata(rvx_signal_04[`RVX_GDEF_295]),
	.rprdata(rvx_signal_15[`RVX_GDEF_295]),
	.rpready(rvx_signal_18[`RVX_GDEF_295]),
	.rpslverr(rvx_signal_38[`RVX_GDEF_295])
);

`else

assign rvx_signal_18[`RVX_GDEF_295] = 0;
assign rvx_signal_15[`RVX_GDEF_295] = -1;
assign rvx_signal_38[`RVX_GDEF_295] = 1;

`endif

`ifdef INCLUDE_MULTICORE

wire [`BW_MASTER_NODE_ID-1:0] rvx_signal_41;
wire [RVX_LPARA_1-1:0] rvx_signal_21;

assign rvx_signal_41 = rvx_signal_09;
`include "munoc_gen_process_id.vh"
assign rvx_signal_21 = valid_access? process_id_temp : {RVX_LPARA_1{1'b 1}};

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_057
    #(
      .RVX_GPARA_2(RVX_LPARA_1),
      .RVX_GPARA_0(RVX_LPARA_2),
      .RVX_GPARA_1(BW_LOCK_STATUS)
    )
		i_rvx_instance_6
		(
			.rvx_port_2(clk),
			.rvx_port_5(rstnn),
      .rvx_port_1(rvx_signal_21),
			.rvx_port_6(rvx_signal_10[i]),
			.rvx_port_4(rvx_signal_35[i]),
			.rvx_port_3(rvx_signal_39[i]),
			.rvx_port_0(lock_status_list[BW_LOCK_STATUS*(i+1)-1 -:BW_LOCK_STATUS])
		);
	end
endgenerate

assign rvx_signal_24 = rvx_signal_00[`RVX_GDEF_057][`RVX_GDEF_584-1:`RVX_GDEF_415];

always@(*)
begin
	rvx_signal_10 = 0;
	rvx_signal_35 = 0;
	if(rvx_signal_16[`RVX_GDEF_057] && rvx_signal_44[`RVX_GDEF_057])
	begin
		if(rvx_signal_22[`RVX_GDEF_057])
			rvx_signal_35 = rvx_signal_24;
		else
			rvx_signal_10 = rvx_signal_24;
	end
end

assign rvx_signal_18[`RVX_GDEF_057] = 1;
assign rvx_signal_15[`RVX_GDEF_057] = rvx_signal_39 & rvx_signal_24;
assign rvx_signal_38[`RVX_GDEF_057] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_18[`RVX_GDEF_057] = 0;
assign rvx_signal_15[`RVX_GDEF_057] = -1;
assign rvx_signal_38[`RVX_GDEF_057] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_8),
			.CIRCULAR(0)
		)
		i_rvx_instance_4
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_33[i]),
			.count(rvx_signal_05[i]),
			.value(rvx_signal_26[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_13 = rvx_signal_00[`RVX_GDEF_373][`RVX_GDEF_324-1:`RVX_GDEF_298];

always@(*)
begin
	rvx_signal_33 = 0;
	rvx_signal_05 = 0;
	if(rvx_signal_16[`RVX_GDEF_373] && rvx_signal_44[`RVX_GDEF_373])
	begin
		if(rvx_signal_22[`RVX_GDEF_373])
			rvx_signal_33 = rvx_signal_13;
		else
			rvx_signal_05 = rvx_signal_13;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_46[(i+1)*RVX_LPARA_8-1-:RVX_LPARA_8] = rvx_signal_26[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_8),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_2
(
	.data_input_list(rvx_signal_46),
	.select(rvx_signal_13),
	.data_output(rvx_signal_25)
);

assign rvx_signal_18[`RVX_GDEF_373] = 1;
assign rvx_signal_15[`RVX_GDEF_373] = rvx_signal_25;
assign rvx_signal_38[`RVX_GDEF_373] = 0;

`else

assign rvx_signal_18[`RVX_GDEF_373] = 0;
assign rvx_signal_15[`RVX_GDEF_373] = -1;
assign rvx_signal_38[`RVX_GDEF_373] = 1;

`endif

RVX_MODULE_036
#(
	.RVX_GPARA_3(BW_ADDR),
	.RVX_GPARA_2(BW_DATA),
	.RVX_GPARA_1(RVX_LPARA_6),
	.RVX_GPARA_4(RVX_LPARA_4)
)
i_rvx_instance_5
(
	.rvx_port_06(clk),
	.rvx_port_15(rstnn),

	.rvx_port_14(rvx_signal_16[`RVX_GDEF_624]),
	.rvx_port_08(rvx_signal_44[`RVX_GDEF_624]),
	.rvx_port_18(rvx_signal_00[`RVX_GDEF_624]),
	.rvx_port_16(rvx_signal_22[`RVX_GDEF_624]),
	.rvx_port_13(rvx_signal_04[`RVX_GDEF_624]),
	.rvx_port_23(rvx_signal_15[`RVX_GDEF_624]),
	.rvx_port_02(rvx_signal_18[`RVX_GDEF_624]),
	.rvx_port_03(rvx_signal_38[`RVX_GDEF_624]),

	.rvx_port_21(1'b 0),
	.rvx_port_24(rvx_signal_08),
	.rvx_port_10(rvx_signal_01),
	.rvx_port_07(rvx_signal_03),
	.rvx_port_11(rvx_signal_19),
	.rvx_port_04(rvx_signal_30),
	.rvx_port_20(rvx_signal_32),
  .rvx_port_05(rvx_signal_20),
	.rvx_port_09(rvx_signal_31),
	.rvx_port_00(rvx_signal_17),
	.rvx_port_22(rvx_signal_42),
	.rvx_port_12(rvx_signal_29),
	.rvx_port_19(rvx_signal_40),
	.rvx_port_17(rvx_signal_34),
	.rvx_port_01(rvx_signal_12)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_125
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_3
(
	.rvx_port_4(clk),
	.rvx_port_0(rstnn),

	.rvx_port_2(global_tag_list),
	.rvx_port_3(rvx_signal_03),
	.rvx_port_1(rvx_signal_19[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_01 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_01 = -1;

`endif

assign system_tick_config = rvx_signal_30;
assign core_tick_config = rvx_signal_32;

`ifdef INCLUDE_MULTICORE

reg [`RVX_GDEF_434-1:0] rvx_signal_23;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_23 <= 0;
  else if(rvx_signal_17)
    rvx_signal_23 <= rvx_signal_23 ^ rvx_signal_42;
end

assign rvx_signal_31 = rvx_signal_23;
assign thread_status_list = rvx_signal_23;

`else

assign thread_status_list = 0;

`endif

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_14 <= 0;
	else if(rvx_signal_34)
	begin
		if(rvx_signal_12[`RVX_GDEF_209-1]==`RVX_GDEF_219)
			rvx_signal_14 <= rvx_signal_14 | rvx_signal_12[`NUM_CORE_PHYSICAL-1:0];
		else
			rvx_signal_14 <= rvx_signal_14 & (~rvx_signal_12[`NUM_CORE_PHYSICAL-1:0]);
	end
end

assign rvx_signal_40 = rvx_signal_14;
assign sw_interrupt_list = rvx_signal_14;

assign rvx_signal_18[`RVX_GDEF_287] = 1;
assign rvx_signal_15[`RVX_GDEF_287] = rvx_signal_00[`RVX_GDEF_287][2]? real_clock[RVX_LPARA_5-1-:BW_DATA] : real_clock[BW_DATA-1-:BW_DATA];

assign rvx_signal_38[`RVX_GDEF_287] = rvx_signal_22[`RVX_GDEF_287];

endmodule
