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
// 2026-11-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`ifndef MUNOC_GDEF_54
`define MUNOC_GDEF_54

`include "munoc_extended_config.vh"

`define MUNOC_GDEF_40 1
`define MUNOC_GDEF_66 0
`define MUNOC_GDEF_20 1

`define MUNOC_GDEF_68 8
`define MUNOC_GDEF_11 8

`define MUNOC_GDEF_36 (`MUNOC_GDEF_40+`MUNOC_GDEF_68+`MUNOC_GDEF_11)

`define MUNOC_GDEF_89 1
`define MUNOC_GDEF_04 0
`define MUNOC_GDEF_57 1
`define MUNOC_GDEF_07 (`MUNOC_GDEF_89 + `BW_MAX_NODE_ID)

`define MUNOC_GDEF_96 32
`define MUNOC_GDEF_95 (`MUNOC_GDEF_96)
`define BW_SVRING_LINK 2

`endif

