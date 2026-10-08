//------------------------------------------------------------------------------
// constants_pkg.vh
// Converted 1:1 from constants_pkg.vhd (package constants_pkg).
//
// VHDL constants -> `define macros (usable in all modules and in port ranges).
// VHDL enumerated types are encoded as integer/vector codes:
//   cache_policy          : READ_ONLY=0, WRITE_THROUGH=1, WRITE_BACK=2
//   cache_control_command : INITIALIZE=0, INVALIDATE=1, FLUSH=2, WRITEBACK=3
//                           (carried on 2-bit ports/signals)
//   request_register_type : OFF=0, LIGHT=1, FULL=2
//   vcp_type              : DISABLED=0, THIRTY_TWO_BIT=1, SIXTY_FOUR_BIT=2
// Function INSTRUCTION_SIZE(vcp) -> `INSTRUCTION_SIZE(vcp) macro.
//------------------------------------------------------------------------------
`ifndef CONSTANTS_PKG_VH
`define CONSTANTS_PKG_VH

`include "utils_pkg.vh"

`define SIGN_EXTENSION_SIZE 20

//REGISTER NAMES
`define REGISTER_NAME_SIZE 5

`define REGISTER_ZERO 5'b00000
`define REGISTER_RA   5'b00001
`define REGISTER_SP   5'b00010
`define REGISTER_GP   5'b00011
`define REGISTER_TP   5'b00100
`define REGISTER_T0   5'b00101
`define REGISTER_T1   5'b00110
`define REGISTER_T2   5'b00111
`define REGISTER_S0   5'b01000
`define REGISTER_S1   5'b01001
`define REGISTER_A0   5'b01010
`define REGISTER_A1   5'b01011
`define REGISTER_A2   5'b01100
`define REGISTER_A3   5'b01101
`define REGISTER_A4   5'b01110
`define REGISTER_A5   5'b01111
`define REGISTER_A6   5'b10000
`define REGISTER_A7   5'b10001
`define REGISTER_S2   5'b10010
`define REGISTER_S3   5'b10011
`define REGISTER_S4   5'b10100
`define REGISTER_S5   5'b10101
`define REGISTER_S6   5'b10110
`define REGISTER_S7   5'b10111
`define REGISTER_S8   5'b11000
`define REGISTER_S9   5'b11001
`define REGISTER_S10  5'b11010
`define REGISTER_S11  5'b11011
`define REGISTER_T3   5'b11100
`define REGISTER_T4   5'b11101
`define REGISTER_T5   5'b11110
`define REGISTER_T6   5'b11111

//Instruction field ranges (VHDL used ranged dummy constants; in Verilog the
//bit indices are used directly at call sites):
//  REGISTER_RS1 = instr[19:15], REGISTER_RS2 = instr[24:20],
//  REGISTER_RD  = instr[11:7],  INSTR_OPCODE = instr[6:0],
//  INSTR_FUNC3  = instr[14:12], INSTR_FUNC7  = instr[31:25]

//Major OP codes instr(6 downto 0)
`define JAL_OP      7'b1101111
`define JALR_OP     7'b1100111
`define LUI_OP      7'b0110111
`define AUIPC_OP    7'b0010111
`define ALU_OP      7'b0110011
`define ALUI_OP     7'b0010011
`define LOAD_OP     7'b0000011
`define STORE_OP    7'b0100011
`define MISC_MEM_OP 7'b0001111
`define SYSTEM_OP   7'b1110011
`define CUSTOM0_OP  7'b0101011
`define CUSTOM1_OP  7'b0111111
`define VCP32_OP    `CUSTOM0_OP
`define VCP64_OP    `CUSTOM1_OP
`define BRANCH_OP   7'b1100011

`define OP_IMM_IMMEDIATE_SIZE 12
//CSR_ZIMM = instr[19:15]

//MISC-MEM functions
`define FENCE_FUNC3 3'b000

`define FENCE_SW_BIT 20
`define FENCE_SR_BIT 21
`define FENCE_SO_BIT 22
`define FENCE_SI_BIT 23
`define FENCE_PW_BIT 24
`define FENCE_PR_BIT 25
`define FENCE_PO_BIT 26
`define FENCE_PI_BIT 27

`define REGION_FUNC3          3'b001
`define FENCE_I_FUNC7         7'b0000000
`define FENCE_RD_FUNC7        7'b0000010
`define FENCE_RI_FUNC7        7'b0000011
`define CACHE_WRITEBACK_FUNC7 7'b0000100
`define CACHE_FLUSH_FUNC7     7'b0000101
`define CACHE_DISCARD_FUNC7   7'b0000110

//CSR Addresses
//CSR_ADDRESS = instr[31:20]
`define CSR_MSTATUS  12'h300
`define CSR_MISA     12'h301
`define CSR_MIE      12'h304
`define CSR_MTVEC    12'h305
`define CSR_MSCRATCH 12'h340
`define CSR_MEPC     12'h341
`define CSR_MCAUSE   12'h342
`define CSR_MTVAL    12'h343
`define CSR_MIP      12'h344
`define CSR_MTIME    12'hF01
`define CSR_MTIMEH   12'hF81
`define CSR_UTIME    12'hC01
`define CSR_UTIMEH   12'hC81

