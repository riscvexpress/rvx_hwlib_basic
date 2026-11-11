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
`include "ervp_axi_define.vh"
`include "rvx_include_07.vh"
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

localparam  RVX_LPARA_7 = `RVX_GDEF_045;
localparam  RVX_LPARA_1 = `RVX_GDEF_209-1;
localparam  RVX_LPARA_3 = `RVX_GDEF_376;

localparam  RVX_LPARA_6 = 8;
localparam  RVX_LPARA_8 = 64;

localparam  RVX_LPARA_0 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_2 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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
input wire [RVX_LPARA_8-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;
output wire [32-1:0] sw_interrupt_list;

genvar i;

wire [RVX_LPARA_7*BW_ADDR-1:0] rvx_signal_45;
wire [RVX_LPARA_7-1:0] rvx_signal_26;
wire [RVX_LPARA_7-1:0] rvx_signal_22;
wire [RVX_LPARA_7*BW_DATA-1:0] rvx_signal_02;
wire [RVX_LPARA_7-1:0] rvx_signal_14;
wire [RVX_LPARA_7*BW_DATA-1:0] rvx_signal_21;
wire [RVX_LPARA_7*BW_DATA-1:0] rvx_signal_42;
wire [RVX_LPARA_7-1:0] rvx_signal_13;
wire [RVX_LPARA_7-1:0] rvx_signal_31;

wire [BW_ADDR-1:0] rvx_signal_04 [RVX_LPARA_7-1:0];
wire [RVX_LPARA_7-1:0] rvx_signal_40;
wire [RVX_LPARA_7-1:0] rvx_signal_05;
wire [BW_ADDR-1:0] rvx_signal_27 [RVX_LPARA_7-1:0];
wire [RVX_LPARA_7-1:0] rvx_signal_03;
wire [BW_DATA-1:0] rvx_signal_33 [RVX_LPARA_7-1:0];
wire [BW_DATA-1:0] rvx_signal_25 [RVX_LPARA_7-1:0];
wire [RVX_LPARA_7-1:0] rvx_signal_38;
wire [RVX_LPARA_7-1:0] rvx_signal_28;

wire [`BW_MASTER_NODE_ID-1:0] rvx_signal_06;

localparam  RVX_LPARA_4 = `BW_MASTER_NODE_ID + 1;
localparam  RVX_LPARA_5 = 8;

wire [NUM_LOCK-1:0] rvx_signal_00;

reg [NUM_LOCK-1:0] rvx_signal_32;
reg [NUM_LOCK-1:0] rvx_signal_39;
wire [NUM_LOCK-1:0] rvx_signal_43;

reg [NUM_AUTO_ID-1:0] rvx_signal_15;
reg [NUM_AUTO_ID-1:0] rvx_signal_41;
wire [RVX_LPARA_6-1:0] rvx_signal_01 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_20;

wire [RVX_LPARA_6*NUM_AUTO_ID-1:0] rvx_signal_37;
wire [RVX_LPARA_6-1:0] rvx_signal_12;

wire rvx_signal_35;
wire [`RVX_GDEF_386-1:0] rvx_signal_18;
wire rvx_signal_16;
wire [`RVX_GDEF_386-1:0] rvx_signal_07;
wire [`RVX_GDEF_249-1:0] rvx_signal_36;
wire [`RVX_GDEF_027-1:0] rvx_signal_24;
wire rvx_signal_30;
wire [`RVX_GDEF_566-1:0] rvx_signal_44;
wire rvx_signal_08;
wire [`RVX_GDEF_566-1:0] rvx_signal_17;
wire rvx_signal_11;
wire [`RVX_GDEF_546-1:0] rvx_signal_09;
wire rvx_signal_10;
wire [`RVX_GDEF_546-1:0] rvx_signal_19;

reg [`NUM_CORE_PHYSICAL-1:0] rvx_signal_34;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_7),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_1),
	.BW_SEL_INDEX(RVX_LPARA_3)
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
	.rpbaseaddr_list(rvx_signal_45),

	.spsel_list(rvx_signal_26),
	.spenable_list(rvx_signal_22),
	.spaddr_list(rvx_signal_02),
	.spwrite_list(rvx_signal_14),
	.spwdata_list(rvx_signal_21),
	.sprdata_list(rvx_signal_42),
	.spready_list(rvx_signal_13),
	.spslverr_list(rvx_signal_31)
);

