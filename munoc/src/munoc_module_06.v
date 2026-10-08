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




module MUNOC_MODULE_06
(
	munoc_port_7,
	munoc_port_3,

	munoc_port_2,
	munoc_port_5,
	munoc_port_4,

	munoc_port_6,
	munoc_port_1,
	munoc_port_0
);




parameter MUNOC_GPARA_0 = 1;
parameter MUNOC_GPARA_1 = 1;

input wire munoc_port_7, munoc_port_3;

output wire munoc_port_2;
input wire munoc_port_5;
input wire [MUNOC_GPARA_0-1:0] munoc_port_4;

output wire munoc_port_6;
input wire munoc_port_1;
output wire [MUNOC_GPARA_0-1:0] munoc_port_0;

ERVP_SMALL_FIFO
#(
	.BW_DATA(MUNOC_GPARA_0),
	.DEPTH(MUNOC_GPARA_1)
)
i_munoc_instance_0
(
	.clk(munoc_port_7),
	.rstnn(munoc_port_3),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_port_2),
	.wfull(),
	.wrequest(munoc_port_5),
	.wdata(munoc_port_4),
	.rready(munoc_port_6),
	.rempty(),
	.rrequest(munoc_port_1),
	.rdata(munoc_port_0)
);

endmodule
