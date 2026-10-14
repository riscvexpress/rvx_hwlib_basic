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


`ifndef MUNOC_GDEF_50
`define MUNOC_GDEF_50

`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_09.vh"

`define MUNOC_GDEF_52 1
`define MUNOC_GDEF_14 0
`define MUNOC_GDEF_26 1

`define MUNOC_GDEF_68 (`BW_MASTER_NODE_ID+`MUNOC_GDEF_52+`BW_LONGEST_AXI_TID+`BW_PACKET_DATATYPE)
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
	`define MUNOC_GDEF_04(source_node,packet_type,tid,datatype) {source_node,packet_type,tid}
`else
	`define MUNOC_GDEF_04(source_node,packet_type,tid,datatype) {source_node,packet_type,tid,datatype}
`endif
`define MUNOC_GDEF_93 (`BW_MASTER_NODE_ID+`MUNOC_GDEF_52+`BW_LONGEST_AXI_TID+`BW_AXI_BRESP)
`define MUNOC_GDEF_09(target_node,packet_type,tid,resp) {target_node,packet_type,tid,resp}
`define MUNOC_GDEF_84 `MAX(`MUNOC_GDEF_68,`MUNOC_GDEF_93)

`define MUNOC_GDEF_77(bw_data) (bw_data+`BW_AXI_RRESP+`BW_AXI_RLAST)
`define MUNOC_GDEF_11(last,resp,data_reversed) {last,resp,data_reversed}

`define MUNOC_GDEF_97(bw_bwn_plit) `DIVIDERU(`MUNOC_GDEF_84,bw_bwn_plit)
`define MUNOC_GDEF_01(bw_data,bw_bwn_plit) `DIVIDERU(`MUNOC_GDEF_77(bw_data),bw_bwn_plit)
`define MUNOC_GDEF_18(bw_data,bw_bwn_plit) ((`MUNOC_GDEF_97(bw_bwn_plit)>`MUNOC_GDEF_01(bw_data,bw_bwn_plit))? `MUNOC_GDEF_97(bw_bwn_plit):`MUNOC_GDEF_01(bw_data,bw_bwn_plit))

`define MUNOC_GDEF_17 `MUNOC_GDEF_84

`endif

