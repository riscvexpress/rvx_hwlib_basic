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


`include "ervp_uart_defines.vh"




module RVX_MODULE_054 (
	rvx_port_09, 
	rvx_port_07,
	rvx_port_06, 
	rvx_port_11, 
	rvx_port_05, 
	rvx_port_04, 
	rvx_port_12, 

	rvx_port_02, 
	rvx_port_10,

	rvx_port_03,
	rvx_port_13, 
	rvx_port_01, 
	rvx_port_08, 
	rvx_port_00

	);




`include "rvx_include_03.vh"

input wire rvx_port_09;
input wire rvx_port_07;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_06;
input wire [7:0] rvx_port_11;
output reg [7:0] rvx_port_05;
input wire rvx_port_04;
input wire rvx_port_12;

output wire rvx_port_02;
input wire rvx_port_10;

input wire [3:0] rvx_port_03;
output wire rvx_port_13;
output wire rvx_port_01;
output reg rvx_port_08;
output wire rvx_port_00;

reg						rvx_signal_087;

reg 					rvx_signal_089;

assign rvx_port_00 = rvx_signal_089; 

wire 					rvx_signal_099;

reg 	[3:0] 			rvx_signal_084;
reg 	[3:0] 			rvx_signal_066;
reg 	[1:0] 			rvx_signal_093;  
reg 	[4:0] 			rvx_signal_049;
reg 	[7:0] 			rvx_signal_003;
reg 	[7:0] 			rvx_signal_002;
reg 	[15:0]			rvx_signal_073;  
reg 	[7:0] 			rvx_signal_063; 
reg 					rvx_signal_078; 
reg 					rvx_signal_008; 
reg 					rvx_signal_004; 
reg 	[15:0] 			rvx_signal_026;  

reg		 [3:0] 			rvx_signal_060; 
reg 					rvx_signal_091;
reg 					rvx_signal_032;

wire 					rvx_signal_041;			   
wire 					rvx_signal_080, rvx_signal_012, rvx_signal_045, rvx_signal_010; 
wire 					rvx_signal_016;		   
wire 					rvx_signal_058, rvx_signal_094, rvx_signal_092, rvx_signal_035;	   
wire                    rvx_signal_044, rvx_signal_055, rvx_signal_095, rvx_signal_082; 

wire [7:0] 				rvx_signal_011;
wire 					rvx_signal_031, rvx_signal_019, rvx_signal_043, rvx_signal_061, rvx_signal_047, rvx_signal_018, rvx_signal_056, rvx_signal_050;
reg						rvx_signal_006, rvx_signal_034, rvx_signal_000, rvx_signal_100, rvx_signal_051, rvx_signal_017, rvx_signal_086, rvx_signal_020;
wire 					rvx_signal_005; 

reg						rvx_signal_042, rvx_signal_102;

wire 					rvx_signal_059;  
wire 					rvx_signal_030;  
wire 					rvx_signal_033;   
wire					rvx_signal_022; 
wire 					rvx_signal_096;   

reg 					rvx_signal_068;
reg		[7:0]			rvx_signal_053;
reg 					rvx_signal_007;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_071;
wire 								rvx_signal_039; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_021;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_052;
wire [2:0] 				rvx_signal_028;
wire [3:0] 				rvx_signal_074;
wire [9:0] 				rvx_signal_057;

wire					rvx_signal_098; 
reg  	[7:0]			rvx_signal_097;   
reg  	[7:0]			rvx_signal_048; 

wire					rvx_signal_027;
wire					rvx_signal_076;

wire rvx_signal_067;

assign rvx_signal_011[7:0] = { rvx_signal_020, rvx_signal_086, rvx_signal_017, rvx_signal_051, rvx_signal_100, rvx_signal_000, rvx_signal_034, rvx_signal_006 };

assign {rvx_signal_080, rvx_signal_012, rvx_signal_045, rvx_signal_010} = rvx_port_03;
assign {rvx_signal_058, rvx_signal_094, rvx_signal_092, rvx_signal_035} = ~{rvx_signal_080,rvx_signal_012,rvx_signal_045,rvx_signal_010};

assign {rvx_signal_044, rvx_signal_055, rvx_signal_095, rvx_signal_082} = rvx_signal_016 ? {rvx_signal_049[`UART_MC_RTS],rvx_signal_049[`UART_MC_DTR],rvx_signal_049[`UART_MC_OUT1],rvx_signal_049[`UART_MC_OUT2]} :	{rvx_signal_080,rvx_signal_012,rvx_signal_045,rvx_signal_010};

