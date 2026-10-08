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

`include "ervp_global.vh"




module RVX_MODULE_090
(
  rvx_port_2,
  rvx_port_5,

  rvx_port_3,
  rvx_port_1,
  rvx_port_4,
  rvx_port_6,
  rvx_port_0
);




parameter RVX_GPARA_1 = 4;
parameter RVX_GPARA_2 = 8;
parameter RVX_GPARA_0 = 16;

input wire rvx_port_2, rvx_port_5;

input wire [RVX_GPARA_1-1:0] rvx_port_3;
input wire rvx_port_1;
input wire rvx_port_4;

output wire rvx_port_6;
output wire [RVX_GPARA_0-1:0] rvx_port_0;

localparam  RVX_LPARA_0 = RVX_GPARA_2 + 1;

reg [RVX_LPARA_0-1:0] rvx_signal_0;
wire [RVX_LPARA_0-1:0] rvx_signal_3;
reg [RVX_GPARA_1-1:0] rvx_signal_1;

wire rvx_signal_4;
wire rvx_signal_5;
wire rvx_signal_2;

assign rvx_signal_4 = (rvx_signal_0==0);
assign rvx_signal_5 = (rvx_port_3==rvx_signal_1);
assign rvx_signal_2 = rvx_signal_0[RVX_LPARA_0-1];

always@(posedge rvx_port_2, negedge rvx_port_5)
begin
  if(rvx_port_5==0)
  begin
    rvx_signal_0 <= 0;
    rvx_signal_1 <= 0;
  end
  else if(~rvx_signal_2)
  begin
    if(rvx_signal_4)
    begin
      if(rvx_port_1 || rvx_port_4)
      begin
        rvx_signal_0 <= rvx_signal_3;
        rvx_signal_1 <= rvx_port_3;
      end
    end
    else if(rvx_signal_5)
    begin
      if(rvx_port_1 || rvx_port_4)
      begin
        rvx_signal_0 <= rvx_signal_3;
      end
    end
  end
end

assign rvx_signal_3 = rvx_port_1? (rvx_signal_0 + 2'b 01) : (rvx_signal_0 - 2'b 01);
assign rvx_port_6 = rvx_signal_4 || rvx_signal_5;
assign rvx_port_0 = {rvx_signal_1, rvx_signal_4};

endmodule