//NON-STANDARD
`define CSR_MCACHE     12'hBC0
`define CSR_MAMR0_BASE 12'hBD0
`define CSR_MAMR1_BASE 12'hBD1
`define CSR_MAMR2_BASE 12'hBD2
`define CSR_MAMR3_BASE 12'hBD3
`define CSR_MAMR0_LAST 12'hBD8
`define CSR_MAMR1_LAST 12'hBD9
`define CSR_MAMR2_LAST 12'hBDA
`define CSR_MAMR3_LAST 12'hBDB
`define CSR_MUMR0_BASE 12'hBE0
`define CSR_MUMR1_BASE 12'hBE1
`define CSR_MUMR2_BASE 12'hBE2
`define CSR_MUMR3_BASE 12'hBE3
`define CSR_MUMR0_LAST 12'hBE8
`define CSR_MUMR1_LAST 12'hBE9
`define CSR_MUMR2_LAST 12'hBEA
`define CSR_MUMR3_LAST 12'hBEB

//CSR_MSTATUS BITS
`define CSR_MSTATUS_MIE  3
`define CSR_MSTATUS_MPIE 7

//CSR_MCACHE BITS
`define CSR_MCACHE_IEXISTS 0
`define CSR_MCACHE_DEXISTS 1
//CSR_MCACHE_AMRS = [19:16], CSR_MCACHE_UMRS = [23:20]

//CSR_MCAUSE_CODE is a 4-bit field, mcause[3:0]
`define CSR_MCAUSE_MSOFT          4'h3
`define CSR_MCAUSE_MTIMER         4'h7
`define CSR_MCAUSE_MEXT           4'hB
`define CSR_MCAUSE_ILLEGAL        4'h2
`define CSR_MCAUSE_EBREAK         4'h3
`define CSR_MCAUSE_MECALL         4'hB
`define CSR_MCAUSE_FETCH_MISALIGN 4'h0
`define CSR_MCAUSE_LOAD_MISALIGN  4'h4
`define CSR_MCAUSE_STORE_MISALIGN 4'h6

//Priveleged FUNC3
`define PRIV_FUNC3 3'b000

`define SYSTEM_ECALL  12'h000
`define SYSTEM_EBREAK 12'h001
`define SYSTEM_MRET   12'h302
`define SYSTEM_WFI    12'h105

//CSR FUNC3
`define CSRRW_FUNC3  3'b001
`define CSRRS_FUNC3  3'b010
`define CSRRC_FUNC3  3'b011
`define CSRRWI_FUNC3 3'b101
`define CSRRSI_FUNC3 3'b110
`define CSRRCI_FUNC3 3'b111

//JALR FUNC3
`define JALR_FUNC3 3'b000

//Branch FUNC3
`define BEQ_FUNC3  3'b000
`define BNE_FUNC3  3'b001
`define BLT_FUNC3  3'b100
`define BGE_FUNC3  3'b101
`define BLTU_FUNC3 3'b110
`define BGEU_FUNC3 3'b111

//Load/store FUNC3
`define LS_BYTE_FUNC3  3'b000
`define LS_HALF_FUNC3  3'b001
`define LS_WORD_FUNC3  3'b010
`define LS_DUBL_FUNC3  3'b011
`define LS_UBYTE_FUNC3 3'b100
`define LS_UHALF_FUNC3 3'b101
`define LS_UWORD_FUNC3 3'b110
`define LS_UDUBL_FUNC3 3'b111

//ALU FUNC3
`define ADDSUB_FUNC3 3'b000
`define SLL_FUNC3    3'b001
`define SLT_FUNC3    3'b010
`define SLTU_FUNC3   3'b011
`define XOR_FUNC3    3'b100
`define SR_FUNC3     3'b101
`define OR_FUNC3     3'b110
`define AND_FUNC3    3'b111

//Multipy FUNC3
`define MUL_FUNC3    3'b000
`define MULH_FUNC3   3'b001
`define MULHSU_FUNC3 3'b010
`define MULHU_FUNC3  3'b011
`define DIV_FUNC3    3'b100
`define DIVU_FUNC3   3'b101
`define REM_FUNC3    3'b110
`define REMU_FUNC3   3'b111

//ALU FUNC7
`define ALU_FUNC7         7'b0000000
`define ADDSUB_ADD_FUNC7  7'b0000000
`define ADDSUB_SUB_FUNC7  7'b0100000
`define SHIFT_LOGIC_FUNC7 7'b0000000
`define SHIFT_ARITH_FUNC7 7'b0100000
`define MUL_FUNC7         7'b0000001

// debug_info by kshan
`define BW_DEBUG_INFO (1+32+32)

//------------------------------------------------------------------------------
// Types (VHDL enumerations -> integer/vector encodings)
//------------------------------------------------------------------------------
// type cache_policy is (READ_ONLY, WRITE_THROUGH, WRITE_BACK);
`define CACHE_POLICY_READ_ONLY     0
`define CACHE_POLICY_WRITE_THROUGH 1
`define CACHE_POLICY_WRITE_BACK    2

// type cache_control_command is (INITIALIZE, INVALIDATE, FLUSH, WRITEBACK);
// carried on 2-bit ports
`define CACHE_CONTROL_COMMAND_WIDTH 2
`define CACHE_CONTROL_INITIALIZE 2'd0
`define CACHE_CONTROL_INVALIDATE 2'd1
`define CACHE_CONTROL_FLUSH      2'd2
`define CACHE_CONTROL_WRITEBACK  2'd3

// type request_register_type is (OFF, LIGHT, FULL);
`define REQUEST_REGISTER_OFF   0
`define REQUEST_REGISTER_LIGHT 1
`define REQUEST_REGISTER_FULL  2

// type vcp_type is (DISABLED, THIRTY_TWO_BIT, SIXTY_FOUR_BIT);
`define VCP_DISABLED       0
`define VCP_THIRTY_TWO_BIT 1
`define VCP_SIXTY_FOUR_BIT 2

// function INSTRUCTION_SIZE (VCP_ENABLE : vcp_type) return positive;
`define INSTRUCTION_SIZE(VCP) (((VCP) != `VCP_DISABLED) ? 64 : 32)

`endif // CONSTANTS_PKG_VH
