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

`include "timescale.vh"


module NCSIM_PRINTF
(
	uart_rx,
	uart_tx,
	core_finish
);


parameter UART_CLK_HZ = 1000;
parameter SAMPLING_RATE = 4;

input wire uart_rx;
output wire uart_tx;
output reg core_finish;

localparam  RVX_LPARA_03 = 115200;
localparam integer RVX_LPARA_10 = (1.0)*UART_CLK_HZ/(16*RVX_LPARA_03);
localparam integer RVX_LPARA_15 = (RVX_LPARA_10<=1)? 1 : RVX_LPARA_10;
localparam  RVX_LPARA_09 = UART_CLK_HZ/(16*RVX_LPARA_15);
localparam  RVX_LPARA_02 = (RVX_LPARA_09<=1)? 1 : RVX_LPARA_09;
localparam  RVX_LPARA_08 = ((1000000.0/(RVX_LPARA_02/1000))/2.0);
localparam  RVX_LPARA_05 = (RVX_LPARA_08/SAMPLING_RATE);	

localparam  RVX_LPARA_11 = 4'h0;
localparam  RVX_LPARA_07 = 4'h1;
localparam  RVX_LPARA_13 = 4'h2;
localparam  RVX_LPARA_04 = 4'h3;
localparam  RVX_LPARA_14 = 4'h4;
localparam  RVX_LPARA_06 = 4'h5;
localparam  RVX_LPARA_00 = 4'h6;
localparam  RVX_LPARA_16 = 4'h7;
localparam  RVX_LPARA_12 = 4'h8;
localparam  RVX_LPARA_01 = 4'h9;

reg rvx_signal_0;

reg	[3:0]	rvx_signal_6;
reg	[7:0]	rvx_signal_5;

reg	[7:0]	rvx_signal_3;
reg	rvx_signal_7;

reg	[SAMPLING_RATE-2:0]	rvx_signal_1;
wire rvx_signal_4;

wire rvx_signal_2;

integer result_file;

`ifdef PRINTF_BOTH_OUT
	`define RVX_LDEF_1
	`define RVX_LDEF_3
`else
	`ifdef PRINTF_FILE_OUT_ONLY
		`define RVX_LDEF_1
	`else
		`define RVX_LDEF_3
	`endif
`endif

initial rvx_signal_0 <= 0;
always #(RVX_LPARA_05) rvx_signal_0 <= ~rvx_signal_0;

always @(posedge rvx_signal_0)
begin
	rvx_signal_1 <= {rvx_signal_1, uart_rx};
end

assign rvx_signal_4 = (rvx_signal_1==0) ? 1'b0 : 1'b1;
assign rvx_signal_2 = (rvx_signal_5==(SAMPLING_RATE-1));

initial begin
	rvx_signal_6 <= RVX_LPARA_11;
	rvx_signal_5	<= 0;
	rvx_signal_3 <= 0;
end

always @(posedge rvx_signal_0)
begin
	case(rvx_signal_6)
	RVX_LPARA_11: begin
		if(rvx_signal_4 == 0) begin
			
			rvx_signal_6 <= RVX_LPARA_07;
			rvx_signal_5 <= 0;
		end
	end
	RVX_LPARA_07: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_13; 
			rvx_signal_5			<= 0;
			rvx_signal_3[0]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_13: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_04; 
			rvx_signal_5			<= 0;
			rvx_signal_3[1]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_04: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_14; 
			rvx_signal_5			<= 0;
			rvx_signal_3[2]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_14: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_06; 
			rvx_signal_5			<= 0;
			rvx_signal_3[3]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_06: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_00; 
			rvx_signal_5			<= 0;
			rvx_signal_3[4]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_00: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_16; 
			rvx_signal_5			<= 0;
			rvx_signal_3[5]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_16: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_12; 
			rvx_signal_5			<= 0;
			rvx_signal_3[6]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_12: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_01; 
			rvx_signal_5			<= 0;
			rvx_signal_3[7]	<= rvx_signal_4;
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	RVX_LPARA_01: begin
		if(rvx_signal_2==1) begin
			rvx_signal_6			<= RVX_LPARA_11; 
			rvx_signal_5			<= 0;
			rvx_signal_7 <= rvx_signal_4;			
		end
		else rvx_signal_5 <= rvx_signal_5 + 1;
	end
	endcase
end

initial
begin
	core_finish = 0;
	`ifdef RVX_LDEF_1
	result_file = $fopen("result.dat", "w");
	`endif
	while(1)
	begin
		wait(rvx_signal_6==RVX_LPARA_11);
		wait(rvx_signal_6==RVX_LPARA_01);
		wait(rvx_signal_2==1);
		if(rvx_signal_3==4)
		begin
			`ifdef RVX_LDEF_1
			$fclose(result_file);
			`endif
			core_finish = 1;			
		end
		else
		begin
			if($unsigned(rvx_signal_3)!=13)
			begin
				`ifdef RVX_LDEF_3
				$write("%c", rvx_signal_3);
				`endif
				`ifdef RVX_LDEF_1
				$fwrite(result_file, "%c", rvx_signal_3);
				`endif				
			end
		end
	end
end

assign uart_tx = 1;

`ifdef PRINTF_BOTH_OUT
	`undef RVX_LDEF_1
	`undef RVX_LDEF_3
`else
	`ifdef PRINTF_FILE_OUT_ONLY
		`undef RVX_LDEF_1
	`else
		`undef RVX_LDEF_3
	`endif
`endif

endmodule
