//------------------------------------------------------------------------------
// orca_core.v
// Converted 1:1 from orca_core.vhd (entity orca_core, arch rtl)
// Instance names preserved: I (instruction_fetch), D (decode), X (execute).
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module orca_core
  #(
    parameter REGISTER_SIZE          = 32,
    parameter RESET_VECTOR           = 32'h00000000,
    parameter INTERRUPT_VECTOR       = 32'h00000200,
    parameter MAX_IFETCHES_IN_FLIGHT = 1,
    parameter BTB_ENTRIES            = 0,
    parameter MULTIPLY_ENABLE        = 0,  // boolean
    parameter DIVIDE_ENABLE          = 0,  // boolean
    parameter SHIFTER_MAX_CYCLES     = 1,
    parameter POWER_OPTIMIZED        = 0,  // boolean
    parameter ENABLE_EXCEPTIONS      = 1,  // boolean
    parameter PIPELINE_STAGES        = 5,
    parameter ENABLE_EXT_INTERRUPTS  = 0,  // boolean
    parameter NUM_INTERRUPTS         = 1,
    parameter VCP_ENABLE             = `VCP_DISABLED,
    parameter WRITE_FIRST_SMALL_RAMS = 0,  // boolean
    parameter FAMILY                 = "GENERIC",

    parameter AUX_MEMORY_REGIONS = 0,
    parameter AMR0_ADDR_BASE     = 32'h00000000,
    parameter AMR0_ADDR_LAST     = 32'hFFFFFFFF,
    parameter AMR0_READ_ONLY     = 1,  // boolean

    parameter UC_MEMORY_REGIONS = 1,
    parameter UMR0_ADDR_BASE    = 32'hFFFFFFFF,
    parameter UMR0_ADDR_LAST    = 32'h00000000,
    parameter UMR0_READ_ONLY    = 0,  // boolean

    parameter HAS_ICACHE = 0,  // boolean
    parameter HAS_DCACHE = 0   // boolean
    )
  (
   input  wire                                          clk,
   input  wire                                          reset,

   input  wire [NUM_INTERRUPTS-1:0]                     global_interrupts,

   input  wire                                          memory_interface_idle,

   //ICache control (Invalidate/flush/writeback)
   input  wire                                          from_icache_control_ready,
   output wire                                          to_icache_control_valid,
   output wire [`CACHE_CONTROL_COMMAND_WIDTH-1:0]       to_icache_control_command,

   //DCache control (Invalidate/flush/writeback)
   input  wire                                          from_dcache_control_ready,
   output wire                                          to_dcache_control_valid,
   output wire [`CACHE_CONTROL_COMMAND_WIDTH-1:0]       to_dcache_control_command,

   //Cache control common signals
   output wire [REGISTER_SIZE-1:0]                      to_cache_control_base,
   output wire [REGISTER_SIZE-1:0]                      to_cache_control_last,

   //Instruction ORCA-internal memory-mapped master
   output wire [REGISTER_SIZE-1:0]                      ifetch_oimm_address,
   output wire                                          ifetch_oimm_requestvalid,
   input  wire [REGISTER_SIZE-1:0]                      ifetch_oimm_readdata,
   input  wire                                          ifetch_oimm_waitrequest,
   input  wire                                          ifetch_oimm_readdatavalid,

   //Data ORCA-internal memory-mapped master
   output wire [REGISTER_SIZE-1:0]                      lsu_oimm_address,
   output wire [(REGISTER_SIZE/8)-1:0]                  lsu_oimm_byteenable,
   output wire                                          lsu_oimm_requestvalid,
   output wire                                          lsu_oimm_readnotwrite,
   output wire [REGISTER_SIZE-1:0]                      lsu_oimm_writedata,
   input  wire [REGISTER_SIZE-1:0]                      lsu_oimm_readdata,
   input  wire                                          lsu_oimm_readdatavalid,
   input  wire                                          lsu_oimm_waitrequest,

   //Auxiliary/Uncached memory regions
   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_base_addrs,
   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_last_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_base_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_last_addrs,

   //Timer signals
   input  wire [63:0]                                   timer_value,
   input  wire                                          timer_interrupt,

   //Vector coprocessor port
   output wire [REGISTER_SIZE-1:0]                      vcp_data0,
   output wire [REGISTER_SIZE-1:0]                      vcp_data1,
   output wire [REGISTER_SIZE-1:0]                      vcp_data2,
   output wire [40:0]                                   vcp_instruction,
   output wire                                          vcp_valid_instr,
   input  wire                                          vcp_ready,
   input  wire                                          vcp_illegal,
   input  wire [REGISTER_SIZE-1:0]                      vcp_writeback_data,
   input  wire                                          vcp_writeback_en,
   input  wire [REGISTER_SIZE-1:0]                      vcp_alu_data1,
   input  wire [REGISTER_SIZE-1:0]                      vcp_alu_data2,
   input  wire                                          vcp_alu_source_valid,
   output wire [REGISTER_SIZE-1:0]                      vcp_alu_result,
   output wire                                          vcp_alu_result_valid,

   // debug_info by kshan
   output wire [`BW_DEBUG_INFO-1:0]                     debug_info
   );

  wire                     pause_ifetch;

  wire                     ifetch_idle;
  wire                     decode_idle;
  wire                     execute_idle;
  wire                     core_idle;

  wire [REGISTER_SIZE-1:0] program_counter;

  wire [REGISTER_SIZE-1:0] to_pc_correction_data;
  wire [REGISTER_SIZE-1:0] to_pc_correction_source_pc;
  wire                     to_pc_correction_valid;
  wire                     to_pc_correction_predictable;
  wire                     from_pc_correction_ready;

  wire [31:0]              ifetch_to_decode_instruction;
  wire [REGISTER_SIZE-1:0] ifetch_to_decode_program_counter;
  wire [REGISTER_SIZE-1:0] ifetch_to_decode_predicted_pc;
  wire                     from_ifetch_valid;
  wire                     decode_to_ifetch_ready;
  wire                     from_decode_incomplete_instruction;

  wire                     to_decode_valid;
  wire [REGISTER_SIZE-1:0] decode_to_execute_rs1_data;
  wire [REGISTER_SIZE-1:0] decode_to_execute_rs2_data;
  wire [REGISTER_SIZE-1:0] decode_to_execute_rs3_data;
  wire [REGISTER_SIZE-12-1:0] decode_to_execute_sign_extension;
  wire [REGISTER_SIZE-1:0] decode_to_execute_program_counter;
  wire [REGISTER_SIZE-1:0] decode_to_execute_predicted_pc;
  wire [`INSTRUCTION_SIZE(VCP_ENABLE)-1:0] decode_to_execute_instruction;
  wire [31:0]              decode_to_execute_next_instruction;
  wire                     decode_to_execute_next_valid;
  wire                     from_decode_valid;
  wire                     execute_to_decode_ready;

  wire                     to_execute_valid;
  wire [`REGISTER_NAME_SIZE-1:0] execute_to_rf_select;
  wire [REGISTER_SIZE-1:0] execute_to_rf_data;
  wire                     execute_to_rf_valid;

  wire                     from_execute_pause_ifetch;
  wire                     to_ifetch_pause_ifetch;

  assign to_ifetch_pause_ifetch = (~(from_decode_incomplete_instruction & ifetch_idle)) &
                                  from_execute_pause_ifetch;

  instruction_fetch
    #(
      .REGISTER_SIZE          (REGISTER_SIZE),
      .RESET_VECTOR           (RESET_VECTOR),
      .MAX_IFETCHES_IN_FLIGHT (MAX_IFETCHES_IN_FLIGHT),
      .BTB_ENTRIES            (BTB_ENTRIES)
      )
  I (
      .clk   (clk),
      .reset (reset),

      .to_pc_correction_data        (to_pc_correction_data),
      .to_pc_correction_source_pc   (to_pc_correction_source_pc),
      .to_pc_correction_valid       (to_pc_correction_valid),
      .to_pc_correction_predictable (to_pc_correction_predictable),
      .from_pc_correction_ready     (from_pc_correction_ready),

      .pause_ifetch (to_ifetch_pause_ifetch),

      .ifetch_idle (ifetch_idle),

      .from_ifetch_instruction     (ifetch_to_decode_instruction),
      .from_ifetch_program_counter (ifetch_to_decode_program_counter),
      .from_ifetch_predicted_pc    (ifetch_to_decode_predicted_pc),
      .from_ifetch_valid           (from_ifetch_valid),
      .to_ifetch_ready             (decode_to_ifetch_ready),

      .program_counter (program_counter),

      .oimm_address       (ifetch_oimm_address),
      .oimm_requestvalid  (ifetch_oimm_requestvalid),
      .oimm_readdata      (ifetch_oimm_readdata),
      .oimm_readdatavalid (ifetch_oimm_readdatavalid),
      .oimm_waitrequest   (ifetch_oimm_waitrequest)
      );

  assign to_decode_valid = from_ifetch_valid & (~to_pc_correction_valid);

  decode
    #(
      .REGISTER_SIZE          (REGISTER_SIZE),
      .SIGN_EXTENSION_SIZE    (`SIGN_EXTENSION_SIZE),
      .VCP_ENABLE             (VCP_ENABLE),
      .PIPELINE_STAGES        (PIPELINE_STAGES-3),
      .WRITE_FIRST_SMALL_RAMS (WRITE_FIRST_SMALL_RAMS),
      .FAMILY                 (FAMILY)
      )
  D (
      .clk   (clk),
      .reset (reset),

      .to_rf_select (execute_to_rf_select),
      .to_rf_data   (execute_to_rf_data),
      .to_rf_valid  (execute_to_rf_valid),

      .to_decode_program_counter          (ifetch_to_decode_program_counter),
      .to_decode_predicted_pc             (ifetch_to_decode_predicted_pc),
      .to_decode_instruction              (ifetch_to_decode_instruction),
      .to_decode_valid                    (to_decode_valid),
      .from_decode_ready                  (decode_to_ifetch_ready),
      .from_decode_incomplete_instruction (from_decode_incomplete_instruction),

      .quash_decode (to_pc_correction_valid),
      .decode_idle  (decode_idle),

      .from_decode_rs1_data         (decode_to_execute_rs1_data),
      .from_decode_rs2_data         (decode_to_execute_rs2_data),
      .from_decode_rs3_data         (decode_to_execute_rs3_data),
      .from_decode_sign_extension   (decode_to_execute_sign_extension),
      .from_decode_program_counter  (decode_to_execute_program_counter),
      .from_decode_predicted_pc     (decode_to_execute_predicted_pc),
      .from_decode_instruction      (decode_to_execute_instruction),
      .from_decode_next_instruction (decode_to_execute_next_instruction),
      .from_decode_next_valid       (decode_to_execute_next_valid),
      .from_decode_valid            (from_decode_valid),
      .to_decode_ready              (execute_to_decode_ready)
      );

  assign to_execute_valid = from_decode_valid & (~to_pc_correction_valid);

  execute
    #(
      .REGISTER_SIZE         (REGISTER_SIZE),
      .SIGN_EXTENSION_SIZE   (`SIGN_EXTENSION_SIZE),
      .INTERRUPT_VECTOR      (INTERRUPT_VECTOR),
      .BTB_ENTRIES           (BTB_ENTRIES),
      .MULTIPLY_ENABLE       (MULTIPLY_ENABLE),
      .DIVIDE_ENABLE         (DIVIDE_ENABLE),
      .POWER_OPTIMIZED       (POWER_OPTIMIZED),
      .SHIFTER_MAX_CYCLES    (SHIFTER_MAX_CYCLES),
      .ENABLE_EXCEPTIONS     (ENABLE_EXCEPTIONS),
      .ENABLE_EXT_INTERRUPTS (ENABLE_EXT_INTERRUPTS),
      .NUM_INTERRUPTS        (NUM_INTERRUPTS),
      .VCP_ENABLE            (VCP_ENABLE),
      .FAMILY                (FAMILY),

      .AUX_MEMORY_REGIONS (AUX_MEMORY_REGIONS),
      .AMR0_ADDR_BASE     (AMR0_ADDR_BASE),
      .AMR0_ADDR_LAST     (AMR0_ADDR_LAST),
      .AMR0_READ_ONLY     (AMR0_READ_ONLY),

      .UC_MEMORY_REGIONS (UC_MEMORY_REGIONS),
      .UMR0_ADDR_BASE    (UMR0_ADDR_BASE),
      .UMR0_ADDR_LAST    (UMR0_ADDR_LAST),
      .UMR0_READ_ONLY    (UMR0_READ_ONLY),

      .HAS_ICACHE (HAS_ICACHE),
      .HAS_DCACHE (HAS_DCACHE)
      )
  X (
      .clk   (clk),
      .reset (reset),

      .global_interrupts     (global_interrupts),
      .program_counter       (program_counter),
      .core_idle             (core_idle),
      .memory_interface_idle (memory_interface_idle),

      .to_execute_valid            (to_execute_valid),
      .to_execute_program_counter  (decode_to_execute_program_counter),
      .to_execute_predicted_pc     (decode_to_execute_predicted_pc),
      .to_execute_instruction      (decode_to_execute_instruction),
      .to_execute_next_instruction (decode_to_execute_next_instruction),
      .to_execute_next_valid       (decode_to_execute_next_valid),
      .to_execute_rs1_data         (decode_to_execute_rs1_data),
      .to_execute_rs2_data         (decode_to_execute_rs2_data),
      .to_execute_rs3_data         (decode_to_execute_rs3_data),
      .to_execute_sign_extension   (decode_to_execute_sign_extension),
      .from_execute_ready          (execute_to_decode_ready),

      .execute_idle (execute_idle),

      .to_pc_correction_data        (to_pc_correction_data),
      .to_pc_correction_source_pc   (to_pc_correction_source_pc),
      .to_pc_correction_valid       (to_pc_correction_valid),
      .to_pc_correction_predictable (to_pc_correction_predictable),
      .from_pc_correction_ready     (from_pc_correction_ready),

      .to_rf_select (execute_to_rf_select),
      .to_rf_data   (execute_to_rf_data),
      .to_rf_valid  (execute_to_rf_valid),

      .lsu_oimm_address       (lsu_oimm_address),
      .lsu_oimm_byteenable    (lsu_oimm_byteenable),
      .lsu_oimm_requestvalid  (lsu_oimm_requestvalid),
      .lsu_oimm_readnotwrite  (lsu_oimm_readnotwrite),
      .lsu_oimm_writedata     (lsu_oimm_writedata),
      .lsu_oimm_readdata      (lsu_oimm_readdata),
      .lsu_oimm_readdatavalid (lsu_oimm_readdatavalid),
      .lsu_oimm_waitrequest   (lsu_oimm_waitrequest),

      .from_icache_control_ready (from_icache_control_ready),
      .to_icache_control_valid   (to_icache_control_valid),
      .to_icache_control_command (to_icache_control_command),

      .from_dcache_control_ready (from_dcache_control_ready),
      .to_dcache_control_valid   (to_dcache_control_valid),
      .to_dcache_control_command (to_dcache_control_command),

      .to_cache_control_base (to_cache_control_base),
      .to_cache_control_last (to_cache_control_last),

      .amr_base_addrs (amr_base_addrs),
      .amr_last_addrs (amr_last_addrs),
      .umr_base_addrs (umr_base_addrs),
      .umr_last_addrs (umr_last_addrs),

      .pause_ifetch (from_execute_pause_ifetch),

      .timer_value     (timer_value),
      .timer_interrupt (timer_interrupt),

      .vcp_data0            (vcp_data0),
      .vcp_data1            (vcp_data1),
      .vcp_data2            (vcp_data2),
      .vcp_instruction      (vcp_instruction),
      .vcp_valid_instr      (vcp_valid_instr),
      .vcp_ready            (vcp_ready),
      .vcp_illegal          (vcp_illegal),
      .vcp_writeback_data   (vcp_writeback_data),
      .vcp_writeback_en     (vcp_writeback_en),
      .vcp_alu_data1        (vcp_alu_data1),
      .vcp_alu_data2        (vcp_alu_data2),
      .vcp_alu_source_valid (vcp_alu_source_valid),
      .vcp_alu_result       (vcp_alu_result),
      .vcp_alu_result_valid (vcp_alu_result_valid),

      .debug_info (debug_info)
      );

  assign core_idle = ifetch_idle & decode_idle & execute_idle;

endmodule
