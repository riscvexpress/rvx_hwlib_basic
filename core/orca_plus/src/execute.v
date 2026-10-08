//------------------------------------------------------------------------------
// execute.v
// Converted 1:1 from execute.vhd (entity execute, arch behavioural)
// Instances kept with original names: alu, branch, ls_unit, syscall, vcp_port.
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module execute
  #(
    parameter REGISTER_SIZE         = 32,
    parameter SIGN_EXTENSION_SIZE   = 20,
    parameter INTERRUPT_VECTOR      = 32'h00000200,
    parameter BTB_ENTRIES           = 0,
    parameter POWER_OPTIMIZED       = 0,  // boolean
    parameter MULTIPLY_ENABLE       = 0,  // boolean
    parameter DIVIDE_ENABLE         = 0,  // boolean
    parameter SHIFTER_MAX_CYCLES    = 1,
    parameter ENABLE_EXCEPTIONS     = 0,  // boolean
    parameter ENABLE_EXT_INTERRUPTS = 0,  // boolean
    parameter NUM_INTERRUPTS        = 1,
    parameter VCP_ENABLE            = `VCP_DISABLED,
    parameter FAMILY                = "GENERIC",

    parameter AUX_MEMORY_REGIONS = 0,
    parameter AMR0_ADDR_BASE     = 32'h00000000,
    parameter AMR0_ADDR_LAST     = 32'hFFFFFFFF,
    parameter AMR0_READ_ONLY     = 0,  // boolean

    parameter UC_MEMORY_REGIONS = 0,
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
   input  wire [REGISTER_SIZE-1:0]                      program_counter,
   input  wire                                          core_idle,
   input  wire                                          memory_interface_idle,

   input  wire                                          to_execute_valid,
   input  wire [REGISTER_SIZE-1:0]                      to_execute_program_counter,
   input  wire [REGISTER_SIZE-1:0]                      to_execute_predicted_pc,
   input  wire [`INSTRUCTION_SIZE(VCP_ENABLE)-1:0]      to_execute_instruction,
   input  wire [31:0]                                   to_execute_next_instruction,
   input  wire                                          to_execute_next_valid,
   input  wire [REGISTER_SIZE-1:0]                      to_execute_rs1_data,
   input  wire [REGISTER_SIZE-1:0]                      to_execute_rs2_data,
   input  wire [REGISTER_SIZE-1:0]                      to_execute_rs3_data,
   input  wire [SIGN_EXTENSION_SIZE-1:0]                to_execute_sign_extension,
   output wire                                          from_execute_ready,

   //quash_execute input isn't needed as mispredicts have already resolved
   output wire                                          execute_idle,

   //To PC correction
   output wire [REGISTER_SIZE-1:0]                      to_pc_correction_data,
   output wire [REGISTER_SIZE-1:0]                      to_pc_correction_source_pc,
   output wire                                          to_pc_correction_valid,
   output wire                                          to_pc_correction_predictable,
   input  wire                                          from_pc_correction_ready,

   //To register file
   output reg  [`REGISTER_NAME_SIZE-1:0]                to_rf_select,
   output reg  [REGISTER_SIZE-1:0]                      to_rf_data,
   output wire                                          to_rf_valid,

   //Data ORCA-internal memory-mapped master
   output wire [REGISTER_SIZE-1:0]                      lsu_oimm_address,
   output wire [(REGISTER_SIZE/8)-1:0]                  lsu_oimm_byteenable,
   output wire                                          lsu_oimm_requestvalid,
   output wire                                          lsu_oimm_readnotwrite,
   output wire [REGISTER_SIZE-1:0]                      lsu_oimm_writedata,
   input  wire [REGISTER_SIZE-1:0]                      lsu_oimm_readdata,
   input  wire                                          lsu_oimm_readdatavalid,
   input  wire                                          lsu_oimm_waitrequest,

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

   //Auxiliary/Uncached memory regions
   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_base_addrs,
   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_last_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_base_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_last_addrs,

   output wire                                          pause_ifetch,

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

  localparam INSTR_WIDTH = `INSTRUCTION_SIZE(VCP_ENABLE);

  // aliases into to_execute_instruction
  wire [6:0]                     opcode;
  wire [`REGISTER_NAME_SIZE-1:0] rd_select;
  wire [`REGISTER_NAME_SIZE-1:0] rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0] rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0] rs3_select;

  wire                     use_after_produce_stall;
  reg                      to_rf_select_writeable;

  wire [REGISTER_SIZE-1:0] rs1_data;
  wire [REGISTER_SIZE-1:0] rs2_data;
  wire [REGISTER_SIZE-1:0] rs3_data;

  // aliases into to_execute_next_instruction
  wire [`REGISTER_NAME_SIZE-1:0] next_rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0] next_rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0] next_rs3_select;

  // type fwd_mux_t is (ALU_FWD, NO_FWD)
  localparam ALU_FWD = 1'b0;
  localparam NO_FWD  = 1'b1;
  reg rs1_mux;
  reg rs2_mux;
  reg rs3_mux;

  //Writeback data sources (VCP writes back through syscall)
  reg                      alu_select;
  wire                     to_alu_valid;
  wire                     from_alu_ready;
  wire                     from_alu_illegal;
  wire                     from_alu_valid;
  wire [REGISTER_SIZE-1:0] from_alu_data;
  reg                      branch_select;
  wire                     to_branch_valid;
  wire                     from_branch_illegal;
  wire                     from_branch_valid;
  wire [REGISTER_SIZE-1:0] from_branch_data;
  reg                      lsu_select;
  wire                     to_lsu_valid;
  wire                     from_lsu_ready;
  wire                     from_lsu_illegal;
  wire                     from_lsu_misalign;
  wire                     from_lsu_valid;
  wire [REGISTER_SIZE-1:0] from_lsu_data;
  reg                      syscall_select;
  wire                     to_syscall_valid;
  wire                     from_syscall_ready;
  wire                     from_syscall_illegal;
  wire                     from_syscall_valid;
  wire [REGISTER_SIZE-1:0] from_syscall_data;
  reg                      vcp_select;
  wire                     to_vcp_valid;

  reg                      from_opcode_illegal;
  wire                     illegal_instruction;

  wire [REGISTER_SIZE-1:0] to_alu_rs1_data;
  wire [REGISTER_SIZE-1:0] to_alu_rs2_data;

  wire                     branch_to_pc_correction_valid;
  wire [REGISTER_SIZE-1:0] branch_to_pc_correction_data;

  wire                     writeback_stall_from_lsu;
  wire                     load_in_progress;

  wire                     lsu_idle;
  wire                     memory_idle;

  wire                     syscall_to_pc_correction_valid;
  wire [REGISTER_SIZE-1:0] syscall_to_pc_correction_data;

  wire                     from_writeback_ready;
  wire [1:0]               to_rf_mux;
  wire                     vcp_writeback_select;

  wire                     from_branch_misaligned;

  //by hujang
  wire [REGISTER_SIZE-1:0] oimm_address;

  //by_kshan
  wire                     to_be_executed;
  reg                      executed;
  reg [INSTR_WIDTH-1:0]    executed_inst;
  reg [REGISTER_SIZE-1:0]  executed_pc;

  assign opcode     = to_execute_instruction[6:0];
  assign rd_select  = to_execute_instruction[11:7];
  assign rs1_select = to_execute_instruction[19:15];
  assign rs2_select = to_execute_instruction[24:20];
  assign rs3_select = to_execute_instruction[11:7];

  assign next_rs1_select = to_execute_next_instruction[19:15];
  assign next_rs2_select = to_execute_next_instruction[24:20];
  assign next_rs3_select = to_execute_next_instruction[11:7];

  //Decode instruction; could get pushed back to decode stage
  always @(*) begin
    alu_select     = 1'b0;
    branch_select  = 1'b0;
    lsu_select     = 1'b0;
    syscall_select = 1'b0;
    vcp_select     = 1'b0;

    from_opcode_illegal = 1'b0;

    //Decode OPCODE to select submodule.  All paths must decode to exactly one
    //submodule.
    case (opcode)
      `ALU_OP, `ALUI_OP, `LUI_OP, `AUIPC_OP: begin
        alu_select = 1'b1;
      end
      `JAL_OP, `JALR_OP, `BRANCH_OP: begin
        branch_select = 1'b1;
      end
      `LOAD_OP, `STORE_OP: begin
        lsu_select = 1'b1;
      end
      `SYSTEM_OP, `MISC_MEM_OP: begin
        syscall_select = 1'b1;
      end
      `VCP32_OP: begin
        if (VCP_ENABLE != `VCP_DISABLED) begin
          vcp_select = 1'b1;
        end else begin
          if (ENABLE_EXCEPTIONS != 0) begin
            from_opcode_illegal = 1'b1;
          end else begin
            alu_select = 1'b1;
          end
        end
      end
      `VCP64_OP: begin
        if (VCP_ENABLE == `VCP_SIXTY_FOUR_BIT) begin
          vcp_select = 1'b1;
        end else begin
          if (ENABLE_EXCEPTIONS != 0) begin
            from_opcode_illegal = 1'b1;
          end else begin
            alu_select = 1'b1;
          end
        end
      end
      default: begin
        if (ENABLE_EXCEPTIONS != 0) begin
          from_opcode_illegal = 1'b1;
        end else begin
          alu_select = 1'b1;
        end
      end
    endcase
  end

  assign to_alu_valid     = alu_select & to_execute_valid & from_writeback_ready;
  assign to_branch_valid  = branch_select & to_execute_valid & from_writeback_ready;
  assign to_lsu_valid     = lsu_select & to_execute_valid & from_writeback_ready;
  assign to_syscall_valid = syscall_select & to_execute_valid & from_writeback_ready;
  assign to_vcp_valid     = vcp_select & to_execute_valid & from_writeback_ready;

  assign from_execute_ready = (~to_execute_valid) |
                              (from_writeback_ready &
                               (((~lsu_select) | from_lsu_ready) &
                                ((~alu_select) | from_alu_ready) &
                                ((~syscall_select) | from_syscall_ready) &
                                ((~vcp_select) | vcp_ready)));

  assign illegal_instruction = to_execute_valid & from_writeback_ready &
                               (from_opcode_illegal |
                                (alu_select & from_alu_illegal) |
                                (branch_select & from_branch_illegal) |
                                (lsu_select & from_lsu_illegal) |
                                (syscall_select & from_syscall_illegal) |
                                (vcp_select & vcp_illegal));

  //---------------------------------------------------------------------------
  // REGISTER FORWARDING
  //---------------------------------------------------------------------------
  assign rs1_data = (rs1_mux == ALU_FWD) ? from_alu_data : to_execute_rs1_data;
  assign rs2_data = (rs2_mux == ALU_FWD) ? from_alu_data : to_execute_rs2_data;
  assign rs3_data = (rs3_mux == ALU_FWD) ? from_alu_data : to_execute_rs3_data;

  //No forward stall; system calls, loads, and branches aren't forwarded.
  assign use_after_produce_stall =
    ((to_rf_select == rs1_select) || (to_rf_select == rs2_select) ||
     ((to_rf_select == rs3_select) && (VCP_ENABLE != `VCP_DISABLED))) ?
    (to_rf_select_writeable & (from_syscall_valid | load_in_progress | from_branch_valid)) :
    1'b0;

  //Calculate forwarding muxes for next instruction in advance in order to
  //minimize execute cycle time.
  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      rs1_mux <= NO_FWD;
      rs2_mux <= NO_FWD;
      rs3_mux <= NO_FWD;
    end else begin
      if (from_writeback_ready == 1'b1) begin
        rs1_mux <= NO_FWD;
        rs2_mux <= NO_FWD;
        rs3_mux <= NO_FWD;
      end
      if ((to_alu_valid == 1'b1) && (from_alu_ready == 1'b1)) begin
        if (rd_select != `REGISTER_ZERO) begin
          if (rd_select == next_rs1_select) begin
            rs1_mux <= ALU_FWD;
          end
          if (rd_select == next_rs2_select) begin
            rs2_mux <= ALU_FWD;
          end
          if (rd_select == next_rs3_select) begin
            rs3_mux <= ALU_FWD;
          end
        end
      end
    end
  end

  assign to_alu_rs1_data = (vcp_select == 1'b1) ? vcp_alu_data1 : rs1_data;
  assign to_alu_rs2_data = (vcp_select == 1'b1) ? vcp_alu_data2 : rs2_data;

  arithmetic_unit
    #(
      .REGISTER_SIZE       (REGISTER_SIZE),
      .SIGN_EXTENSION_SIZE (SIGN_EXTENSION_SIZE),
      .POWER_OPTIMIZED     (POWER_OPTIMIZED),
      .MULTIPLY_ENABLE     (MULTIPLY_ENABLE),
      .DIVIDE_ENABLE       (DIVIDE_ENABLE),
      .SHIFTER_MAX_CYCLES  (SHIFTER_MAX_CYCLES),
      .ENABLE_EXCEPTIONS   (ENABLE_EXCEPTIONS),
      .FAMILY              (FAMILY)
      )
  alu (
       .clk (clk),

       .to_alu_valid     (to_alu_valid),
       .to_alu_rs1_data  (to_alu_rs1_data),
       .to_alu_rs2_data  (to_alu_rs2_data),
       .from_alu_ready   (from_alu_ready),
       .from_alu_illegal (from_alu_illegal),

       .vcp_source_valid (vcp_alu_source_valid),
       .vcp_select       (vcp_select),

       .from_execute_ready (from_execute_ready),
       .instruction        (to_execute_instruction[31:0]),
       .sign_extension     (to_execute_sign_extension),
       .current_pc         (to_execute_program_counter),

       .from_alu_data  (from_alu_data),
       .from_alu_valid (from_alu_valid)
       );

  branch_unit
    #(
      .REGISTER_SIZE       (REGISTER_SIZE),
      .SIGN_EXTENSION_SIZE (SIGN_EXTENSION_SIZE),
      .BTB_ENTRIES         (BTB_ENTRIES),
      .ENABLE_EXCEPTIONS   (ENABLE_EXCEPTIONS)
      )
  branch (
       .clk   (clk),
       .reset (reset),

       .to_branch_valid     (to_branch_valid),
       .from_branch_illegal (from_branch_illegal),

       .rs1_data       (rs1_data),
       .rs2_data       (rs2_data),
       .current_pc     (to_execute_program_counter),
       .predicted_pc   (to_execute_predicted_pc),
       .instruction    (to_execute_instruction[31:0]),
       .sign_extension (to_execute_sign_extension),

       .from_branch_valid          (from_branch_valid),
       .from_branch_data           (from_branch_data),
       .to_branch_ready            (from_writeback_ready),
       .target_misaligned          (from_branch_misaligned),
       .to_pc_correction_data      (branch_to_pc_correction_data),
       .to_pc_correction_source_pc (to_pc_correction_source_pc),
       .to_pc_correction_valid     (branch_to_pc_correction_valid),
       .from_pc_correction_ready   (from_pc_correction_ready)
       );

  load_store_unit
    #(
      .REGISTER_SIZE       (REGISTER_SIZE),
      .SIGN_EXTENSION_SIZE (SIGN_EXTENSION_SIZE),
      .ENABLE_EXCEPTIONS   (ENABLE_EXCEPTIONS)
      )
  ls_unit (
       .clk   (clk),
       .reset (reset),

       .lsu_idle (lsu_idle),

       .to_lsu_valid      (to_lsu_valid),
       .from_lsu_illegal  (from_lsu_illegal),
       .from_lsu_misalign (from_lsu_misalign),

       .rs1_data       (rs1_data),
       .rs2_data       (rs2_data),
       .instruction    (to_execute_instruction[31:0]),
       .sign_extension (to_execute_sign_extension),

       .load_in_progress         (load_in_progress),
       .writeback_stall_from_lsu (writeback_stall_from_lsu),

       .lsu_ready      (from_lsu_ready),
       .from_lsu_data  (from_lsu_data),
       .from_lsu_valid (from_lsu_valid),

       .oimm_address       (oimm_address),
       .oimm_byteenable    (lsu_oimm_byteenable),
       .oimm_requestvalid  (lsu_oimm_requestvalid),
       .oimm_readnotwrite  (lsu_oimm_readnotwrite),
       .oimm_writedata     (lsu_oimm_writedata),
       .oimm_readdata      (lsu_oimm_readdata),
       .oimm_readdatavalid (lsu_oimm_readdatavalid),
       .oimm_waitrequest   (lsu_oimm_waitrequest)
       );

  assign lsu_oimm_address = oimm_address;

  assign memory_idle = memory_interface_idle & lsu_idle;

  sys_call
    #(
      .REGISTER_SIZE    (REGISTER_SIZE),
      .POWER_OPTIMIZED  (POWER_OPTIMIZED),
      .INTERRUPT_VECTOR (INTERRUPT_VECTOR),

      .ENABLE_EXCEPTIONS     (ENABLE_EXCEPTIONS),
      .ENABLE_EXT_INTERRUPTS (ENABLE_EXT_INTERRUPTS),
      .NUM_INTERRUPTS        (NUM_INTERRUPTS),

      .VCP_ENABLE      (VCP_ENABLE),
      .MULTIPLY_ENABLE (MULTIPLY_ENABLE),

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
  syscall (
       .clk   (clk),
       .reset (reset),

       .global_interrupts (global_interrupts),
       .core_idle         (core_idle),
       .memory_idle       (memory_idle),
       .program_counter   (program_counter),

       .to_syscall_valid     (to_syscall_valid),
       .from_syscall_illegal (from_syscall_illegal),
       .rs1_data             (rs1_data),
       .rs2_data             (rs2_data),
       .instruction          (to_execute_instruction[31:0]),
       .current_pc           (to_execute_program_counter),
       .from_syscall_ready   (from_syscall_ready),

       .from_branch_misaligned (from_branch_misaligned),
       .illegal_instruction    (illegal_instruction),
       .from_lsu_addr_misalign (from_lsu_misalign),
       .from_lsu_address       (oimm_address),
       .from_syscall_valid     (from_syscall_valid),
       .from_syscall_data      (from_syscall_data),

       .to_pc_correction_data    (syscall_to_pc_correction_data),
       .to_pc_correction_valid   (syscall_to_pc_correction_valid),
       .from_pc_correction_ready (from_pc_correction_ready),

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

       .pause_ifetch (pause_ifetch),

       .timer_value     (timer_value),
       .timer_interrupt (timer_interrupt),

       .vcp_writeback_data (vcp_writeback_data),
       .vcp_writeback_en   (vcp_writeback_en)
       );

  vcp_handler
    #(
      .REGISTER_SIZE (REGISTER_SIZE),
      .VCP_ENABLE    (VCP_ENABLE)
      )
  vcp_port (
       .clk   (clk),
       .reset (reset),

       .instruction  (to_execute_instruction),
       .to_vcp_valid (to_vcp_valid),
       .vcp_select   (vcp_select),

       .rs1_data (rs1_data),
       .rs2_data (rs2_data),
       .rs3_data (rs3_data),

       .vcp_data0 (vcp_data0),
       .vcp_data1 (vcp_data1),
       .vcp_data2 (vcp_data2),

       .vcp_instruction      (vcp_instruction),
       .vcp_valid_instr      (vcp_valid_instr),
       .vcp_writeback_select (vcp_writeback_select)
       );

  assign vcp_alu_result_valid = from_alu_valid;
  assign vcp_alu_result       = from_alu_data;

  //----------------------------------------------------------------------------
  // PC correction (branch mispredict, interrupt, etc.)
  //----------------------------------------------------------------------------
  assign to_pc_correction_data = (syscall_to_pc_correction_valid == 1'b1) ?
                                 syscall_to_pc_correction_data :
                                 branch_to_pc_correction_data;
  assign to_pc_correction_valid = syscall_to_pc_correction_valid | branch_to_pc_correction_valid;
  //Don't put syscalls in the BTB as they have side effects and must flush the
  //pipeline anyway.
  assign to_pc_correction_predictable = ~syscall_to_pc_correction_valid;

  assign execute_idle = lsu_idle & (~to_pc_correction_valid);

  //----------------------------------------------------------------------------
  // Writeback
  //----------------------------------------------------------------------------
  assign from_writeback_ready = (~use_after_produce_stall) & (~writeback_stall_from_lsu);

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      to_rf_select           <= {`REGISTER_NAME_SIZE{1'b0}};
      to_rf_select_writeable <= 1'b0;
    end else begin
      if (from_writeback_ready == 1'b1) begin
        to_rf_select <= rd_select;
        if (rd_select == `REGISTER_ZERO) begin
          to_rf_select_writeable <= 1'b0;
        end else begin
          to_rf_select_writeable <= 1'b1;
        end
      end
    end
  end

  assign to_rf_mux = (from_syscall_valid == 1'b1) ? 2'b00 :
                     (load_in_progress == 1'b1)   ? 2'b01 :
                     (from_branch_valid == 1'b1)  ? 2'b10 :
                     2'b11;

  always @(*) begin
    case (to_rf_mux)
      2'b00:   to_rf_data = from_syscall_data;
      2'b01:   to_rf_data = from_lsu_data;
      2'b10:   to_rf_data = from_branch_data;
      default: to_rf_data = from_alu_data;
    endcase
  end

  assign to_rf_valid = to_rf_select_writeable & (from_syscall_valid |
                                                 from_lsu_valid |
                                                 from_branch_valid |
                                                 (from_alu_valid & (~vcp_writeback_select)));

  //-------------------------------------------------------------------------------
  // Simulation assertions and debug (VHDL translate_off block omitted)
  //-------------------------------------------------------------------------------

  // by_kshan
  assign to_be_executed = to_execute_valid & from_execute_ready;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      executed      <= 1'b0;
      executed_pc   <= {REGISTER_SIZE{1'b0}};
      executed_inst <= {INSTR_WIDTH{1'b0}};
    end else begin
      executed <= to_be_executed;
      if (to_be_executed == 1'b1) begin
        executed_pc   <= to_execute_program_counter;
        executed_inst <= to_execute_instruction;
      end
    end
  end

  assign debug_info = {executed, executed_pc[31:0], executed_inst[31:0]};

endmodule
