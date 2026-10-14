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
// 2026-10-14
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "ervp_uart_defines.vh"




module RVX_MODULE_098 (
	rvx_port_08, 
	rvx_port_05,
	rvx_port_00, 
	rvx_port_01, 
	rvx_port_11, 
	rvx_port_13, 
	rvx_port_02, 

	rvx_port_06, 
	rvx_port_12,

	rvx_port_10,
	rvx_port_04, 
	rvx_port_07, 
	rvx_port_09, 
	rvx_port_03

	);




`include "rvx_include_17.vh"

input wire rvx_port_08;
input wire rvx_port_05;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_00;
input wire [7:0] rvx_port_01;
output reg [7:0] rvx_port_11;
input wire rvx_port_13;
input wire rvx_port_02;

output wire rvx_port_06;
input wire rvx_port_12;

input wire [3:0] rvx_port_10;
output wire rvx_port_04;
output wire rvx_port_07;
output reg rvx_port_09;
output wire rvx_port_03;

reg						rvx_signal_087;

reg 					rvx_signal_028;

assign rvx_port_03 = rvx_signal_028; 

wire 					rvx_signal_055;

reg 	[3:0] 			rvx_signal_038;
reg 	[3:0] 			rvx_signal_030;
reg 	[1:0] 			rvx_signal_063;  
reg 	[4:0] 			rvx_signal_060;
reg 	[7:0] 			rvx_signal_048;
reg 	[7:0] 			rvx_signal_047;
reg 	[15:0]			rvx_signal_090;  
reg 	[7:0] 			rvx_signal_021; 
reg 					rvx_signal_077; 
reg 					rvx_signal_040; 
reg 					rvx_signal_086; 
reg 	[15:0] 			rvx_signal_019;  

reg		 [3:0] 			rvx_signal_093; 
reg 					rvx_signal_053;
reg 					rvx_signal_056;

wire 					rvx_signal_051;			   
wire 					rvx_signal_002, rvx_signal_027, rvx_signal_061, rvx_signal_050; 
wire 					rvx_signal_065;		   
wire 					rvx_signal_017, rvx_signal_023, rvx_signal_003, rvx_signal_049;	   
wire                    rvx_signal_071, rvx_signal_068, rvx_signal_101, rvx_signal_088; 

wire [7:0] 				rvx_signal_081;
wire 					rvx_signal_036, rvx_signal_097, rvx_signal_094, rvx_signal_012, rvx_signal_000, rvx_signal_035, rvx_signal_095, rvx_signal_070;
reg						rvx_signal_084, rvx_signal_085, rvx_signal_022, rvx_signal_099, rvx_signal_089, rvx_signal_066, rvx_signal_009, rvx_signal_045;
wire 					rvx_signal_044; 

reg						rvx_signal_100, rvx_signal_011;

wire 					rvx_signal_067;  
wire 					rvx_signal_098;  
wire 					rvx_signal_076;   
wire					rvx_signal_041; 
wire 					rvx_signal_013;   

reg 					rvx_signal_006;
reg		[7:0]			rvx_signal_042;
reg 					rvx_signal_083;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_026;
wire 								rvx_signal_091; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_079;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_043;
wire [2:0] 				rvx_signal_078;
wire [3:0] 				rvx_signal_001;
wire [9:0] 				rvx_signal_032;

wire					rvx_signal_064; 
reg  	[7:0]			rvx_signal_010;   
reg  	[7:0]			rvx_signal_069; 

wire					rvx_signal_008;
wire					rvx_signal_059;

wire rvx_signal_034;

assign rvx_signal_081[7:0] = { rvx_signal_045, rvx_signal_009, rvx_signal_066, rvx_signal_089, rvx_signal_099, rvx_signal_022, rvx_signal_085, rvx_signal_084 };

assign {rvx_signal_002, rvx_signal_027, rvx_signal_061, rvx_signal_050} = rvx_port_10;
assign {rvx_signal_017, rvx_signal_023, rvx_signal_003, rvx_signal_049} = ~{rvx_signal_002,rvx_signal_027,rvx_signal_061,rvx_signal_050};

assign {rvx_signal_071, rvx_signal_068, rvx_signal_101, rvx_signal_088} = rvx_signal_065 ? {rvx_signal_060[`UART_MC_RTS],rvx_signal_060[`UART_MC_DTR],rvx_signal_060[`UART_MC_OUT1],rvx_signal_060[`UART_MC_OUT2]} :	{rvx_signal_002,rvx_signal_027,rvx_signal_061,rvx_signal_050};

assign rvx_signal_051 = rvx_signal_048[`UART_LC_DL];
assign rvx_signal_065 = rvx_signal_060[4];