assign rvx_signal_041 = rvx_signal_003[`UART_LC_DL];
assign rvx_signal_016 = rvx_signal_049[4];

assign rvx_port_13 = rvx_signal_049[`UART_MC_RTS];
assign rvx_port_01 = rvx_signal_049[`UART_MC_DTR];

RVX_MODULE_006 i_rvx_instance_1(
	.rvx_port_05(rvx_port_09), 
	.rvx_port_02(rvx_port_07), 
	.rvx_port_08(rvx_signal_003), 
	.rvx_port_06(rvx_signal_068), 
	.rvx_port_09(rvx_signal_053), 
	.rvx_port_01(rvx_signal_089), 
	.rvx_port_07(rvx_signal_067), 
	.rvx_port_03(rvx_signal_028), 
	.rvx_port_00(rvx_signal_052), 
	.rvx_port_04(rvx_signal_032), 
	.rvx_port_10(rvx_signal_005)
);

always @ (posedge rvx_port_09 or posedge rvx_port_07)
begin
	if (rvx_port_09) begin
		rvx_signal_042 <= 1'b1;
		rvx_signal_102 <= 1'b1;
	end
	else begin
		rvx_signal_042 <= rvx_port_10;    
		rvx_signal_102 <= rvx_signal_042;    
	end
end

assign rvx_signal_099 = (rvx_signal_087 == 0) ? 1'b1 : rvx_signal_102;

wire 	serial_in	= rvx_signal_016 ? rvx_signal_067 : rvx_signal_099;
assign	rvx_port_02 	= (rvx_signal_016 || (rvx_signal_087 == 0)) ? 1'b1 : rvx_signal_067;

RVX_MODULE_094 i_rvx_instance_0(
	.rvx_port_00(rvx_port_09), 
	.rvx_port_13(rvx_port_07), 
	.rvx_port_02(rvx_signal_003), 
	.rvx_port_04(rvx_signal_007), 
	.rvx_port_05(serial_in), 
	.rvx_port_11(rvx_signal_089), 
	.rvx_port_01(rvx_signal_057), 
	.rvx_port_14(rvx_signal_021), 
	.rvx_port_09(rvx_signal_071), 
	.rvx_port_08(rvx_signal_039), 
	.rvx_port_10(rvx_signal_027), 
	.rvx_port_12(rvx_signal_091), 
	.rvx_port_07(rvx_signal_005), 
	.rvx_port_03(rvx_signal_074), 
	.rvx_port_06(rvx_signal_076)
);

always @*
begin
	case (rvx_port_06)
	`UART_REG_RB   	: rvx_port_05 = rvx_signal_041 ? rvx_signal_073[7:0] : rvx_signal_071[10:3];
	`UART_REG_IE	: rvx_port_05 = rvx_signal_041 ? rvx_signal_073[15:8] : rvx_signal_084;
	`UART_REG_II	: rvx_port_05 = {4'b1100,rvx_signal_066};
	`UART_REG_LC	: rvx_port_05 = rvx_signal_003;
	`UART_REG_LS	: rvx_port_05 = rvx_signal_011;
	`UART_REG_MS	: rvx_port_05 = rvx_signal_002;
	`UART_REG_SR	: rvx_port_05 = rvx_signal_063;
	`UART_REG_EN	: rvx_port_05 = {7'b0, rvx_signal_087};
	`UART_REG_TC	: rvx_port_05 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_052};
	default			: rvx_port_05 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_09 or posedge rvx_port_07)
begin
	if (rvx_port_09) begin
		rvx_signal_087 <=  0; 
	end
	else begin
		if(rvx_port_04 && (rvx_port_06==`UART_REG_EN)) begin
			rvx_signal_087 <= rvx_port_11[0];
		end
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_007 <=  0; 
	else
	if (rvx_signal_007)	
		rvx_signal_007 <=  0;
	else
	if (rvx_port_12 && (rvx_port_06 == `UART_REG_RB) && !rvx_signal_041)
		rvx_signal_007 <=  1; 
end

wire 	rvx_signal_001;
wire 	rvx_signal_040;
wire  	rvx_signal_090;
wire	rvx_signal_037;
wire	rvx_signal_077;

