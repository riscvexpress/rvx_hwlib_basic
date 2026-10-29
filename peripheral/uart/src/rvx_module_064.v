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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "ervp_uart_defines.vh"




module RVX_MODULE_064 (
	rvx_port_03, 
	rvx_port_11,
	rvx_port_12, 
	rvx_port_07, 
	rvx_port_06, 
	rvx_port_08, 
	rvx_port_09, 

	rvx_port_10, 
	rvx_port_13,

	rvx_port_02,
	rvx_port_04, 
	rvx_port_00, 
	rvx_port_05, 
	rvx_port_01

	);




`include "rvx_include_11.vh"

input wire rvx_port_03;
input wire rvx_port_11;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_12;
input wire [7:0] rvx_port_07;
output reg [7:0] rvx_port_06;
input wire rvx_port_08;
input wire rvx_port_09;

output wire rvx_port_10;
input wire rvx_port_13;

input wire [3:0] rvx_port_02;
output wire rvx_port_04;
output wire rvx_port_00;
output reg rvx_port_05;
output wire rvx_port_01;

reg						rvx_signal_015;

reg 					rvx_signal_065;

assign rvx_port_01 = rvx_signal_065; 

wire 					rvx_signal_073;

reg 	[3:0] 			rvx_signal_089;
reg 	[3:0] 			rvx_signal_038;
reg 	[1:0] 			rvx_signal_077;  
reg 	[4:0] 			rvx_signal_068;
reg 	[7:0] 			rvx_signal_033;
reg 	[7:0] 			rvx_signal_034;
reg 	[15:0]			rvx_signal_075;  
reg 	[7:0] 			rvx_signal_060; 
reg 					rvx_signal_013; 
reg 					rvx_signal_094; 
reg 					rvx_signal_087; 
reg 	[15:0] 			rvx_signal_024;  

reg		 [3:0] 			rvx_signal_030; 
reg 					rvx_signal_081;
reg 					rvx_signal_088;

wire 					rvx_signal_031;			   
wire 					rvx_signal_079, rvx_signal_071, rvx_signal_035, rvx_signal_096; 
wire 					rvx_signal_002;		   
wire 					rvx_signal_000, rvx_signal_017, rvx_signal_091, rvx_signal_021;	   
wire                    rvx_signal_011, rvx_signal_082, rvx_signal_009, rvx_signal_099; 

wire [7:0] 				rvx_signal_102;
wire 					rvx_signal_005, rvx_signal_074, rvx_signal_016, rvx_signal_052, rvx_signal_020, rvx_signal_101, rvx_signal_054, rvx_signal_022;
reg						rvx_signal_058, rvx_signal_072, rvx_signal_003, rvx_signal_001, rvx_signal_029, rvx_signal_046, rvx_signal_019, rvx_signal_027;
wire 					rvx_signal_023; 

reg						rvx_signal_028, rvx_signal_037;

wire 					rvx_signal_036;  
wire 					rvx_signal_048;  
wire 					rvx_signal_062;   
wire					rvx_signal_018; 
wire 					rvx_signal_086;   

reg 					rvx_signal_084;
reg		[7:0]			rvx_signal_069;
reg 					rvx_signal_059;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_043;
wire 								rvx_signal_095; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_006;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_051;
wire [2:0] 				rvx_signal_007;
wire [3:0] 				rvx_signal_014;
wire [9:0] 				rvx_signal_010;

wire					rvx_signal_100; 
reg  	[7:0]			rvx_signal_061;   
reg  	[7:0]			rvx_signal_057; 

wire					rvx_signal_045;
wire					rvx_signal_044;

wire rvx_signal_026;

assign rvx_signal_102[7:0] = { rvx_signal_027, rvx_signal_019, rvx_signal_046, rvx_signal_029, rvx_signal_001, rvx_signal_003, rvx_signal_072, rvx_signal_058 };

assign {rvx_signal_079, rvx_signal_071, rvx_signal_035, rvx_signal_096} = rvx_port_02;
assign {rvx_signal_000, rvx_signal_017, rvx_signal_091, rvx_signal_021} = ~{rvx_signal_079,rvx_signal_071,rvx_signal_035,rvx_signal_096};

assign {rvx_signal_011, rvx_signal_082, rvx_signal_009, rvx_signal_099} = rvx_signal_002 ? {rvx_signal_068[`UART_MC_RTS],rvx_signal_068[`UART_MC_DTR],rvx_signal_068[`UART_MC_OUT1],rvx_signal_068[`UART_MC_OUT2]} :	{rvx_signal_079,rvx_signal_071,rvx_signal_035,rvx_signal_096};

assign rvx_signal_031 = rvx_signal_033[`UART_LC_DL];
assign rvx_signal_002 = rvx_signal_068[4];

