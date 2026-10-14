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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_01.vh"
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

localparam  RVX_LPARA_00 = `RVX_GDEF_614;
localparam  RVX_LPARA_03 = `RVX_GDEF_230-1;
localparam  RVX_LPARA_01 = `RVX_GDEF_195;

localparam  RVX_LPARA_10 = 8;
localparam  RVX_LPARA_08 = 64;

localparam  RVX_LPARA_07 = (`DIVIDERU(`SYSTEM_CLK_HZ, `TICK_HZ)<<1) + 1;
localparam  RVX_LPARA_09 = (`DIVIDERU(`CORE_CLK_HZ, `TICK_HZ)<<1) + 1;

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
input wire [RVX_LPARA_08-1:0] real_clock;
output wire [NUM_GLOBAL_TAG-1:0] global_tag_list;
output wire [11-1:0] system_tick_config;
output wire [11-1:0] core_tick_config;
output wire [32-1:0] sw_interrupt_list;

genvar i;

wire [RVX_LPARA_00*BW_ADDR-1:0] rvx_signal_46;
wire [RVX_LPARA_00-1:0] rvx_signal_20;
wire [RVX_LPARA_00-1:0] rvx_signal_07;
wire [RVX_LPARA_00*BW_DATA-1:0] rvx_signal_08;
wire [RVX_LPARA_00-1:0] rvx_signal_04;
wire [RVX_LPARA_00*BW_DATA-1:0] rvx_signal_47;
wire [RVX_LPARA_00*BW_DATA-1:0] rvx_signal_21;
wire [RVX_LPARA_00-1:0] rvx_signal_00;
wire [RVX_LPARA_00-1:0] rvx_signal_45;

wire [BW_ADDR-1:0] rvx_signal_05 [RVX_LPARA_00-1:0];
wire [RVX_LPARA_00-1:0] rvx_signal_37;
wire [RVX_LPARA_00-1:0] rvx_signal_18;
wire [BW_ADDR-1:0] rvx_signal_34 [RVX_LPARA_00-1:0];
wire [RVX_LPARA_00-1:0] rvx_signal_17;
wire [BW_DATA-1:0] rvx_signal_33 [RVX_LPARA_00-1:0];
wire [BW_DATA-1:0] rvx_signal_30 [RVX_LPARA_00-1:0];
wire [RVX_LPARA_00-1:0] rvx_signal_15;
wire [RVX_LPARA_00-1:0] rvx_signal_29;

wire [`BW_MASTER_NODE_ID-1:0] rvx_signal_12;

localparam  RVX_LPARA_02 = `BW_MASTER_NODE_ID;
localparam  RVX_LPARA_04 = 8;

wire [NUM_LOCK-1:0] rvx_signal_40;

reg [NUM_LOCK-1:0] rvx_signal_02;
reg [NUM_LOCK-1:0] rvx_signal_48;
wire [NUM_LOCK-1:0] rvx_signal_32;

reg [NUM_AUTO_ID-1:0] rvx_signal_03;
reg [NUM_AUTO_ID-1:0] rvx_signal_28;
wire [RVX_LPARA_10-1:0] rvx_signal_14 [NUM_AUTO_ID-1:0];
wire [NUM_AUTO_ID-1:0] rvx_signal_19;

wire [RVX_LPARA_10*NUM_AUTO_ID-1:0] rvx_signal_36;
wire [RVX_LPARA_10-1:0] rvx_signal_38;

wire rvx_signal_13;
wire [`RVX_GDEF_187-1:0] rvx_signal_22;
wire rvx_signal_23;
wire [`RVX_GDEF_187-1:0] rvx_signal_01;
wire [`RVX_GDEF_524-1:0] rvx_signal_44;
wire [`RVX_GDEF_576-1:0] rvx_signal_35;
wire rvx_signal_39;
wire [`RVX_GDEF_482-1:0] rvx_signal_24;
wire rvx_signal_31;
wire [`RVX_GDEF_482-1:0] rvx_signal_06;
wire rvx_signal_42;
wire [`RVX_GDEF_336-1:0] rvx_signal_27;
wire rvx_signal_26;
wire [`RVX_GDEF_336-1:0] rvx_signal_16;

reg [`NUM_CORE_PHYSICAL-1:0] rvx_signal_25;

