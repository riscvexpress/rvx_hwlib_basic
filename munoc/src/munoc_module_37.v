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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_06.vh"
`include "munoc_extended_config.vh"
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"





module MUNOC_MODULE_37
(
	munoc_port_0,
	munoc_port_1,
	munoc_port_3,
	munoc_port_5,	
	munoc_port_6,
	munoc_port_4,
	munoc_port_2
);





parameter MUNOC_GPARA_1 = `NOT_SELECTED; 
parameter MUNOC_GPARA_2 = -1;
parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_3 = 1;

localparam  MUNOC_LPARA_0 = (MUNOC_GPARA_1==`FORWARD_NETWORK)? `BW_FNI_LINK(MUNOC_GPARA_0) : `BW_BNI_LINK(MUNOC_GPARA_0);
localparam  MUNOC_LPARA_1 = (MUNOC_GPARA_1==`FORWARD_NETWORK)? `BW_SLAVE_NODE_ID : `BW_MASTER_NODE_ID;

input wire munoc_port_0, munoc_port_1;
output reg munoc_port_3;
input wire [MUNOC_LPARA_0-1:0] munoc_port_5;
input wire munoc_port_6;
output wire [MUNOC_LPARA_0-1:0] munoc_port_4;
output wire [MUNOC_GPARA_3-1:0] munoc_port_2;

wire munoc_signal_0;
wire munoc_signal_7;
wire [MUNOC_LPARA_1-1:0] munoc_signal_3;

wire munoc_signal_4;

reg munoc_signal_5;
reg [MUNOC_LPARA_1-1:0] munoc_signal_2;
wire [MUNOC_GPARA_3-1:0] munoc_signal_6;

wire munoc_signal_1;

assign munoc_signal_0 = munoc_port_5[MUNOC_LPARA_0-1-`MUNOC_GDEF_82(MUNOC_GPARA_1)];
assign munoc_signal_7 = munoc_port_5[MUNOC_LPARA_0-1-`MUNOC_GDEF_85(MUNOC_GPARA_1)];
assign munoc_signal_3 = munoc_port_5[MUNOC_LPARA_0-1-`MUNOC_GDEF_23(MUNOC_GPARA_1)-:MUNOC_LPARA_1];
assign munoc_signal_4 = munoc_port_4[MUNOC_LPARA_0-1-`MUNOC_GDEF_82(MUNOC_GPARA_1)];

RVX_MODULE_055
#(
	.RVX_GPARA_1(MUNOC_LPARA_0-1)
)
i_munoc_instance_1
(
	.rvx_port_5(munoc_port_0),
	.rvx_port_3(munoc_port_1),
	.rvx_port_2(munoc_port_5[MUNOC_LPARA_0-2:0]),
	.rvx_port_0(munoc_port_4[MUNOC_LPARA_0-1]),
	.rvx_port_4(munoc_port_4[MUNOC_LPARA_0-2:0]),
	.rvx_port_6(munoc_signal_1),
	.rvx_port_1(munoc_port_6)
);

always@(posedge munoc_port_0, negedge munoc_port_1)
begin
	if(munoc_port_1==0)
		munoc_signal_5 <= 1;
	else if(munoc_signal_1)
	begin
		if(munoc_signal_7)
			munoc_signal_5 <= 1;
		else
			munoc_signal_5 <= 0;
	end
end

always@(posedge munoc_port_0, negedge munoc_port_1)
begin
	if(munoc_port_1==0)
		munoc_signal_2 <= 0;
	else if(munoc_signal_1 && munoc_signal_5)
		munoc_signal_2 <= munoc_signal_3;
end

assign munoc_signal_1 = munoc_signal_0 & munoc_port_3;

always@(*)
begin
	munoc_port_3 = 0;
	if(!munoc_signal_4)
		munoc_port_3 = 1;
	else if(munoc_port_6)
			munoc_port_3 = 1;
end

MUNOC_ROUTING_TABLE
#(
	.BW_NODE_ID(MUNOC_LPARA_1),
	.NUM_OUTPUT(MUNOC_GPARA_3),
	.NETWORK_TYPE(MUNOC_GPARA_1),
	.ROUTER_ID(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.target_node(munoc_signal_2),
	.routing_info(munoc_signal_6)
);

assign munoc_port_2 = (munoc_signal_4)? munoc_signal_6 : 0;

endmodule

