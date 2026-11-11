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


`include "ervp_uart_defines.vh"




module RVX_MODULE_132 (
	rvx_port_09, 
	rvx_port_08,
	rvx_port_01, 
	rvx_port_12, 
	rvx_port_02, 
	rvx_port_03, 
	rvx_port_10, 

	rvx_port_07, 
	rvx_port_11,

	rvx_port_05,
	rvx_port_00, 
	rvx_port_06, 
	rvx_port_13, 
	rvx_port_04

	);




`include "rvx_include_06.vh"

input wire rvx_port_09;
input wire rvx_port_08;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_01;
input wire [7:0] rvx_port_12;
output reg [7:0] rvx_port_02;
input wire rvx_port_03;
input wire rvx_port_10;

output wire rvx_port_07;
input wire rvx_port_11;

input wire [3:0] rvx_port_05;
output wire rvx_port_00;
output wire rvx_port_06;
output reg rvx_port_13;
output wire rvx_port_04;

reg						rvx_signal_072;

reg 					rvx_signal_025;

assign rvx_port_04 = rvx_signal_025; 

wire 					rvx_signal_080;

reg 	[3:0] 			rvx_signal_101;
reg 	[3:0] 			rvx_signal_031;
reg 	[1:0] 			rvx_signal_065;  
reg 	[4:0] 			rvx_signal_096;
reg 	[7:0] 			rvx_signal_067;
reg 	[7:0] 			rvx_signal_013;
reg 	[15:0]			rvx_signal_077;  
reg 	[7:0] 			rvx_signal_084; 
reg 					rvx_signal_046; 
reg 					rvx_signal_086; 
reg 					rvx_signal_002; 
reg 	[15:0] 			rvx_signal_083;  

reg		 [3:0] 			rvx_signal_036; 
reg 					rvx_signal_022;
reg 					rvx_signal_005;

wire 					rvx_signal_030;			   
wire 					rvx_signal_012, rvx_signal_064, rvx_signal_074, rvx_signal_050; 
wire 					rvx_signal_023;		   
wire 					rvx_signal_097, rvx_signal_034, rvx_signal_008, rvx_signal_004;	   
wire                    rvx_signal_094, rvx_signal_085, rvx_signal_001, rvx_signal_043; 

wire [7:0] 				rvx_signal_102;
wire 					rvx_signal_081, rvx_signal_087, rvx_signal_017, rvx_signal_024, rvx_signal_027, rvx_signal_095, rvx_signal_093, rvx_signal_070;
reg						rvx_signal_021, rvx_signal_091, rvx_signal_055, rvx_signal_090, rvx_signal_073, rvx_signal_088, rvx_signal_011, rvx_signal_054;
wire 					rvx_signal_044; 

reg						rvx_signal_009, rvx_signal_058;

wire 					rvx_signal_053;  
wire 					rvx_signal_032;  
wire 					rvx_signal_028;   
wire					rvx_signal_033; 
wire 					rvx_signal_048;   

reg 					rvx_signal_068;
reg		[7:0]			rvx_signal_026;
reg 					rvx_signal_015;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_049;
wire 								rvx_signal_057; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_006;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_100;
wire [2:0] 				rvx_signal_014;
wire [3:0] 				rvx_signal_089;
wire [9:0] 				rvx_signal_003;

wire					rvx_signal_029; 
reg  	[7:0]			rvx_signal_020;   
reg  	[7:0]			rvx_signal_056; 

wire					rvx_signal_076;
wire					rvx_signal_059;

wire rvx_signal_007;

assign rvx_signal_102[7:0] = { rvx_signal_054, rvx_signal_011, rvx_signal_088, rvx_signal_073, rvx_signal_090, rvx_signal_055, rvx_signal_091, rvx_signal_021 };

assign {rvx_signal_012, rvx_signal_064, rvx_signal_074, rvx_signal_050} = rvx_port_05;
assign {rvx_signal_097, rvx_signal_034, rvx_signal_008, rvx_signal_004} = ~{rvx_signal_012,rvx_signal_064,rvx_signal_074,rvx_signal_050};

assign {rvx_signal_094, rvx_signal_085, rvx_signal_001, rvx_signal_043} = rvx_signal_023 ? {rvx_signal_096[`UART_MC_RTS],rvx_signal_096[`UART_MC_DTR],rvx_signal_096[`UART_MC_OUT1],rvx_signal_096[`UART_MC_OUT2]} :	{rvx_signal_012,rvx_signal_064,rvx_signal_074,rvx_signal_050};