assign rvx_signal_001 = (rvx_port_12 && (rvx_port_06 == `UART_REG_LS) && !rvx_signal_041);
assign rvx_signal_040 	= (rvx_port_12 && (rvx_port_06 == `UART_REG_II) && !rvx_signal_041);
assign rvx_signal_090 	= (rvx_port_12 && (rvx_port_06 == `UART_REG_MS) && !rvx_signal_041);
assign rvx_signal_037 	= (rvx_port_12 && (rvx_port_06 == `UART_REG_RB) && !rvx_signal_041);
assign rvx_signal_077 	= (rvx_port_04 && (rvx_port_06 == `UART_REG_TR) && !rvx_signal_041);

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_008 <=  0;
	else 
		rvx_signal_008 <=  rvx_signal_001;
end

assign rvx_signal_005 = rvx_signal_001 && ~rvx_signal_008;

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_004 <=  1;
	else
	if (rvx_signal_004)
		rvx_signal_004 <=  0;
	else
	if (rvx_signal_090)
		rvx_signal_004 <=  1; 
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_003 <=  8'b00000011; 
	else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_LC))
		rvx_signal_003 <=  rvx_port_11;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	begin
		rvx_signal_084 <=  4'b0000; 
		rvx_signal_073[15:8] <=  8'b0;
	end
	else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_IE))
		if (rvx_signal_041)
		begin
			rvx_signal_073[15:8] <=  rvx_port_11;
		end
		else
			rvx_signal_084 <=  rvx_port_11[3:0]; 
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) begin
		rvx_signal_093 <=  2'b11; 
		rvx_signal_091 <=  0;
		rvx_signal_032 <=  0;
	end else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_FC)) begin
		rvx_signal_093 <=  rvx_port_11[7:6];
		rvx_signal_091 <=  rvx_port_11[1];
		rvx_signal_032 <=  rvx_port_11[2];
	end else begin
		rvx_signal_091 <=  0;
		rvx_signal_032 <=  0;
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_049 <=  5'b0; 
	else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_MC))
			rvx_signal_049 <=  rvx_port_11[4:0];
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_063 <=  0; 
	else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_SR))
		rvx_signal_063 <=  rvx_port_11;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	begin
		rvx_signal_073[7:0]  	<=  8'b0;
		rvx_signal_068   	<=  1'b0;
		rvx_signal_078 	<=  1'b0;
		rvx_signal_053	<= 0;
	end
	else
	if (rvx_port_04 && (rvx_port_06==`UART_REG_TR))
		if (rvx_signal_041)
		begin
			rvx_signal_073[7:0] <=  rvx_port_11;
			rvx_signal_078 <=  1'b1; 
			rvx_signal_068 <=  1'b0;
		end
		else
		begin
			rvx_signal_068   <=  1'b1;
			rvx_signal_078 <=  1'b0;
			rvx_signal_053 <= rvx_port_11;
		end 
	else
	begin
		rvx_signal_078 <=  1'b0;
		rvx_signal_068   <=  1'b0;
	end 
end

