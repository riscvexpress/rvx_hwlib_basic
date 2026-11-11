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


`include "i2c_master_defines.v"



module RVX_MODULE_072 (
    input             rvx_port_02,      
    input             rvx_port_07,   
    input             rvx_port_06,      

    input      [15:0] rvx_port_01,  

    input      [ 3:0] rvx_port_14,      
    output reg        rvx_port_15,  
    output reg        rvx_port_12,     
    output reg        rvx_port_00,       

    input             rvx_port_11,
    output reg        rvx_port_03,

    input             rvx_port_08,    
    output            rvx_port_10,    
    output reg        rvx_port_04,  
    input             rvx_port_05,    
    output            rvx_port_09,    
    output reg        rvx_port_13   
);



    
    
    

    reg [ 1:0] rvx_signal_17, rvx_signal_12;      
    reg [ 2:0] rvx_signal_09, rvx_signal_05;      
    reg        rvx_signal_07, rvx_signal_14;      
    reg        rvx_signal_02, rvx_signal_08;      
    reg        rvx_signal_16;        
    reg        rvx_signal_15;         
    reg        rvx_signal_01;          
    reg        rvx_signal_10;      
    reg [15:0] rvx_signal_06;             
    reg [13:0] rvx_signal_18;      

    
    reg [17:0] rvx_signal_03;

    
    
    

    
    
    always @(posedge rvx_port_02)
      rvx_signal_16 <= rvx_port_04;

    
    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (!rvx_port_07) rvx_signal_10 <= 1'b0;
      else         rvx_signal_10 <= (rvx_port_04 & ~rvx_signal_16 & ~rvx_signal_07) | (rvx_signal_10 & ~rvx_signal_07);

    
    
    wire scl_sync   = rvx_signal_02 & ~rvx_signal_07 & rvx_port_04;

    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (~rvx_port_07)
      begin
          rvx_signal_06    <= 16'h0;
          rvx_signal_01 <= 1'b1;
      end
      else if ( ~|rvx_signal_06 || !rvx_port_06 || scl_sync)
      begin
          rvx_signal_06    <= rvx_port_01;
          rvx_signal_01 <= 1'b1;
      end
      else if (rvx_signal_10)
      begin
          rvx_signal_06    <= rvx_signal_06;
          rvx_signal_01 <= 1'b0;    
      end
      else
      begin
          rvx_signal_06    <= rvx_signal_06 - 16'h1;
          rvx_signal_01 <= 1'b0;
      end

    

    
    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (!rvx_port_07)
      begin
          rvx_signal_17 <= 2'b00;
          rvx_signal_12 <= 2'b00;
      end
      else
      begin
          rvx_signal_17 <= {rvx_signal_17[0],rvx_port_08};
          rvx_signal_12 <= {rvx_signal_12[0],rvx_port_05};
      end

    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if      (!rvx_port_07     ) rvx_signal_18 <= 14'h0;
      else if (!rvx_port_06 ) rvx_signal_18 <= 14'h0;
      else if (~|rvx_signal_18) rvx_signal_18 <= rvx_port_01 >> 2; 
      else                   rvx_signal_18 <= rvx_signal_18 -1;

    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (!rvx_port_07)
      begin
          rvx_signal_09 <= 3'b111;
          rvx_signal_05 <= 3'b111;
      end
      else if (~|rvx_signal_18)
      begin
          rvx_signal_09 <= {rvx_signal_09[1:0],rvx_signal_17[1]};
          rvx_signal_05 <= {rvx_signal_05[1:0],rvx_signal_12[1]};
      end

    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (~rvx_port_07)
      begin
          rvx_signal_07 <= 1'b1;
          rvx_signal_14 <= 1'b1;

          rvx_signal_02 <= 1'b1;
          rvx_signal_08 <= 1'b1;
      end
      else
      begin
          rvx_signal_07 <= &rvx_signal_09[2:1] | &rvx_signal_09[1:0] | (rvx_signal_09[2] & rvx_signal_09[0]);
          rvx_signal_14 <= &rvx_signal_05[2:1] | &rvx_signal_05[1:0] | (rvx_signal_05[2] & rvx_signal_05[0]);

          rvx_signal_02 <= rvx_signal_07;
          rvx_signal_08 <= rvx_signal_14;
      end

    
    
    reg rvx_signal_04;
    reg rvx_signal_00;
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (~rvx_port_07)
      begin
          rvx_signal_04 <= 1'b0;
          rvx_signal_00 <= 1'b0;
      end
      else
      begin
          rvx_signal_04 <= ~rvx_signal_14 &  rvx_signal_08 & rvx_signal_07;
          rvx_signal_00 <=  rvx_signal_14 & ~rvx_signal_08 & rvx_signal_07;
      end

    
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if      (!rvx_port_07) rvx_port_12 <= 1'b0;
      else              rvx_port_12 <= (rvx_signal_04 | rvx_port_12) & ~rvx_signal_00;

    
    
    
    
    reg rvx_signal_11;
    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (~rvx_port_07)
          rvx_signal_11 <= 1'b0;
      else if (rvx_signal_01)
          rvx_signal_11 <= rvx_port_14 == `I2C_CMD_STOP;

    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (~rvx_port_07)
          rvx_port_00 <= 1'b0;
      else
          rvx_port_00 <= (rvx_signal_15 & ~rvx_signal_14 & rvx_port_13) | (|rvx_signal_03 & rvx_signal_00 & ~rvx_signal_11);

    
    always @(posedge rvx_port_02)
      if (rvx_signal_07 & ~rvx_signal_02) rvx_port_03 <= rvx_signal_14;

    

    
    parameter [17:0] idle    = 18'b0_0000_0000_0000_0000;
    parameter [17:0] start_a = 18'b0_0000_0000_0000_0001;
    parameter [17:0] start_b = 18'b0_0000_0000_0000_0010;
    parameter [17:0] start_c = 18'b0_0000_0000_0000_0100;
    parameter [17:0] start_d = 18'b0_0000_0000_0000_1000;
    parameter [17:0] start_e = 18'b0_0000_0000_0001_0000;
    parameter [17:0] stop_a  = 18'b0_0000_0000_0010_0000;
    parameter [17:0] stop_b  = 18'b0_0000_0000_0100_0000;
    parameter [17:0] stop_c  = 18'b0_0000_0000_1000_0000;
    parameter [17:0] stop_d  = 18'b0_0000_0001_0000_0000;
    parameter [17:0] rd_a    = 18'b0_0000_0010_0000_0000;
    parameter [17:0] rd_b    = 18'b0_0000_0100_0000_0000;
    parameter [17:0] rd_c    = 18'b0_0000_1000_0000_0000;
    parameter [17:0] rd_d    = 18'b0_0001_0000_0000_0000;
    parameter [17:0] wr_a    = 18'b0_0010_0000_0000_0000;
    parameter [17:0] wr_b    = 18'b0_0100_0000_0000_0000;
    parameter [17:0] wr_c    = 18'b0_1000_0000_0000_0000;
    parameter [17:0] wr_d    = 18'b1_0000_0000_0000_0000;

    always @(posedge rvx_port_02 or negedge rvx_port_07)
      if (!rvx_port_07)
      begin
          rvx_signal_03 <= idle;
          rvx_port_15 <= 1'b0;
          rvx_port_04 <= 1'b1;
          rvx_port_13 <= 1'b1;
          rvx_signal_15 <= 1'b0;
      end
      else if ( rvx_port_00)
      begin
          rvx_signal_03 <= idle;
          rvx_port_15 <= 1'b0;
          rvx_port_04 <= 1'b1;
          rvx_port_13 <= 1'b1;
          rvx_signal_15 <= 1'b0;
      end
      else
      begin
          rvx_port_15   <= 1'b0; 

          if (rvx_signal_01)
              case (rvx_signal_03) 
                    
                    idle:
                    begin
                        case (rvx_port_14) 
                             `I2C_CMD_START: rvx_signal_03 <= start_a;
                             `I2C_CMD_STOP:  rvx_signal_03 <= stop_a;
                             `I2C_CMD_WRITE: rvx_signal_03 <= wr_a;
                             `I2C_CMD_READ:  rvx_signal_03 <= rd_a;
                             default:        rvx_signal_03 <= idle;
                        endcase

                        rvx_port_04 <= rvx_port_04; 
                        rvx_port_13 <= rvx_port_13; 
                        rvx_signal_15 <= 1'b0;    
                    end

                    
                    start_a:
                    begin
                        rvx_signal_03 <= start_b;
                        rvx_port_04 <= rvx_port_04; 
                        rvx_port_13 <= 1'b1;    
                        rvx_signal_15 <= 1'b0;    
                    end

                    start_b:
                    begin
                        rvx_signal_03 <= start_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    start_c:
                    begin
                        rvx_signal_03 <= start_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    start_d:
                    begin
                        rvx_signal_03 <= start_e;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    start_e:
                    begin
                        rvx_signal_03 <= idle;
                        rvx_port_15 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    
                    stop_a:
                    begin
                        rvx_signal_03 <= stop_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    stop_b:
                    begin
                        rvx_signal_03 <= stop_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    stop_c:
                    begin
                        rvx_signal_03 <= stop_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b0; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    stop_d:
                    begin
                        rvx_signal_03 <= idle;
                        rvx_port_15 <= 1'b1;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    
                    rd_a:
                    begin
                        rvx_signal_03 <= rd_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    rd_b:
                    begin
                        rvx_signal_03 <= rd_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    rd_c:
                    begin
                        rvx_signal_03 <= rd_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    rd_d:
                    begin
                        rvx_signal_03 <= idle;
                        rvx_port_15 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= 1'b1; 
                        rvx_signal_15 <= 1'b0; 
                    end

                    
                    wr_a:
                    begin
                        rvx_signal_03 <= wr_b;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= rvx_port_11;  
                        rvx_signal_15 <= 1'b0; 
                    end

                    wr_b:
                    begin
                        rvx_signal_03 <= wr_c;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= rvx_port_11;  
                        rvx_signal_15 <= 1'b0; 
                                            
                    end

                    wr_c:
                    begin
                        rvx_signal_03 <= wr_d;
                        rvx_port_04 <= 1'b1; 
                        rvx_port_13 <= rvx_port_11;
                        rvx_signal_15 <= 1'b1; 
                    end

                    wr_d:
                    begin
                        rvx_signal_03 <= idle;
                        rvx_port_15 <= 1'b1;
                        rvx_port_04 <= 1'b0; 
                        rvx_port_13 <= rvx_port_11;
                        rvx_signal_15 <= 1'b0; 
                    end

              endcase
      end

    
    assign rvx_port_10 = 1'b0;
    assign rvx_port_09 = 1'b0;

endmodule