assign rvx_port_04 = rvx_signal_068[`UART_MC_RTS];
assign rvx_port_00 = rvx_signal_068[`UART_MC_DTR];

RVX_MODULE_124 i_rvx_instance_1(
	.rvx_port_07(rvx_port_03), 
	.rvx_port_01(rvx_port_11), 
	.rvx_port_03(rvx_signal_033), 
	.rvx_port_04(rvx_signal_084), 
	.rvx_port_00(rvx_signal_069), 
	.rvx_port_08(rvx_signal_065), 
	.rvx_port_05(rvx_signal_026), 
	.rvx_port_10(rvx_signal_007), 
	.rvx_port_09(rvx_signal_051), 
	.rvx_port_06(rvx_signal_088), 
	.rvx_port_02(rvx_signal_023)
);

always @ (posedge rvx_port_03 or posedge rvx_port_11)
begin
	if (rvx_port_03) begin
		rvx_signal_028 <= 1'b1;
		rvx_signal_037 <= 1'b1;
	end
	else begin
		rvx_signal_028 <= rvx_port_13;    
		rvx_signal_037 <= rvx_signal_028;    
	end
end

assign rvx_signal_073 = (rvx_signal_015 == 0) ? 1'b1 : rvx_signal_037;

wire 	serial_in	= rvx_signal_002 ? rvx_signal_026 : rvx_signal_073;
assign	rvx_port_10 	= (rvx_signal_002 || (rvx_signal_015 == 0)) ? 1'b1 : rvx_signal_026;

RVX_MODULE_045 i_rvx_instance_0(
	.rvx_port_01(rvx_port_03), 
	.rvx_port_10(rvx_port_11), 
	.rvx_port_07(rvx_signal_033), 
	.rvx_port_05(rvx_signal_059), 
	.rvx_port_09(serial_in), 
	.rvx_port_02(rvx_signal_065), 
	.rvx_port_03(rvx_signal_010), 
	.rvx_port_08(rvx_signal_006), 
	.rvx_port_04(rvx_signal_043), 
	.rvx_port_13(rvx_signal_095), 
	.rvx_port_12(rvx_signal_045), 
	.rvx_port_06(rvx_signal_081), 
	.rvx_port_00(rvx_signal_023), 
	.rvx_port_14(rvx_signal_014), 
	.rvx_port_11(rvx_signal_044)
);

always @*
begin
	case (rvx_port_12)
	`UART_REG_RB   	: rvx_port_06 = rvx_signal_031 ? rvx_signal_075[7:0] : rvx_signal_043[10:3];
	`UART_REG_IE	: rvx_port_06 = rvx_signal_031 ? rvx_signal_075[15:8] : rvx_signal_089;
	`UART_REG_II	: rvx_port_06 = {4'b1100,rvx_signal_038};
	`UART_REG_LC	: rvx_port_06 = rvx_signal_033;
	`UART_REG_LS	: rvx_port_06 = rvx_signal_102;
	`UART_REG_MS	: rvx_port_06 = rvx_signal_034;
	`UART_REG_SR	: rvx_port_06 = rvx_signal_060;
	`UART_REG_EN	: rvx_port_06 = {7'b0, rvx_signal_015};
	`UART_REG_TC	: rvx_port_06 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_051};
	default			: rvx_port_06 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_03 or posedge rvx_port_11)
begin
	if (rvx_port_03) begin
		rvx_signal_015 <=  0; 
	end
	else begin
		if(rvx_port_08 && (rvx_port_12==`UART_REG_EN)) begin
			rvx_signal_015 <= rvx_port_07[0];
		end
	end
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_059 <=  0; 
	else
	if (rvx_signal_059)	
		rvx_signal_059 <=  0;
	else
	if (rvx_port_09 && (rvx_port_12 == `UART_REG_RB) && !rvx_signal_031)
		rvx_signal_059 <=  1; 
end

wire 	rvx_signal_039;
wire 	rvx_signal_090;
wire  	rvx_signal_070;
wire	rvx_signal_050;
wire	rvx_signal_056;

assign rvx_signal_039 = (rvx_port_09 && (rvx_port_12 == `UART_REG_LS) && !rvx_signal_031);
assign rvx_signal_090 	= (rvx_port_09 && (rvx_port_12 == `UART_REG_II) && !rvx_signal_031);
assign rvx_signal_070 	= (rvx_port_09 && (rvx_port_12 == `UART_REG_MS) && !rvx_signal_031);
assign rvx_signal_050 	= (rvx_port_09 && (rvx_port_12 == `UART_REG_RB) && !rvx_signal_031);
assign rvx_signal_056 	= (rvx_port_08 && (rvx_port_12 == `UART_REG_TR) && !rvx_signal_031);

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_094 <=  0;
	else 
		rvx_signal_094 <=  rvx_signal_039;
