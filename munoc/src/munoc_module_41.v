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
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"





module MUNOC_MODULE_41
(
	munoc_port_1,
	munoc_port_6,
	munoc_port_2,
	munoc_port_0,	
	munoc_port_4,
	munoc_port_5,
	munoc_port_3
);





parameter MUNOC_GPARA_2 = `NOT_SELECTED; 
parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_1 = 8;
parameter MUNOC_GPARA_3 = 1;

localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_2==`FORWARD_NETWORK)? `BW_FNI_LINK(MUNOC_GPARA_1) : `BW_BNI_LINK(MUNOC_GPARA_1);
localparam  MUNOC_LPARA_1 = (MUNOC_GPARA_2==`FORWARD_NETWORK)? `BW_SLAVE_NODE_ID : `BW_MASTER_NODE_ID;

input wire munoc_port_1, munoc_port_6;
output reg munoc_port_2;
input wire [MUNOC_LPARA_0-1:0] munoc_port_0;
input wire munoc_port_4;
output wire [MUNOC_LPARA_0-1:0] munoc_port_5;
output wire [MUNOC_GPARA_3-1:0] munoc_port_3;

wire munoc_signal_0;
wire munoc_signal_7;
wire [MUNOC_LPARA_1-1:0] munoc_signal_4;

wire munoc_signal_3;

reg munoc_signal_1;
reg [MUNOC_LPARA_1-1:0] munoc_signal_5;
wire [MUNOC_GPARA_3-1:0] munoc_signal_2;

wire munoc_signal_6;

assign munoc_signal_0 = munoc_port_0[MUNOC_LPARA_0-1-`MUNOC_GDEF_48(MUNOC_GPARA_2)];
assign munoc_signal_7 = munoc_port_0[MUNOC_LPARA_0-1-`MUNOC_GDEF_24(MUNOC_GPARA_2)];
assign munoc_signal_4 = munoc_port_0[MUNOC_LPARA_0-1-`MUNOC_GDEF_73(MUNOC_GPARA_2)-:MUNOC_LPARA_1];
assign munoc_signal_3 = munoc_port_5[MUNOC_LPARA_0-1-`MUNOC_GDEF_48(MUNOC_GPARA_2)];

RVX_MODULE_019
#(
	.RVX_GPARA_1(MUNOC_LPARA_0-1)
)
i_munoc_instance_0
(
	.rvx_port_2(munoc_port_1),
	.rvx_port_4(munoc_port_6),
	.rvx_port_0(munoc_port_0[MUNOC_LPARA_0-2:0]),
	.rvx_port_3(munoc_port_5[MUNOC_LPARA_0-1]),
	.rvx_port_1(munoc_port_5[MUNOC_LPARA_0-2:0]),
	.rvx_port_6(munoc_signal_6),
	.rvx_port_5(munoc_port_4)
);

always@(posedge munoc_port_1, negedge munoc_port_6)
begin
	if(munoc_port_6==0)
		munoc_signal_1 <= 1;
	else if(munoc_signal_6)
	begin
		if(munoc_signal_7)
			munoc_signal_1 <= 1;
		else
			munoc_signal_1 <= 0;
	end
end

always@(posedge munoc_port_1, negedge munoc_port_6)
begin
	if(munoc_port_6==0)
		munoc_signal_5 <= 0;
	else if(munoc_signal_6 && munoc_signal_1)
		munoc_signal_5 <= munoc_signal_4;
end

assign munoc_signal_6 = munoc_signal_0 & munoc_port_2;

always@(*)
begin
	munoc_port_2 = 0;
	if(!munoc_signal_3)
		munoc_port_2 = 1;
	else if(munoc_port_4)
			munoc_port_2 = 1;
end

MUNOC_ROUTING_TABLE
#(
	.BW_NODE_ID(MUNOC_LPARA_1),
	.NUM_OUTPUT(MUNOC_GPARA_3),
	.NETWORK_TYPE(MUNOC_GPARA_2),
	.ROUTER_ID(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.target_node(munoc_signal_5),
	.routing_info(munoc_signal_2)
);

assign munoc_port_3 = (munoc_signal_3)? munoc_signal_2 : 0;

endmodule

