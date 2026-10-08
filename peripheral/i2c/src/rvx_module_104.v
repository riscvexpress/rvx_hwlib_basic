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




module RVX_MODULE_104 (
	rvx_port_16, rvx_port_10, rvx_port_00, rvx_port_09, rvx_port_04, rvx_port_17, rvx_port_03, rvx_port_02, rvx_port_07, rvx_port_18,
	rvx_port_13, rvx_port_05, rvx_port_12, rvx_port_19, rvx_port_15, rvx_port_01, rvx_port_11, rvx_port_06, rvx_port_14, rvx_port_08, rvx_port_20 );




	
	
	
	input rvx_port_16;     
	input rvx_port_10;   
	input rvx_port_00;     

	input [15:0] rvx_port_09; 

	
	input       rvx_port_04;
	input       rvx_port_17;
	input       rvx_port_03;
	input       rvx_port_02;
	input       rvx_port_07;
	input [7:0] rvx_port_18;

	
	output       rvx_port_13;
	reg rvx_port_13;
	output       rvx_port_05;
	reg rvx_port_05;
	output       rvx_port_19;
	output       rvx_port_15;
	output [7:0] rvx_port_12;

	
	input  rvx_port_01;
	output rvx_port_11;
	output rvx_port_06;
	input  rvx_port_14;
	output rvx_port_08;
	output rvx_port_20;

	
	
	

	
	parameter [4:0] ST_IDLE  = 5'b0_0000;
	parameter [4:0] ST_START = 5'b0_0001;
	parameter [4:0] ST_READ  = 5'b0_0010;
	parameter [4:0] ST_WRITE = 5'b0_0100;
	parameter [4:0] ST_ACK   = 5'b0_1000;
	parameter [4:0] ST_STOP  = 5'b1_0000;

	
	reg  [3:0] rvx_signal_05;
	reg        rvx_signal_07;
	wire       rvx_signal_10, rvx_signal_00;

	
	reg [7:0] rvx_signal_02; 
	reg       rvx_signal_04, rvx_signal_08;

	
	wire       rvx_signal_01;
	reg  [2:0] rvx_signal_09;
	wire       rvx_signal_06;

	
	
	

	
	RVX_MODULE_110 i_rvx_instance_0 (
		.rvx_port_14( rvx_port_16      ),
		.rvx_port_13( rvx_port_10   ),
		.rvx_port_12( rvx_port_00      ),
		.rvx_port_10( rvx_port_09  ),
		.rvx_port_09( rvx_signal_05 ),
		.rvx_port_07( rvx_signal_10 ),
		.rvx_port_05( rvx_port_19 ),
		.rvx_port_00( rvx_port_15   ),
		.rvx_port_01( rvx_signal_07 ),
		.rvx_port_15( rvx_signal_00 ),
		.rvx_port_02( rvx_port_01    ),
		.rvx_port_06( rvx_port_11    ),
		.rvx_port_04( rvx_port_06  ),
		.rvx_port_11( rvx_port_14    ),
		.rvx_port_08( rvx_port_08    ),
		.rvx_port_03( rvx_port_20  )
	);

	
	assign rvx_signal_01 = (rvx_port_03 | rvx_port_02 | rvx_port_17) & ~rvx_port_13;

	
	assign rvx_port_12 = rvx_signal_02;

	
	always @(posedge rvx_port_16 or negedge rvx_port_10)
	  if (!rvx_port_10)
	    rvx_signal_02 <= 8'h0;
	  else if (rvx_signal_08)
	    rvx_signal_02 <= rvx_port_18;
	  else if (rvx_signal_04)
	    rvx_signal_02 <= {rvx_signal_02[6:0], rvx_signal_00};

	
	always @(posedge rvx_port_16 or negedge rvx_port_10)
	  if (!rvx_port_10)
	    rvx_signal_09 <= 3'h0;
	  else if (rvx_signal_08)
	    rvx_signal_09 <= 3'h7;
	  else if (rvx_signal_04)
	    rvx_signal_09 <= rvx_signal_09 - 3'h1;

	assign rvx_signal_06 = ~(|rvx_signal_09);

	
	
	
	reg [4:0] rvx_signal_03;

	always @(posedge rvx_port_16 or negedge rvx_port_10)
	  if (!rvx_port_10)
	    begin
	        rvx_signal_05 <= `I2C_CMD_NOP;
	        rvx_signal_07 <= 1'b0;
	        rvx_signal_04    <= 1'b0;
	        rvx_signal_08       <= 1'b0;
	        rvx_port_13  <= 1'b0;
	        rvx_signal_03  <= ST_IDLE;
	        rvx_port_05  <= 1'b0;
	    end
	  else if (rvx_port_15)
	   begin
	       rvx_signal_05 <= `I2C_CMD_NOP;
	       rvx_signal_07 <= 1'b0;
	       rvx_signal_04    <= 1'b0;
	       rvx_signal_08       <= 1'b0;
	       rvx_port_13  <= 1'b0;
	       rvx_signal_03  <= ST_IDLE;
	       rvx_port_05  <= 1'b0;
	   end
	else
	  begin
	      
	      rvx_signal_07 <= rvx_signal_02[7];
	      rvx_signal_04    <= 1'b0;
	      rvx_signal_08       <= 1'b0;
	      rvx_port_13  <= 1'b0;

	      case (rvx_signal_03) 
	        ST_IDLE:
	          if (rvx_signal_01)
	            begin
	                if (rvx_port_04)
	                  begin
	                      rvx_signal_03  <= ST_START;
	                      rvx_signal_05 <= `I2C_CMD_START;
	                  end
	                else if (rvx_port_03)
	                  begin
	                      rvx_signal_03  <= ST_READ;
	                      rvx_signal_05 <= `I2C_CMD_READ;
	                  end
	                else if (rvx_port_02)
	                  begin
	                      rvx_signal_03  <= ST_WRITE;
	                      rvx_signal_05 <= `I2C_CMD_WRITE;
	                  end
	                else 
	                  begin
	                      rvx_signal_03  <= ST_STOP;
	                      rvx_signal_05 <= `I2C_CMD_STOP;
	                  end

	                rvx_signal_08 <= 1'b1;
	            end

	        ST_START:
	          if (rvx_signal_10)
	            begin
	                if (rvx_port_03)
	                  begin
	                      rvx_signal_03  <= ST_READ;
	                      rvx_signal_05 <= `I2C_CMD_READ;
	                  end
	                else
	                  begin
	                      rvx_signal_03  <= ST_WRITE;
	                      rvx_signal_05 <= `I2C_CMD_WRITE;
	                  end

	                rvx_signal_08 <= 1'b1;
	            end

	        ST_WRITE:
	          if (rvx_signal_10)
	            if (rvx_signal_06)
	              begin
	                  rvx_signal_03  <= ST_ACK;
	                  rvx_signal_05 <= `I2C_CMD_READ;
	              end
	            else
	              begin
	                  rvx_signal_03  <= ST_WRITE;       
	                  rvx_signal_05 <= `I2C_CMD_WRITE; 
	                  rvx_signal_04    <= 1'b1;
	              end

	        ST_READ:
	          if (rvx_signal_10)
	            begin
	                if (rvx_signal_06)
	                  begin
	                      rvx_signal_03  <= ST_ACK;
	                      rvx_signal_05 <= `I2C_CMD_WRITE;
	                  end
	                else
	                  begin
	                      rvx_signal_03  <= ST_READ;       
	                      rvx_signal_05 <= `I2C_CMD_READ; 
	                  end

	                rvx_signal_04    <= 1'b1;
	                rvx_signal_07 <= rvx_port_07;
	            end

	        ST_ACK:
	          if (rvx_signal_10)
	            begin
	               if (rvx_port_17)
	                 begin
	                     rvx_signal_03  <= ST_STOP;
	                     rvx_signal_05 <= `I2C_CMD_STOP;
	                 end
	               else
	                 begin
	                     rvx_signal_03  <= ST_IDLE;
	                     rvx_signal_05 <= `I2C_CMD_NOP;

	                     
	                     rvx_port_13  <= 1'b1;
	                 end

	                 
	                 rvx_port_05 <= rvx_signal_00;

	                 rvx_signal_07 <= 1'b1;
	             end
	           else
	             rvx_signal_07 <= rvx_port_07;

	        ST_STOP:
	          if (rvx_signal_10)
	            begin
	                rvx_signal_03  <= ST_IDLE;
	                rvx_signal_05 <= `I2C_CMD_NOP;

	                
	                rvx_port_13  <= 1'b1;
	            end

	      endcase
	  end
endmodule
