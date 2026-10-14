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
// 2026-10-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`ifndef MUNOC_GDEF_74
`define MUNOC_GDEF_74

`include "munoc_extended_config.vh"
`include "munoc_include_08.vh"
`include "munoc_include_01.vh"

`define MUNOC_GDEF_47(bw_addr,bw_data,bw_fwn_plit) (`MUNOC_GDEF_38(bw_addr,bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_55 3

`define MUNOC_GDEF_63(bw_addr,bw_fwn_plit) (`MUNOC_GDEF_59(bw_addr,bw_fwn_plit)*(bw_fwn_plit))
`define MUNOC_GDEF_37(bw_data,bw_fwn_plit) (`MUNOC_GDEF_46(bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_02 2

`define MUNOC_GDEF_27 (`REQUIRED_BW_OF_SLAVE_TID+`BW_PACKET_DATATYPE)
`define MUNOC_GDEF_44(bw_data,bw_bwn_plit) (`MUNOC_GDEF_18(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_49 2

`define MUNOC_GDEF_33(bw_data,bw_bwn_plit) (`MUNOC_GDEF_18(bw_data,bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_41(bw_bwn_plit) (`MUNOC_GDEF_97(bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_72(bw_data,bw_bwn_plit) (`MUNOC_GDEF_01(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_40 2

`endif

