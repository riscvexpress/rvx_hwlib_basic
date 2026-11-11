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

localparam  RVX_LPARA_4 = REQUIRED_BITWIDTH_INDEX(BW_DATA);
localparam  RVX_LPARA_5 = REQUIRED_BITWIDTH_UNSIGNED(BW_PART*3);

localparam  RVX_LPARA_0 = 1;
localparam  RVX_LPARA_1 = 0;
localparam  RVX_LPARA_3 = 1;

reg [RVX_LPARA_0-1:0] rvx_signal_18;
reg  rvx_signal_21;
reg  rvx_signal_15;
reg [BW_DATA-1:0] rvx_signal_28;
reg [BW_DATA-1:0] rvx_signal_24;
reg [BW_DATA-1:0] rvx_signal_07;
reg [BW_DATA-1:0] rvx_signal_05;
reg [RVX_LPARA_4-1:0] rvx_signal_06;

wire [BW_DATA*2-1:0] rvx_signal_11;
wire [BW_DATA-1:0] rvx_signal_22;
wire [BW_DATA-1:0] rvx_signal_17;
wire [RVX_LPARA_4-1:0] rvx_signal_01;

reg [RVX_LPARA_5-1:0] rvx_signal_29;

wire [BW_DATA-1:0] rvx_signal_19;
wire [BW_DATA-1:0] rvx_signal_00;
wire rvx_signal_02;
wire rvx_signal_12;

localparam  RVX_LPARA_2 = 4;

wire [RVX_LPARA_2-1:0] rvx_signal_14;
wire [RVX_LPARA_2-1:0] rvx_signal_25;

wire rvx_signal_08;
wire rvx_signal_27;
reg  rvx_signal_20;
wire rvx_signal_23;

wire [BW_DATA-1:0] rvx_signal_09;

wire [BW_DATA+1-1:0] rvx_signal_10;
wire rvx_signal_31;
wire [BW_DATA+1-1:0] rvx_signal_16;
wire [BW_DATA-1:0] rvx_signal_04;

wire rvx_signal_30;
wire rvx_signal_13;
wire [RVX_LPARA_4-1:0] rvx_signal_26;
wire rvx_signal_03;

assign rvx_signal_09[BW_DATA-1] = 1;
assign rvx_signal_09[BW_DATA-1-1:0] = 0;

assign rvx_signal_08 = (denominator==0);
assign rvx_signal_27 = (~is_unsigned) & (numerator==rvx_signal_09) & ($signed(denominator)==(-1));

assign rvx_signal_02 = (~is_unsigned) & numerator[BW_DATA-1];
assign rvx_signal_12 = (~is_unsigned) & denominator[BW_DATA-1];

assign rvx_signal_19 = (rvx_signal_02==0)? numerator : ((~numerator)+1);
assign rvx_signal_00 = (rvx_signal_12==0)? denominator : ((~denominator)+1);

generate
for(i=0; i<RVX_LPARA_2; i=i+1)
begin : i_gen_property
  assign rvx_signal_14[i] = (i==(RVX_LPARA_2-1))? (rvx_signal_19[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_19[(i+1)*BW_PART-1-:BW_PART]!=0);
  assign rvx_signal_25[i] = (i==(RVX_LPARA_2-1))? (rvx_signal_00[BW_DATA-1-:BW_PART]!=0) : (rvx_signal_00[(i+1)*BW_PART-1-:BW_PART]!=0);
end
endgenerate

assign rvx_signal_11 = rvx_signal_19;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(BW_DATA*2),
  .BW_SHIFT_AMOUNT(RVX_LPARA_5),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1)
)
i_rvx_instance_0
(
	.data_input(rvx_signal_11),
	.shift_amount(rvx_signal_29),
	.data_output({rvx_signal_17,rvx_signal_22})
);

assign rvx_signal_01 = BW_DATA-1 - $unsigned(rvx_signal_29);

