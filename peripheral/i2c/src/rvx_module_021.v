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


`include "i2c_master_defines.v"





module RVX_MODULE_021(

	rvx_port_16, 
        rvx_port_07,
        rvx_port_06,

        rvx_port_13,
        rvx_port_00,
        rvx_port_11,
        rvx_port_15,
        rvx_port_04,
        rvx_port_03,
        rvx_port_12,
        rvx_port_08,
        
        rvx_port_01,
        rvx_port_10,
        rvx_port_09,
        rvx_port_05,
        rvx_port_14,
        rvx_port_02
);





	
	parameter RVX_GPARA_0 = 1'b0; 

	
	
	
	
	input        rvx_port_16;     
	input        rvx_port_07;     
        output       rvx_port_06;    

        input wire rvx_port_13;
        input wire rvx_port_00;
        input wire [7:0] rvx_port_11;
        input wire rvx_port_15;
        input wire [7:0] rvx_port_04;
        output reg [7:0] rvx_port_03;
        output reg rvx_port_12;
        output wire rvx_port_08;

	
	
	reg rvx_port_06;

	
	
	input  rvx_port_01;       
	output rvx_port_10;       
	output rvx_port_09;    

	
	input  rvx_port_05;       
	output rvx_port_14;       
	output rvx_port_02;    

	
	
	

	
	reg  [15:0] rvx_signal_17; 
	reg  [ 7:0] rvx_signal_02;  
	reg  [ 7:0] rvx_signal_09;  
	wire [ 7:0] rvx_signal_15;  
	reg  [ 7:0] rvx_signal_20;   
	wire [ 7:0] rvx_signal_19;   

	
	wire rvx_signal_10;

	
	wire rvx_signal_21;
	wire rvx_signal_00;

	
	wire rvx_signal_14;
	reg  rvx_signal_05;       
	reg  rvx_signal_16;         
	reg  rvx_signal_13;    
	wire rvx_signal_18;    
	wire rvx_signal_04;      
	reg  rvx_signal_12;          

	
	
	

	
	

	
	
	wire wb_wacc =  rvx_port_15 & rvx_port_13 & rvx_port_00;
	wire wb_racc =  ~rvx_port_15 & rvx_port_13 & rvx_port_00;

	
	
	

        always @(posedge rvx_port_16 or negedge rvx_port_07)
        begin
        if(!rvx_port_07)
         rvx_port_12 <= 1'b0;
        else
         rvx_port_12  <= (rvx_port_13 & ~rvx_port_00);
        end

	
	
	always @(*)
	begin
          
	  case (rvx_port_11) 
	    
	    8'h00:  rvx_port_03 =  rvx_signal_17[ 7:0];
	    8'h04:  rvx_port_03 =  rvx_signal_17[15:8];
	    8'h08:  rvx_port_03 =  rvx_signal_02;
	    8'h0c:  rvx_port_03 =  rvx_signal_15; 
	    8'h10:  rvx_port_03 =  rvx_signal_19;  
	    8'h14:  rvx_port_03 =  rvx_signal_09;
	    8'h18:  rvx_port_03 =  rvx_signal_20;
	    8'h1c:  rvx_port_03 =  0;   
            default:  rvx_port_03 =  0;
	  endcase
        
        
	end
       

	
	always @(posedge rvx_port_16 or negedge rvx_port_07)
	  if (!rvx_port_07)
	    begin
	        rvx_signal_17 <= 16'hffff;
	        rvx_signal_02  <=  8'h0;
	        rvx_signal_09  <=  8'h0;
	    end
	  else
	    if (wb_wacc)
	      
	      case (rvx_port_11) 
	         
	         8'h00 : rvx_signal_17 [ 7:0] <=  rvx_port_04;
	         8'h04 : rvx_signal_17 [15:8] <=  rvx_port_04;
	         8'h08 : rvx_signal_02         <=  rvx_port_04;
	         8'h0c : rvx_signal_09         <=  rvx_port_04;
	         default: ;
	      endcase

	
	always @(posedge rvx_port_16 or negedge rvx_port_07)
	  if (!rvx_port_07)
	    rvx_signal_20 <=  8'h0;
	  else if (wb_wacc)
	    begin
	        
	        if (rvx_signal_21 & (rvx_port_11 == 8'h10) )
	          
	          rvx_signal_20 <=  rvx_port_04;
	    end
	  else
	    begin
	        if (rvx_signal_10 | rvx_signal_04)
	          rvx_signal_20[7:4] <=  4'h0;           
	                                        
	        rvx_signal_20[2:1] <=  2'b0;             
	        rvx_signal_20[0]   <=  1'b0;             
	    end

	
	wire sta  = rvx_signal_20[7];
	wire sto  = rvx_signal_20[6];
	wire rd   = rvx_signal_20[5];
	wire wr   = rvx_signal_20[4];
	wire ack  = rvx_signal_20[3];
	wire iack = rvx_signal_20[0];

	
	assign rvx_signal_21 = rvx_signal_02[7];
	assign rvx_signal_00 = rvx_signal_02[6];

	
	RVX_MODULE_104 i_rvx_instance_0 (
		.rvx_port_16( rvx_port_16     ),
		.rvx_port_10( rvx_port_07     ),
		.rvx_port_00( rvx_signal_21      ),
		.rvx_port_09( rvx_signal_17         ),
		.rvx_port_04( sta          ),
		.rvx_port_17( sto          ),
		.rvx_port_03( rd           ),
		.rvx_port_02( wr           ),
		.rvx_port_07( ack          ),
		.rvx_port_18( rvx_signal_09          ),
		.rvx_port_13( rvx_signal_10         ),
		.rvx_port_05( rvx_signal_14       ),
		.rvx_port_12( rvx_signal_15          ),
		.rvx_port_19( rvx_signal_18     ),
		.rvx_port_15( rvx_signal_04       ),
		.rvx_port_01( rvx_port_01    ),
		.rvx_port_11( rvx_port_10    ),
		.rvx_port_06( rvx_port_09 ),
		.rvx_port_14( rvx_port_05    ),
		.rvx_port_08( rvx_port_14    ),
		.rvx_port_20( rvx_port_02 )
	);

	
	always @(posedge rvx_port_16 or negedge rvx_port_07)
	  if (!rvx_port_07)
	    begin
	        rvx_signal_12       <= 1'b0;
	        rvx_signal_05    <= 1'b0;
	        rvx_signal_16      <= 1'b0;
	        rvx_signal_13 <= 1'b0;
	    end
	  else
	    begin
	        rvx_signal_12       <= rvx_signal_04 | (rvx_signal_12 & ~sta);
	        rvx_signal_05    <= rvx_signal_14;
	        rvx_signal_16      <= (rd | wr);
	        rvx_signal_13 <= (rvx_signal_10 | rvx_signal_04 | rvx_signal_13) & ~iack; 
	    end

	
	always @(posedge rvx_port_16 or negedge rvx_port_07)
	  if (!rvx_port_07)
	    rvx_port_06 <= 1'b0;
	  else
	    rvx_port_06 <= rvx_signal_13 && rvx_signal_00; 

	
	assign rvx_signal_19[7]   = rvx_signal_05;
	assign rvx_signal_19[6]   = rvx_signal_18;
	assign rvx_signal_19[5]   = rvx_signal_12;
	assign rvx_signal_19[4:2] = 3'h0; 
	assign rvx_signal_19[1]   = rvx_signal_16;
	assign rvx_signal_19[0]   = rvx_signal_13;

        assign rvx_port_08 = 1'b0;
endmodule