always @(rvx_signal_093)
begin
	case (rvx_signal_093[`UART_FC_TL])
		2'b00 : rvx_signal_060 = 1;
		2'b01 : rvx_signal_060 = 4;
		2'b10 : rvx_signal_060 = 8;
		2'b11 : rvx_signal_060 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_085;
always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
	  begin
  		rvx_signal_002 <=  0;
	  	rvx_signal_085[3:0] <=  0;
	  end
	else begin
		rvx_signal_002[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_004 ? 4'b0 :
			rvx_signal_002[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_035, rvx_signal_092, rvx_signal_094, rvx_signal_058} ^ rvx_signal_085[3:0]);
		rvx_signal_002[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_082, rvx_signal_095, rvx_signal_055, rvx_signal_044};
		rvx_signal_085[3:0] <=  {rvx_signal_035, rvx_signal_092, rvx_signal_094, rvx_signal_058};
	end
end

assign rvx_signal_031 = (rvx_signal_021==0 && rvx_signal_076);  
assign rvx_signal_019 = rvx_signal_027;     
assign rvx_signal_043 = rvx_signal_071[1]; 
assign rvx_signal_061 = rvx_signal_071[0]; 
assign rvx_signal_047 = rvx_signal_071[2]; 
assign rvx_signal_018 = ((rvx_signal_052==5'b0) && rvx_signal_098);  
assign rvx_signal_056 = ((rvx_signal_052==5'b0) && rvx_signal_098 && (rvx_signal_028 ==  0)); 
assign rvx_signal_050 = rvx_signal_039 | rvx_signal_027;

reg 	 rvx_signal_069;

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_069 <=  0;
	else rvx_signal_069 <=  rvx_signal_031;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_006 <=  0;
	else rvx_signal_006 <=  (rvx_signal_021==1 && rvx_signal_007 && !rvx_signal_076 || rvx_signal_091) ? 0 : 
					  rvx_signal_006 || (rvx_signal_031 && ~rvx_signal_069); 
end

reg rvx_signal_101; 

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_101 <=  0;
	else rvx_signal_101 <=  rvx_signal_019;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_034 <=  0;
	else	rvx_signal_034 <= 	rvx_signal_005 ? 0 : rvx_signal_034 || (rvx_signal_019 && ~rvx_signal_101); 
end

reg rvx_signal_054; 

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_054 <=  0;
	else rvx_signal_054 <=  rvx_signal_043;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_000 <=  0;
	else rvx_signal_000 <=  rvx_signal_005 ? 0 : rvx_signal_000 || (rvx_signal_043 && ~rvx_signal_054); 
end

reg rvx_signal_038; 

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_038 <=  0;
	else rvx_signal_038 <=  rvx_signal_061;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_100 <=  0;
	else rvx_signal_100 <=  rvx_signal_005 ? 0 : rvx_signal_100 || (rvx_signal_061 && ~rvx_signal_038); 
end

reg rvx_signal_023; 

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_023 <=  0;
	else rvx_signal_023 <=  rvx_signal_047;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_051 <=  0;
	else rvx_signal_051 <=  rvx_signal_005 ? 0 : rvx_signal_051 || (rvx_signal_047 && ~rvx_signal_023);
end

reg rvx_signal_079;

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_079 <=  1;
	else rvx_signal_079 <=  rvx_signal_018;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_017 <=  1;
	else rvx_signal_017 <=  (rvx_signal_077) ? 0 :  rvx_signal_017 || (rvx_signal_018 && ~rvx_signal_079);
end

reg rvx_signal_025;

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_025 <=  1;
	else rvx_signal_025 <=  rvx_signal_056;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_086 <=  1;
	else rvx_signal_086 <=  (rvx_signal_077) ? 0 : rvx_signal_086 || (rvx_signal_056 && ~rvx_signal_025);
end

reg rvx_signal_081;

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_081 <=  0;
	else rvx_signal_081 <=  rvx_signal_050;
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_020 <=  0;
	else rvx_signal_020 <=  rvx_signal_005 ? 0 : rvx_signal_020 || (rvx_signal_050 && ~rvx_signal_081);
end

always @(posedge rvx_port_07 or posedge rvx_port_09) 
begin
	if (rvx_port_09)
		rvx_signal_026 <=  0;
	else
		if (rvx_signal_078 | ~ (|rvx_signal_026))
  			rvx_signal_026 <=  rvx_signal_073 - 1;               
		else
			rvx_signal_026 <=  rvx_signal_026 - 1;              
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_089 <=  1'b0;
	else
		if (|rvx_signal_073 & ~(|rvx_signal_026))     
			rvx_signal_089 <=  1'b1;
		else
			rvx_signal_089 <=  1'b0;
end

always @(rvx_signal_003)
begin
  case (rvx_signal_003[3:0])
    4'b0000                             : rvx_signal_048 =  95; 
    4'b0100                             : rvx_signal_048 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_048 = 111; 
    4'b1100                             : rvx_signal_048 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_048 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_048 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_048 = 159; 
    4'b1111                             : rvx_signal_048 = 175; 
  endcase 
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
  if (rvx_port_09)
    rvx_signal_097 <=  8'd0;
  else
  if(rvx_signal_017 & rvx_signal_077)  
    rvx_signal_097 <=  rvx_signal_048;
  else
  if (rvx_signal_089 & rvx_signal_097 != 8'b0)  
    rvx_signal_097 <=  rvx_signal_097 - 1;  
end 

assign rvx_signal_098 = ~(|rvx_signal_097);

assign rvx_signal_059  = rvx_signal_084[`UART_IE_RLS] && (rvx_signal_011[`UART_LS_OE] || rvx_signal_011[`UART_LS_PE] || rvx_signal_011[`UART_LS_FE] || rvx_signal_011[`UART_LS_BI]);
assign rvx_signal_030  = rvx_signal_084[`UART_IE_RDA] && (rvx_signal_021 >= {1'b0,rvx_signal_060});
assign rvx_signal_022 = rvx_signal_084[`UART_IE_THRE] && rvx_signal_011[`UART_LS_TFE];
assign rvx_signal_096   = rvx_signal_084[`UART_IE_MS] && (| rvx_signal_002[3:0]);
assign rvx_signal_033   = rvx_signal_084[`UART_IE_RDA] && (rvx_signal_057 == 10'b0) && (|rvx_signal_021);

reg 	 rvx_signal_070;
reg 	 rvx_signal_046;
reg 	 rvx_signal_009;
reg 	 rvx_signal_014;
reg 	 rvx_signal_064;

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_070 <=  0;
	else rvx_signal_070 <=  rvx_signal_059;
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_064 <=  0;
	else rvx_signal_064 <=  rvx_signal_030;
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_046 <=  0;
	else rvx_signal_046 <=  rvx_signal_022;
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_009 <=  0;
	else rvx_signal_009 <=  rvx_signal_096;
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_014 <=  0;
	else rvx_signal_014 <=  rvx_signal_033;
end

wire 	 rvx_signal_015;
wire 	 rvx_signal_083;
wire 	 rvx_signal_062;
wire 	 rvx_signal_036;
wire 	 rvx_signal_075;

assign rvx_signal_075    = rvx_signal_030 & ~rvx_signal_064;
assign rvx_signal_015 	  = rvx_signal_059 & ~rvx_signal_070;
assign rvx_signal_083   = rvx_signal_022 & ~rvx_signal_046;
assign rvx_signal_062 	  = rvx_signal_096 & ~rvx_signal_009;
assign rvx_signal_036 	  = rvx_signal_033 & ~rvx_signal_014;

reg 	rvx_signal_072;
reg		rvx_signal_065;
reg 	rvx_signal_029;
reg 	rvx_signal_024;
reg 	rvx_signal_013;

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_072 <=  0; 
	else 
		rvx_signal_072 <=  rvx_signal_005 ? 0 :  						
							rvx_signal_015 ? 1 :						
							rvx_signal_072 && rvx_signal_084[`UART_IE_RLS];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_065 <=  0; 
	else 
		rvx_signal_065 <=  ((rvx_signal_021 == {1'b0,rvx_signal_060}) && rvx_signal_037) ? 0 :  	
							rvx_signal_075 ? 1 :						
							rvx_signal_065 && rvx_signal_084[`UART_IE_RDA];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_029 <=  0; 
	else 
		rvx_signal_029 <=  rvx_signal_077 || (rvx_signal_040 & ~rvx_signal_066[`UART_II_IP] & rvx_signal_066[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_083 ? 1 :
							rvx_signal_029 && rvx_signal_084[`UART_IE_THRE];
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_024 <=  0; 
	else 
		rvx_signal_024 <=  rvx_signal_090 ? 0 : 
							rvx_signal_062 ? 1 :
							rvx_signal_024 && rvx_signal_084[`UART_IE_MS];
end

always  @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09) rvx_signal_013 <=  0; 
	else 
		rvx_signal_013 <=  rvx_signal_037 ? 0 : 
							rvx_signal_036 ? 1 :
							rvx_signal_013 && rvx_signal_084[`UART_IE_RDA];
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)	
		rvx_port_08 <=  1'b0;
	else
		rvx_port_08 <= rvx_signal_072? ~rvx_signal_005 : (rvx_signal_065? 1 : (rvx_signal_013? ~rvx_signal_037 : (rvx_signal_029? !(rvx_signal_077 & rvx_signal_040) : (rvx_signal_024? ~rvx_signal_090 : 0))));
end

always @(posedge rvx_port_07 or posedge rvx_port_09)
begin
	if (rvx_port_09)
		rvx_signal_066 <=  1;
	else
	if (rvx_signal_072)  
	begin
		rvx_signal_066[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_066[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_030)
	begin
		rvx_signal_066[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_066[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_013)
	begin
		rvx_signal_066[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_066[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_029)
	begin
		rvx_signal_066[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_066[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_024)
	begin
		rvx_signal_066[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_066[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_066[`UART_II_II] <=  0;
		rvx_signal_066[`UART_II_IP] <=  1'b1;
	end
end

endmodule