assign rvx_signal_030 = rvx_signal_067[`UART_LC_DL];
assign rvx_signal_023 = rvx_signal_096[4];

assign rvx_port_00 = rvx_signal_096[`UART_MC_RTS];
assign rvx_port_06 = rvx_signal_096[`UART_MC_DTR];

RVX_MODULE_062 i_rvx_instance_1(
	.rvx_port_01(rvx_port_09), 
	.rvx_port_09(rvx_port_08), 
	.rvx_port_06(rvx_signal_067), 
	.rvx_port_03(rvx_signal_068), 
	.rvx_port_05(rvx_signal_026), 
	.rvx_port_00(rvx_signal_025), 
	.rvx_port_10(rvx_signal_007), 
	.rvx_port_07(rvx_signal_014), 
	.rvx_port_08(rvx_signal_100), 
	.rvx_port_04(rvx_signal_005), 
	.rvx_port_02(rvx_signal_044)
);

always @ (posedge rvx_port_09 or posedge rvx_port_08)
begin
	if (rvx_port_09) begin
		rvx_signal_009 <= 1'b1;
		rvx_signal_058 <= 1'b1;
	end
	else begin
		rvx_signal_009 <= rvx_port_11;    
		rvx_signal_058 <= rvx_signal_009;    
	end
end

assign rvx_signal_080 = (rvx_signal_072 == 0) ? 1'b1 : rvx_signal_058;

wire 	serial_in	= rvx_signal_023 ? rvx_signal_007 : rvx_signal_080;
assign	rvx_port_07 	= (rvx_signal_023 || (rvx_signal_072 == 0)) ? 1'b1 : rvx_signal_007;

RVX_MODULE_001 i_rvx_instance_0(
	.rvx_port_10(rvx_port_09), 
	.rvx_port_00(rvx_port_08), 
	.rvx_port_02(rvx_signal_067), 
	.rvx_port_01(rvx_signal_015), 
	.rvx_port_09(serial_in), 
	.rvx_port_11(rvx_signal_025), 
	.rvx_port_03(rvx_signal_003), 
	.rvx_port_14(rvx_signal_006), 
	.rvx_port_05(rvx_signal_049), 
	.rvx_port_06(rvx_signal_057), 
	.rvx_port_13(rvx_signal_076), 
	.rvx_port_07(rvx_signal_022), 
	.rvx_port_04(rvx_signal_044), 
	.rvx_port_12(rvx_signal_089), 
	.rvx_port_08(rvx_signal_059)
);

always @*
begin
	case (rvx_port_01)
	`UART_REG_RB   	: rvx_port_02 = rvx_signal_030 ? rvx_signal_077[7:0] : rvx_signal_049[10:3];
	`UART_REG_IE	: rvx_port_02 = rvx_signal_030 ? rvx_signal_077[15:8] : rvx_signal_101;
	`UART_REG_II	: rvx_port_02 = {4'b1100,rvx_signal_031};
	`UART_REG_LC	: rvx_port_02 = rvx_signal_067;
	`UART_REG_LS	: rvx_port_02 = rvx_signal_102;
	`UART_REG_MS	: rvx_port_02 = rvx_signal_013;
	`UART_REG_SR	: rvx_port_02 = rvx_signal_084;
	`UART_REG_EN	: rvx_port_02 = {7'b0, rvx_signal_072};
	`UART_REG_TC	: rvx_port_02 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_100};
	default			: rvx_port_02 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_09 or posedge rvx_port_08)
begin
	if (rvx_port_09) begin
		rvx_signal_072 <=  0; 
	end
	else begin
		if(rvx_port_03 && (rvx_port_01==`UART_REG_EN)) begin
			rvx_signal_072 <= rvx_port_12[0];
		end
	end
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_015 <=  0; 
	else
	if (rvx_signal_015)	
		rvx_signal_015 <=  0;
	else
	if (rvx_port_10 && (rvx_port_01 == `UART_REG_RB) && !rvx_signal_030)
		rvx_signal_015 <=  1; 
end

wire 	rvx_signal_063;
wire 	rvx_signal_062;
wire  	rvx_signal_051;
wire	rvx_signal_041;
wire	rvx_signal_052;