assign rvx_port_04 = rvx_signal_060[`UART_MC_RTS];
assign rvx_port_07 = rvx_signal_060[`UART_MC_DTR];

RVX_MODULE_113 i_rvx_instance_1(
	.rvx_port_10(rvx_port_08), 
	.rvx_port_05(rvx_port_05), 
	.rvx_port_01(rvx_signal_048), 
	.rvx_port_00(rvx_signal_006), 
	.rvx_port_04(rvx_signal_042), 
	.rvx_port_09(rvx_signal_028), 
	.rvx_port_02(rvx_signal_034), 
	.rvx_port_06(rvx_signal_078), 
	.rvx_port_07(rvx_signal_043), 
	.rvx_port_08(rvx_signal_056), 
	.rvx_port_03(rvx_signal_044)
);

always @ (posedge rvx_port_08 or posedge rvx_port_05)
begin
	if (rvx_port_08) begin
		rvx_signal_100 <= 1'b1;
		rvx_signal_011 <= 1'b1;
	end
	else begin
		rvx_signal_100 <= rvx_port_12;    
		rvx_signal_011 <= rvx_signal_100;    
	end
end

assign rvx_signal_055 = (rvx_signal_087 == 0) ? 1'b1 : rvx_signal_011;

wire 	serial_in	= rvx_signal_065 ? rvx_signal_034 : rvx_signal_055;
assign	rvx_port_06 	= (rvx_signal_065 || (rvx_signal_087 == 0)) ? 1'b1 : rvx_signal_034;

RVX_MODULE_035 i_rvx_instance_0(
	.rvx_port_07(rvx_port_08), 
	.rvx_port_01(rvx_port_05), 
	.rvx_port_05(rvx_signal_048), 
	.rvx_port_09(rvx_signal_083), 
	.rvx_port_02(serial_in), 
	.rvx_port_06(rvx_signal_028), 
	.rvx_port_10(rvx_signal_032), 
	.rvx_port_12(rvx_signal_079), 
	.rvx_port_13(rvx_signal_026), 
	.rvx_port_04(rvx_signal_091), 
	.rvx_port_14(rvx_signal_008), 
	.rvx_port_00(rvx_signal_053), 
	.rvx_port_11(rvx_signal_044), 
	.rvx_port_03(rvx_signal_001), 
	.rvx_port_08(rvx_signal_059)
);

always @*
begin
	case (rvx_port_00)
	`UART_REG_RB   	: rvx_port_11 = rvx_signal_051 ? rvx_signal_090[7:0] : rvx_signal_026[10:3];
	`UART_REG_IE	: rvx_port_11 = rvx_signal_051 ? rvx_signal_090[15:8] : rvx_signal_038;
	`UART_REG_II	: rvx_port_11 = {4'b1100,rvx_signal_030};
	`UART_REG_LC	: rvx_port_11 = rvx_signal_048;
	`UART_REG_LS	: rvx_port_11 = rvx_signal_081;
	`UART_REG_MS	: rvx_port_11 = rvx_signal_047;
	`UART_REG_SR	: rvx_port_11 = rvx_signal_021;
	`UART_REG_EN	: rvx_port_11 = {7'b0, rvx_signal_087};
	`UART_REG_TC	: rvx_port_11 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_043};
	default			: rvx_port_11 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_08 or posedge rvx_port_05)
begin
	if (rvx_port_08) begin
		rvx_signal_087 <=  0; 
	end
	else begin
		if(rvx_port_13 && (rvx_port_00==`UART_REG_EN)) begin
			rvx_signal_087 <= rvx_port_01[0];
		end
	end
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_083 <=  0; 
	else
	if (rvx_signal_083)	
		rvx_signal_083 <=  0;
	else
	if (rvx_port_02 && (rvx_port_00 == `UART_REG_RB) && !rvx_signal_051)
		rvx_signal_083 <=  1; 
end

wire 	rvx_signal_096;
wire 	rvx_signal_072;
wire  	rvx_signal_075;
wire	rvx_signal_039;
wire	rvx_signal_031;

assign rvx_signal_096 = (rvx_port_02 && (rvx_port_00 == `UART_REG_LS) && !rvx_signal_051);
assign rvx_signal_072 	= (rvx_port_02 && (rvx_port_00 == `UART_REG_II) && !rvx_signal_051);
assign rvx_signal_075 	= (rvx_port_02 && (rvx_port_00 == `UART_REG_MS) && !rvx_signal_051);
assign rvx_signal_039 	= (rvx_port_02 && (rvx_port_00 == `UART_REG_RB) && !rvx_signal_051);
assign rvx_signal_031 	= (rvx_port_13 && (rvx_port_00 == `UART_REG_TR) && !rvx_signal_051);

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_040 <=  0;
	else 
		rvx_signal_040 <=  rvx_signal_096;
