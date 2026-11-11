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


`default_nettype wire


module VIRTUAL_BLE_MCP (
	csn,
	sck,
	din,
	dout
);


input wire csn;
input wire sck;
input wire din;
inout wire dout;

wire debug = 1'b1;

wire cpol = 1'b0;
wire cpha  = 1'b0;

reg [7:0] rvx_signal_06 [7:0]; 
reg [2:0] rvx_signal_08;   
reg [7:0] rvx_signal_09;    

reg [7:0] rvx_signal_11, rvx_signal_04;  

reg [2:0] rvx_signal_10;
reg       rvx_signal_02;

wire rvx_signal_07;

localparam  RVX_LPARA_0 = 2;
localparam  RVX_LPARA_1 = 0;
localparam  RVX_LPARA_3 = 1;
localparam  RVX_LPARA_2 = 2;

reg [RVX_LPARA_0-1:0] rvx_signal_00;

initial
begin
	rvx_signal_00 = RVX_LPARA_1;
	wait(csn && sck && din && dout);
	rvx_signal_00 = RVX_LPARA_3;
	wait(csn && (~sck) && (~din) && (~dout));
	rvx_signal_00 = RVX_LPARA_2;
end

assign dout = (rvx_signal_00==RVX_LPARA_2)? rvx_signal_04[7] : 1'b z;

initial
begin
	rvx_signal_06[0] = 8'h11;
	rvx_signal_06[1] = 8'h22;
	rvx_signal_06[2] = 8'h33;
	rvx_signal_06[3] = 8'h44;
	rvx_signal_06[4] = 8'h55;
	rvx_signal_06[5] = 8'h66;
	rvx_signal_06[6] = 8'h77;
	rvx_signal_06[7] = 8'h88;
	rvx_signal_11    = 8'h99;
end

assign rvx_signal_07 = cpol ^ cpha ^ sck;

always @(posedge rvx_signal_07)
	rvx_signal_11 <= #1 {rvx_signal_11[6:0],din};

always @(posedge rvx_signal_07)
begin
	if (&rvx_signal_10)
		rvx_signal_04 <= #1 rvx_signal_06[rvx_signal_08];
	else
		rvx_signal_04 <= #1 {rvx_signal_04[6:0],1'bx};
end

always @(posedge rvx_signal_07, posedge csn)
begin
	if(csn)
		rvx_signal_10 <= #1 3'b111;
	else
		rvx_signal_10 <= #1 rvx_signal_10 - 3'h1;
end

always @(posedge rvx_signal_07)
begin
	rvx_signal_02 <= #1 ~(|rvx_signal_10);
end

always @(negedge rvx_signal_07)
begin
	if (rvx_signal_02) begin
		rvx_signal_06[rvx_signal_08] <= #1 rvx_signal_11;
		rvx_signal_08      <= #1 rvx_signal_08 + 1'b1;
	end
end

initial
begin
	rvx_signal_10=3'b111;
	rvx_signal_08 = 0;
	rvx_signal_04 = rvx_signal_06[rvx_signal_08];
end

endmodule

