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

localparam  RVX_LPARA_5 = REQUIRED_BITWIDTH_INDEX(BW_DATA);
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_UNSIGNED(BW_PART*3);

localparam  RVX_LPARA_0 = 1;
localparam  RVX_LPARA_3 = 0;
localparam  RVX_LPARA_2 = 1;

reg [RVX_LPARA_0-1:0] rvx_signal_25;
reg  rvx_signal_09;
reg  rvx_signal_06;
reg [BW_DATA-1:0] rvx_signal_11;
reg [BW_DATA-1:0] rvx_signal_24;
reg [BW_DATA-1:0] rvx_signal_15;
reg [BW_DATA-1:0] rvx_signal_20;
reg [RVX_LPARA_5-1:0] rvx_signal_08;

wire [BW_DATA*2-1:0] rvx_signal_21;
wire [BW_DATA-1:0] rvx_signal_26;
wire [BW_DATA-1:0] rvx_signal_03;
wire [RVX_LPARA_5-1:0] rvx_signal_12;

reg [RVX_LPARA_1-1:0] rvx_signal_18;

wire [BW_DATA-1:0] rvx_signal_22;
wire [BW_DATA-1:0] rvx_signal_05;
wire rvx_signal_14;
wire rvx_signal_19;

localparam  RVX_LPARA_4 = 4;

wire [RVX_LPARA_4-1:0] rvx_signal_01;
wire [RVX_LPARA_4-1:0] rvx_signal_27;

wire rvx_signal_10;
wire rvx_signal_02;
reg  rvx_signal_04;
wire rvx_signal_31;

wire [BW_DATA-1:0] rvx_signal_16;

wire [BW_DATA+1-1:0] rvx_signal_30;
wire rvx_signal_29;
wire [BW_DATA+1-1:0] rvx_signal_17;
wire [BW_DATA-1:0] rvx_signal_23;

wire rvx_signal_07;
wire rvx_signal_28;
wire [RVX_LPARA_5-1:0] rvx_signal_00;
wire rvx_signal_13;

assign rvx_signal_16[BW_DATA-1] = 1;
assign rvx_signal_16[BW_DATA-1-1:0] = 0;

assign rvx_signal_10 = (denominator==0);
assign rvx_signal_02 = (~is_unsigned) & (numerator==rvx_signal_16) & ($signed(denominator)==(-1));

assign rvx_signal_14 = (~is_unsigned) & numerator[BW_DATA-1];
assign rvx_signal_19 = (~is_unsigned) & denominator[BW_DATA-1];

assign rvx_signal_22 = (rvx_signal_14==0)? numerator : ((~numerator)+1);
assign rvx_signal_05 = (rvx_signal_19==0)? denominator : ((~denominator)+1);

generate
for(i=0; i<RVX_LPARA_4; i=i+1)
begin : i_gen_property
  assign rvx_signal_01[i] = (i==(RVX_LPARA_4-1))? (rvx_signal_22[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_22[(i+1)*BW_PART-1-:BW_PART]!=0);
  assign rvx_signal_27[i] = (i==(RVX_LPARA_4-1))? (rvx_signal_05[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_05[(i+1)*BW_PART-1-:BW_PART]!=0);
end
endgenerate

assign rvx_signal_21 = rvx_signal_22;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(BW_DATA*2),
  .BW_SHIFT_AMOUNT(RVX_LPARA_1),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1)
)
i_rvx_instance_0
(
	.data_input(rvx_signal_21),
	.shift_amount(rvx_signal_18),
	.data_output({rvx_signal_03,rvx_signal_26})
);

assign rvx_signal_12 = BW_DATA-1 - $unsigned(rvx_signal_18);