end

assign rvx_signal_044 = rvx_signal_096 && ~rvx_signal_040;

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_086 <=  1;
	else
	if (rvx_signal_086)
		rvx_signal_086 <=  0;
	else
	if (rvx_signal_075)
		rvx_signal_086 <=  1; 
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_048 <=  8'b00000011; 
	else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_LC))
		rvx_signal_048 <=  rvx_port_01;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
	begin
		rvx_signal_038 <=  4'b0000; 
		rvx_signal_090[15:8] <=  8'b0;
	end
	else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_IE))
		if (rvx_signal_051)
		begin
			rvx_signal_090[15:8] <=  rvx_port_01;
		end
		else
			rvx_signal_038 <=  rvx_port_01[3:0]; 
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) begin
		rvx_signal_063 <=  2'b11; 
		rvx_signal_053 <=  0;
		rvx_signal_056 <=  0;
	end else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_FC)) begin
		rvx_signal_063 <=  rvx_port_01[7:6];
		rvx_signal_053 <=  rvx_port_01[1];
		rvx_signal_056 <=  rvx_port_01[2];
	end else begin
		rvx_signal_053 <=  0;
		rvx_signal_056 <=  0;
	end
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_060 <=  5'b0; 
	else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_MC))
			rvx_signal_060 <=  rvx_port_01[4:0];
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_021 <=  0; 
	else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_SR))
		rvx_signal_021 <=  rvx_port_01;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
	begin
		rvx_signal_090[7:0]  	<=  8'b0;
		rvx_signal_006   	<=  1'b0;
		rvx_signal_077 	<=  1'b0;
		rvx_signal_042	<= 0;
	end
	else
	if (rvx_port_13 && (rvx_port_00==`UART_REG_TR))
		if (rvx_signal_051)
		begin
			rvx_signal_090[7:0] <=  rvx_port_01;
			rvx_signal_077 <=  1'b1; 
			rvx_signal_006 <=  1'b0;
		end
		else
		begin
			rvx_signal_006   <=  1'b1;
			rvx_signal_077 <=  1'b0;
			rvx_signal_042 <= rvx_port_01;
		end 
	else
	begin
		rvx_signal_077 <=  1'b0;
		rvx_signal_006   <=  1'b0;
	end 
end

always @(rvx_signal_063)
begin
	case (rvx_signal_063[`UART_FC_TL])
		2'b00 : rvx_signal_093 = 1;
		2'b01 : rvx_signal_093 = 4;
		2'b10 : rvx_signal_093 = 8;
		2'b11 : rvx_signal_093 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_080;
always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
	  begin
  		rvx_signal_047 <=  0;
	  	rvx_signal_080[3:0] <=  0;
	  end
	else begin
		rvx_signal_047[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_086 ? 4'b0 :
			rvx_signal_047[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_049, rvx_signal_003, rvx_signal_023, rvx_signal_017} ^ rvx_signal_080[3:0]);
		rvx_signal_047[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_088, rvx_signal_101, rvx_signal_068, rvx_signal_071};
		rvx_signal_080[3:0] <=  {rvx_signal_049, rvx_signal_003, rvx_signal_023, rvx_signal_017};
	end
end

