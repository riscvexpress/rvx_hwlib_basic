//------------------------------------------------------------------------------
// orca.v  (TOP)
// Converted 1:1 from orca.vhd (entity orca, arch rtl)
// Instance names preserved: core (orca_core), the_memory_interface
// (memory_interface).
//
// Generic conversion notes (encodings identical to the VHDL conversion
// functions, so parameter values pass straight through):
//  - natural_to_request_register(n): 0=OFF, 1=LIGHT, 2=FULL (same encoding)
//  - natural_to_vcp(n): 0=DISABLED, 1=THIRTY_TWO_BIT, 2=SIXTY_FOUR_BIT
//  - boolean generics of submodules receive (X != 0)
// VHDL input-port default values have no Verilog equivalent; unused inputs
// must be tied off by the instantiating testbench/system.
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module orca
  #(
    parameter REGISTER_SIZE = 32,

    parameter RESET_VECTOR           = 32'h00000000,
    parameter INTERRUPT_VECTOR       = 32'h00000200,
    parameter MAX_IFETCHES_IN_FLIGHT = 1,
    parameter BTB_ENTRIES            = 0,
    parameter MULTIPLY_ENABLE        = 0,
    parameter DIVIDE_ENABLE          = 0,
    parameter SHIFTER_MAX_CYCLES     = 1,
    parameter ENABLE_EXCEPTIONS      = 1,
    parameter PIPELINE_STAGES        = 5,
    parameter VCP_ENABLE             = 0,
    parameter ENABLE_EXT_INTERRUPTS  = 0,
    parameter NUM_INTERRUPTS         = 1,
    parameter POWER_OPTIMIZED        = 0,
    parameter FAMILY                 = "GENERIC",

    //----------------------------------------------------------------------------
    // Memory interfaces
    //----------------------------------------------------------------------------
    parameter LOG2_BURSTLENGTH = 8,
    parameter AXI_ID_WIDTH     = 2,

    //Auxiliary interface select (at most one enabled)
    parameter AVALON_AUX   = 0,
    parameter LMB_AUX      = 0,
    parameter WISHBONE_AUX = 0,

    //Auxiliary memory regions (0 to disable)
    parameter AUX_MEMORY_REGIONS = 0,
    parameter AMR0_ADDR_BASE     = 32'h00000000,
    parameter AMR0_ADDR_LAST     = 32'hFFFFFFFF,
    parameter AMR0_READ_ONLY     = 1,

    //Uncached memory regions (0 to disable)
    parameter UC_MEMORY_REGIONS = 1,
    parameter UMR0_ADDR_BASE    = 32'hFFFFFFFF,
    parameter UMR0_ADDR_LAST    = 32'h00000000,
    parameter UMR0_READ_ONLY    = 0,

    //Instruction cache (ICACHE_SIZE 0 to disable)
    parameter HAS_ICACHE            = 1,
    parameter ICACHE_SIZE           = 32768,
    parameter ICACHE_LINE_SIZE      = 32,
    parameter ICACHE_EXTERNAL_WIDTH = 32,

    //Instruction interface registers for timing/fmax
    //Request registers are 0/off, 1/light (waitrequest/ready only), 2/full
    parameter INSTRUCTION_REQUEST_REGISTER = 0,
    parameter INSTRUCTION_RETURN_REGISTER  = 0,
    parameter IUC_REQUEST_REGISTER         = 0,
    parameter IUC_RETURN_REGISTER          = 0,
    parameter IAUX_REQUEST_REGISTER        = 0,
    parameter IAUX_RETURN_REGISTER         = 0,
    parameter IC_REQUEST_REGISTER          = 1,
    parameter IC_RETURN_REGISTER           = 0,

    //Data cache (DCACHE_SIZE 0 to disable)
    parameter HAS_DCACHE            = 1,
    parameter DCACHE_SIZE           = 32768,
    parameter DCACHE_LINE_SIZE      = 32,
    parameter DCACHE_EXTERNAL_WIDTH = 32,
    parameter DCACHE_WRITEBACK      = 1,

    //Data interface registers for timing/fmax
    parameter DATA_REQUEST_REGISTER = 1,
    parameter DATA_RETURN_REGISTER  = 0,
    parameter DUC_REQUEST_REGISTER  = 0,
    parameter DUC_RETURN_REGISTER   = 0,
    parameter DAUX_REQUEST_REGISTER = 0,
    parameter DAUX_RETURN_REGISTER  = 0,
    parameter DC_REQUEST_REGISTER   = 1,
    parameter DC_RETURN_REGISTER    = 0
    )
  (
   input  wire                                          clk,
   input  wire                                          reset,

   //----------------------------------------------------------------------------
   // Interrupts
   //----------------------------------------------------------------------------
   input  wire [NUM_INTERRUPTS-1:0]                     global_interrupts,

   //----------------------------------------------------------------------------
   //AVALON
   //----------------------------------------------------------------------------
   //Avalon data master
   output wire [REGISTER_SIZE-1:0]                      avm_data_address,
   output wire [(REGISTER_SIZE/8)-1:0]                  avm_data_byteenable,
   output wire                                          avm_data_read,
   input  wire [REGISTER_SIZE-1:0]                      avm_data_readdata,
   output wire                                          avm_data_write,
   output wire [REGISTER_SIZE-1:0]                      avm_data_writedata,
   input  wire                                          avm_data_waitrequest,
   input  wire                                          avm_data_readdatavalid,

   //Avalon instruction master
   output wire [REGISTER_SIZE-1:0]                      avm_instruction_address,
   output wire                                          avm_instruction_read,
   input  wire [REGISTER_SIZE-1:0]                      avm_instruction_readdata,
   input  wire                                          avm_instruction_waitrequest,
   input  wire                                          avm_instruction_readdatavalid,

   //----------------------------------------------------------------------------
   //WISHBONE
   //----------------------------------------------------------------------------
   //WISHBONE data master
   output wire [REGISTER_SIZE-1:0]                      data_ADR_O,
   input  wire [REGISTER_SIZE-1:0]                      data_DAT_I,
   output wire [REGISTER_SIZE-1:0]                      data_DAT_O,
   output wire                                          data_WE_O,
   output wire [(REGISTER_SIZE/8)-1:0]                  data_SEL_O,
   output wire                                          data_STB_O,
   input  wire                                          data_ACK_I,
   output wire                                          data_CYC_O,
   output wire [2:0]                                    data_CTI_O,
   input  wire                                          data_STALL_I,

   //WISHBONE instruction master
   output wire [REGISTER_SIZE-1:0]                      instr_ADR_O,
   input  wire [REGISTER_SIZE-1:0]                      instr_DAT_I,
   output wire                                          instr_STB_O,
   input  wire                                          instr_ACK_I,
   output wire                                          instr_CYC_O,
   output wire [2:0]                                    instr_CTI_O,
   input  wire                                          instr_STALL_I,

   //----------------------------------------------------------------------------
   //AXI
   //----------------------------------------------------------------------------
   //AXI4-Lite uncached instruction master
   output wire [AXI_ID_WIDTH-1:0]                       IUC_ARID,
   output wire [REGISTER_SIZE-1:0]                      IUC_ARADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   IUC_ARLEN,
   output wire [2:0]                                    IUC_ARSIZE,
   output wire [1:0]                                    IUC_ARBURST,
   output wire [1:0]                                    IUC_ARLOCK,
   output wire [3:0]                                    IUC_ARCACHE,
   output wire [2:0]                                    IUC_ARPROT,
   output wire                                          IUC_ARVALID,
   input  wire                                          IUC_ARREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       IUC_RID,
   input  wire [REGISTER_SIZE-1:0]                      IUC_RDATA,
   input  wire [1:0]                                    IUC_RRESP,
   input  wire                                          IUC_RLAST,
   input  wire                                          IUC_RVALID,
   output wire                                          IUC_RREADY,

   output wire [AXI_ID_WIDTH-1:0]                       IUC_AWID,
   output wire [REGISTER_SIZE-1:0]                      IUC_AWADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   IUC_AWLEN,
   output wire [2:0]                                    IUC_AWSIZE,
   output wire [1:0]                                    IUC_AWBURST,
   output wire [1:0]                                    IUC_AWLOCK,
   output wire [3:0]                                    IUC_AWCACHE,
   output wire [2:0]                                    IUC_AWPROT,
   output wire                                          IUC_AWVALID,
   input  wire                                          IUC_AWREADY,

   output wire [AXI_ID_WIDTH-1:0]                       IUC_WID,
   output wire [REGISTER_SIZE-1:0]                      IUC_WDATA,
   output wire [(REGISTER_SIZE/8)-1:0]                  IUC_WSTRB,
   output wire                                          IUC_WLAST,
   output wire                                          IUC_WVALID,
   input  wire                                          IUC_WREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       IUC_BID,
   input  wire [1:0]                                    IUC_BRESP,
   input  wire                                          IUC_BVALID,
   output wire                                          IUC_BREADY,

   //AXI4-Lite uncached data master
   output wire [AXI_ID_WIDTH-1:0]                       DUC_AWID,
   output wire [REGISTER_SIZE-1:0]                      DUC_AWADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   DUC_AWLEN,
   output wire [2:0]                                    DUC_AWSIZE,
   output wire [1:0]                                    DUC_AWBURST,
   output wire [1:0]                                    DUC_AWLOCK,
   output wire [3:0]                                    DUC_AWCACHE,
   output wire [2:0]                                    DUC_AWPROT,
   output wire                                          DUC_AWVALID,
   input  wire                                          DUC_AWREADY,

   output wire [AXI_ID_WIDTH-1:0]                       DUC_WID,
   output wire [REGISTER_SIZE-1:0]                      DUC_WDATA,
   output wire [(REGISTER_SIZE/8)-1:0]                  DUC_WSTRB,
   output wire                                          DUC_WLAST,
   output wire                                          DUC_WVALID,
   input  wire                                          DUC_WREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       DUC_BID,
   input  wire [1:0]                                    DUC_BRESP,
   input  wire                                          DUC_BVALID,
   output wire                                          DUC_BREADY,

   output wire [AXI_ID_WIDTH-1:0]                       DUC_ARID,
   output wire [REGISTER_SIZE-1:0]                      DUC_ARADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   DUC_ARLEN,
   output wire [2:0]                                    DUC_ARSIZE,
   output wire [1:0]                                    DUC_ARBURST,
   output wire [1:0]                                    DUC_ARLOCK,
   output wire [3:0]                                    DUC_ARCACHE,
   output wire [2:0]                                    DUC_ARPROT,
   output wire                                          DUC_ARVALID,
   input  wire                                          DUC_ARREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       DUC_RID,
   input  wire [REGISTER_SIZE-1:0]                      DUC_RDATA,
   input  wire [1:0]                                    DUC_RRESP,
   input  wire                                          DUC_RLAST,
   input  wire                                          DUC_RVALID,
   output wire                                          DUC_RREADY,

   //AXI3/4 cacheable instruction master
   output wire [AXI_ID_WIDTH-1:0]                       IC_ARID,
   output wire [REGISTER_SIZE-1:0]                      IC_ARADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   IC_ARLEN,
   output wire [2:0]                                    IC_ARSIZE,
   output wire [1:0]                                    IC_ARBURST,
   output wire [1:0]                                    IC_ARLOCK,
   output wire [3:0]                                    IC_ARCACHE,
   output wire [2:0]                                    IC_ARPROT,
   output wire                                          IC_ARVALID,
   input  wire                                          IC_ARREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       IC_RID,
   input  wire [ICACHE_EXTERNAL_WIDTH-1:0]              IC_RDATA,
   input  wire [1:0]                                    IC_RRESP,
   input  wire                                          IC_RLAST,
   input  wire                                          IC_RVALID,
   output wire                                          IC_RREADY,

   output wire [AXI_ID_WIDTH-1:0]                       IC_AWID,
   output wire [REGISTER_SIZE-1:0]                      IC_AWADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   IC_AWLEN,
   output wire [2:0]                                    IC_AWSIZE,
   output wire [1:0]                                    IC_AWBURST,
   output wire [1:0]                                    IC_AWLOCK,
   output wire [3:0]                                    IC_AWCACHE,
   output wire [2:0]                                    IC_AWPROT,
   output wire                                          IC_AWVALID,
   input  wire                                          IC_AWREADY,

   output wire [AXI_ID_WIDTH-1:0]                       IC_WID,
   output wire [ICACHE_EXTERNAL_WIDTH-1:0]              IC_WDATA,
   output wire [(ICACHE_EXTERNAL_WIDTH/8)-1:0]          IC_WSTRB,
   output wire                                          IC_WLAST,
   output wire                                          IC_WVALID,
   input  wire                                          IC_WREADY,
   input  wire [AXI_ID_WIDTH-1:0]                       IC_BID,
   input  wire [1:0]                                    IC_BRESP,
   input  wire                                          IC_BVALID,
   output wire                                          IC_BREADY,

   //AXI3/4 cacheable data master
   output wire [AXI_ID_WIDTH-1:0]                       DC_ARID,
   output wire [REGISTER_SIZE-1:0]                      DC_ARADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   DC_ARLEN,
   output wire [2:0]                                    DC_ARSIZE,
   output wire [1:0]                                    DC_ARBURST,
   output wire [1:0]                                    DC_ARLOCK,
   output wire [3:0]                                    DC_ARCACHE,
   output wire [2:0]                                    DC_ARPROT,
   output wire                                          DC_ARVALID,
   input  wire                                          DC_ARREADY,

   input  wire [AXI_ID_WIDTH-1:0]                       DC_RID,
   input  wire [DCACHE_EXTERNAL_WIDTH-1:0]              DC_RDATA,
   input  wire [1:0]                                    DC_RRESP,
   input  wire                                          DC_RLAST,
   input  wire                                          DC_RVALID,
   output wire                                          DC_RREADY,

   output wire [AXI_ID_WIDTH-1:0]                       DC_AWID,
   output wire [REGISTER_SIZE-1:0]                      DC_AWADDR,
   output wire [LOG2_BURSTLENGTH-1:0]                   DC_AWLEN,
   output wire [2:0]                                    DC_AWSIZE,
   output wire [1:0]                                    DC_AWBURST,
   output wire [1:0]                                    DC_AWLOCK,
   output wire [3:0]                                    DC_AWCACHE,
   output wire [2:0]                                    DC_AWPROT,
   output wire                                          DC_AWVALID,
   input  wire                                          DC_AWREADY,

   output wire [AXI_ID_WIDTH-1:0]                       DC_WID,
   output wire [DCACHE_EXTERNAL_WIDTH-1:0]              DC_WDATA,
   output wire [(DCACHE_EXTERNAL_WIDTH/8)-1:0]          DC_WSTRB,
   output wire                                          DC_WLAST,
   output wire                                          DC_WVALID,
   input  wire                                          DC_WREADY,
   input  wire [AXI_ID_WIDTH-1:0]                       DC_BID,
   input  wire [1:0]                                    DC_BRESP,
   input  wire                                          DC_BVALID,
   output wire                                          DC_BREADY,

   //----------------------------------------------------------------------------
   //LMB (ascending bit order [0:N-1] preserved from VHDL)
   //----------------------------------------------------------------------------
   //Xilinx local memory bus instruction master
   output wire [0:REGISTER_SIZE-1]                      ILMB_Addr,
   output wire [0:(REGISTER_SIZE/8)-1]                  ILMB_Byte_Enable,
   output wire [0:REGISTER_SIZE-1]                      ILMB_Data_Write,
   output wire                                          ILMB_AS,
   output wire                                          ILMB_Read_Strobe,
   output wire                                          ILMB_Write_Strobe,
   input  wire [0:REGISTER_SIZE-1]                      ILMB_Data_Read,
   input  wire                                          ILMB_Ready,
   input  wire                                          ILMB_Wait,
   input  wire                                          ILMB_CE,
   input  wire                                          ILMB_UE,

   //Xilinx local memory bus data master
   output wire [0:REGISTER_SIZE-1]                      DLMB_Addr,
   output wire [0:(REGISTER_SIZE/8)-1]                  DLMB_Byte_Enable,
   output wire [0:REGISTER_SIZE-1]                      DLMB_Data_Write,
   output wire                                          DLMB_AS,
   output wire                                          DLMB_Read_Strobe,
   output wire                                          DLMB_Write_Strobe,
   input  wire [0:REGISTER_SIZE-1]                      DLMB_Data_Read,
   input  wire                                          DLMB_Ready,
   input  wire                                          DLMB_Wait,
   input  wire                                          DLMB_CE,
   input  wire                                          DLMB_UE,

   //---------------------------------------------------------------------------
   // Timer signals
   //---------------------------------------------------------------------------
   input  wire [63:0]                                   timer_value,
   input  wire                                          timer_interrupt,

   //---------------------------------------------------------------------------
   // Vector Coprocessor Port
   //---------------------------------------------------------------------------
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

   output wire                                          icache_tag_renable,
   output wire [`log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1:0] icache_tag_raddr,
   input  wire [REGISTER_SIZE-`log2(ICACHE_SIZE):0]     icache_tag_rdata,
   output wire                                          icache_tag_wenable,
   output wire [`log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1:0] icache_tag_waddr,
   output wire [REGISTER_SIZE-`log2(ICACHE_SIZE):0]     icache_tag_wdata,

   output wire                                          icache_data_renable,
   output wire [`log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+`log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1:0] icache_data_raddr,
   input  wire [ICACHE_EXTERNAL_WIDTH-1:0]              icache_data_rdata,
   output wire                                          icache_data_wenable,
   output wire [`log2_min1(ICACHE_SIZE/ICACHE_LINE_SIZE)+`log2(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1:0] icache_data_waddr,
   output wire [(ICACHE_EXTERNAL_WIDTH/8)-1:0]          icache_data_wstrb,
   output wire [ICACHE_EXTERNAL_WIDTH-1:0]              icache_data_wdata,

   output wire                                          dcache_tag_renable,
   output wire [`log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1:0] dcache_tag_raddr,
   input  wire [REGISTER_SIZE-`log2(DCACHE_SIZE)+DCACHE_WRITEBACK:0] dcache_tag_rdata,
   output wire                                          dcache_tag_wenable,
   output wire [`log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1:0] dcache_tag_waddr,
   output wire [REGISTER_SIZE-`log2(DCACHE_SIZE)+DCACHE_WRITEBACK:0] dcache_tag_wdata,

   output wire                                          dcache_data_renable,
   output wire [`log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+`log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1:0] dcache_data_raddr,
   input  wire [DCACHE_EXTERNAL_WIDTH-1:0]              dcache_data_rdata,
   output wire                                          dcache_data_wenable,
   output wire [`log2_min1(DCACHE_SIZE/DCACHE_LINE_SIZE)+`log2(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1:0] dcache_data_waddr,
   output wire [(DCACHE_EXTERNAL_WIDTH/8)-1:0]          dcache_data_wstrb,
   output wire [DCACHE_EXTERNAL_WIDTH-1:0]              dcache_data_wdata,

   // debug_info by kshan
   output wire                                          executed,
   output wire [31:0]                                   executed_inst,
   output wire [31:0]                                   executed_pc
   );

  //Might want to bring these out to the top level.
  localparam WRITE_FIRST_SMALL_RAMS   = (FAMILY == "XILINX") || (FAMILY == "INTEL");
  localparam MAX_OUTSTANDING_REQUESTS = 4;

  wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_base_addrs;
  wire [(`imax(AUX_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0] amr_last_addrs;
  wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_base_addrs;
  wire [(`imax(UC_MEMORY_REGIONS, 1)*REGISTER_SIZE)-1:0]  umr_last_addrs;

  wire                                          from_icache_control_ready;
  wire                                          to_icache_control_valid;
  wire [`CACHE_CONTROL_COMMAND_WIDTH-1:0]       to_icache_control_command;
  wire                                          from_dcache_control_ready;
  wire                                          to_dcache_control_valid;
  wire [`CACHE_CONTROL_COMMAND_WIDTH-1:0]       to_dcache_control_command;
  wire [REGISTER_SIZE-1:0]                      to_cache_control_base;
  wire [REGISTER_SIZE-1:0]                      to_cache_control_last;

  wire                                          memory_interface_idle;

  wire [REGISTER_SIZE-1:0]                      lsu_oimm_address;
  wire [(REGISTER_SIZE/8)-1:0]                  lsu_oimm_byteenable;
  wire                                          lsu_oimm_requestvalid;
  wire                                          lsu_oimm_readnotwrite;
  wire [REGISTER_SIZE-1:0]                      lsu_oimm_writedata;
  wire [REGISTER_SIZE-1:0]                      lsu_oimm_readdata;
  wire                                          lsu_oimm_readdatavalid;
  wire                                          lsu_oimm_waitrequest;

  wire [REGISTER_SIZE-1:0]                      ifetch_oimm_address;
  wire                                          ifetch_oimm_requestvalid;
  wire [REGISTER_SIZE-1:0]                      ifetch_oimm_readdata;
  wire                                          ifetch_oimm_waitrequest;
  wire                                          ifetch_oimm_readdatavalid;

  // debug_info by kshan
  wire [`BW_DEBUG_INFO-1:0]                     debug_info;

  orca_core
    #(
      .REGISTER_SIZE          (REGISTER_SIZE),
      .RESET_VECTOR           (RESET_VECTOR),
      .INTERRUPT_VECTOR       (INTERRUPT_VECTOR),
      .MAX_IFETCHES_IN_FLIGHT (MAX_IFETCHES_IN_FLIGHT),
      .BTB_ENTRIES            (BTB_ENTRIES),
      .MULTIPLY_ENABLE        (MULTIPLY_ENABLE != 0),
      .DIVIDE_ENABLE          (DIVIDE_ENABLE != 0),
      .SHIFTER_MAX_CYCLES     (SHIFTER_MAX_CYCLES),
      .POWER_OPTIMIZED        (POWER_OPTIMIZED != 0),
      .ENABLE_EXCEPTIONS      (ENABLE_EXCEPTIONS != 0),
      .PIPELINE_STAGES        (PIPELINE_STAGES),
      .VCP_ENABLE             (VCP_ENABLE),          // natural_to_vcp: same encoding
      .ENABLE_EXT_INTERRUPTS  (ENABLE_EXT_INTERRUPTS != 0),
      .NUM_INTERRUPTS         (NUM_INTERRUPTS),
      .WRITE_FIRST_SMALL_RAMS (WRITE_FIRST_SMALL_RAMS),
      .FAMILY                 (FAMILY),

      .AUX_MEMORY_REGIONS (AUX_MEMORY_REGIONS),
      .AMR0_ADDR_BASE     (AMR0_ADDR_BASE),
      .AMR0_ADDR_LAST     (AMR0_ADDR_LAST),
      .AMR0_READ_ONLY     (AMR0_READ_ONLY != 0),

      .UC_MEMORY_REGIONS (UC_MEMORY_REGIONS),
      .UMR0_ADDR_BASE    (UMR0_ADDR_BASE),
      .UMR0_ADDR_LAST    (UMR0_ADDR_LAST),
      .UMR0_READ_ONLY    (UMR0_READ_ONLY != 0),

      .HAS_ICACHE (HAS_ICACHE),
      .HAS_DCACHE (HAS_DCACHE)
      )
  core (
      .clk   (clk),
      .reset (reset),

      .global_interrupts (global_interrupts),

      .memory_interface_idle (memory_interface_idle),

      //ICache control (Invalidate/flush/writeback)
      .from_icache_control_ready (from_icache_control_ready),
      .to_icache_control_valid   (to_icache_control_valid),
      .to_icache_control_command (to_icache_control_command),

      //DCache control (Invalidate/flush/writeback)
      .from_dcache_control_ready (from_dcache_control_ready),
      .to_dcache_control_valid   (to_dcache_control_valid),
      .to_dcache_control_command (to_dcache_control_command),

      //Cache control common signals
      .to_cache_control_base (to_cache_control_base),
      .to_cache_control_last (to_cache_control_last),

      //Instruction memory-mapped master
      .ifetch_oimm_address       (ifetch_oimm_address),
      .ifetch_oimm_requestvalid  (ifetch_oimm_requestvalid),
      .ifetch_oimm_readdata      (ifetch_oimm_readdata),
      .ifetch_oimm_waitrequest   (ifetch_oimm_waitrequest),
      .ifetch_oimm_readdatavalid (ifetch_oimm_readdatavalid),

      //Data memory-mapped master
      .lsu_oimm_address       (lsu_oimm_address),
      .lsu_oimm_byteenable    (lsu_oimm_byteenable),
      .lsu_oimm_requestvalid  (lsu_oimm_requestvalid),
      .lsu_oimm_readnotwrite  (lsu_oimm_readnotwrite),
      .lsu_oimm_writedata     (lsu_oimm_writedata),
      .lsu_oimm_readdata      (lsu_oimm_readdata),
      .lsu_oimm_readdatavalid (lsu_oimm_readdatavalid),
      .lsu_oimm_waitrequest   (lsu_oimm_waitrequest),

      //Timer signals
      .timer_value     (timer_value),
      .timer_interrupt (timer_interrupt),

      //Vector coprocessor port
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

      //Auxiliary/Uncached memory regions
      .amr_base_addrs (amr_base_addrs),
      .amr_last_addrs (amr_last_addrs),
      .umr_base_addrs (umr_base_addrs),
      .umr_last_addrs (umr_last_addrs),

      // debug_info by kshan
      .debug_info (debug_info)
      );

  //----------------------------------------------------------------------------
  // ETRI ERVP memory interface.
  //
  // NOTE: ERVP_ORCA_MEMORY_INTERFACE (ervp_orca_memory_interface.v) is a
  // slimmed-down rewrite of the original OpenSoC ORCA memory interface. It
  // only supports the four AXI masters (IUC/DUC/IC/DC), the OIMM ifetch/lsu
  // ports, uncached-memory-region (UMR) tie-offs and the cache RAM ports.
  // The Avalon / WISHBONE / Xilinx-LMB / auxiliary-region (AMR) / spill /
  // per-interface request-register options of the old interface do not exist
  // in this module, so they are neither parameterized nor connected here.
  // The corresponding top-level orca ports (avm_*, *_ADR_O/*_DAT_*, [ID]LMB_*,
  // spill_*, amr_*) are left undriven and should be tied off by the system if
  // used.
  //----------------------------------------------------------------------------
  ERVP_ORCA_MEMORY_INTERFACE
    #(
      .REGISTER_SIZE         (REGISTER_SIZE),
      .LOG2_BURSTLENGTH      (LOG2_BURSTLENGTH),
      .AXI_ID_WIDTH          (AXI_ID_WIDTH),

      .UC_MEMORY_REGIONS     (UC_MEMORY_REGIONS),

      .HAS_ICACHE            (HAS_ICACHE),
      .ICACHE_SIZE           (ICACHE_SIZE),
      .ICACHE_LINE_SIZE      (ICACHE_LINE_SIZE),
      .ICACHE_EXTERNAL_WIDTH (ICACHE_EXTERNAL_WIDTH),

      .HAS_DCACHE            (HAS_DCACHE),
      .DCACHE_SIZE           (DCACHE_SIZE),
      .DCACHE_LINE_SIZE      (DCACHE_LINE_SIZE),
      .DCACHE_EXTERNAL_WIDTH (DCACHE_EXTERNAL_WIDTH),
      .DCACHE_WRITEBACK      (DCACHE_WRITEBACK != 0),
      .DCACHE_DIRTY_BITS     (DCACHE_WRITEBACK)
      )
  the_memory_interface (
      .clk   (clk),
      .reset (reset),

      //Uncached memory regions
      .umr_base_addrs (umr_base_addrs),
      .umr_last_addrs (umr_last_addrs),

      //ICache control (Invalidate/flush/writeback)
      .from_icache_control_ready (from_icache_control_ready),
      .to_icache_control_valid   (to_icache_control_valid),
      .to_icache_control_command (to_icache_control_command),

      //DCache control (Invalidate/flush/writeback)
      .from_dcache_control_ready (from_dcache_control_ready),
      .to_dcache_control_valid   (to_dcache_control_valid),
      .to_dcache_control_command (to_dcache_control_command),

      //Cache control common signals
      .to_cache_control_base (to_cache_control_base),
      .to_cache_control_last (to_cache_control_last),

      .memory_interface_idle (memory_interface_idle),

      //Instruction memory-mapped master
      .ifetch_oimm_address       (ifetch_oimm_address),
      .ifetch_oimm_requestvalid  (ifetch_oimm_requestvalid),
      .ifetch_oimm_readdata      (ifetch_oimm_readdata),
      .ifetch_oimm_waitrequest   (ifetch_oimm_waitrequest),
      .ifetch_oimm_readdatavalid (ifetch_oimm_readdatavalid),

      //Data memory-mapped master
      .lsu_oimm_address       (lsu_oimm_address),
      .lsu_oimm_byteenable    (lsu_oimm_byteenable),
      .lsu_oimm_requestvalid  (lsu_oimm_requestvalid),
      .lsu_oimm_readnotwrite  (lsu_oimm_readnotwrite),
      .lsu_oimm_writedata     (lsu_oimm_writedata),
      .lsu_oimm_readdata      (lsu_oimm_readdata),
      .lsu_oimm_readdatavalid (lsu_oimm_readdatavalid),
      .lsu_oimm_waitrequest   (lsu_oimm_waitrequest),

      //AXI4-Lite uncached instruction master
      .IUC_ARID    (IUC_ARID),
      .IUC_ARADDR  (IUC_ARADDR),
      .IUC_ARLEN   (IUC_ARLEN),
      .IUC_ARSIZE  (IUC_ARSIZE),
      .IUC_ARBURST (IUC_ARBURST),
      .IUC_ARLOCK  (IUC_ARLOCK),
      .IUC_ARCACHE (IUC_ARCACHE),
      .IUC_ARPROT  (IUC_ARPROT),
      .IUC_ARVALID (IUC_ARVALID),
      .IUC_ARREADY (IUC_ARREADY),

      .IUC_RID    (IUC_RID),
      .IUC_RDATA  (IUC_RDATA),
      .IUC_RRESP  (IUC_RRESP),
      .IUC_RLAST  (IUC_RLAST),
      .IUC_RVALID (IUC_RVALID),
      .IUC_RREADY (IUC_RREADY),

      .IUC_AWID    (IUC_AWID),
      .IUC_AWADDR  (IUC_AWADDR),
      .IUC_AWLEN   (IUC_AWLEN),
      .IUC_AWSIZE  (IUC_AWSIZE),
      .IUC_AWBURST (IUC_AWBURST),
      .IUC_AWLOCK  (IUC_AWLOCK),
      .IUC_AWCACHE (IUC_AWCACHE),
      .IUC_AWPROT  (IUC_AWPROT),
      .IUC_AWVALID (IUC_AWVALID),
      .IUC_AWREADY (IUC_AWREADY),

      .IUC_WID    (IUC_WID),
      .IUC_WDATA  (IUC_WDATA),
      .IUC_WSTRB  (IUC_WSTRB),
      .IUC_WLAST  (IUC_WLAST),
      .IUC_WVALID (IUC_WVALID),
      .IUC_WREADY (IUC_WREADY),

      .IUC_BID    (IUC_BID),
      .IUC_BRESP  (IUC_BRESP),
      .IUC_BVALID (IUC_BVALID),
      .IUC_BREADY (IUC_BREADY),

      //AXI4-Lite uncached data master
      .DUC_ARID    (DUC_ARID),
      .DUC_ARADDR  (DUC_ARADDR),
      .DUC_ARLEN   (DUC_ARLEN),
      .DUC_ARSIZE  (DUC_ARSIZE),
      .DUC_ARBURST (DUC_ARBURST),
      .DUC_ARLOCK  (DUC_ARLOCK),
      .DUC_ARCACHE (DUC_ARCACHE),
      .DUC_ARPROT  (DUC_ARPROT),
      .DUC_ARVALID (DUC_ARVALID),
      .DUC_ARREADY (DUC_ARREADY),

      .DUC_RID    (DUC_RID),
      .DUC_RDATA  (DUC_RDATA),
      .DUC_RRESP  (DUC_RRESP),
      .DUC_RLAST  (DUC_RLAST),
      .DUC_RVALID (DUC_RVALID),
      .DUC_RREADY (DUC_RREADY),

      .DUC_AWID    (DUC_AWID),
      .DUC_AWADDR  (DUC_AWADDR),
      .DUC_AWLEN   (DUC_AWLEN),
      .DUC_AWSIZE  (DUC_AWSIZE),
      .DUC_AWBURST (DUC_AWBURST),
      .DUC_AWLOCK  (DUC_AWLOCK),
      .DUC_AWCACHE (DUC_AWCACHE),
      .DUC_AWPROT  (DUC_AWPROT),
      .DUC_AWVALID (DUC_AWVALID),
      .DUC_AWREADY (DUC_AWREADY),

      .DUC_WID    (DUC_WID),
      .DUC_WDATA  (DUC_WDATA),
      .DUC_WSTRB  (DUC_WSTRB),
      .DUC_WLAST  (DUC_WLAST),
      .DUC_WVALID (DUC_WVALID),
      .DUC_WREADY (DUC_WREADY),

      .DUC_BID    (DUC_BID),
      .DUC_BRESP  (DUC_BRESP),
      .DUC_BVALID (DUC_BVALID),
      .DUC_BREADY (DUC_BREADY),

      //AXI3/4 cacheable instruction master
      .IC_ARID    (IC_ARID),
      .IC_ARADDR  (IC_ARADDR),
      .IC_ARLEN   (IC_ARLEN),
      .IC_ARSIZE  (IC_ARSIZE),
      .IC_ARBURST (IC_ARBURST),
      .IC_ARLOCK  (IC_ARLOCK),
      .IC_ARCACHE (IC_ARCACHE),
      .IC_ARPROT  (IC_ARPROT),
      .IC_ARVALID (IC_ARVALID),
      .IC_ARREADY (IC_ARREADY),

      .IC_RID    (IC_RID),
      .IC_RDATA  (IC_RDATA),
      .IC_RRESP  (IC_RRESP),
      .IC_RLAST  (IC_RLAST),
      .IC_RVALID (IC_RVALID),
      .IC_RREADY (IC_RREADY),

      .IC_AWID    (IC_AWID),
      .IC_AWADDR  (IC_AWADDR),
      .IC_AWLEN   (IC_AWLEN),
      .IC_AWSIZE  (IC_AWSIZE),
      .IC_AWBURST (IC_AWBURST),
      .IC_AWLOCK  (IC_AWLOCK),
      .IC_AWCACHE (IC_AWCACHE),
      .IC_AWPROT  (IC_AWPROT),
      .IC_AWVALID (IC_AWVALID),
      .IC_AWREADY (IC_AWREADY),

      .IC_WID    (IC_WID),
      .IC_WDATA  (IC_WDATA),
      .IC_WSTRB  (IC_WSTRB),
      .IC_WLAST  (IC_WLAST),
      .IC_WVALID (IC_WVALID),
      .IC_WREADY (IC_WREADY),

      .IC_BID    (IC_BID),
      .IC_BRESP  (IC_BRESP),
      .IC_BVALID (IC_BVALID),
      .IC_BREADY (IC_BREADY),

      //AXI3/4 cacheable data master
      .DC_ARID    (DC_ARID),
      .DC_ARADDR  (DC_ARADDR),
      .DC_ARLEN   (DC_ARLEN),
      .DC_ARSIZE  (DC_ARSIZE),
      .DC_ARBURST (DC_ARBURST),
      .DC_ARLOCK  (DC_ARLOCK),
      .DC_ARCACHE (DC_ARCACHE),
      .DC_ARPROT  (DC_ARPROT),
      .DC_ARVALID (DC_ARVALID),
      .DC_ARREADY (DC_ARREADY),

      .DC_RID    (DC_RID),
      .DC_RDATA  (DC_RDATA),
      .DC_RRESP  (DC_RRESP),
      .DC_RLAST  (DC_RLAST),
      .DC_RVALID (DC_RVALID),
      .DC_RREADY (DC_RREADY),

      .DC_AWID    (DC_AWID),
      .DC_AWADDR  (DC_AWADDR),
      .DC_AWLEN   (DC_AWLEN),
      .DC_AWSIZE  (DC_AWSIZE),
      .DC_AWBURST (DC_AWBURST),
      .DC_AWLOCK  (DC_AWLOCK),
      .DC_AWCACHE (DC_AWCACHE),
      .DC_AWPROT  (DC_AWPROT),
      .DC_AWVALID (DC_AWVALID),
      .DC_AWREADY (DC_AWREADY),

      .DC_WID    (DC_WID),
      .DC_WDATA  (DC_WDATA),
      .DC_WSTRB  (DC_WSTRB),
      .DC_WLAST  (DC_WLAST),
      .DC_WVALID (DC_WVALID),
      .DC_WREADY (DC_WREADY),

      .DC_BID    (DC_BID),
      .DC_BRESP  (DC_BRESP),
      .DC_BVALID (DC_BVALID),
      .DC_BREADY (DC_BREADY),

      //ICache tag RAM
      .icache_tag_renable (icache_tag_renable),
      .icache_tag_raddr   (icache_tag_raddr),
      .icache_tag_rdata   (icache_tag_rdata),
      .icache_tag_wenable (icache_tag_wenable),
      .icache_tag_waddr   (icache_tag_waddr),
      .icache_tag_wdata   (icache_tag_wdata),

      //ICache data RAM
      .icache_data_renable (icache_data_renable),
      .icache_data_raddr   (icache_data_raddr),
      .icache_data_rdata   (icache_data_rdata),
      .icache_data_wenable (icache_data_wenable),
      .icache_data_waddr   (icache_data_waddr),
      .icache_data_wstrb   (icache_data_wstrb),
      .icache_data_wdata   (icache_data_wdata),

      //DCache tag RAM
      .dcache_tag_renable (dcache_tag_renable),
      .dcache_tag_raddr   (dcache_tag_raddr),
      .dcache_tag_rdata   (dcache_tag_rdata),
      .dcache_tag_wenable (dcache_tag_wenable),
      .dcache_tag_waddr   (dcache_tag_waddr),
      .dcache_tag_wdata   (dcache_tag_wdata),

      //DCache data RAM
      .dcache_data_renable (dcache_data_renable),
      .dcache_data_raddr   (dcache_data_raddr),
      .dcache_data_rdata   (dcache_data_rdata),
      .dcache_data_wenable (dcache_data_wenable),
      .dcache_data_waddr   (dcache_data_waddr),
      .dcache_data_wstrb   (dcache_data_wstrb),
      .dcache_data_wdata   (dcache_data_wdata)
      );

  // VHDL assert (external interrupts require exceptions) omitted; check
  // configuration manually.

  // debug_info by kshan
  assign executed      = debug_info[64];
  assign executed_pc   = debug_info[63:32];
  assign executed_inst = debug_info[31:0];

endmodule
