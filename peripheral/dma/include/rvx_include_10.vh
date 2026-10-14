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
localparam AXI_SIZE = `GET_AXI_SIZE(BW_AXI_DATA);
localparam AXI_SIZE_BYTE = (1 << AXI_SIZE);
localparam MAX_BURST_LENGTH = MAX_BURST_LENGTH_M1 + 1;
localparam BW_BURST_LENGTH = `BW_AXI_ALEN + 1;
localparam NUM_BYTE = AXI_SIZE_BYTE;
localparam BW_OFFSET = AXI_SIZE;
localparam BW_TOTAL_SIZE = BW_LINE_SIZE + 1;
localparam BW_NUM_BEAT = BW_TOTAL_SIZE - BW_OFFSET;
