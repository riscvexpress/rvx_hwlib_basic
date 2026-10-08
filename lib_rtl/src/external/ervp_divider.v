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



module ERVP_DIVIDER
(
   clk,
   rstnn,
   enable,
   busy,

   start,
   is_unsigned,
   numerator,
   denominator,
   quotient,
   remainder
);



parameter BW_DATA = 32;
parameter BW_PART = 8;

input wire clk;
input wire rstnn;
input wire enable;
output wire busy;

input wire start;

input wire is_unsigned;
input wire [BW_DATA-1:0] numerator;
input wire [BW_DATA-1:0] denominator;
output wire [BW_DATA-1:0] quotient;
output wire [BW_DATA-1:0] remainder;

genvar i;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_2 = REQUIRED_BITWIDTH_INDEX(BW_DATA);
localparam  RVX_LPARA_4 = REQUIRED_BITWIDTH_UNSIGNED(BW_PART*3);

localparam  RVX_LPARA_3 = 1;
localparam  RVX_LPARA_5 = 0;
localparam  RVX_LPARA_1 = 1;

reg [RVX_LPARA_3-1:0] rvx_signal_22;
reg  rvx_signal_18;
reg  rvx_signal_29;
reg [BW_DATA-1:0] rvx_signal_04;
reg [BW_DATA-1:0] rvx_signal_24;
reg [BW_DATA-1:0] rvx_signal_12;
reg [BW_DATA-1:0] rvx_signal_14;
reg [RVX_LPARA_2-1:0] rvx_signal_08;

wire [BW_DATA*2-1:0] rvx_signal_20;
wire [BW_DATA-1:0] rvx_signal_00;
wire [BW_DATA-1:0] rvx_signal_07;
wire [RVX_LPARA_2-1:0] rvx_signal_28;

reg [RVX_LPARA_4-1:0] rvx_signal_05;

wire [BW_DATA-1:0] rvx_signal_13;
wire [BW_DATA-1:0] rvx_signal_27;
wire rvx_signal_09;
wire rvx_signal_21;

localparam  RVX_LPARA_0 = 4;

wire [RVX_LPARA_0-1:0] rvx_signal_03;
wire [RVX_LPARA_0-1:0] rvx_signal_01;

wire rvx_signal_25;
wire rvx_signal_17;
reg  rvx_signal_06;
wire rvx_signal_15;

wire [BW_DATA-1:0] rvx_signal_10;

wire [BW_DATA+1-1:0] rvx_signal_23;
wire rvx_signal_26;
wire [BW_DATA+1-1:0] rvx_signal_31;
wire [BW_DATA-1:0] rvx_signal_02;

wire rvx_signal_30;
wire rvx_signal_16;
wire [RVX_LPARA_2-1:0] rvx_signal_11;
wire rvx_signal_19;

assign rvx_signal_10[BW_DATA-1] = 1;
assign rvx_signal_10[BW_DATA-1-1:0] = 0;

assign rvx_signal_25 = (denominator==0);
assign rvx_signal_17 = (~is_unsigned) & (numerator==rvx_signal_10) & ($signed(denominator)==(-1));

assign rvx_signal_09 = (~is_unsigned) & numerator[BW_DATA-1];
assign rvx_signal_21 = (~is_unsigned) & denominator[BW_DATA-1];

assign rvx_signal_13 = (rvx_signal_09==0)? numerator : ((~numerator)+1);
assign rvx_signal_27 = (rvx_signal_21==0)? denominator : ((~denominator)+1);

generate
for(i=0; i<RVX_LPARA_0; i=i+1)
begin : i_gen_property
  assign rvx_signal_03[i] = (i==(RVX_LPARA_0-1))? (rvx_signal_13[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_13[(i+1)*BW_PART-1-:BW_PART]!=0);
  assign rvx_signal_01[i] = (i==(RVX_LPARA_0-1))? (rvx_signal_27[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_27[(i+1)*BW_PART-1-:BW_PART]!=0);
end
endgenerate

assign rvx_signal_20 = rvx_signal_13;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(BW_DATA*2),
  .BW_SHIFT_AMOUNT(RVX_LPARA_4),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1)
)
i_rvx_instance_0
(
	.data_input(rvx_signal_20),
	.shift_amount(rvx_signal_05),
	.data_output({rvx_signal_07,rvx_signal_00})
);

assign rvx_signal_28 = BW_DATA-1 - $unsigned(rvx_signal_05);

