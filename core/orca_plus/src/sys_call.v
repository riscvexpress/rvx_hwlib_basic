//------------------------------------------------------------------------------
// sys_call.v
// Converted 1:1 from sys_call.vhd (entity sys_call, arch rtl)
//
// cache_control_command outputs are 2-bit encoded (see constants_pkg.vh).
// VCP_ENABLE uses vcp_type encoding 0/1/2.
// The VHDL csr_vector arrays (mamr_base/mamr_last/mumr_base/mumr_last) are
// flattened to 4*REGISTER_SIZE wide buses so that each array element can be
// driven from its own generate branch (Verilog-2001 cannot drive individual
// array elements from separate processes).
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module sys_call
  #(
    parameter REGISTER_SIZE    = 32,
    parameter POWER_OPTIMIZED  = 0,   // boolean
    parameter INTERRUPT_VECTOR = 32'h00000200,

    parameter ENABLE_EXCEPTIONS     = 0,  // boolean
    parameter ENABLE_EXT_INTERRUPTS = 0,  // boolean
    parameter NUM_INTERRUPTS        = 1,

    parameter VCP_ENABLE      = `VCP_DISABLED,
    parameter MULTIPLY_ENABLE = 0,  // boolean

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
   input  wire                                                clk,
   input  wire                                                reset,

   input  wire [NUM_INTERRUPTS-1:0]                           global_interrupts,
   input  wire                                                core_idle,
   input  wire                                                memory_idle,
   input  wire [REGISTER_SIZE-1:0]                            program_counter,

   input  wire                                                to_syscall_valid,
   output reg                                                 from_syscall_illegal,
   input  wire [REGISTER_SIZE-1:0]                            current_pc,
   input  wire [31:0]                                         instruction,
   input  wire [REGISTER_SIZE-1:0]                            rs1_data,
   input  wire [REGISTER_SIZE-1:0]                            rs2_data,
   output wire                                                from_syscall_ready,

   input  wire                                                from_branch_misaligned,

   input  wire                                                illegal_instruction,

   input  wire                                                from_lsu_addr_misalign,
   input  wire [REGISTER_SIZE-1:0]                            from_lsu_address,

   output reg                                                 from_syscall_valid,
   output reg  [REGISTER_SIZE-1:0]                            from_syscall_data,

   output wire [REGISTER_SIZE-1:0]                            to_pc_correction_data,
   output wire                                                to_pc_correction_valid,
   input  wire                                                from_pc_correction_ready,

   input  wire                                                from_icache_control_ready,
   output reg                                                 to_icache_control_valid,
   output reg  [`CACHE_CONTROL_COMMAND_WIDTH-1:0]             to_icache_control_command,

   input  wire                                                from_dcache_control_ready,
   output reg                                                 to_dcache_control_valid,
   output reg  [`CACHE_CONTROL_COMMAND_WIDTH-1:0]             to_dcache_control_command,

   output reg  [REGISTER_SIZE-1:0]                            to_cache_control_base,
   output reg  [REGISTER_SIZE-1:0]                            to_cache_control_last,

   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_base_addrs,
   output wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_last_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_base_addrs,
   output wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_last_addrs,

   output wire                                                pause_ifetch,

   input  wire [63:0]                                         timer_value,
   input  wire                                                timer_interrupt,

   input  wire                                                vcp_writeback_en,
   input  wire [REGISTER_SIZE-1:0]                            vcp_writeback_data
   );

  // Sliceable constant vectors (literals/parameters cannot be bit-selected in
  // Verilog-2001, so constant wires are used instead)
  wire [11:0] CSR_MAMR0_BASE_C   = `CSR_MAMR0_BASE;
  wire [11:0] CSR_MAMR0_LAST_C   = `CSR_MAMR0_LAST;
  wire [11:0] CSR_MUMR0_BASE_C   = `CSR_MUMR0_BASE;
  wire [11:0] CSR_MUMR0_LAST_C   = `CSR_MUMR0_LAST;
  wire [6:0]  SYSTEM_OP_C        = `SYSTEM_OP;
  wire [31:0] INTERRUPT_VECTOR_C = INTERRUPT_VECTOR;

  reg                       fence_select;
  reg                       fencei_select;
  reg                       cache_select;
  reg                       csr_select;
  reg                       ebreak_select;
  reg                       ecall_select;
  reg                       mret_select;
  reg                       wfi_select;

  // CSR signals
  wire [REGISTER_SIZE-1:0]  mstatus;
  wire [REGISTER_SIZE-1:0]  mscratch;
  wire [REGISTER_SIZE-1:2]  mepc_reg;
  wire [REGISTER_SIZE-1:0]  mepc;
  wire [REGISTER_SIZE-1:0]  mcause;
  wire [REGISTER_SIZE-1:0]  mtval;
  wire [REGISTER_SIZE-1:0]  mtime;
  wire [REGISTER_SIZE-1:0]  mtimeh;
  wire [REGISTER_SIZE-1:0]  meimask;
  wire [REGISTER_SIZE-1:0]  meimask_full;
  wire [REGISTER_SIZE-1:0]  meipend;
  wire [REGISTER_SIZE-1:0]  mcache;
  wire [REGISTER_SIZE-1:0]  misa;
  wire [REGISTER_SIZE-1:2]  mtvec_reg;
  wire [REGISTER_SIZE-1:0]  mtvec;

  // aliases
  wire [11:0]               csr_number;  // instruction(31 downto 20)
  wire [6:0]                opcode;      // instruction(6 downto 0)
  wire [2:0]                func3;       // instruction(14 downto 12)
  wire [6:0]                func7;       // instruction(31 downto 25)
  wire [4:0]                imm;         // instruction(19 downto 15) (CSR_ZIMM)
  wire [`REGISTER_NAME_SIZE-1:0] rs1_select;  // instruction(19 downto 15)
  wire [`REGISTER_NAME_SIZE-1:0] rd_select;   // instruction(11 downto 7)
  wire [REGISTER_SIZE-1:0]  bit_sel;     // alias of rs1_data

  reg [REGISTER_SIZE-1:0]   csr_readdata;
  reg [REGISTER_SIZE-1:0]   csr_writedata;
  reg [REGISTER_SIZE-1:0]   last_csr_writedata;

  wire                      was_mret;
  wire                      was_illegal;
  reg                       fence_pc_correction_valid;
  reg [REGISTER_SIZE-1:0]   next_fence_pc;

  reg                       fence_pending;
  wire                      interrupt_pending;
  wire                      interrupt_pc_correction_valid;

  //Uncached/Auxiliary memory region CSR signals (flattened csr_vector(3 downto 0))
  wire [(4*REGISTER_SIZE)-1:0] mamr_base;
  wire [(4*REGISTER_SIZE)-1:0] mamr_last;
  wire [(4*REGISTER_SIZE)-1:0] mumr_base;
  wire [(4*REGISTER_SIZE)-1:0] mumr_last;
  wire [3:0]                   amr_base_select;
  wire [3:0]                   amr_last_select;
  wire [3:0]                   umr_base_select;
  wire [3:0]                   umr_last_select;
  reg  [3:0]                   amr_base_write;
  reg  [3:0]                   amr_last_write;
  reg  [3:0]                   umr_base_write;
  reg  [3:0]                   umr_last_write;

  assign csr_number = instruction[31:20];
  assign opcode     = instruction[6:0];
  assign func3      = instruction[14:12];
  assign func7      = instruction[31:25];
  assign imm        = instruction[19:15];
  assign rs1_select = instruction[19:15];
  assign rd_select  = instruction[11:7];
  assign bit_sel    = rs1_data;

  //Decode instruction to select submodule.  All paths must decode to exactly
  //one submodule.
  //ASSUMES only SYSTEM_OP | MISC_MEM_OP for opcode.
  always @(*) begin
    fence_select         = 1'b0;
    fencei_select        = 1'b0;
    cache_select         = 1'b0;
    csr_select           = 1'b0;
    ebreak_select        = 1'b0;
    ecall_select         = 1'b0;
    mret_select          = 1'b0;
    wfi_select           = 1'b0;
    from_syscall_illegal = 1'b0;

    if (opcode[6] == SYSTEM_OP_C[6]) begin
      if (ENABLE_EXCEPTIONS != 0) begin
        case (func3)
          `PRIV_FUNC3: begin
            if ((rs1_select != `REGISTER_ZERO) || (rd_select != `REGISTER_ZERO)) begin
              from_syscall_illegal = 1'b1;
            end else begin
              case (csr_number)
                `SYSTEM_ECALL: begin
                  ecall_select = 1'b1;
                end
                `SYSTEM_EBREAK: begin
                  ebreak_select = 1'b1;
                end
                `SYSTEM_MRET: begin
                  mret_select = 1'b1;
                end
                `SYSTEM_WFI: begin
                  wfi_select = 1'b1;
                end
                default: begin
                  from_syscall_illegal = 1'b1;
                end
              endcase
            end
          end
          3'b100: begin
            from_syscall_illegal = 1'b1;
          end
          default: begin
            csr_select = 1'b1;
          end
        endcase
      end else begin
        csr_select = 1'b1;
      end
    end else begin
      case (func3)
        `FENCE_FUNC3: begin
          fence_select = 1'b1;
        end
        `REGION_FUNC3: begin
          case (func7)
            `FENCE_I_FUNC7, `FENCE_RI_FUNC7: begin
              fencei_select = 1'b1;
            end
            `FENCE_RD_FUNC7: begin
              fence_select = 1'b1;
            end
            `CACHE_WRITEBACK_FUNC7, `CACHE_FLUSH_FUNC7, `CACHE_DISCARD_FUNC7: begin
              if (HAS_DCACHE != 0) begin
                cache_select = 1'b1;
              end else begin
                fence_select = 1'b1;
              end
            end
            default: begin
              if (ENABLE_EXCEPTIONS != 0) begin
                from_syscall_illegal = 1'b1;
              end else begin
                fence_select = 1'b1;
              end
            end
          endcase
        end
        default: begin
          if (ENABLE_EXCEPTIONS != 0) begin
            from_syscall_illegal = 1'b1;
          end else begin
            fence_select = 1'b1;
          end
        end
      endcase
    end
  end

  assign mtime  = timer_value[REGISTER_SIZE-1:0];
  assign mtimeh = timer_value[63:63-REGISTER_SIZE+1];

  // misa: only bits 31:30, 23, 12, 8 assigned in VHDL; remaining bits were
  // left unassigned ('U') and are tied to 0 here.
  assign misa[REGISTER_SIZE-1:REGISTER_SIZE-2] = 2'b01;
  assign misa[29:24]                           = 6'b000000;
  assign misa[23]                              = (VCP_ENABLE == `VCP_DISABLED) ? 1'b0 : 1'b1;
  assign misa[22:13]                           = 10'b0000000000;
  assign misa[12]                              = (MULTIPLY_ENABLE != 0) ? 1'b1 : 1'b0;
  assign misa[11:9]                            = 3'b000;
  assign misa[8]                               = 1'b1;  //I
  assign misa[7:0]                             = 8'h00;

  always @(*) begin
    case (csr_number)
      `CSR_MISA:       csr_readdata = misa;
      `CSR_MSCRATCH:   csr_readdata = mscratch;
      `CSR_MSTATUS:    csr_readdata = mstatus;
      `CSR_MEPC:       csr_readdata = mepc;
      `CSR_MCAUSE:     csr_readdata = mcause;
      `CSR_MTVAL:      csr_readdata = mtval;
      `CSR_MIE:        csr_readdata = meimask;  // by_kshan
      `CSR_MIP:        csr_readdata = meipend;  // by_kshan
      `CSR_MTIME:      csr_readdata = mtime;
      `CSR_MTIMEH:     csr_readdata = mtimeh;
      `CSR_UTIME:      csr_readdata = mtime;
      `CSR_UTIMEH:     csr_readdata = mtimeh;
      `CSR_MCACHE:     csr_readdata = mcache;
      `CSR_MTVEC:      csr_readdata = mtvec;
      `CSR_MAMR0_BASE: csr_readdata = mamr_base[REGISTER_SIZE-1:0];
      `CSR_MAMR1_BASE: csr_readdata = mamr_base[(2*REGISTER_SIZE)-1:REGISTER_SIZE];
      `CSR_MAMR2_BASE: csr_readdata = mamr_base[(3*REGISTER_SIZE)-1:2*REGISTER_SIZE];
      `CSR_MAMR3_BASE: csr_readdata = mamr_base[(4*REGISTER_SIZE)-1:3*REGISTER_SIZE];
      `CSR_MAMR0_LAST: csr_readdata = mamr_last[REGISTER_SIZE-1:0];
      `CSR_MAMR1_LAST: csr_readdata = mamr_last[(2*REGISTER_SIZE)-1:REGISTER_SIZE];
      `CSR_MAMR2_LAST: csr_readdata = mamr_last[(3*REGISTER_SIZE)-1:2*REGISTER_SIZE];
      `CSR_MAMR3_LAST: csr_readdata = mamr_last[(4*REGISTER_SIZE)-1:3*REGISTER_SIZE];
      `CSR_MUMR0_BASE: csr_readdata = mumr_base[REGISTER_SIZE-1:0];
      `CSR_MUMR1_BASE: csr_readdata = mumr_base[(2*REGISTER_SIZE)-1:REGISTER_SIZE];
      `CSR_MUMR2_BASE: csr_readdata = mumr_base[(3*REGISTER_SIZE)-1:2*REGISTER_SIZE];
      `CSR_MUMR3_BASE: csr_readdata = mumr_base[(4*REGISTER_SIZE)-1:3*REGISTER_SIZE];
      `CSR_MUMR0_LAST: csr_readdata = mumr_last[REGISTER_SIZE-1:0];
      `CSR_MUMR1_LAST: csr_readdata = mumr_last[(2*REGISTER_SIZE)-1:REGISTER_SIZE];
      `CSR_MUMR2_LAST: csr_readdata = mumr_last[(3*REGISTER_SIZE)-1:2*REGISTER_SIZE];
      `CSR_MUMR3_LAST: csr_readdata = mumr_last[(4*REGISTER_SIZE)-1:3*REGISTER_SIZE];
      default:         csr_readdata = {REGISTER_SIZE{1'b0}};
    endcase
  end

  always @(*) begin
    case (func3)
      `CSRRCI_FUNC3: csr_writedata = {csr_readdata[31:5], (csr_readdata[4:0] & (~imm))};
      `CSRRSI_FUNC3: csr_writedata = {csr_readdata[31:5], (csr_readdata[4:0] | imm)};
      `CSRRWI_FUNC3: csr_writedata = {{(REGISTER_SIZE-5){1'b0}}, imm};
      `CSRRC_FUNC3:  csr_writedata = csr_readdata & (~rs1_data);
      `CSRRS_FUNC3:  csr_writedata = csr_readdata | rs1_data;
      default:       csr_writedata = rs1_data;  //CSRRW_FUNC3
    endcase
  end

  //WFI holds until an interrupt enabled in mie is pending; other syscall
  //instructions execute without backpressure
  assign from_syscall_ready = (ENABLE_EXT_INTERRUPTS != 0) ?
                              ~(wfi_select & to_syscall_valid & ((meimask & meipend) == {REGISTER_SIZE{1'b0}})) : 1'b1;

  generate
    if (ENABLE_EXCEPTIONS != 0) begin : exceptions_gen
      reg                      was_mret_reg;
      reg                      was_illegal_reg;
      reg                      interrupt_pc_correction_valid_reg;
      reg [REGISTER_SIZE-1:2]  mtvec_reg_r;
      reg                      mstatus_mie;
      reg                      mstatus_mpie;
      reg [REGISTER_SIZE-1:2]  mepc_reg_r;
      reg                      mcause_interrupt;   // mcause(mcause'left)
      reg [3:0]                mcause_exc_code;    // mcause(CSR_MCAUSE_CODE'range)
      reg [REGISTER_SIZE-1:0]  meimask_full_reg;
      reg [REGISTER_SIZE-1:0]  mtval_reg;
      reg [REGISTER_SIZE-1:0]  mscratch_reg;

      assign was_mret                      = was_mret_reg;
      assign was_illegal                   = was_illegal_reg;
      assign interrupt_pc_correction_valid = interrupt_pc_correction_valid_reg;
      assign mtvec_reg                     = mtvec_reg_r;
      assign mepc_reg                      = mepc_reg_r;
      assign meimask_full                  = meimask_full_reg;
      assign mtval                         = mtval_reg;
      assign mscratch                      = mscratch_reg;

      // mstatus: only MIE and MPIE bits implemented, others '0'
      assign mstatus = {{(REGISTER_SIZE-1-`CSR_MSTATUS_MPIE){1'b0}},
                        mstatus_mpie,
                        {(`CSR_MSTATUS_MPIE-1-`CSR_MSTATUS_MIE){1'b0}},
                        mstatus_mie,
                        {`CSR_MSTATUS_MIE{1'b0}}};
      // mcause: interrupt bit + exception code, others '0'
      assign mcause = {mcause_interrupt, {(REGISTER_SIZE-2-4+1){1'b0}}, mcause_exc_code};

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          was_mret_reg                      <= 1'b0;
          was_illegal_reg                   <= 1'b0;
          interrupt_pc_correction_valid_reg <= 1'b0;
          mtvec_reg_r                       <= INTERRUPT_VECTOR_C[REGISTER_SIZE-1:2];
          mstatus_mie                       <= 1'b0;
          mstatus_mpie                      <= 1'b0;
          mepc_reg_r                        <= {(REGISTER_SIZE-2){1'b0}};
          mcause_interrupt                  <= 1'b0;
          mcause_exc_code                   <= 4'b0000;
          meimask_full_reg                  <= {REGISTER_SIZE{1'b0}};
        end else begin
          //Hold pc_correction causing signals until they have been processed
          if (from_pc_correction_ready == 1'b1) begin
            was_mret_reg    <= 1'b0;
            was_illegal_reg <= 1'b0;
          end

          if ((illegal_instruction == 1'b1) ||
              (from_lsu_addr_misalign == 1'b1) ||
              (from_branch_misaligned == 1'b1) ||
              ((to_syscall_valid == 1'b1) && ((ebreak_select == 1'b1) || (ecall_select == 1'b1)))) begin
            //Handle Illegal Instructions
            mstatus_mie      <= 1'b0;
            mstatus_mpie     <= mstatus_mie;
            mcause_interrupt <= 1'b0;
            if (from_branch_misaligned == 1'b1) begin
              mcause_exc_code <= `CSR_MCAUSE_FETCH_MISALIGN;
              //according to the tests its legal to put zero in this register
              mtval_reg       <= {REGISTER_SIZE{1'b0}};
            end else if (illegal_instruction == 1'b1) begin
              mcause_exc_code <= `CSR_MCAUSE_ILLEGAL;
              mtval_reg       <= instruction[REGISTER_SIZE-1:0];
            end else if (from_lsu_addr_misalign == 1'b1) begin
              mtval_reg       <= from_lsu_address;
              mcause_exc_code <= `CSR_MCAUSE_LOAD_MISALIGN;
              if (instruction[5] == 1'b1) begin
                mcause_exc_code <= `CSR_MCAUSE_STORE_MISALIGN;
              end
            end else begin
              if (ebreak_select == 1'b1) begin
                mcause_exc_code <= `CSR_MCAUSE_EBREAK;
              end else begin
                mcause_exc_code <= `CSR_MCAUSE_MECALL;
              end
            end
            mepc_reg_r      <= current_pc[REGISTER_SIZE-1:2];
            was_illegal_reg <= 1'b1;
          end

          if (to_syscall_valid == 1'b1) begin
            if (csr_select == 1'b1) begin
              //CSR Read/Write
              case (csr_number)
                `CSR_MTVEC: begin
                  // Only direct exceptions are available; zero lower two bits
                  mtvec_reg_r <= csr_writedata[REGISTER_SIZE-1:2];
                end
                `CSR_MSTATUS: begin
                  // Only 2 bits are writeable.
                  mstatus_mie  <= csr_writedata[`CSR_MSTATUS_MIE];
                  mstatus_mpie <= csr_writedata[`CSR_MSTATUS_MPIE];
                end
                `CSR_MEPC: begin
                  mepc_reg_r <= csr_writedata[REGISTER_SIZE-1:2];
                end
                `CSR_MCAUSE: begin
                  //MCAUSE is WLRL so only legal values need to be supported
                  mcause_interrupt <= csr_writedata[REGISTER_SIZE-1];
                  mcause_exc_code  <= csr_writedata[3:0];
                end
                `CSR_MTVAL: begin
                  mtval_reg <= csr_writedata;
                end
                `CSR_MIE: begin  // by_kshan
                  meimask_full_reg <= csr_writedata;
                end
                `CSR_MSCRATCH: begin
                  mscratch_reg <= csr_writedata;
                end
                default: begin
                end
              endcase
            end

            if (mret_select == 1'b1) begin
              //MRET
              mstatus_mie  <= mstatus_mpie;
              mstatus_mpie <= 1'b0;
              was_mret_reg <= 1'b1;
            end
          end

          if (from_pc_correction_ready == 1'b1) begin
            interrupt_pc_correction_valid_reg <= 1'b0;
          end

          if ((interrupt_pending == 1'b1) && (core_idle == 1'b1)) begin
            interrupt_pc_correction_valid_reg <= 1'b1;

            // Latch in mepc the cycle before interrupt_pc_correction_valid goes high.
            mepc_reg_r       <= program_counter[REGISTER_SIZE-1:2];
            mstatus_mie      <= 1'b0;
            mstatus_mpie     <= 1'b1;
            mcause_interrupt <= 1'b1;
            // by_kshan
            if (meipend[7] == 1'b1) begin        // to_integer(CSR_MCAUSE_MTIMER)
              mcause_exc_code <= `CSR_MCAUSE_MTIMER;
            end else if (meipend[11] == 1'b1) begin  // to_integer(CSR_MCAUSE_MEXT)
              mcause_exc_code <= `CSR_MCAUSE_MEXT;
            end else if (meipend[3] == 1'b1) begin   // to_integer(CSR_MCAUSE_MSOFT)
              mcause_exc_code <= `CSR_MCAUSE_MSOFT;
            end else begin
              mcause_exc_code <= 4'd14;
            end
          end
        end
      end
    end
    if (ENABLE_EXCEPTIONS == 0) begin : no_exceptions_gen
      assign mtvec_reg                     = {(REGISTER_SIZE-2){1'b0}};
      assign was_mret                      = 1'b0;
      assign was_illegal                   = 1'b0;
      assign interrupt_pc_correction_valid = 1'b0;
      assign mstatus                       = {REGISTER_SIZE{1'b0}};
      assign mepc_reg                      = {(REGISTER_SIZE-2){1'b0}};
      assign mcause                        = {REGISTER_SIZE{1'b0}};
      // mscratch/mtval/meimask_full were left unassigned ('U') in VHDL when
      // exceptions are disabled; tied to 0 here.
      assign mscratch     = {REGISTER_SIZE{1'b0}};
      assign mtval        = {REGISTER_SIZE{1'b0}};
      assign meimask_full = {REGISTER_SIZE{1'b0}};
    end
  endgenerate

  assign mepc  = {mepc_reg, 2'b00};
  assign mtvec = {mtvec_reg, 2'b00};

  genvar gregister;
  generate
    for (gregister = 0; gregister <= 3; gregister = gregister + 1) begin : memory_region_registers_gen
      if ((AUX_MEMORY_REGIONS > gregister) &&
          ((UC_MEMORY_REGIONS != 0) || (HAS_ICACHE != 0) || (HAS_DCACHE != 0))) begin : amr_gen
        if ((gregister == 0) && (AMR0_READ_ONLY != 0)) begin : read_only_amr_gen
          assign amr_base_select[gregister] = 1'b0;
          assign amr_last_select[gregister] = 1'b0;
          assign mamr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = AMR0_ADDR_BASE;
          assign mamr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = AMR0_ADDR_LAST;
        end
        if ((gregister != 0) || (AMR0_READ_ONLY == 0)) begin : writeable_amr_gen
          localparam [REGISTER_SIZE-1:0] RESET_BASE = (gregister == 0) ? AMR0_ADDR_BASE : {REGISTER_SIZE{1'b1}};
          localparam [REGISTER_SIZE-1:0] RESET_LAST = (gregister == 0) ? AMR0_ADDR_LAST : {REGISTER_SIZE{1'b0}};

          reg [REGISTER_SIZE-1:0] mamr_base_reg;
          reg [REGISTER_SIZE-1:0] mamr_last_reg;

          assign amr_base_select[gregister] =
            ((csr_number[11:3] == CSR_MAMR0_BASE_C[11:3]) &&
             (csr_number[2:0] == gregister)) ? 1'b1 : 1'b0;
          assign amr_last_select[gregister] =
            ((csr_number[11:3] == CSR_MAMR0_LAST_C[11:3]) &&
             (csr_number[2:0] == gregister)) ? 1'b1 : 1'b0;

          assign mamr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = mamr_base_reg;
          assign mamr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = mamr_last_reg;

          always @(posedge clk or posedge reset) begin
            if (reset == 1'b1) begin
              mamr_base_reg <= RESET_BASE;
              mamr_last_reg <= RESET_LAST;
            end else begin
              //Don't write the new AMR until the pipeline and memory interface are
              //flushed
              if (from_pc_correction_ready == 1'b1) begin
                if ((memory_idle == 1'b1) &&
                    ((from_icache_control_ready == 1'b1) || (to_icache_control_valid == 1'b0)) &&
                    ((from_dcache_control_ready == 1'b1) || (to_dcache_control_valid == 1'b0))) begin
                  if (amr_base_write[gregister] == 1'b1) begin
                    mamr_base_reg <= last_csr_writedata;
                  end
                  if (amr_last_write[gregister] == 1'b1) begin
                    mamr_last_reg <= last_csr_writedata;
                  end
                end
              end
            end
          end
        end
      end
      if ((AUX_MEMORY_REGIONS <= gregister) ||
          ((UC_MEMORY_REGIONS == 0) && (HAS_ICACHE == 0) && (HAS_DCACHE == 0))) begin : no_amr_gen
        assign amr_base_select[gregister] = 1'b0;
        assign amr_last_select[gregister] = 1'b0;
        assign mamr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = {REGISTER_SIZE{1'b0}};
        assign mamr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = {REGISTER_SIZE{1'b0}};
      end
      if ((UC_MEMORY_REGIONS > gregister) &&
          ((AUX_MEMORY_REGIONS != 0) || (HAS_ICACHE != 0) || (HAS_DCACHE != 0))) begin : umr_gen
        if ((gregister == 0) && (UMR0_READ_ONLY != 0)) begin : read_only_umr_gen
          assign umr_base_select[gregister] = 1'b0;
          assign umr_last_select[gregister] = 1'b0;
          assign mumr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = UMR0_ADDR_BASE;
          assign mumr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = UMR0_ADDR_LAST;
        end
        if ((gregister != 0) || (UMR0_READ_ONLY == 0)) begin : writeable_umr_gen
          localparam [REGISTER_SIZE-1:0] RESET_BASE = (gregister == 0) ? UMR0_ADDR_BASE : {REGISTER_SIZE{1'b1}};
          localparam [REGISTER_SIZE-1:0] RESET_LAST = (gregister == 0) ? UMR0_ADDR_LAST : {REGISTER_SIZE{1'b0}};

          reg [REGISTER_SIZE-1:0] mumr_base_reg;
          reg [REGISTER_SIZE-1:0] mumr_last_reg;

          assign umr_base_select[gregister] =
            ((csr_number[11:3] == CSR_MUMR0_BASE_C[11:3]) &&
             (csr_number[2:0] == gregister)) ? 1'b1 : 1'b0;
          assign umr_last_select[gregister] =
            ((csr_number[11:3] == CSR_MUMR0_LAST_C[11:3]) &&
             (csr_number[2:0] == gregister)) ? 1'b1 : 1'b0;

          assign mumr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = mumr_base_reg;
          assign mumr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = mumr_last_reg;

          always @(posedge clk or posedge reset) begin
            if (reset == 1'b1) begin
              mumr_base_reg <= RESET_BASE;
              mumr_last_reg <= RESET_LAST;
            end else begin
              //Don't write the new UMR until the pipeline and memory interface are
              //flushed
              if (from_pc_correction_ready == 1'b1) begin
                if ((memory_idle == 1'b1) &&
                    ((from_icache_control_ready == 1'b1) || (to_icache_control_valid == 1'b0)) &&
                    ((from_dcache_control_ready == 1'b1) || (to_dcache_control_valid == 1'b0))) begin
                  if (umr_base_write[gregister] == 1'b1) begin
                    mumr_base_reg <= last_csr_writedata;
                  end
                  if (umr_last_write[gregister] == 1'b1) begin
                    mumr_last_reg <= last_csr_writedata;
                  end
                end
              end
            end
          end
        end
      end
      if ((UC_MEMORY_REGIONS <= gregister) ||
          ((AUX_MEMORY_REGIONS == 0) && (HAS_ICACHE == 0) && (HAS_DCACHE == 0))) begin : no_umr_gen
        assign umr_base_select[gregister] = 1'b0;
        assign umr_last_select[gregister] = 1'b0;
        assign mumr_base[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = {REGISTER_SIZE{1'b0}};
        assign mumr_last[((gregister+1)*REGISTER_SIZE)-1:gregister*REGISTER_SIZE] = {REGISTER_SIZE{1'b0}};
      end
    end
  endgenerate

  genvar goreg;
  generate
    for (goreg = 0; goreg <= `imax(AUX_MEMORY_REGIONS, 1)-1; goreg = goreg + 1) begin : amr_gen
      assign amr_base_addrs[((goreg+1)*REGISTER_SIZE)-1:goreg*REGISTER_SIZE] =
        mamr_base[((goreg+1)*REGISTER_SIZE)-1:goreg*REGISTER_SIZE];
      assign amr_last_addrs[((goreg+1)*REGISTER_SIZE)-1:goreg*REGISTER_SIZE] =
        mamr_last[((goreg+1)*REGISTER_SIZE)-1:goreg*REGISTER_SIZE];
    end
  endgenerate
  genvar gureg;
  generate
    for (gureg = 0; gureg <= `imax(UC_MEMORY_REGIONS, 1)-1; gureg = gureg + 1) begin : umr_gen
      assign umr_base_addrs[((gureg+1)*REGISTER_SIZE)-1:gureg*REGISTER_SIZE] =
        mumr_base[((gureg+1)*REGISTER_SIZE)-1:gureg*REGISTER_SIZE];
      assign umr_last_addrs[((gureg+1)*REGISTER_SIZE)-1:gureg*REGISTER_SIZE] =
        mumr_last[((gureg+1)*REGISTER_SIZE)-1:gureg*REGISTER_SIZE];
    end
  endgenerate

  generate
    if (HAS_ICACHE != 0) begin : has_icache_gen
      assign mcache[`CSR_MCACHE_IEXISTS] = 1'b1;
    end
    if (HAS_ICACHE == 0) begin : no_icache_gen
      assign mcache[`CSR_MCACHE_IEXISTS] = 1'b0;
    end
    if (HAS_DCACHE != 0) begin : has_dcache_gen
      assign mcache[`CSR_MCACHE_DEXISTS] = 1'b1;
    end
    if (HAS_DCACHE == 0) begin : no_dcache_gen
      assign mcache[`CSR_MCACHE_DEXISTS] = 1'b0;
    end
  endgenerate
  assign mcache[REGISTER_SIZE-1:`CSR_MCACHE_DEXISTS+1] = {(REGISTER_SIZE-1-`CSR_MCACHE_DEXISTS){1'b0}};

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      from_syscall_valid        <= 1'b0;
      fence_pc_correction_valid <= 1'b0;
      fence_pending             <= 1'b0;
      to_icache_control_valid   <= 1'b0;
      to_dcache_control_valid   <= 1'b0;
      amr_base_write            <= 4'b0000;
      amr_last_write            <= 4'b0000;
      umr_base_write            <= 4'b0000;
      umr_last_write            <= 4'b0000;
    end else begin
      from_syscall_valid <= 1'b0;

      //Hold pc_correction causing signals until they have been processed
      if (from_pc_correction_ready == 1'b1) begin
        fence_pc_correction_valid <= 1'b0;

        //On FENCE.I hold the PC correction until all pending writebacks have
        //occurred and the ICache is flushed (from_icache_control_ready is
        //hardwired to '1' when no ICache is present).
        if ((memory_idle == 1'b1) &&
            ((from_icache_control_ready == 1'b1) || (to_icache_control_valid == 1'b0)) &&
            ((from_dcache_control_ready == 1'b1) || (to_dcache_control_valid == 1'b0))) begin
          fence_pending <= 1'b0;

          amr_base_write <= 4'b0000;
          amr_last_write <= 4'b0000;
          umr_base_write <= 4'b0000;
          umr_last_write <= 4'b0000;
        end
      end

      if (from_icache_control_ready == 1'b1) begin
        to_icache_control_valid <= 1'b0;
      end
      if (from_dcache_control_ready == 1'b1) begin
        to_dcache_control_valid <= 1'b0;
      end

      if ((illegal_instruction == 1'b0) && (to_syscall_valid == 1'b1)) begin
        if (csr_select == 1'b1) begin
          //CSR Read/Write
          from_syscall_valid <= 1'b1;
          from_syscall_data  <= csr_readdata;
          last_csr_writedata <= csr_writedata;

          //Changing cacheability flushes the pipeline and clears the
          //memory interface before resuming.
          if ((|(amr_base_select | amr_last_select | umr_base_select | umr_last_select)) == 1'b1) begin
            fence_pc_correction_valid <= 1'b1;
            fence_pending             <= 1'b1;
          end
          amr_base_write <= amr_base_select;
          amr_last_write <= amr_last_select;
          umr_base_write <= umr_base_select;
          umr_last_write <= umr_last_select;
        end

        next_fence_pc             <= current_pc + 32'd4;
        to_icache_control_command <= `CACHE_CONTROL_INVALIDATE;
        to_dcache_control_command <= `CACHE_CONTROL_WRITEBACK;

        to_cache_control_base <= rs1_data;
        to_cache_control_last <= rs2_data;

        if (fencei_select == 1'b1) begin
          //FENCE.I/FENCE.RI
          fence_pc_correction_valid <= 1'b1;
          fence_pending             <= 1'b1;
          to_icache_control_valid   <= 1'b1;
          to_dcache_control_valid   <= 1'b1;

          if (func7[1] == 1'b0) begin
            //FENCE.I does not take base/last parameters; applies to all of cache
            to_cache_control_base <= {REGISTER_SIZE{1'b0}};
            to_cache_control_last <= {REGISTER_SIZE{1'b1}};
          end

          //Unclear from the REGION draft spec if FENCE.RI should return a
          //value or not, since it can't partially complete.  Omitting for now
          //as it doesn't seem useful.
        end

        if (cache_select == 1'b1) begin
          //CACHE control instructions

          //A FENCE is implied by all cache control instructions.
          fence_pc_correction_valid <= 1'b1;
          fence_pending             <= 1'b1;

          //Cache control instructions must return a value > rs2 on completion,
          //corresponding to the start of memory not affected.  Since if all
          //memory is affected it's valid to return 0, just return 0 for all
          //these instructions.
          from_syscall_valid <= 1'b1;
          from_syscall_data  <= {REGISTER_SIZE{1'b0}};

          to_dcache_control_valid <= 1'b1;
          case (func7[1:0])
            2'b00: begin                //CACHE_WRITEBACK_FUNC7(1 downto 0)
              to_dcache_control_command <= `CACHE_CONTROL_WRITEBACK;
            end
            2'b01: begin                //CACHE_FLUSH_FUNC7(1 downto 0)
              to_dcache_control_command <= `CACHE_CONTROL_FLUSH;
            end
            default: begin  //CACHE_DISCARD_FUNC7(1 downto 0) + don't care
              //Currently INVALIDATE invalidates the entire cache which is not
              //safe.  Until region support is added just flush the cache which
              //is always safe.
              to_dcache_control_command <= `CACHE_CONTROL_FLUSH;
            end
          endcase
        end

        if (fence_select == 1'b1) begin
          //FENCE: all interfaces are strictly ordered; nothing to do.
        end

        if ((wfi_select == 1'b1) && (from_syscall_ready == 1'b1)) begin
          //WFI: discard the instructions fetched after it so that a pending
          //interrupt is taken right after WFI (mepc = WFI + 4)
          fence_pc_correction_valid <= 1'b1;
          fence_pending             <= 1'b1;
        end
      end

      if ((VCP_ENABLE != `VCP_DISABLED) && (vcp_writeback_en == 1'b1)) begin
        // To avoid having a 5 to one mux in execute, we add
        // the writebacks from the vcp here.
        from_syscall_data  <= vcp_writeback_data;
        from_syscall_valid <= 1'b1;
      end
    end
  end

//------------------------------------------------------------------------------
// Handle Global Interrupts
//------------------------------------------------------------------------------
  generate
    if (ENABLE_EXT_INTERRUPTS != 0) begin : interrupts_gen
      reg [NUM_INTERRUPTS-1:0] meipend_reg;

      always @(posedge clk) begin
        meipend_reg <= global_interrupts;
      end
      assign meipend[NUM_INTERRUPTS-1:0] = meipend_reg;
      assign meimask[NUM_INTERRUPTS-1:0] = meimask_full[NUM_INTERRUPTS-1:0];
      if (NUM_INTERRUPTS < REGISTER_SIZE) begin : not_all_interrupts_gen
        assign meipend[REGISTER_SIZE-1:NUM_INTERRUPTS] = {(REGISTER_SIZE-NUM_INTERRUPTS){1'b0}};
        assign meimask[REGISTER_SIZE-1:NUM_INTERRUPTS] = {(REGISTER_SIZE-NUM_INTERRUPTS){1'b0}};
      end
    end
    if (ENABLE_EXT_INTERRUPTS == 0) begin : no_interrupts_gen
      assign meipend = {REGISTER_SIZE{1'b0}};
      assign meimask = {REGISTER_SIZE{1'b0}};
    end
  endgenerate
  assign interrupt_pending = ((meimask & meipend) != {REGISTER_SIZE{1'b0}}) ?
                             mstatus[`CSR_MSTATUS_MIE] : 1'b0;  // by_kshan

  assign pause_ifetch = fence_pending | interrupt_pending;

  // There are several reasons that sys_calls might send a pc correction
  // global interrupt / illegal instruction / mret instruction / fence.i
  assign to_pc_correction_valid = fence_pc_correction_valid | was_mret | was_illegal |
                                  interrupt_pc_correction_valid;
  assign to_pc_correction_data =
    (fence_pc_correction_valid == 1'b1)                       ? next_fence_pc :
    ((was_illegal == 1'b1) || (interrupt_pc_correction_valid == 1'b1)) ? mtvec :
    (was_mret == 1'b1)                                        ? mepc :
    {REGISTER_SIZE{1'bx}};  // (others => '-')

endmodule
