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


`ifndef MUNOC_GDEF_82
`define MUNOC_GDEF_82

`include "munoc_extended_config.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"

`define MUNOC_GDEF_43(bw_addr,bw_data,bw_fwn_plit) (`MUNOC_GDEF_17(bw_addr,bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_87 3

`define MUNOC_GDEF_94(bw_addr,bw_fwn_plit) (`MUNOC_GDEF_65(bw_addr,bw_fwn_plit)*(bw_fwn_plit))
`define MUNOC_GDEF_02(bw_data,bw_fwn_plit) (`MUNOC_GDEF_47(bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_37 2

`define MUNOC_GDEF_18 (`REQUIRED_BW_OF_SLAVE_TID+`BW_PACKET_DATATYPE)
`define MUNOC_GDEF_52(bw_data,bw_bwn_plit) (`MUNOC_GDEF_67(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_84 2

`define MUNOC_GDEF_71(bw_data,bw_bwn_plit) (`MUNOC_GDEF_67(bw_data,bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_39(bw_bwn_plit) (`MUNOC_GDEF_32(bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_63(bw_data,bw_bwn_plit) (`MUNOC_GDEF_30(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_59 2

`endif