always@(*)
begin
  rvx_signal_06 = 0;
  rvx_signal_05 = 0;
  if(rvx_signal_01[3])
  begin
    if(rvx_signal_03[3])
      rvx_signal_05 = BW_PART*3;
    else
      rvx_signal_06 = 1;
  end
  else if(rvx_signal_01[2])
  begin
    if(rvx_signal_03[3])
      rvx_signal_05 = BW_PART*2;
    else if(rvx_signal_03[2])
      rvx_signal_05 = BW_PART*3;
    else
      rvx_signal_06 = 1;
  end
  else if(rvx_signal_01[1])
  begin
    if(rvx_signal_03[3])
      rvx_signal_05 = BW_PART*1;
    else if(rvx_signal_03[2])
      rvx_signal_05 = BW_PART*2;
    else if(rvx_signal_03[1])
      rvx_signal_05 = BW_PART*3;
    else
      rvx_signal_06 = 1;
  end
  else
  begin
    if(rvx_signal_03[3])
      rvx_signal_05 = 0;
    else if(rvx_signal_03[2])
      rvx_signal_05 = BW_PART*1;
    else if(rvx_signal_03[1])
      rvx_signal_05 = BW_PART*2;
    else if(rvx_signal_03[0])
      rvx_signal_05 = BW_PART*3;
    else
      rvx_signal_06 = 1;
  end
end

assign rvx_signal_15 = ~(rvx_signal_25|rvx_signal_17|rvx_signal_06);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_18  <= 0;
    rvx_signal_29 <= 0;
    rvx_signal_24       <= 0;
    rvx_signal_08          <= 0;
  end
  else if(enable)
  begin
    if(start)
      if(rvx_signal_15)
      begin
        rvx_signal_18  <= rvx_signal_21 ^ rvx_signal_09;
        rvx_signal_29 <= rvx_signal_09;
        rvx_signal_24       <= rvx_signal_27;
        rvx_signal_08          <= rvx_signal_28;
      end
      else
      begin
        rvx_signal_18  <= 0;
        rvx_signal_29 <= 0;
      end
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_22 <= RVX_LPARA_5;
  else if(enable)
    case(rvx_signal_22)
      RVX_LPARA_5:
        if(start)
          if(rvx_signal_15)
            rvx_signal_22 <= RVX_LPARA_1;
      RVX_LPARA_1:
        if(rvx_signal_19)
          rvx_signal_22 <= RVX_LPARA_5;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_04         <= 0;
    rvx_signal_12          <= 0;
    rvx_signal_14         <= 0;
  end
  else if(enable)
    case(rvx_signal_22)
      RVX_LPARA_5:
        if(start)
        begin
          if(rvx_signal_25)
          begin
            rvx_signal_12      <= -1;
            rvx_signal_14     <= numerator;
          end
          else if(rvx_signal_17)
          begin
            rvx_signal_12      <= rvx_signal_10;
            rvx_signal_14     <= 0;
          end
          else if(rvx_signal_06)
          begin
            rvx_signal_12      <= 0;
            rvx_signal_14     <= numerator;
          end
          else
          begin
            rvx_signal_04   <= rvx_signal_00;
            rvx_signal_12    <= 0;
            rvx_signal_14   <= rvx_signal_07;
          end
        end
      RVX_LPARA_1:
      begin
        rvx_signal_04     <= rvx_signal_04 << 1;
        rvx_signal_12      <= {rvx_signal_12,rvx_signal_26};
        rvx_signal_14     <= rvx_signal_02;
      end
    endcase
end

assign rvx_signal_31 = {rvx_signal_14, rvx_signal_04[BW_DATA-1]};
assign rvx_signal_23 = rvx_signal_31 - {1'b 0, rvx_signal_24};
assign rvx_signal_26 = ~rvx_signal_23[BW_DATA];
assign rvx_signal_02 = rvx_signal_26? rvx_signal_23[BW_DATA-1:0] : rvx_signal_31[BW_DATA-1:0];

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_2)
)
i_rvx_instance_1
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
	.init(rvx_signal_30),
  .count(rvx_signal_16),
	.value(rvx_signal_11),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_30 = start & rvx_signal_15;
assign rvx_signal_16 = (rvx_signal_22==RVX_LPARA_1);
assign rvx_signal_19 = (rvx_signal_11==rvx_signal_08);

assign remainder = (rvx_signal_29==0)? rvx_signal_14 : ((~rvx_signal_14)+1);
assign quotient  = (rvx_signal_18==0)? rvx_signal_12 : ((~rvx_signal_12)+1);
assign busy = (rvx_signal_22==RVX_LPARA_1);

endmodule