reg rvx_signal_43;
wire rvx_signal_41;
reg [RVX_LPARA_08-1:0] rvx_signal_10;
wire [RVX_LPARA_08-1:0] rvx_signal_11;

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_00),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(RVX_LPARA_03),
	.BW_SEL_INDEX(RVX_LPARA_01)
)
i_rvx_instance_5
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
	.rpbaseaddr_list(rvx_signal_46),

	.spsel_list(rvx_signal_20),
	.spenable_list(rvx_signal_07),
	.spaddr_list(rvx_signal_08),
	.spwrite_list(rvx_signal_04),
	.spwdata_list(rvx_signal_47),
	.sprdata_list(rvx_signal_21),
	.spready_list(rvx_signal_00),
	.spslverr_list(rvx_signal_45)
);

generate
	for(i=0; i<RVX_LPARA_00; i=i+1)
	begin : i_split_and_merge_submodule
		assign rvx_signal_46[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_05[i];
		assign rvx_signal_37[i] = rvx_signal_20[i];
		assign rvx_signal_18[i] = rvx_signal_07[i];
		assign rvx_signal_34[i] = rvx_signal_08[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_17[i] = rvx_signal_04[i];
		assign rvx_signal_33[i] = rvx_signal_47[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_21[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_30[i];
		assign rvx_signal_00[i] = rvx_signal_15[i];
		assign rvx_signal_45[i] = rvx_signal_29[i];
	end
endgenerate

assign rvx_signal_05[`RVX_GDEF_467] = `RVX_GDEF_606;
assign rvx_signal_05[`RVX_GDEF_552] = `RVX_GDEF_291;
assign rvx_signal_05[`RVX_GDEF_626] = `RVX_GDEF_293;
assign rvx_signal_05[`RVX_GDEF_619] = `RVX_GDEF_033;
assign rvx_signal_05[`RVX_GDEF_488] = `RVX_GDEF_237;

assign rvx_signal_12 = rptid[`REQUIRED_BW_OF_SLAVE_TID-1-:`BW_MASTER_NODE_ID];

`ifdef INCLUDE_IROM

ERVP_IROM_APB
#(
	.BW_ADDR(BW_ADDR)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_37[`RVX_GDEF_467]),
	.rpenable(rvx_signal_18[`RVX_GDEF_467]),
	.rpaddr(rvx_signal_34[`RVX_GDEF_467]),
	.rpwrite(rvx_signal_17[`RVX_GDEF_467]),
	.rpwdata(rvx_signal_33[`RVX_GDEF_467]),
	.rprdata(rvx_signal_30[`RVX_GDEF_467]),
	.rpready(rvx_signal_15[`RVX_GDEF_467]),
	.rpslverr(rvx_signal_29[`RVX_GDEF_467])
);

`else

assign rvx_signal_15[`RVX_GDEF_467] = 0;
assign rvx_signal_30[`RVX_GDEF_467] = -1;
assign rvx_signal_29[`RVX_GDEF_467] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_LOCK; i=i+1)
	begin : i_generate_lock
		RVX_MODULE_037
    #(
      .RVX_GPARA_1(RVX_LPARA_02),
      .RVX_GPARA_0(RVX_LPARA_04),
      .RVX_GPARA_2(BW_LOCK_STATUS)
    )
		i_rvx_instance_2
		(
			.rvx_port_2(clk),
			.rvx_port_6(rstnn),
      .rvx_port_5(rvx_signal_12),
			.rvx_port_1(rvx_signal_02[i]),
			.rvx_port_3(rvx_signal_48[i]),
			.rvx_port_0(rvx_signal_32[i]),
			.rvx_port_4(lock_status_list[BW_LOCK_STATUS*(i+1)-1 -:BW_LOCK_STATUS])
		);
	end
endgenerate

assign rvx_signal_40 = rvx_signal_34[`RVX_GDEF_552][`RVX_GDEF_075-1:`RVX_GDEF_287];

always@(*)
begin
	rvx_signal_02 = 0;
	rvx_signal_48 = 0;
	if(rvx_signal_37[`RVX_GDEF_552] && rvx_signal_18[`RVX_GDEF_552])
	begin
		if(rvx_signal_17[`RVX_GDEF_552])
			rvx_signal_48 = rvx_signal_40;
		else
			rvx_signal_02 = rvx_signal_40;
	end
end

assign rvx_signal_15[`RVX_GDEF_552] = 1;
assign rvx_signal_30[`RVX_GDEF_552] = rvx_signal_32 & rvx_signal_40;
assign rvx_signal_29[`RVX_GDEF_552] = 0;

`else

assign lock_status_list = 0;
assign rvx_signal_15[`RVX_GDEF_552] = 0;
assign rvx_signal_30[`RVX_GDEF_552] = -1;
assign rvx_signal_29[`RVX_GDEF_552] = 1;

`endif

`ifdef INCLUDE_MULTICORE

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_generate_auto_id
		ERVP_COUNTER
		#(
			.BW_COUNTER(RVX_LPARA_10),
			.CIRCULAR(0)
		)
		i_rvx_instance_3
		(
			.clk(clk),
			.rstnn(rstnn),
			.enable(1'b 1),
			.init(rvx_signal_03[i]),
			.count(rvx_signal_28[i]),
			.value(rvx_signal_14[i]),
			.is_first_count(),
			.is_last_count()
		);
	end
endgenerate

assign rvx_signal_19 = rvx_signal_34[`RVX_GDEF_626][`RVX_GDEF_278-1:`RVX_GDEF_452];

always@(*)
begin
	rvx_signal_03 = 0;
	rvx_signal_28 = 0;
	if(rvx_signal_37[`RVX_GDEF_626] && rvx_signal_18[`RVX_GDEF_626])
	begin
		if(rvx_signal_17[`RVX_GDEF_626])
			rvx_signal_03 = rvx_signal_19;
		else
			rvx_signal_28 = rvx_signal_19;
	end
end

generate
	for(i=0; i<NUM_AUTO_ID; i=i+1)
	begin : i_concat_auto_id
		assign rvx_signal_36[(i+1)*RVX_LPARA_10-1-:RVX_LPARA_10] = rvx_signal_14[i];
	end
endgenerate

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
	.BW_DATA(RVX_LPARA_10),
	.NUM_DATA(NUM_AUTO_ID),
	.ACTIVE_HIGH(1)
)
i_rvx_instance_4
(
	.data_input_list(rvx_signal_36),
	.select(rvx_signal_19),
	.data_output(rvx_signal_38)
);

assign rvx_signal_15[`RVX_GDEF_626] = 1;
assign rvx_signal_30[`RVX_GDEF_626] = rvx_signal_38;
assign rvx_signal_29[`RVX_GDEF_626] = 0;

`else

assign rvx_signal_15[`RVX_GDEF_626] = 0;
assign rvx_signal_30[`RVX_GDEF_626] = -1;
assign rvx_signal_29[`RVX_GDEF_626] = 1;

`endif

RVX_MODULE_134
#(
	.RVX_GPARA_4(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_2(RVX_LPARA_07),
	.RVX_GPARA_3(RVX_LPARA_09)
)
i_rvx_instance_1
(
	.rvx_port_01(clk),
	.rvx_port_24(rstnn),

	.rvx_port_15(rvx_signal_37[`RVX_GDEF_619]),
	.rvx_port_20(rvx_signal_18[`RVX_GDEF_619]),
	.rvx_port_02(rvx_signal_34[`RVX_GDEF_619]),
	.rvx_port_10(rvx_signal_17[`RVX_GDEF_619]),
	.rvx_port_16(rvx_signal_33[`RVX_GDEF_619]),
	.rvx_port_04(rvx_signal_30[`RVX_GDEF_619]),
	.rvx_port_21(rvx_signal_15[`RVX_GDEF_619]),
	.rvx_port_23(rvx_signal_29[`RVX_GDEF_619]),

	.rvx_port_00(1'b 0),
	.rvx_port_18(rvx_signal_13),
	.rvx_port_14(rvx_signal_22),
	.rvx_port_07(rvx_signal_23),
	.rvx_port_19(rvx_signal_01),
	.rvx_port_13(rvx_signal_44),
	.rvx_port_09(rvx_signal_35),
  .rvx_port_12(rvx_signal_39),
	.rvx_port_08(rvx_signal_24),
	.rvx_port_22(rvx_signal_31),
	.rvx_port_17(rvx_signal_06),
	.rvx_port_11(rvx_signal_42),
	.rvx_port_05(rvx_signal_27),
	.rvx_port_06(rvx_signal_26),
	.rvx_port_03(rvx_signal_16)
);

`ifdef INCLUDE_MULTICORE

RVX_MODULE_111
#(
	.RVX_GPARA_0(NUM_GLOBAL_TAG)
)
i_rvx_instance_6
(
	.rvx_port_3(clk),
	.rvx_port_1(rstnn),

	.rvx_port_0(global_tag_list),
	.rvx_port_2(rvx_signal_23),
	.rvx_port_4(rvx_signal_01[NUM_GLOBAL_TAG-1:0])
);

assign rvx_signal_22 = global_tag_list;

`else

assign global_tag_list = 0;
assign rvx_signal_22 = -1;

`endif

assign system_tick_config = rvx_signal_44;
assign core_tick_config = rvx_signal_35;

`ifdef INCLUDE_MULTICORE

reg [`RVX_GDEF_482-1:0] rvx_signal_09;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_09 <= 0;
  else if(rvx_signal_31)
    rvx_signal_09 <= rvx_signal_09 ^ rvx_signal_06;
end

assign rvx_signal_24 = rvx_signal_09;
assign thread_status_list = rvx_signal_09;

`else

assign thread_status_list = 0;

`endif

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_25 <= 0;
	else if(rvx_signal_26)
	begin
		if(rvx_signal_16[`RVX_GDEF_336-1]==`RVX_GDEF_411)
			rvx_signal_25 <= rvx_signal_25 | rvx_signal_16[`NUM_CORE_PHYSICAL-1:0];
		else
			rvx_signal_25 <= rvx_signal_25 & (~rvx_signal_16[`NUM_CORE_PHYSICAL-1:0]);
	end
end

assign rvx_signal_27 = rvx_signal_25;
assign sw_interrupt_list = rvx_signal_25;

localparam  RVX_LPARA_05 = 0;
localparam  RVX_LPARA_06 = 1;

assign rvx_signal_41 = rvx_signal_37[`RVX_GDEF_488] & rvx_signal_18[`RVX_GDEF_488];
assign rvx_signal_11 = (rvx_signal_43==RVX_LPARA_05)? real_clock : rvx_signal_10; 

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_43 <= RVX_LPARA_05;
	else if(rvx_signal_41)
		rvx_signal_43 <= ~rvx_signal_43;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_10 <= 0;
	else if((rvx_signal_43==RVX_LPARA_05) && rvx_signal_41)
		rvx_signal_10 <= real_clock;
end

assign rvx_signal_15[`RVX_GDEF_488] = 1;
assign rvx_signal_30[`RVX_GDEF_488] = rvx_signal_34[`RVX_GDEF_488][2]? rvx_signal_11[RVX_LPARA_08-1-:BW_DATA] : rvx_signal_11[BW_DATA-1-:BW_DATA];

assign rvx_signal_29[`RVX_GDEF_488] = rvx_signal_17[`RVX_GDEF_488];

endmodule
