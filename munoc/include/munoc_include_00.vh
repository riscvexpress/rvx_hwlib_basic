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


`ifndef MUNOC_GDEF_11
`define MUNOC_GDEF_11

`include "munoc_extended_config.vh"
`include "munoc_include_08.vh"
`include "munoc_include_09.vh"

`define MUNOC_GDEF_43(bw_addr,bw_data,bw_fwn_plit) (`MUNOC_GDEF_47(bw_addr,bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_28 3

`define MUNOC_GDEF_59(bw_addr,bw_fwn_plit) (`MUNOC_GDEF_41(bw_addr,bw_fwn_plit)*(bw_fwn_plit))
`define MUNOC_GDEF_37(bw_data,bw_fwn_plit) (`MUNOC_GDEF_31(bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_72 2

`define MUNOC_GDEF_58 (`REQUIRED_BW_OF_SLAVE_TID+`BW_PACKET_DATATYPE)
`define MUNOC_GDEF_74(bw_data,bw_bwn_plit) (`MUNOC_GDEF_64(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_55 2

`define MUNOC_GDEF_26(bw_data,bw_bwn_plit) (`MUNOC_GDEF_64(bw_data,bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_40(bw_bwn_plit) (`MUNOC_GDEF_23(bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_42(bw_data,bw_bwn_plit) (`MUNOC_GDEF_13(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_66 2

`endif