always@(*)
begin
  rvx_signal_04 = 0;
  rvx_signal_18 = 0;
  if(rvx_signal_27[3])
  begin
    if(rvx_signal_01[3])
      rvx_signal_18 = BW_PART*3;
    else
      rvx_signal_04 = 1;
  end
  else if(rvx_signal_27[2])
  begin
    if(rvx_signal_01[3])
      rvx_signal_18 = BW_PART*2;
    else if(rvx_signal_01[2])
      rvx_signal_18 = BW_PART*3;
    else
      rvx_signal_04 = 1;
  end
  else if(rvx_signal_27[1])
  begin
    if(rvx_signal_01[3])
      rvx_signal_18 = BW_PART*1;
    else if(rvx_signal_01[2])
      rvx_signal_18 = BW_PART*2;
    else if(rvx_signal_01[1])
      rvx_signal_18 = BW_PART*3;
    else
      rvx_signal_04 = 1;
  end
  else
  begin
    if(rvx_signal_01[3])
      rvx_signal_18 = 0;
    else if(rvx_signal_01[2])
      rvx_signal_18 = BW_PART*1;
    else if(rvx_signal_01[1])
      rvx_signal_18 = BW_PART*2;
    else if(rvx_signal_01[0])
      rvx_signal_18 = BW_PART*3;
    else
      rvx_signal_04 = 1;
  end
end

assign rvx_signal_31 = ~(rvx_signal_10|rvx_signal_02|rvx_signal_04);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_09  <= 0;
    rvx_signal_06 <= 0;
    rvx_signal_24       <= 0;
    rvx_signal_08          <= 0;
  end
  else if(enable)
  begin
    if(start)
      if(rvx_signal_31)
      begin
        rvx_signal_09  <= rvx_signal_19 ^ rvx_signal_14;
        rvx_signal_06 <= rvx_signal_14;
        rvx_signal_24       <= rvx_signal_05;
        rvx_signal_08          <= rvx_signal_12;
      end
      else
      begin
        rvx_signal_09  <= 0;
        rvx_signal_06 <= 0;
      end
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_25 <= RVX_LPARA_3;
  else if(enable)
    case(rvx_signal_25)
      RVX_LPARA_3:
        if(start)
          if(rvx_signal_31)
            rvx_signal_25 <= RVX_LPARA_2;
      RVX_LPARA_2:
        if(rvx_signal_13)
          rvx_signal_25 <= RVX_LPARA_3;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_11         <= 0;
    rvx_signal_15          <= 0;
    rvx_signal_20         <= 0;
  end
  else if(enable)
    case(rvx_signal_25)
      RVX_LPARA_3:
        if(start)
        begin
          if(rvx_signal_10)
          begin
            rvx_signal_15      <= -1;
            rvx_signal_20     <= numerator;
          end
          else if(rvx_signal_02)
          begin
            rvx_signal_15      <= rvx_signal_16;
            rvx_signal_20     <= 0;
          end
          else if(rvx_signal_04)
          begin
            rvx_signal_15      <= 0;
            rvx_signal_20     <= numerator;
          end
          else
          begin
            rvx_signal_11   <= rvx_signal_26;
            rvx_signal_15    <= 0;
            rvx_signal_20   <= rvx_signal_03;
          end
        end
      RVX_LPARA_2:
      begin
        rvx_signal_11     <= rvx_signal_11 << 1;
        rvx_signal_15      <= {rvx_signal_15,rvx_signal_29};
        rvx_signal_20     <= rvx_signal_23;
      end
    endcase
end

assign rvx_signal_17 = {rvx_signal_20, rvx_signal_11[BW_DATA-1]};
assign rvx_signal_30 = rvx_signal_17 - {1'b 0, rvx_signal_24};
assign rvx_signal_29 = ~rvx_signal_30[BW_DATA];
assign rvx_signal_23 = rvx_signal_29? rvx_signal_30[BW_DATA-1:0] : rvx_signal_17[BW_DATA-1:0];

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_5)
)
i_rvx_instance_1
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
	.init(rvx_signal_07),
  .count(rvx_signal_28),
	.value(rvx_signal_00),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_07 = start & rvx_signal_31;
assign rvx_signal_28 = (rvx_signal_25==RVX_LPARA_2);
assign rvx_signal_13 = (rvx_signal_00==rvx_signal_08);

assign remainder = (rvx_signal_06==0)? rvx_signal_20 : ((~rvx_signal_20)+1);
assign quotient  = (rvx_signal_09==0)? rvx_signal_15 : ((~rvx_signal_15)+1);
assign busy = (rvx_signal_25==RVX_LPARA_2);

endmodule