always@(*)
begin
  rvx_signal_20 = 0;
  rvx_signal_29 = 0;
  if(rvx_signal_25[3])
  begin
    if(rvx_signal_14[3])
      rvx_signal_29 = BW_PART*3;
    else
      rvx_signal_20 = 1;
  end
  else if(rvx_signal_25[2])
  begin
    if(rvx_signal_14[3])
      rvx_signal_29 = BW_PART*2;
    else if(rvx_signal_14[2])
      rvx_signal_29 = BW_PART*3;
    else
      rvx_signal_20 = 1;
  end
  else if(rvx_signal_25[1])
  begin
    if(rvx_signal_14[3])
      rvx_signal_29 = BW_PART*1;
    else if(rvx_signal_14[2])
      rvx_signal_29 = BW_PART*2;
    else if(rvx_signal_14[1])
      rvx_signal_29 = BW_PART*3;
    else
      rvx_signal_20 = 1;
  end
  else
  begin
    if(rvx_signal_14[3])
      rvx_signal_29 = 0;
    else if(rvx_signal_14[2])
      rvx_signal_29 = BW_PART*1;
    else if(rvx_signal_14[1])
      rvx_signal_29 = BW_PART*2;
    else if(rvx_signal_14[0])
      rvx_signal_29 = BW_PART*3;
    else
      rvx_signal_20 = 1;
  end
end

assign rvx_signal_23 = ~(rvx_signal_08|rvx_signal_27|rvx_signal_20);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_21  <= 0;
    rvx_signal_15 <= 0;
    rvx_signal_24       <= 0;
    rvx_signal_06          <= 0;
  end
  else if(enable)
  begin
    if(start)
      if(rvx_signal_23)
      begin
        rvx_signal_21  <= rvx_signal_12 ^ rvx_signal_02;
        rvx_signal_15 <= rvx_signal_02;
        rvx_signal_24       <= rvx_signal_00;
        rvx_signal_06          <= rvx_signal_01;
      end
      else
      begin
        rvx_signal_21  <= 0;
        rvx_signal_15 <= 0;
      end
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_18 <= RVX_LPARA_1;
  else if(enable)
    case(rvx_signal_18)
      RVX_LPARA_1:
        if(start)
          if(rvx_signal_23)
            rvx_signal_18 <= RVX_LPARA_3;
      RVX_LPARA_3:
        if(rvx_signal_03)
          rvx_signal_18 <= RVX_LPARA_1;
    endcase
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
  begin
    rvx_signal_28         <= 0;
    rvx_signal_07          <= 0;
    rvx_signal_05         <= 0;
  end
  else if(enable)
    case(rvx_signal_18)
      RVX_LPARA_1:
        if(start)
        begin
          if(rvx_signal_08)
          begin
            rvx_signal_07      <= -1;
            rvx_signal_05     <= numerator;
          end
          else if(rvx_signal_27)
          begin
            rvx_signal_07      <= rvx_signal_09;
            rvx_signal_05     <= 0;
          end
          else if(rvx_signal_20)
          begin
            rvx_signal_07      <= 0;
            rvx_signal_05     <= numerator;
          end
          else
          begin
            rvx_signal_28   <= rvx_signal_22;
            rvx_signal_07    <= 0;
            rvx_signal_05   <= rvx_signal_17;
          end
        end
      RVX_LPARA_3:
      begin
        rvx_signal_28     <= rvx_signal_28 << 1;
        rvx_signal_07      <= {rvx_signal_07,rvx_signal_31};
        rvx_signal_05     <= rvx_signal_04;
      end
    endcase
end

assign rvx_signal_16 = {rvx_signal_05, rvx_signal_28[BW_DATA-1]};
assign rvx_signal_10 = rvx_signal_16 - {1'b 0, rvx_signal_24};
assign rvx_signal_31 = ~rvx_signal_10[BW_DATA];
assign rvx_signal_04 = rvx_signal_31? rvx_signal_10[BW_DATA-1:0] : rvx_signal_16[BW_DATA-1:0];

ERVP_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_4)
)
i_rvx_instance_1
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
	.init(rvx_signal_30),
  .count(rvx_signal_13),
	.value(rvx_signal_26),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_30 = start & rvx_signal_23;
assign rvx_signal_13 = (rvx_signal_18==RVX_LPARA_3);
assign rvx_signal_03 = (rvx_signal_26==rvx_signal_06);

assign remainder = (rvx_signal_15==0)? rvx_signal_05 : ((~rvx_signal_05)+1);
assign quotient  = (rvx_signal_21==0)? rvx_signal_07 : ((~rvx_signal_07)+1);
assign busy = (rvx_signal_18==RVX_LPARA_3);

endmodule
