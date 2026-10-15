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

`include "ervp_global.vh"
`include "ervp_trigger_cond.vh"




module RVX_MODULE_070
(
	rvx_port_6,
	rvx_port_8,
	rvx_port_3,
	rvx_port_4,
	rvx_port_0,
	rvx_port_5,
	rvx_port_2,
	rvx_port_7,
	rvx_port_1
);




parameter RVX_GPARA_0 = 4;

input wire rvx_port_6;
input wire rvx_port_8;
input wire rvx_port_3;
input wire rvx_port_4;
input wire rvx_port_0;
input wire [`BW_ERVP_TRIGGER_COND-1:0] rvx_port_5;
input wire [RVX_GPARA_0-1:0] rvx_port_2;
input wire [RVX_GPARA_0-1:0] rvx_port_7;
output reg rvx_port_1;

localparam  RVX_LPARA_4 = 2;
localparam  RVX_LPARA_2 = 0;
localparam  RVX_LPARA_3 = 1;
localparam  RVX_LPARA_0 = 2;
localparam  RVX_LPARA_1 = 3;

reg [RVX_LPARA_4-1:0] rvx_signal_8;
reg [RVX_GPARA_0-1:0] rvx_signal_5;

reg [RVX_GPARA_0-1:0] rvx_signal_7;
wire [RVX_GPARA_0-1+1:0] rvx_signal_1;
wire [RVX_GPARA_0-1+1:0] rvx_signal_6;
wire [RVX_GPARA_0-1+1:0] rvx_signal_0;
wire rvx_signal_2;
wire rvx_signal_3;
wire rvx_signal_4;

always@(posedge rvx_port_6, negedge rvx_port_8)
begin
	if(rvx_port_8==0)
		rvx_signal_8 <= RVX_LPARA_2;
  else if(rvx_port_3)
	begin
    if(rvx_port_4)
      rvx_signal_8 <= RVX_LPARA_2;
    else
      case(rvx_signal_8)
        RVX_LPARA_2:
          rvx_signal_8 <= RVX_LPARA_3;
        RVX_LPARA_3:
          rvx_signal_8 <= RVX_LPARA_0;
        RVX_LPARA_0:
        begin
          if(rvx_port_1)
            rvx_signal_8 <= RVX_LPARA_1;
        end
      endcase
	end
end

always@(posedge rvx_port_6, negedge rvx_port_8)
begin
	if(rvx_port_8==0)
		rvx_signal_5 <= 0;
	else
	begin
		case(rvx_signal_8)
			RVX_LPARA_3,
			RVX_LPARA_0:
				rvx_signal_5 <= rvx_port_2;
		endcase
	end
end

always@(*)
begin
	rvx_signal_7 = rvx_port_7;
	if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_HIGH])
		rvx_signal_7 = rvx_port_7;
	else if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_LOW])
		rvx_signal_7 = rvx_port_7;
	else if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_EQ])
		rvx_signal_7 = rvx_port_7;
	else if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_RISE])
		rvx_signal_7 = rvx_signal_5;
	else if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_FALL])
		rvx_signal_7 = rvx_signal_5;
end

assign rvx_signal_1 = rvx_port_0? $signed(rvx_signal_7) : $unsigned(rvx_signal_7);
assign rvx_signal_6 = rvx_port_0? $signed(rvx_port_2) : $unsigned(rvx_port_2);

assign rvx_signal_0 = (rvx_signal_6 - rvx_signal_1);
assign rvx_signal_2  = ($signed(rvx_signal_0) >  0);
assign rvx_signal_3   = ($signed(rvx_signal_0) == 0);
assign rvx_signal_4 = ($signed(rvx_signal_0) <  0);

always@(*)
begin
	rvx_port_1 = 0;
	case(rvx_signal_8)
		RVX_LPARA_0:
			if(RVX_GPARA_0==1)
			begin
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_HIGH])
				begin
					if(rvx_port_2==1)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_LOW])
				begin
					if(rvx_port_2==0)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_EQ])
				begin
					if(rvx_port_2==rvx_port_7)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_RISE])
				begin
					if((rvx_signal_5==0) && (rvx_port_2==1))
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_FALL])
				begin
					if((rvx_signal_5==1) && (rvx_port_2==0))
						rvx_port_1 = 1;
				end
			end
			else
			begin
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_HIGH])
				begin
					if(rvx_signal_2)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_LOW])
				begin
					if(rvx_signal_4)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_EQ])
				begin
					if(rvx_signal_3)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_RISE])
				begin
					if(rvx_signal_2)
						rvx_port_1 = 1;
				end
				if(rvx_port_5[`ERVP_TRIGGER_COND_INDEX_FALL])
				begin
					if(rvx_signal_4)
						rvx_port_1 = 1;
				end
			end
		RVX_LPARA_1:
			rvx_port_1 = 1;
	endcase
end

endmodule
