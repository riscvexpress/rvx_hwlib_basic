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
// 2026-10-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`default_nettype wire
`include "timescale.vh"


module I2C_SLAVE_MODEL (scl, sda);


	
	
	
	parameter I2C_ADR = 7'h10;

	
	
	
	input scl;
	inout sda;

	
	
	
	wire debug = 1'b1;

	reg [7:0] rvx_signal_07 [3:0]; 
	reg [7:0] rvx_signal_17;   
	reg [7:0] rvx_signal_14;    

	reg rvx_signal_09, rvx_signal_15;
	reg rvx_signal_10, rvx_signal_13;

	reg [7:0] rvx_signal_01;        
	reg       rvx_signal_06;        

	wire      rvx_signal_03;    
	wire      rvx_signal_08; 
	reg [2:0] rvx_signal_11;   
	wire      rvx_signal_19;  
	reg       rvx_signal_04;        

	reg       rvx_signal_05;     
	wire      rvx_signal_00;   

	
	parameter idle        = 3'b000;
	parameter slave_ack   = 3'b001;
	parameter get_mem_adr = 3'b010;
	parameter gma_ack     = 3'b011;
	parameter data        = 3'b100;
	parameter data_ack    = 3'b101;

	reg [2:0] rvx_signal_16; 

initial
begin
 rvx_signal_07[0] = 0;
 rvx_signal_07[1] = 0;
 rvx_signal_07[2] = 0;
 rvx_signal_07[3] = 0;
end
	
	
	

	initial
	begin
	   rvx_signal_05 = 1'b1;
	   rvx_signal_16 = idle;
	end

	
	always @(posedge scl)
	  rvx_signal_01 <= #1 {rvx_signal_01[6:0],sda};

	
	assign rvx_signal_03 = (rvx_signal_01[7:1] == I2C_ADR);
	
	

	
	always @(posedge scl)
	  if(rvx_signal_04)
	    rvx_signal_11 <= #1 3'b111;
	  else
	    rvx_signal_11 <= #1 rvx_signal_11 - 3'h1;

	
	assign rvx_signal_19 = !(|rvx_signal_11);

	
	
	
	
	
	
	assign #1 rvx_signal_00 = sda;

	
	always @(negedge sda)
	  if(scl)
	    begin
	        rvx_signal_09   <= #1 1'b1;
		rvx_signal_15 <= #1 1'b0;
		rvx_signal_10   <= #1 1'b0;

	        if(debug)
	          $display("DEBUG i2c_slave; start condition detected at %t", $time);
	    end
	  else
	    rvx_signal_09 <= #1 1'b0;

	always @(posedge scl)
	  rvx_signal_15 <= #1 rvx_signal_09;

	
	always @(posedge sda)
	  if(scl)
	    begin
	       rvx_signal_09 <= #1 1'b0;
	       rvx_signal_10 <= #1 1'b1;

	       if(debug)
	         $display("DEBUG i2c_slave; stop condition detected at %t", $time);
	    end
	  else
	    rvx_signal_10 <= #1 1'b0;

	
	assign rvx_signal_08 = rvx_signal_09 || rvx_signal_10;

	
	always @(negedge scl or posedge rvx_signal_10)
	  if (rvx_signal_10 || (rvx_signal_09 && !rvx_signal_15) )
	    begin
	        rvx_signal_16 <= #1 idle; 

	        rvx_signal_05 <= #1 1'b1;
	        rvx_signal_04    <= #1 1'b1;
	    end
	  else
	    begin
	        
	        rvx_signal_05 <= #1 1'b1;
	        rvx_signal_04    <= #1 1'b0;

	        case(rvx_signal_16) 
	            idle: 
	              if (rvx_signal_19 && rvx_signal_03)
	                begin
	                    rvx_signal_16 <= #1 slave_ack;
	                    rvx_signal_06 <= #1 rvx_signal_01[0];
	                    rvx_signal_05 <= #1 1'b0; 

	                    #2;
	                    if(debug && rvx_signal_06)
	                      $display("DEBUG i2c_slave; command byte received (read) at %t", $time);
	                    if(debug && !rvx_signal_06)
	                      $display("DEBUG i2c_slave; command byte received (write) at %t", $time);

	                    if(rvx_signal_06)
	                      begin
	                          rvx_signal_14 <= #1 rvx_signal_07[rvx_signal_17];

	                          if(debug)
	                            begin
	                                #2 $display("DEBUG i2c_slave; data block read %x from address %x (1)", rvx_signal_14, rvx_signal_17);
	                                #2 $display("DEBUG i2c_slave; memcheck [0]=%x, [1]=%x, [2]=%x", rvx_signal_07[4'h0], rvx_signal_07[4'h1], rvx_signal_07[4'h2]);
	                            end
	                      end
	                end

	            slave_ack:
	              begin
	                  if(rvx_signal_06)
	                    begin
	                        rvx_signal_16 <= #1 data;
	                        rvx_signal_05 <= #1 rvx_signal_14[7];
	                    end
	                  else
	                    rvx_signal_16 <= #1 get_mem_adr;

	                  rvx_signal_04    <= #1 1'b1;
	              end

	            get_mem_adr: 
	              if(rvx_signal_19)
	                begin
	                    rvx_signal_16 <= #1 gma_ack;
	                    rvx_signal_17 <= #1 rvx_signal_01; 
	                    rvx_signal_05 <= #1 !(rvx_signal_01 <= 15); 

	                    if(debug)
	                      #1 $display("DEBUG i2c_slave; address received. adr=%x, ack=%b", rvx_signal_01, rvx_signal_05);
	                end

	            gma_ack:
	              begin
	                  rvx_signal_16 <= #1 data;
	                  rvx_signal_04    <= #1 1'b1;
	              end

	            data: 
	              begin
	                  if(rvx_signal_06)
	                    rvx_signal_05 <= #1 rvx_signal_14[7];

	                  if(rvx_signal_19)
	                    begin
	                        rvx_signal_16 <= #1 data_ack;
	                        rvx_signal_17 <= #2 rvx_signal_17 + 8'h1;
	                        rvx_signal_05 <= #1 (rvx_signal_06 && (rvx_signal_17 <= 15) ); 

	                        if(rvx_signal_06)
	                          begin
	                              #3 rvx_signal_14 <= rvx_signal_07[rvx_signal_17];

	                              if(debug)
	                                #5 $display("DEBUG i2c_slave; data block read %x from address %x (2)", rvx_signal_14, rvx_signal_17);
	                          end

	                        if(!rvx_signal_06)
	                          begin
	                              rvx_signal_07[ rvx_signal_17[3:0] ] <= #1 rvx_signal_01; 

	                              if(debug)
	                                #2 $display("DEBUG i2c_slave; data block write %x to address %x", rvx_signal_01, rvx_signal_17);
	                          end
	                    end
	              end

	            data_ack:
	              begin
	                  rvx_signal_04 <= #1 1'b1;

	                  if(rvx_signal_06)
	                    if(rvx_signal_01[0]) 
	                      begin
	                          rvx_signal_16 <= #1 idle;
	                          rvx_signal_05 <= #1 1'b1;
	                      end
	                    else
	                      begin
	                          rvx_signal_16 <= #1 data;
	                          rvx_signal_05 <= #1 rvx_signal_14[7];
	                      end
	                  else
	                    begin
	                        rvx_signal_16 <= #1 data;
	                        rvx_signal_05 <= #1 1'b1;
	                    end
	              end

	        endcase
	    end

	
	always @(posedge scl)
	  if(!rvx_signal_19 && rvx_signal_06)
	    rvx_signal_14 <= #1 {rvx_signal_14[6:0], 1'b1}; 

	
	assign sda = rvx_signal_05 ? 1'bz : 1'b0;

	
	
	

	wire tst_sto = rvx_signal_10;
	wire tst_sta = rvx_signal_09;

	specify
	  specparam normal_scl_low  = 4700,
	            normal_scl_high = 4000,
	            normal_tsu_sta  = 4700,
	            normal_thd_sta  = 4000,
	            normal_tsu_sto  = 4000,
	            normal_tbuf     = 4700,

	            fast_scl_low  = 1300,
	            fast_scl_high =  600,
	            fast_tsu_sta  = 1300,
	            fast_thd_sta  =  600,
	            fast_tsu_sto  =  600,
	            fast_tbuf     = 1300;

	  $width(negedge scl, normal_scl_low);  
	  $width(posedge scl, normal_scl_high); 

	  $setup(posedge scl, negedge sda &&& scl, normal_tsu_sta); 
	  $setup(negedge sda &&& scl, negedge scl, normal_thd_sta); 
	  $setup(posedge scl, posedge sda &&& scl, normal_tsu_sto); 

	  $setup(posedge tst_sta, posedge tst_sto, normal_tbuf); 
	endspecify

endmodule

