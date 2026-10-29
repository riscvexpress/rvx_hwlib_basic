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
// 2026-10-29
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************
localparam BW_TLOT_A_USER = 23;
localparam BW_TLOT_D_USER = 14;
localparam BW_TLOT_INTG = 7;
localparam [4-1:0] TLOT_MUBI4_FALSE = 4'h 9;

function [BW_TLOT_INTG-1:0] TLOT_SECDED_INV_64_57;
	input [57-1:0] data;
	reg [64-1:0] d;
begin
	d = {7'b 0, data};
	TLOT_SECDED_INV_64_57[0] = ^(d & 64'h 0103FFF800007FFF);
	TLOT_SECDED_INV_64_57[1] = ^(d & 64'h 017C1FF801FF801F);
	TLOT_SECDED_INV_64_57[2] = ^(d & 64'h 01BDE1F87E0781E1);
	TLOT_SECDED_INV_64_57[3] = ^(d & 64'h 01DEEE3B8E388E22);
	TLOT_SECDED_INV_64_57[4] = ^(d & 64'h 01EF76CDB2C93244);
	TLOT_SECDED_INV_64_57[5] = ^(d & 64'h 01F7BB56D5525488);
	TLOT_SECDED_INV_64_57[6] = ^(d & 64'h 01FBDDA769A46910);
	TLOT_SECDED_INV_64_57 = TLOT_SECDED_INV_64_57 ^ 7'h 2A;
end
endfunction

function [BW_TLOT_INTG-1:0] TLOT_SECDED_INV_39_32;
	input [32-1:0] data;
	reg [39-1:0] d;
begin
	d = {7'b 0, data};
	TLOT_SECDED_INV_39_32[0] = ^(d & 39'h 002606BD25);
	TLOT_SECDED_INV_39_32[1] = ^(d & 39'h 00DEBA8050);
	TLOT_SECDED_INV_39_32[2] = ^(d & 39'h 00413D89AA);
	TLOT_SECDED_INV_39_32[3] = ^(d & 39'h 0031234ED1);
	TLOT_SECDED_INV_39_32[4] = ^(d & 39'h 00C2C1323B);
	TLOT_SECDED_INV_39_32[5] = ^(d & 39'h 002DCC624C);
	TLOT_SECDED_INV_39_32[6] = ^(d & 39'h 0098505586);
	TLOT_SECDED_INV_39_32 = TLOT_SECDED_INV_39_32 ^ 7'h 2A;
end
endfunction
