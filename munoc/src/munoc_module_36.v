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





module MUNOC_MODULE_36
(
	munoc_port_0,
	munoc_port_1,
	munoc_port_4,

	munoc_port_2,
	munoc_port_3
);





parameter MUNOC_GPARA_0 = 32;
parameter MUNOC_GPARA_1 = 4;
parameter MUNOC_GPARA_2 = 10;

localparam  MUNOC_LPARA_0 = `DIVIDERD(MUNOC_GPARA_0,MUNOC_GPARA_1);

input wire munoc_port_0, munoc_port_1;
input wire munoc_port_4;

input wire munoc_port_2;
output reg [MUNOC_GPARA_0-1:0] munoc_port_3;

genvar i;
integer j;

wire [MUNOC_GPARA_2-1:0] munoc_signal_0;
wire munoc_signal_3;

reg [MUNOC_GPARA_1-1:0] munoc_signal_1 [MUNOC_LPARA_0-1:0];

wire [MUNOC_LPARA_0-1:0] munoc_signal_2;

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.clk(munoc_port_0),
	.rstnn(munoc_port_1),
	.enable(munoc_port_4),
	.init(munoc_signal_3),
	.count(1'b 1),
	.value(),
	.is_first_count(),
	.is_last_count(munoc_signal_3)
);

ERVP_COUNTER
#(
	.BW_COUNTER(MUNOC_GPARA_2)
)
i_munoc_instance_1
(
	.clk(munoc_port_0),
	.rstnn(munoc_port_1),
	.enable(munoc_port_4),
	.init(munoc_signal_3),
	.count(munoc_port_2),
	.value(munoc_signal_0),
	.is_first_count(),
	.is_last_count()
);

always@(*)
begin
	munoc_port_3 = 0;
	for(j=0; j<MUNOC_LPARA_0; j=j+1)
	begin
		munoc_port_3[(j+1)*MUNOC_GPARA_1-1-:MUNOC_GPARA_1] = munoc_signal_1[j];
	end
end

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
	.COUNT_LENGTH(MUNOC_LPARA_0),
	.CIRCULAR(1)
)
i_munoc_instance_2
(
	.clk(munoc_port_0),
	.rstnn(munoc_port_1),
	.enable(munoc_port_4),
	.init(1'b 0),
	.count(munoc_signal_3),
	.value(munoc_signal_2),
	.is_first_count(),
	.is_last_count()
);

generate
for(i=0; i<MUNOC_LPARA_0; i=i+1)
begin : i_gen_idle_count
	always @(posedge munoc_port_0, negedge munoc_port_1)
	begin
		if(munoc_port_1==0)
			munoc_signal_1[i] <= -1;
		else if(munoc_port_4)
			if(munoc_signal_3 && munoc_signal_2[i])
				munoc_signal_1[i] <= munoc_signal_0[MUNOC_GPARA_2-1 -:MUNOC_GPARA_1];
	end
end
endgenerate

endmodule