assign rvx_signal_063 = (rvx_port_10 && (rvx_port_01 == `UART_REG_LS) && !rvx_signal_030);
assign rvx_signal_062 	= (rvx_port_10 && (rvx_port_01 == `UART_REG_II) && !rvx_signal_030);
assign rvx_signal_051 	= (rvx_port_10 && (rvx_port_01 == `UART_REG_MS) && !rvx_signal_030);
assign rvx_signal_041 	= (rvx_port_10 && (rvx_port_01 == `UART_REG_RB) && !rvx_signal_030);
assign rvx_signal_052 	= (rvx_port_03 && (rvx_port_01 == `UART_REG_TR) && !rvx_signal_030);

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_086 <=  0;
	else 
		rvx_signal_086 <=  rvx_signal_063;
end

assign rvx_signal_044 = rvx_signal_063 && ~rvx_signal_086;

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_002 <=  1;
	else
	if (rvx_signal_002)
		rvx_signal_002 <=  0;
	else
	if (rvx_signal_051)
		rvx_signal_002 <=  1; 
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_067 <=  8'b00000011; 
	else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_LC))
		rvx_signal_067 <=  rvx_port_12;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	begin
		rvx_signal_101 <=  4'b0000; 
		rvx_signal_077[15:8] <=  8'b0;
	end
	else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_IE))
		if (rvx_signal_030)
		begin
			rvx_signal_077[15:8] <=  rvx_port_12;
		end
		else
			rvx_signal_101 <=  rvx_port_12[3:0]; 
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) begin
		rvx_signal_065 <=  2'b11; 
		rvx_signal_022 <=  0;
		rvx_signal_005 <=  0;
	end else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_FC)) begin
		rvx_signal_065 <=  rvx_port_12[7:6];
		rvx_signal_022 <=  rvx_port_12[1];
		rvx_signal_005 <=  rvx_port_12[2];
	end else begin
		rvx_signal_022 <=  0;
		rvx_signal_005 <=  0;
	end
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_096 <=  5'b0; 
	else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_MC))
			rvx_signal_096 <=  rvx_port_12[4:0];
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_084 <=  0; 
	else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_SR))
		rvx_signal_084 <=  rvx_port_12;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	begin
		rvx_signal_077[7:0]  	<=  8'b0;
		rvx_signal_068   	<=  1'b0;
		rvx_signal_046 	<=  1'b0;
		rvx_signal_026	<= 0;
	end
	else
	if (rvx_port_03 && (rvx_port_01==`UART_REG_TR))
		if (rvx_signal_030)
		begin
			rvx_signal_077[7:0] <=  rvx_port_12;
			rvx_signal_046 <=  1'b1; 
			rvx_signal_068 <=  1'b0;
		end
		else
		begin
			rvx_signal_068   <=  1'b1;
			rvx_signal_046 <=  1'b0;
			rvx_signal_026 <= rvx_port_12;
		end 
	else
	begin
		rvx_signal_046 <=  1'b0;
		rvx_signal_068   <=  1'b0;
	end 
end