generate
	for(i=0; i<RVX_LPARA_7; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_45[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_04[i];
		assign rvx_signal_40[i] = rvx_signal_26[i];
		assign rvx_signal_05[i] = rvx_signal_22[i];
		assign rvx_signal_27[i] = rvx_signal_02[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_03[i] = rvx_signal_14[i];
		assign rvx_signal_33[i] = rvx_signal_21[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_42[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_25[i];
		assign rvx_signal_13[i] = rvx_signal_38[i];
		assign rvx_signal_31[i] = rvx_signal_28[i];
	end
endgenerate

assign rvx_signal_04[`RVX_GDEF_266] = `RVX_GDEF_228;
assign rvx_signal_04[`RVX_GDEF_223] = `RVX_GDEF_079;
assign rvx_signal_04[`RVX_GDEF_317] = `RVX_GDEF_378;
assign rvx_signal_04[`RVX_GDEF_284] = `RVX_GDEF_342;
assign rvx_signal_04[`RVX_GDEF_432] = `RVX_GDEF_591;

assign rvx_signal_06 = rptid[`REQUIRED_BW_OF_SLAVE_TID-1-:`BW_MASTER_NODE_ID];

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_40[`RVX_GDEF_266]),
	.rpenable(rvx_signal_05[`RVX_GDEF_266]),
	.rpaddr(rvx_signal_27[`RVX_GDEF_266]),
	.rpwrite(rvx_signal_03[`RVX_GDEF_266]),
	.rpwdata(rvx_signal_33[`RVX_GDEF_266]),
	.rprdata(rvx_signal_25[`RVX_GDEF_266]),
	.rpready(rvx_signal_38[`RVX_GDEF_266]),
	.rpslverr(rvx_signal_28[`RVX_GDEF_266])
);

`else

assign rvx_signal_38[`RVX_GDEF_266] = 0;
assign rvx_signal_25[`RVX_GDEF_266] = -1;
assign rvx_signal_28[`RVX_GDEF_266] = 1;

`endif

`ifdef INCLUDE_MULTICORE

wire [`BW_MASTER_NODE_ID-1:0] master_nodeid;
wire [RVX_LPARA_4-1:0] rvx_signal_29;

assign master_nodeid = rvx_signal_06;
`include "munoc_gen_process_id.vh"
assign rvx_signal_29 = valid_access? process_id_temp : {RVX_LPARA_4{1'b 1}};

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_000
    #(
      .RVX_GPARA_2(RVX_LPARA_4),
      .RVX_GPARA_0(RVX_LPARA_5),
      .RVX_GPARA_1(BW_LOCK_STATUS)
    )
		i_rvx_instance_6
		(
			.rvx_port_4(clk),
			.rvx_port_6(rstnn),
      .rvx_port_3(rvx_signal_29),
			.rvx_port_0(rvx_signal_32[i]),
			.rvx_port_1(rvx_signal_39[i]),
			.rvx_port_2(rvx_signal_43[i]),
			.rvx_port_5(lock_status_list[BW_LOCK_STATUS*(i+1)-1 -:BW_LOCK_STATUS])
		);
	end
endgenerate

assign rvx_signal_00 = rvx_signal_27[`RVX_GDEF_223][`RVX_GDEF_513-1:`RVX_GDEF_111];

always@(*)
begin
	rvx_signal_32 = 0;
	rvx_signal_39 = 0;
	if(rvx_signal_40[`RVX_GDEF_223] && rvx_signal_05[`RVX_GDEF_223])
	begin
		if(rvx_signal_03[`RVX_GDEF_223])
			rvx_signal_39 = rvx_signal_00;
		else
			rvx_signal_32 = rvx_signal_00;
	end
end

assign rvx_signal_38[`RVX_GDEF_223] = 1;
assign rvx_signal_25[`RVX_GDEF_223] = rvx_signal_43 & rvx_signal_00;
assign rvx_signal_28[`RVX_GDEF_223] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_38[`RVX_GDEF_223] = 0;
assign rvx_signal_25[`RVX_GDEF_223] = -1;
assign rvx_signal_28[`RVX_GDEF_223] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_6),
			.CIRCULAR(0)
		)
		i_rvx_instance_1
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_15[i]),
			.count(rvx_signal_41[i]),
			.value(rvx_signal_01[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_20 = rvx_signal_27[`RVX_GDEF_317][`RVX_GDEF_121-1:`RVX_GDEF_308];

always@(*)
begin
	rvx_signal_15 = 0;
	rvx_signal_41 = 0;
	if(rvx_signal_40[`RVX_GDEF_317] && rvx_signal_05[`RVX_GDEF_317])
	begin
		if(rvx_signal_03[`RVX_GDEF_317])
			rvx_signal_15 = rvx_signal_20;
		else
			rvx_signal_41 = rvx_signal_20;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_37[(i+1)*RVX_LPARA_6-1-:RVX_LPARA_6] = rvx_signal_01[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_6),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_4
(
	.data_input_list(rvx_signal_37),
	.select(rvx_signal_20),
	.data_output(rvx_signal_12)
);

assign rvx_signal_38[`RVX_GDEF_317] = 1;
assign rvx_signal_25[`RVX_GDEF_317] = rvx_signal_12;
assign rvx_signal_28[`RVX_GDEF_317] = 0;

`else

assign rvx_signal_38[`RVX_GDEF_317] = 0;
assign rvx_signal_25[`RVX_GDEF_317] = -1;
assign rvx_signal_28[`RVX_GDEF_317] = 1;

`endif

RVX_MODULE_052
#(
	.RVX_GPARA_2(BW_ADDR),
	.RVX_GPARA_3(BW_DATA),
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_LPARA_2)
)
i_rvx_instance_3
(
	.rvx_port_23(clk),
	.rvx_port_22(rstnn),

	.rvx_port_03(rvx_signal_40[`RVX_GDEF_284]),
	.rvx_port_06(rvx_signal_05[`RVX_GDEF_284]),
	.rvx_port_12(rvx_signal_27[`RVX_GDEF_284]),
	.rvx_port_15(rvx_signal_03[`RVX_GDEF_284]),
	.rvx_port_13(rvx_signal_33[`RVX_GDEF_284]),
	.rvx_port_18(rvx_signal_25[`RVX_GDEF_284]),
	.rvx_port_10(rvx_signal_38[`RVX_GDEF_284]),
	.rvx_port_14(rvx_signal_28[`RVX_GDEF_284]),

	.rvx_port_19(1'b 0),
	.rvx_port_04(rvx_signal_35),
	.rvx_port_01(rvx_signal_18),
	.rvx_port_02(rvx_signal_16),
	.rvx_port_24(rvx_signal_07),
	.rvx_port_05(rvx_signal_36),
	.rvx_port_07(rvx_signal_24),
  .rvx_port_00(rvx_signal_30),
	.rvx_port_17(rvx_signal_44),
	.rvx_port_21(rvx_signal_08),
	.rvx_port_08(rvx_signal_17),
	.rvx_port_20(rvx_signal_11),
	.rvx_port_11(rvx_signal_09),
	.rvx_port_16(rvx_signal_10),
	.rvx_port_09(rvx_signal_19)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_089
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_5
(
	.rvx_port_1(clk),
	.rvx_port_3(rstnn),

	.rvx_port_4(global_tag_list),
	.rvx_port_2(rvx_signal_16),
	.rvx_port_0(rvx_signal_07[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_18 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_18 = -1;

`endif

assign system_tick_config = rvx_signal_36;
assign core_tick_config = rvx_signal_24;

`ifdef INCLUDE_MULTICORE

reg [`RVX_GDEF_566-1:0] rvx_signal_23;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_23 <= 0;
  else if(rvx_signal_08)
    rvx_signal_23 <= rvx_signal_23 ^ rvx_signal_17;
end

assign rvx_signal_44 = rvx_signal_23;
assign thread_status_list = rvx_signal_23;

`else

assign thread_status_list = 0;

`endif

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_34 <= 0;
	else if(rvx_signal_10)
	begin
		if(rvx_signal_19[`RVX_GDEF_546-1]==`RVX_GDEF_050)
			rvx_signal_34 <= rvx_signal_34 | rvx_signal_19[`NUM_CORE_PHYSICAL-1:0];
		else
			rvx_signal_34 <= rvx_signal_34 & (~rvx_signal_19[`NUM_CORE_PHYSICAL-1:0]);
	end
end

assign rvx_signal_09 = rvx_signal_34;
assign sw_interrupt_list = rvx_signal_34;

assign rvx_signal_38[`RVX_GDEF_432] = 1;
assign rvx_signal_25[`RVX_GDEF_432] = rvx_signal_27[`RVX_GDEF_432][2]? real_clock[RVX_LPARA_8-1-:BW_DATA] : real_clock[BW_DATA-1-:BW_DATA];

assign rvx_signal_28[`RVX_GDEF_432] = rvx_signal_03[`RVX_GDEF_432];

endmodule
