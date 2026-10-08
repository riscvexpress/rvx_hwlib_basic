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


`ifndef MUNOC_GDEF_32
`define MUNOC_GDEF_32

`define MUNOC_GDEF_22 3

`define MUNOC_GDEF_80 0
`define MUNOC_GDEF_14 1
`define MUNOC_GDEF_24 2
`define MUNOC_GDEF_12 3
`define MUNOC_GDEF_77 4
`define MUNOC_GDEF_73 5

`define MUNOC_GDEF_34(bw_data) (((bw_data)==32)? `MUNOC_GDEF_80 : (((bw_data)==64)? `MUNOC_GDEF_14 : (((bw_data)==128)? `MUNOC_GDEF_24 : (((bw_data)==256)? `MUNOC_GDEF_12 : (((bw_data)==512)? `MUNOC_GDEF_77 : (((bw_data)==1024)? `MUNOC_GDEF_73 : -1))))))

`endif