end

assign rvx_signal_023 = rvx_signal_039 && ~rvx_signal_094;

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_087 <=  1;
	else
	if (rvx_signal_087)
		rvx_signal_087 <=  0;
	else
	if (rvx_signal_070)
		rvx_signal_087 <=  1; 
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_033 <=  8'b00000011; 
	else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_LC))
		rvx_signal_033 <=  rvx_port_07;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
	begin
		rvx_signal_089 <=  4'b0000; 
		rvx_signal_075[15:8] <=  8'b0;
	end
	else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_IE))
		if (rvx_signal_031)
		begin
			rvx_signal_075[15:8] <=  rvx_port_07;
		end
		else
			rvx_signal_089 <=  rvx_port_07[3:0]; 
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) begin
		rvx_signal_077 <=  2'b11; 
		rvx_signal_081 <=  0;
		rvx_signal_088 <=  0;
	end else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_FC)) begin
		rvx_signal_077 <=  rvx_port_07[7:6];
		rvx_signal_081 <=  rvx_port_07[1];
		rvx_signal_088 <=  rvx_port_07[2];
	end else begin
		rvx_signal_081 <=  0;
		rvx_signal_088 <=  0;
	end
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_068 <=  5'b0; 
	else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_MC))
			rvx_signal_068 <=  rvx_port_07[4:0];
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_060 <=  0; 
	else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_SR))
		rvx_signal_060 <=  rvx_port_07;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
	begin
		rvx_signal_075[7:0]  	<=  8'b0;
		rvx_signal_084   	<=  1'b0;
		rvx_signal_013 	<=  1'b0;
		rvx_signal_069	<= 0;
	end
	else
	if (rvx_port_08 && (rvx_port_12==`UART_REG_TR))
		if (rvx_signal_031)
		begin
			rvx_signal_075[7:0] <=  rvx_port_07;
			rvx_signal_013 <=  1'b1; 
			rvx_signal_084 <=  1'b0;
		end
		else
		begin
			rvx_signal_084   <=  1'b1;
			rvx_signal_013 <=  1'b0;
			rvx_signal_069 <= rvx_port_07;
		end 
	else
	begin
		rvx_signal_013 <=  1'b0;
		rvx_signal_084   <=  1'b0;
	end 
end

always @(rvx_signal_077)
begin
	case (rvx_signal_077[`UART_FC_TL])
		2'b00 : rvx_signal_030 = 1;
		2'b01 : rvx_signal_030 = 4;
		2'b10 : rvx_signal_030 = 8;
		2'b11 : rvx_signal_030 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_076;
always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
	  begin
  		rvx_signal_034 <=  0;
	  	rvx_signal_076[3:0] <=  0;
	  end
	else begin
		rvx_signal_034[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_087 ? 4'b0 :
			rvx_signal_034[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_021, rvx_signal_091, rvx_signal_017, rvx_signal_000} ^ rvx_signal_076[3:0]);
		rvx_signal_034[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_099, rvx_signal_009, rvx_signal_082, rvx_signal_011};
		rvx_signal_076[3:0] <=  {rvx_signal_021, rvx_signal_091, rvx_signal_017, rvx_signal_000};
	end
end