always @(rvx_signal_065)
begin
	case (rvx_signal_065[`UART_FC_TL])
		2'b00 : rvx_signal_036 = 1;
		2'b01 : rvx_signal_036 = 4;
		2'b10 : rvx_signal_036 = 8;
		2'b11 : rvx_signal_036 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_071;
always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	  begin
  		rvx_signal_013 <=  0;
	  	rvx_signal_071[3:0] <=  0;
	  end
	else begin
		rvx_signal_013[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_002 ? 4'b0 :
			rvx_signal_013[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_004, rvx_signal_008, rvx_signal_034, rvx_signal_097} ^ rvx_signal_071[3:0]);
		rvx_signal_013[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_043, rvx_signal_001, rvx_signal_085, rvx_signal_094};
		rvx_signal_071[3:0] <=  {rvx_signal_004, rvx_signal_008, rvx_signal_034, rvx_signal_097};
	end
end

assign rvx_signal_081 = (rvx_signal_006==0 && rvx_signal_059);  
assign rvx_signal_087 = rvx_signal_076;     
assign rvx_signal_017 = rvx_signal_049[1]; 
assign rvx_signal_024 = rvx_signal_049[0]; 
assign rvx_signal_027 = rvx_signal_049[2]; 
assign rvx_signal_095 = ((rvx_signal_100==5'b0) && rvx_signal_029);  
assign rvx_signal_093 = ((rvx_signal_100==5'b0) && rvx_signal_029 && (rvx_signal_014 ==  0)); 
assign rvx_signal_070 = rvx_signal_057 | rvx_signal_076;

reg 	 rvx_signal_040;

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_040 <=  0;
	else rvx_signal_040 <=  rvx_signal_081;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_021 <=  0;
	else rvx_signal_021 <=  (rvx_signal_006==1 && rvx_signal_015 && !rvx_signal_059 || rvx_signal_022) ? 0 : 
					  rvx_signal_021 || (rvx_signal_081 && ~rvx_signal_040); 
end

reg rvx_signal_039; 

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_039 <=  0;
	else rvx_signal_039 <=  rvx_signal_087;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_091 <=  0;
	else	rvx_signal_091 <= 	rvx_signal_044 ? 0 : rvx_signal_091 || (rvx_signal_087 && ~rvx_signal_039); 
end

reg rvx_signal_099; 

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_099 <=  0;
	else rvx_signal_099 <=  rvx_signal_017;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_055 <=  0;
	else rvx_signal_055 <=  rvx_signal_044 ? 0 : rvx_signal_055 || (rvx_signal_017 && ~rvx_signal_099); 
end

reg rvx_signal_010; 

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_010 <=  0;
	else rvx_signal_010 <=  rvx_signal_024;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_090 <=  0;
	else rvx_signal_090 <=  rvx_signal_044 ? 0 : rvx_signal_090 || (rvx_signal_024 && ~rvx_signal_010); 
end

reg rvx_signal_000; 

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_000 <=  0;
	else rvx_signal_000 <=  rvx_signal_027;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_073 <=  0;
	else rvx_signal_073 <=  rvx_signal_044 ? 0 : rvx_signal_073 || (rvx_signal_027 && ~rvx_signal_000);
end

reg rvx_signal_079;

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_079 <=  1;
	else rvx_signal_079 <=  rvx_signal_095;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_088 <=  1;
	else rvx_signal_088 <=  (rvx_signal_052) ? 0 :  rvx_signal_088 || (rvx_signal_095 && ~rvx_signal_079);
end

reg rvx_signal_078;

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_078 <=  1;
	else rvx_signal_078 <=  rvx_signal_093;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_011 <=  1;
	else rvx_signal_011 <=  (rvx_signal_052) ? 0 : rvx_signal_011 || (rvx_signal_093 && ~rvx_signal_078);
end

reg rvx_signal_045;

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_045 <=  0;
	else rvx_signal_045 <=  rvx_signal_070;
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_054 <=  0;
	else rvx_signal_054 <=  rvx_signal_044 ? 0 : rvx_signal_054 || (rvx_signal_070 && ~rvx_signal_045);
end

always @(posedge rvx_port_08 or posedge rvx_port_09) 
begin
	if (rvx_port_09)
		rvx_signal_083 <=  0;
	else
		if (rvx_signal_046 | ~ (|rvx_signal_083))
  			rvx_signal_083 <=  rvx_signal_077 - 1;               
		else
			rvx_signal_083 <=  rvx_signal_083 - 1;              
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_025 <=  1'b0;
	else
		if (|rvx_signal_077 & ~(|rvx_signal_083))     
			rvx_signal_025 <=  1'b1;
		else
			rvx_signal_025 <=  1'b0;
end

always @(rvx_signal_067)
begin
  case (rvx_signal_067[3:0])
    4'b0000                             : rvx_signal_056 =  95; 
    4'b0100                             : rvx_signal_056 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_056 = 111; 
    4'b1100                             : rvx_signal_056 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_056 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_056 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_056 = 159; 
    4'b1111                             : rvx_signal_056 = 175; 
  endcase 
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
  if (rvx_port_09)
    rvx_signal_020 <=  8'd0;
  else
  if(rvx_signal_088 & rvx_signal_052)  
    rvx_signal_020 <=  rvx_signal_056;
  else
  if (rvx_signal_025 & rvx_signal_020 != 8'b0)  
    rvx_signal_020 <=  rvx_signal_020 - 1;  
end 

assign rvx_signal_029 = ~(|rvx_signal_020);

assign rvx_signal_053  = rvx_signal_101[`UART_IE_RLS] && (rvx_signal_102[`UART_LS_OE] || rvx_signal_102[`UART_LS_PE] || rvx_signal_102[`UART_LS_FE] || rvx_signal_102[`UART_LS_BI]);
assign rvx_signal_032  = rvx_signal_101[`UART_IE_RDA] && (rvx_signal_006 >= {1'b0,rvx_signal_036});
assign rvx_signal_033 = rvx_signal_101[`UART_IE_THRE] && rvx_signal_102[`UART_LS_TFE];
assign rvx_signal_048   = rvx_signal_101[`UART_IE_MS] && (| rvx_signal_013[3:0]);
assign rvx_signal_028   = rvx_signal_101[`UART_IE_RDA] && (rvx_signal_003 == 10'b0) && (|rvx_signal_006);

reg 	 rvx_signal_075;
reg 	 rvx_signal_038;
reg 	 rvx_signal_060;
reg 	 rvx_signal_061;
reg 	 rvx_signal_092;

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_075 <=  0;
	else rvx_signal_075 <=  rvx_signal_053;
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_092 <=  0;
	else rvx_signal_092 <=  rvx_signal_032;
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_038 <=  0;
	else rvx_signal_038 <=  rvx_signal_033;
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_060 <=  0;
	else rvx_signal_060 <=  rvx_signal_048;
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_061 <=  0;
	else rvx_signal_061 <=  rvx_signal_028;
end

wire 	 rvx_signal_016;
wire 	 rvx_signal_098;
wire 	 rvx_signal_069;
wire 	 rvx_signal_019;
wire 	 rvx_signal_018;

assign rvx_signal_018    = rvx_signal_032 & ~rvx_signal_092;
assign rvx_signal_016 	  = rvx_signal_053 & ~rvx_signal_075;
assign rvx_signal_098   = rvx_signal_033 & ~rvx_signal_038;
assign rvx_signal_069 	  = rvx_signal_048 & ~rvx_signal_060;
assign rvx_signal_019 	  = rvx_signal_028 & ~rvx_signal_061;

reg 	rvx_signal_042;
reg		rvx_signal_082;
reg 	rvx_signal_037;
reg 	rvx_signal_035;
reg 	rvx_signal_047;

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_042 <=  0; 
	else 
		rvx_signal_042 <=  rvx_signal_044 ? 0 :  						
							rvx_signal_016 ? 1 :						
							rvx_signal_042 && rvx_signal_101[`UART_IE_RLS];	
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_082 <=  0; 
	else 
		rvx_signal_082 <=  ((rvx_signal_006 == {1'b0,rvx_signal_036}) && rvx_signal_041) ? 0 :  	
							rvx_signal_018 ? 1 :						
							rvx_signal_082 && rvx_signal_101[`UART_IE_RDA];	
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_037 <=  0; 
	else 
		rvx_signal_037 <=  rvx_signal_052 || (rvx_signal_062 & ~rvx_signal_031[`UART_II_IP] & rvx_signal_031[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_098 ? 1 :
							rvx_signal_037 && rvx_signal_101[`UART_IE_THRE];
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_035 <=  0; 
	else 
		rvx_signal_035 <=  rvx_signal_051 ? 0 : 
							rvx_signal_069 ? 1 :
							rvx_signal_035 && rvx_signal_101[`UART_IE_MS];
end

always  @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_047 <=  0; 
	else 
		rvx_signal_047 <=  rvx_signal_041 ? 0 : 
							rvx_signal_019 ? 1 :
							rvx_signal_047 && rvx_signal_101[`UART_IE_RDA];
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)	
		rvx_port_13 <=  1'b0;
	else
		rvx_port_13 <= rvx_signal_042? ~rvx_signal_044 : (rvx_signal_082? 1 : (rvx_signal_047? ~rvx_signal_041 : (rvx_signal_037? !(rvx_signal_052 & rvx_signal_062) : (rvx_signal_035? ~rvx_signal_051 : 0))));
end

always @(posedge rvx_port_08 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_031 <=  1;
	else
	if (rvx_signal_042)  
	begin
		rvx_signal_031[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_031[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_032)
	begin
		rvx_signal_031[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_031[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_047)
	begin
		rvx_signal_031[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_031[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_037)
	begin
		rvx_signal_031[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_031[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_035)
	begin
		rvx_signal_031[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_031[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_031[`UART_II_II] <=  0;
		rvx_signal_031[`UART_II_IP] <=  1'b1;
	end
end

endmodule

