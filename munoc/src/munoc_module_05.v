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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_01.vh"
`include "munoc_extended_config.vh"
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"





module MUNOC_MODULE_05
(
	munoc_port_1,
	munoc_port_3,
	munoc_port_6,
	munoc_port_5,	
	munoc_port_4,
	munoc_port_0,
	munoc_port_2
);





parameter MUNOC_GPARA_1 = `NOT_SELECTED; 
parameter MUNOC_GPARA_0 = -1;
parameter MUNOC_GPARA_3 = 8;
parameter MUNOC_GPARA_2 = 1;

localparam  MUNOC_LPARA_1 = (MUNOC_GPARA_1==`FORWARD_NETWORK)? `BW_FNI_LINK(MUNOC_GPARA_3) : `BW_BNI_LINK(MUNOC_GPARA_3);
localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_1==`FORWARD_NETWORK)? `BW_SLAVE_NODE_ID : `BW_MASTER_NODE_ID;

input wire munoc_port_1, munoc_port_3;
output reg munoc_port_6;
input wire [MUNOC_LPARA_1-1:0] munoc_port_5;
input wire munoc_port_4;
output wire [MUNOC_LPARA_1-1:0] munoc_port_0;
output wire [MUNOC_GPARA_2-1:0] munoc_port_2;

wire munoc_signal_7;
wire munoc_signal_3;
wire [MUNOC_LPARA_0-1:0] munoc_signal_2;

wire munoc_signal_1;

reg munoc_signal_6;
reg [MUNOC_LPARA_0-1:0] munoc_signal_5;
wire [MUNOC_GPARA_2-1:0] munoc_signal_4;

wire munoc_signal_0;

assign munoc_signal_7 = munoc_port_5[MUNOC_LPARA_1-1-`MUNOC_GDEF_56(MUNOC_GPARA_1)];
assign munoc_signal_3 = munoc_port_5[MUNOC_LPARA_1-1-`MUNOC_GDEF_85(MUNOC_GPARA_1)];
assign munoc_signal_2 = munoc_port_5[MUNOC_LPARA_1-1-`MUNOC_GDEF_50(MUNOC_GPARA_1)-:MUNOC_LPARA_0];
assign munoc_signal_1 = munoc_port_0[MUNOC_LPARA_1-1-`MUNOC_GDEF_56(MUNOC_GPARA_1)];

RVX_MODULE_012
#(
	.RVX_GPARA_0(MUNOC_LPARA_1-1)
)
i_munoc_instance_0
(
	.rvx_port_2(munoc_port_1),
	.rvx_port_1(munoc_port_3),
	.rvx_port_4(munoc_port_5[MUNOC_LPARA_1-2:0]),
	.rvx_port_6(munoc_port_0[MUNOC_LPARA_1-1]),
	.rvx_port_0(munoc_port_0[MUNOC_LPARA_1-2:0]),
	.rvx_port_3(munoc_signal_0),
	.rvx_port_5(munoc_port_4)
);

always@(posedge munoc_port_1, negedge munoc_port_3)
begin
	if(munoc_port_3==0)
		munoc_signal_6 <= 1;
	else if(munoc_signal_0)
	begin
		if(munoc_signal_3)
			munoc_signal_6 <= 1;
		else
			munoc_signal_6 <= 0;
	end
end

always@(posedge munoc_port_1, negedge munoc_port_3)
begin
	if(munoc_port_3==0)
		munoc_signal_5 <= 0;
	else if(munoc_signal_0 && munoc_signal_6)
		munoc_signal_5 <= munoc_signal_2;
end

assign munoc_signal_0 = munoc_signal_7 & munoc_port_6;

always@(*)
begin
	munoc_port_6 = 0;
	if(!munoc_signal_1)
		munoc_port_6 = 1;
	else if(munoc_port_4)
			munoc_port_6 = 1;
end

MUNOC_ROUTING_TABLE
#(
	.BW_NODE_ID(MUNOC_LPARA_0),
	.NUM_OUTPUT(MUNOC_GPARA_2),
	.NETWORK_TYPE(MUNOC_GPARA_1),
	.ROUTER_ID(MUNOC_GPARA_0)
)
i_munoc_instance_1
(
	.target_node(munoc_signal_5),
	.routing_info(munoc_signal_4)
);

assign munoc_port_2 = (munoc_signal_1)? munoc_signal_4 : 0;

endmodule

