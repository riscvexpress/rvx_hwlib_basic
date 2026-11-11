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

`ifndef MUNOC_GDEF_15
`define MUNOC_GDEF_15

`include "munoc_network_type.vh"

`define MUNOC_GDEF_10 3
`define BW_FNI_LINK(bw_plit) ((bw_plit) + `MUNOC_GDEF_10)

`define MUNOC_GDEF_23 3
`define BW_BNI_LINK(bw_plit) ((bw_plit) + `MUNOC_GDEF_23)

`define MUNOC_GDEF_48(network_type) 0
`define MUNOC_GDEF_24(network_type) 1
`define MUNOC_GDEF_75(network_type) 2
`define MUNOC_GDEF_91(network_type) ((network_type==`FORWARD_NETWORK)? `MUNOC_GDEF_10 : `MUNOC_GDEF_23)
`define MUNOC_GDEF_73(network_type) ((network_type==`FORWARD_NETWORK)? `MUNOC_GDEF_10 : `MUNOC_GDEF_23)

`endif
