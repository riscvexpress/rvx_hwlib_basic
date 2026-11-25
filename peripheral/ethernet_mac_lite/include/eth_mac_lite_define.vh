// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reserved.
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
// 2026-10-30 Sukho Lee (shlee99@etri.re.kr), written with Claude
// ****************************************************************************
// ****************************************************************************
// eth_mac_lite_define.vh : constants shared by the ETH_MAC_LITE modules
//
// Register map of PG135 Table 2-7 (AXI EthernetLite v3.0) as word indices
// inside one 2 KB buffer, plus the Ethernet frame constants.
// Design note: user/doc/misc/ethernetlite_rtl_design_claude.md
// ****************************************************************************
// ****************************************************************************

`ifndef ETH_MAC_LITE_DEFINE_VH
`define ETH_MAC_LITE_DEFINE_VH

// address split of the 8 KB window: addr[12:11] = buffer, addr[10:2] = word
`define ETH_MAC_LITE_BW_ADDR        13
`define ETH_MAC_LITE_BW_DATA        32
`define ETH_MAC_LITE_BW_WORD        9
`define ETH_MAC_LITE_BUF_TX_PING    2'd0
`define ETH_MAC_LITE_BUF_TX_PONG    2'd1
`define ETH_MAC_LITE_BUF_RX_PING    2'd2
`define ETH_MAC_LITE_BUF_RX_PONG    2'd3

// RAM words 0..503 (+0x000..+0x7DC); word 504 (+0x7E0) is empty
`define ETH_MAC_LITE_NUM_RAM_WORD   504
`define ETH_MAC_LITE_WORD_MDIOADDR  9'd505   // +0x7E4, TX ping only
`define ETH_MAC_LITE_WORD_MDIOWR    9'd506   // +0x7E8
`define ETH_MAC_LITE_WORD_MDIORD    9'd507   // +0x7EC, read only
`define ETH_MAC_LITE_WORD_MDIOCTRL  9'd508   // +0x7F0
`define ETH_MAC_LITE_WORD_LENGTH    9'd509   // +0x7F4, TX buffers
`define ETH_MAC_LITE_WORD_GIE       9'd510   // +0x7F8, TX ping only
`define ETH_MAC_LITE_WORD_CTRL      9'd511   // +0x7FC, every buffer

// control register bits (PG135 Tables 2-9 .. 2-17)
`define ETH_MAC_LITE_CTRL_STATUS    0
`define ETH_MAC_LITE_CTRL_PROGRAM   1
`define ETH_MAC_LITE_CTRL_IE        3
`define ETH_MAC_LITE_CTRL_LOOPBACK  4
`define ETH_MAC_LITE_GIE_BIT        31
`define ETH_MAC_LITE_MDIOADDR_OP    10
`define ETH_MAC_LITE_MDIOCTRL_EN    3

// Ethernet frame constants
`define ETH_MAC_LITE_BW_MAC         48
`define ETH_MAC_LITE_MAC_RESET      48'h CEFA_005E_0000   // 00-00-5E-00-FA-CE, byte 0 in bits [7:0]
`define ETH_MAC_LITE_MIN_DATA_BYTE  60      // frame without FCS is padded to this
`define ETH_MAC_LITE_MIN_FRAME_BYTE 64      // shorter frames (incl. FCS) are runts
`define ETH_MAC_LITE_MAX_FRAME_BYTE 2016    // buffer RAM size (504 words)
`define ETH_MAC_LITE_BW_LENGTH      16
`define ETH_MAC_LITE_BW_BYTE_COUNT  11      // 0..2047
`define ETH_MAC_LITE_FCS_BYTE       4
`define ETH_MAC_LITE_PREAMBLE_NIB   4'h5
`define ETH_MAC_LITE_SFD_NIB        4'hD
`define ETH_MAC_LITE_NUM_PREAMBLE   15      // 7 x 0x55 + low nibble of 0xD5
`define ETH_MAC_LITE_IFG_NIBBLE     24      // 96 bit times
`define ETH_MAC_LITE_CRC_INIT       32'h FFFF_FFFF
`define ETH_MAC_LITE_CRC_RESIDUE    32'h DEBB_20E3   // CRC register after data + FCS

`endif
