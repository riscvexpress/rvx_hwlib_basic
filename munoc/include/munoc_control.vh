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
// 2026-07-09
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`ifndef MUNOC_GDEF_15
`define MUNOC_GDEF_15

`include "munoc_extended_config.vh"

`define MUNOC_GDEF_07 1
`define MUNOC_GDEF_36 0
`define MUNOC_GDEF_10 1

`define MUNOC_GDEF_05 8
`define MUNOC_GDEF_62 8

`define MUNOC_GDEF_81 (`MUNOC_GDEF_07+`MUNOC_GDEF_05+`MUNOC_GDEF_62)

`define MUNOC_GDEF_02 1
`define MUNOC_GDEF_20 0
`define MUNOC_GDEF_86 1
`define MUNOC_GDEF_71 (`MUNOC_GDEF_02 + `BW_MAX_NODE_ID)

`define MUNOC_GDEF_30 32
`define MUNOC_GDEF_01 (`MUNOC_GDEF_30)
`define BW_SVRING_LINK 2

`endif