assign rvx_signal_005 = (rvx_signal_006==0 && rvx_signal_044);  
assign rvx_signal_074 = rvx_signal_045;     
assign rvx_signal_016 = rvx_signal_043[1]; 
assign rvx_signal_052 = rvx_signal_043[0]; 
assign rvx_signal_020 = rvx_signal_043[2]; 
assign rvx_signal_101 = ((rvx_signal_051==5'b0) && rvx_signal_100);  
assign rvx_signal_054 = ((rvx_signal_051==5'b0) && rvx_signal_100 && (rvx_signal_007 ==  0)); 
assign rvx_signal_022 = rvx_signal_095 | rvx_signal_045;

reg 	 rvx_signal_092;

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_092 <=  0;
	else rvx_signal_092 <=  rvx_signal_005;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_058 <=  0;
	else rvx_signal_058 <=  (rvx_signal_006==1 && rvx_signal_059 && !rvx_signal_044 || rvx_signal_081) ? 0 : 
					  rvx_signal_058 || (rvx_signal_005 && ~rvx_signal_092); 
end

reg rvx_signal_098; 

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_098 <=  0;
	else rvx_signal_098 <=  rvx_signal_074;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_072 <=  0;
	else	rvx_signal_072 <= 	rvx_signal_023 ? 0 : rvx_signal_072 || (rvx_signal_074 && ~rvx_signal_098); 
end

reg rvx_signal_004; 

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_004 <=  0;
	else rvx_signal_004 <=  rvx_signal_016;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_003 <=  0;
	else rvx_signal_003 <=  rvx_signal_023 ? 0 : rvx_signal_003 || (rvx_signal_016 && ~rvx_signal_004); 
end

reg rvx_signal_066; 

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_066 <=  0;
	else rvx_signal_066 <=  rvx_signal_052;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_001 <=  0;
	else rvx_signal_001 <=  rvx_signal_023 ? 0 : rvx_signal_001 || (rvx_signal_052 && ~rvx_signal_066); 
end

reg rvx_signal_064; 

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_064 <=  0;
	else rvx_signal_064 <=  rvx_signal_020;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_029 <=  0;
	else rvx_signal_029 <=  rvx_signal_023 ? 0 : rvx_signal_029 || (rvx_signal_020 && ~rvx_signal_064);
end

reg rvx_signal_041;

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_041 <=  1;
	else rvx_signal_041 <=  rvx_signal_101;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_046 <=  1;
	else rvx_signal_046 <=  (rvx_signal_056) ? 0 :  rvx_signal_046 || (rvx_signal_101 && ~rvx_signal_041);
end

reg rvx_signal_085;

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_085 <=  1;
	else rvx_signal_085 <=  rvx_signal_054;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_019 <=  1;
	else rvx_signal_019 <=  (rvx_signal_056) ? 0 : rvx_signal_019 || (rvx_signal_054 && ~rvx_signal_085);
end

reg rvx_signal_093;

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_093 <=  0;
	else rvx_signal_093 <=  rvx_signal_022;
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_027 <=  0;
	else rvx_signal_027 <=  rvx_signal_023 ? 0 : rvx_signal_027 || (rvx_signal_022 && ~rvx_signal_093);
end

always @(posedge rvx_port_11 or posedge rvx_port_03) 
begin
	if (rvx_port_03)
		rvx_signal_024 <=  0;
	else
		if (rvx_signal_013 | ~ (|rvx_signal_024))
  			rvx_signal_024 <=  rvx_signal_075 - 1;               
		else
			rvx_signal_024 <=  rvx_signal_024 - 1;              
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_065 <=  1'b0;
	else
		if (|rvx_signal_075 & ~(|rvx_signal_024))     
			rvx_signal_065 <=  1'b1;
		else
			rvx_signal_065 <=  1'b0;
end

always @(rvx_signal_033)
begin
  case (rvx_signal_033[3:0])
    4'b0000                             : rvx_signal_057 =  95; 
    4'b0100                             : rvx_signal_057 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_057 = 111; 
    4'b1100                             : rvx_signal_057 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_057 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_057 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_057 = 159; 
    4'b1111                             : rvx_signal_057 = 175; 
  endcase 
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
  if (rvx_port_03)
    rvx_signal_061 <=  8'd0;
  else
  if(rvx_signal_046 & rvx_signal_056)  
    rvx_signal_061 <=  rvx_signal_057;
  else
  if (rvx_signal_065 & rvx_signal_061 != 8'b0)  
    rvx_signal_061 <=  rvx_signal_061 - 1;  
end 

assign rvx_signal_100 = ~(|rvx_signal_061);

assign rvx_signal_036  = rvx_signal_089[`UART_IE_RLS] && (rvx_signal_102[`UART_LS_OE] || rvx_signal_102[`UART_LS_PE] || rvx_signal_102[`UART_LS_FE] || rvx_signal_102[`UART_LS_BI]);
assign rvx_signal_048  = rvx_signal_089[`UART_IE_RDA] && (rvx_signal_006 >= {1'b0,rvx_signal_030});
assign rvx_signal_018 = rvx_signal_089[`UART_IE_THRE] && rvx_signal_102[`UART_LS_TFE];
assign rvx_signal_086   = rvx_signal_089[`UART_IE_MS] && (| rvx_signal_034[3:0]);
assign rvx_signal_062   = rvx_signal_089[`UART_IE_RDA] && (rvx_signal_010 == 10'b0) && (|rvx_signal_006);

reg 	 rvx_signal_012;
reg 	 rvx_signal_067;
reg 	 rvx_signal_047;
reg 	 rvx_signal_049;
reg 	 rvx_signal_083;

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_012 <=  0;
	else rvx_signal_012 <=  rvx_signal_036;
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_083 <=  0;
	else rvx_signal_083 <=  rvx_signal_048;
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_067 <=  0;
	else rvx_signal_067 <=  rvx_signal_018;
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_047 <=  0;
	else rvx_signal_047 <=  rvx_signal_086;
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_049 <=  0;
	else rvx_signal_049 <=  rvx_signal_062;
end

wire 	 rvx_signal_008;
wire 	 rvx_signal_078;
wire 	 rvx_signal_042;
wire 	 rvx_signal_080;
wire 	 rvx_signal_097;

assign rvx_signal_097    = rvx_signal_048 & ~rvx_signal_083;
assign rvx_signal_008 	  = rvx_signal_036 & ~rvx_signal_012;
assign rvx_signal_078   = rvx_signal_018 & ~rvx_signal_067;
assign rvx_signal_042 	  = rvx_signal_086 & ~rvx_signal_047;
assign rvx_signal_080 	  = rvx_signal_062 & ~rvx_signal_049;

reg 	rvx_signal_032;
reg		rvx_signal_063;
reg 	rvx_signal_053;
reg 	rvx_signal_025;
reg 	rvx_signal_040;

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_032 <=  0; 
	else 
		rvx_signal_032 <=  rvx_signal_023 ? 0 :  						
							rvx_signal_008 ? 1 :						
							rvx_signal_032 && rvx_signal_089[`UART_IE_RLS];	
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_063 <=  0; 
	else 
		rvx_signal_063 <=  ((rvx_signal_006 == {1'b0,rvx_signal_030}) && rvx_signal_050) ? 0 :  	
							rvx_signal_097 ? 1 :						
							rvx_signal_063 && rvx_signal_089[`UART_IE_RDA];	
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_053 <=  0; 
	else 
		rvx_signal_053 <=  rvx_signal_056 || (rvx_signal_090 & ~rvx_signal_038[`UART_II_IP] & rvx_signal_038[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_078 ? 1 :
							rvx_signal_053 && rvx_signal_089[`UART_IE_THRE];
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_025 <=  0; 
	else 
		rvx_signal_025 <=  rvx_signal_070 ? 0 : 
							rvx_signal_042 ? 1 :
							rvx_signal_025 && rvx_signal_089[`UART_IE_MS];
end

always  @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03) rvx_signal_040 <=  0; 
	else 
		rvx_signal_040 <=  rvx_signal_050 ? 0 : 
							rvx_signal_080 ? 1 :
							rvx_signal_040 && rvx_signal_089[`UART_IE_RDA];
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)	
		rvx_port_05 <=  1'b0;
	else
		rvx_port_05 <= rvx_signal_032? ~rvx_signal_023 : (rvx_signal_063? 1 : (rvx_signal_040? ~rvx_signal_050 : (rvx_signal_053? !(rvx_signal_056 & rvx_signal_090) : (rvx_signal_025? ~rvx_signal_070 : 0))));
end

always @(posedge rvx_port_11 or posedge rvx_port_03)
begin
	if (rvx_port_03)
		rvx_signal_038 <=  1;
	else
	if (rvx_signal_032)  
	begin
		rvx_signal_038[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_038[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_048)
	begin
		rvx_signal_038[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_038[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_040)
	begin
		rvx_signal_038[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_038[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_053)
	begin
		rvx_signal_038[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_038[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_025)
	begin
		rvx_signal_038[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_038[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_038[`UART_II_II] <=  0;
		rvx_signal_038[`UART_II_IP] <=  1'b1;
	end
end

endmodule

