//------------------------------------------------------------------------------
// components_pkg.vh
// Converted 1:1 from components_pkg.vhd (package rv_components).
//
// The VHDL package rv_components contains ONLY component declarations for:
//   orca, memory_interface, orca_core, decode, execute, instruction_fetch,
//   arithmetic_unit, branch_unit, load_store_unit, register_file, sys_call,
//   ram_mux, bram_microsemi, a4l_master, axi_master,
//   ERVP_ORCA_CACHE_AXI_MASTER_OLD, cache_controller, cache, cache_mux,
//   oimm_register, oimm_throttler, bram_sdp_write_first, vcp_handler
//
// Verilog does not require component declarations; modules are instantiated
// directly by name.  This header is kept only to preserve the 1:1 file
// mapping.  It pulls in the shared constant/utility headers so that any file
// including components_pkg.vh (as the VHDL files did via "use
// work.rv_components.all") also gets the shared definitions.
//------------------------------------------------------------------------------
`ifndef COMPONENTS_PKG_VH
`define COMPONENTS_PKG_VH

`include "utils_pkg.vh"
`include "constants_pkg.vh"

`endif // COMPONENTS_PKG_VH
