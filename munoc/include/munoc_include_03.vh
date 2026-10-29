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


`ifndef MUNOC_GDEF_57
`define MUNOC_GDEF_57

`include "munoc_extended_config.vh"
`include "munoc_include_07.vh"
`include "munoc_include_08.vh"

`define MUNOC_GDEF_44(bw_addr,bw_data,bw_fwn_plit) (`MUNOC_GDEF_24(bw_addr,bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_86 3

`define MUNOC_GDEF_61(bw_addr,bw_fwn_plit) (`MUNOC_GDEF_78(bw_addr,bw_fwn_plit)*(bw_fwn_plit))
`define MUNOC_GDEF_05(bw_data,bw_fwn_plit) (`MUNOC_GDEF_56(bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_81 2

`define MUNOC_GDEF_91 (`REQUIRED_BW_OF_SLAVE_TID+`BW_PACKET_DATATYPE)
`define MUNOC_GDEF_71(bw_data,bw_bwn_plit) (`MUNOC_GDEF_41(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_93 2

`define MUNOC_GDEF_60(bw_data,bw_bwn_plit) (`MUNOC_GDEF_41(bw_data,bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_34(bw_bwn_plit) (`MUNOC_GDEF_35(bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_14(bw_data,bw_bwn_plit) (`MUNOC_GDEF_23(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_94 2

`endif