assign rvx_signal_036 = (rvx_signal_079==0 && rvx_signal_059);  
assign rvx_signal_097 = rvx_signal_008;     
assign rvx_signal_094 = rvx_signal_026[1]; 
assign rvx_signal_012 = rvx_signal_026[0]; 
assign rvx_signal_000 = rvx_signal_026[2]; 
assign rvx_signal_035 = ((rvx_signal_043==5'b0) && rvx_signal_064);  
assign rvx_signal_095 = ((rvx_signal_043==5'b0) && rvx_signal_064 && (rvx_signal_078 ==  0)); 
assign rvx_signal_070 = rvx_signal_091 | rvx_signal_008;

reg 	 rvx_signal_033;

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_033 <=  0;
	else rvx_signal_033 <=  rvx_signal_036;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_084 <=  0;
	else rvx_signal_084 <=  (rvx_signal_079==1 && rvx_signal_083 && !rvx_signal_059 || rvx_signal_053) ? 0 : 
					  rvx_signal_084 || (rvx_signal_036 && ~rvx_signal_033); 
end

reg rvx_signal_015; 

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_015 <=  0;
	else rvx_signal_015 <=  rvx_signal_097;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_085 <=  0;
	else	rvx_signal_085 <= 	rvx_signal_044 ? 0 : rvx_signal_085 || (rvx_signal_097 && ~rvx_signal_015); 
end

reg rvx_signal_082; 

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_082 <=  0;
	else rvx_signal_082 <=  rvx_signal_094;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_022 <=  0;
	else rvx_signal_022 <=  rvx_signal_044 ? 0 : rvx_signal_022 || (rvx_signal_094 && ~rvx_signal_082); 
end

reg rvx_signal_102; 

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_102 <=  0;
	else rvx_signal_102 <=  rvx_signal_012;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_099 <=  0;
	else rvx_signal_099 <=  rvx_signal_044 ? 0 : rvx_signal_099 || (rvx_signal_012 && ~rvx_signal_102); 
end

reg rvx_signal_037; 

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_037 <=  0;
	else rvx_signal_037 <=  rvx_signal_000;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_089 <=  0;
	else rvx_signal_089 <=  rvx_signal_044 ? 0 : rvx_signal_089 || (rvx_signal_000 && ~rvx_signal_037);
end

reg rvx_signal_073;

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_073 <=  1;
	else rvx_signal_073 <=  rvx_signal_035;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_066 <=  1;
	else rvx_signal_066 <=  (rvx_signal_031) ? 0 :  rvx_signal_066 || (rvx_signal_035 && ~rvx_signal_073);
end

reg rvx_signal_020;

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_020 <=  1;
	else rvx_signal_020 <=  rvx_signal_095;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_009 <=  1;
	else rvx_signal_009 <=  (rvx_signal_031) ? 0 : rvx_signal_009 || (rvx_signal_095 && ~rvx_signal_020);
end

reg rvx_signal_004;

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_004 <=  0;
	else rvx_signal_004 <=  rvx_signal_070;
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_045 <=  0;
	else rvx_signal_045 <=  rvx_signal_044 ? 0 : rvx_signal_045 || (rvx_signal_070 && ~rvx_signal_004);
end

always @(posedge rvx_port_05 or posedge rvx_port_08) 
begin
	if (rvx_port_08)
		rvx_signal_019 <=  0;
	else
		if (rvx_signal_077 | ~ (|rvx_signal_019))
  			rvx_signal_019 <=  rvx_signal_090 - 1;               
		else
			rvx_signal_019 <=  rvx_signal_019 - 1;              
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_028 <=  1'b0;
	else
		if (|rvx_signal_090 & ~(|rvx_signal_019))     
			rvx_signal_028 <=  1'b1;
		else
			rvx_signal_028 <=  1'b0;
end

always @(rvx_signal_048)
begin
  case (rvx_signal_048[3:0])
    4'b0000                             : rvx_signal_069 =  95; 
    4'b0100                             : rvx_signal_069 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_069 = 111; 
    4'b1100                             : rvx_signal_069 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_069 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_069 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_069 = 159; 
    4'b1111                             : rvx_signal_069 = 175; 
  endcase 
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
  if (rvx_port_08)
    rvx_signal_010 <=  8'd0;
  else
  if(rvx_signal_066 & rvx_signal_031)  
    rvx_signal_010 <=  rvx_signal_069;
  else
  if (rvx_signal_028 & rvx_signal_010 != 8'b0)  
    rvx_signal_010 <=  rvx_signal_010 - 1;  
end 

assign rvx_signal_064 = ~(|rvx_signal_010);

assign rvx_signal_067  = rvx_signal_038[`UART_IE_RLS] && (rvx_signal_081[`UART_LS_OE] || rvx_signal_081[`UART_LS_PE] || rvx_signal_081[`UART_LS_FE] || rvx_signal_081[`UART_LS_BI]);
assign rvx_signal_098  = rvx_signal_038[`UART_IE_RDA] && (rvx_signal_079 >= {1'b0,rvx_signal_093});
assign rvx_signal_041 = rvx_signal_038[`UART_IE_THRE] && rvx_signal_081[`UART_LS_TFE];
assign rvx_signal_013   = rvx_signal_038[`UART_IE_MS] && (| rvx_signal_047[3:0]);
assign rvx_signal_076   = rvx_signal_038[`UART_IE_RDA] && (rvx_signal_032 == 10'b0) && (|rvx_signal_079);

reg 	 rvx_signal_074;
reg 	 rvx_signal_024;
reg 	 rvx_signal_016;
reg 	 rvx_signal_058;
reg 	 rvx_signal_062;

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_074 <=  0;
	else rvx_signal_074 <=  rvx_signal_067;
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_062 <=  0;
	else rvx_signal_062 <=  rvx_signal_098;
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_024 <=  0;
	else rvx_signal_024 <=  rvx_signal_041;
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_016 <=  0;
	else rvx_signal_016 <=  rvx_signal_013;
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_058 <=  0;
	else rvx_signal_058 <=  rvx_signal_076;
end

wire 	 rvx_signal_007;
wire 	 rvx_signal_025;
wire 	 rvx_signal_052;
wire 	 rvx_signal_092;
wire 	 rvx_signal_046;

assign rvx_signal_046    = rvx_signal_098 & ~rvx_signal_062;
assign rvx_signal_007 	  = rvx_signal_067 & ~rvx_signal_074;
assign rvx_signal_025   = rvx_signal_041 & ~rvx_signal_024;
assign rvx_signal_052 	  = rvx_signal_013 & ~rvx_signal_016;
assign rvx_signal_092 	  = rvx_signal_076 & ~rvx_signal_058;

reg 	rvx_signal_018;
reg		rvx_signal_057;
reg 	rvx_signal_014;
reg 	rvx_signal_005;
reg 	rvx_signal_029;

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_018 <=  0; 
	else 
		rvx_signal_018 <=  rvx_signal_044 ? 0 :  						
							rvx_signal_007 ? 1 :						
							rvx_signal_018 && rvx_signal_038[`UART_IE_RLS];	
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_057 <=  0; 
	else 
		rvx_signal_057 <=  ((rvx_signal_079 == {1'b0,rvx_signal_093}) && rvx_signal_039) ? 0 :  	
							rvx_signal_046 ? 1 :						
							rvx_signal_057 && rvx_signal_038[`UART_IE_RDA];	
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_014 <=  0; 
	else 
		rvx_signal_014 <=  rvx_signal_031 || (rvx_signal_072 & ~rvx_signal_030[`UART_II_IP] & rvx_signal_030[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_025 ? 1 :
							rvx_signal_014 && rvx_signal_038[`UART_IE_THRE];
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_005 <=  0; 
	else 
		rvx_signal_005 <=  rvx_signal_075 ? 0 : 
							rvx_signal_052 ? 1 :
							rvx_signal_005 && rvx_signal_038[`UART_IE_MS];
end

always  @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08) rvx_signal_029 <=  0; 
	else 
		rvx_signal_029 <=  rvx_signal_039 ? 0 : 
							rvx_signal_092 ? 1 :
							rvx_signal_029 && rvx_signal_038[`UART_IE_RDA];
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)	
		rvx_port_09 <=  1'b0;
	else
		rvx_port_09 <= rvx_signal_018? ~rvx_signal_044 : (rvx_signal_057? 1 : (rvx_signal_029? ~rvx_signal_039 : (rvx_signal_014? !(rvx_signal_031 & rvx_signal_072) : (rvx_signal_005? ~rvx_signal_075 : 0))));
end

always @(posedge rvx_port_05 or posedge rvx_port_08)
begin
	if (rvx_port_08)
		rvx_signal_030 <=  1;
	else
	if (rvx_signal_018)  
	begin
		rvx_signal_030[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_030[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_098)
	begin
		rvx_signal_030[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_030[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_029)
	begin
		rvx_signal_030[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_030[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_014)
	begin
		rvx_signal_030[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_030[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_005)
	begin
		rvx_signal_030[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_030[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_030[`UART_II_II] <=  0;
		rvx_signal_030[`UART_II_IP] <=  1'b1;
	end
end

endmodule

