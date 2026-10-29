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
// 2026-10-20
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`ifndef MUNOC_GDEF_96
`define MUNOC_GDEF_96

`include "munoc_extended_config.vh"

`define MUNOC_GDEF_51 1
`define MUNOC_GDEF_32 0
`define MUNOC_GDEF_65 1

`define MUNOC_GDEF_07 8
`define MUNOC_GDEF_40 8

`define MUNOC_GDEF_87 (`MUNOC_GDEF_51+`MUNOC_GDEF_07+`MUNOC_GDEF_40)

`define MUNOC_GDEF_30 1
`define MUNOC_GDEF_06 0
`define MUNOC_GDEF_11 1
`define MUNOC_GDEF_62 (`MUNOC_GDEF_30 + `BW_MAX_NODE_ID)

`define MUNOC_GDEF_52 32
`define MUNOC_GDEF_82 (`MUNOC_GDEF_52)
`define BW_SVRING_LINK 2

`endif

