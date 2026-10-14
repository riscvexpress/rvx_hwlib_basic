//------------------------------------------------------------------------------
// load_store_unit.v
// Converted 1:1 from load_store_unit.vhd (entity load_store_unit, arch rtl)
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module load_store_unit
  #(
    parameter REGISTER_SIZE       = 32,
    parameter SIGN_EXTENSION_SIZE = 20,
    parameter ENABLE_EXCEPTIONS   = 0  // boolean
    )
  (
   input  wire                           clk,
   input  wire                           reset,

   output wire                           lsu_idle,

   input  wire                           to_lsu_valid,
   output wire                           from_lsu_illegal,
   output wire                           from_lsu_misalign,

   input  wire [REGISTER_SIZE-1:0]       rs1_data,
   input  wire [REGISTER_SIZE-1:0]       rs2_data,
   input  wire [31:0]                    instruction,
   input  wire [SIGN_EXTENSION_SIZE-1:0] sign_extension,

   output reg                            load_in_progress,
   output wire                           writeback_stall_from_lsu,

   output wire                           lsu_ready,
   output reg  [REGISTER_SIZE-1:0]       from_lsu_data,
   output wire                           from_lsu_valid,

   //ORCA-internal memory-mapped master
   output wire [REGISTER_SIZE-1:0]       oimm_address,
   output reg  [(REGISTER_SIZE/8)-1:0]   oimm_byteenable,
   output wire                           oimm_requestvalid,
   output wire                           oimm_readnotwrite,
   output wire [REGISTER_SIZE-1:0]       oimm_writedata,
   input  wire [REGISTER_SIZE-1:0]       oimm_readdata,
   input  wire                           oimm_readdatavalid,
   input  wire                           oimm_waitrequest
   );

  reg                      from_instruction_illegal;
  wire                     from_alignment_illegal;

  // alias base_address is rs1_data; alias source_data is rs2_data
  wire [REGISTER_SIZE-1:0] base_address;
  wire [REGISTER_SIZE-1:0] source_data;

  // alias opcode : instruction(6 downto 0); alias func3 : instruction(14 downto 12)
  wire [6:0]               opcode;
  wire [2:0]               func3;
  wire [11:0]              imm;

  wire [REGISTER_SIZE-1:0] address_unaligned;

  reg  [2:0]               load_func3;
  reg  [1:0]               load_alignment;

  wire [7:0]               store_byte0;
  wire [7:0]               store_byte1;
  wire [7:0]               store_byte2;
  wire [7:0]               store_byte3;

  wire [7:0]               load_byte0;
  wire [7:0]               load_byte1;
  wire [7:0]               load_byte2;
  wire [7:0]               load_byte3;

  reg                      store_select;
  wire                     store_valid;
  reg                      load_select;
  wire                     load_valid;

  // constant vector for bit-selects of `LOAD_OP (literals cannot be bit-selected)
  wire [6:0] LOAD_OP_C = `LOAD_OP;

  assign base_address = rs1_data;
  assign source_data  = rs2_data;
  assign opcode       = instruction[6:0];
  assign func3        = instruction[14:12];

  //Decode instruction to select submodule.  All paths must decode to exactly
  //one submodule.
  //ASSUMES only LOAD_OP | STORE_OP for opcode.
  always @(*) begin
    store_select             = 1'b0;
    load_select              = 1'b0;
    from_instruction_illegal = 1'b0;

    if (opcode[5] == LOAD_OP_C[5]) begin
      if (ENABLE_EXCEPTIONS != 0) begin
        case (func3)
          `LS_DUBL_FUNC3, `LS_UWORD_FUNC3, `LS_UDUBL_FUNC3: begin
            from_instruction_illegal = 1'b1;
          end
          default: begin
            load_select = 1'b1;
          end
        endcase
      end else begin
        load_select = 1'b1;
      end
    end else begin
      if (ENABLE_EXCEPTIONS != 0) begin
        case (func3)
          `LS_BYTE_FUNC3, `LS_HALF_FUNC3, `LS_WORD_FUNC3: begin
            store_select = 1'b1;
          end
          default: begin
            from_instruction_illegal = 1'b1;
          end
        endcase
      end else begin
        store_select = 1'b1;
      end
    end
  end

  //Check for unaligned accesses.  Disabled until properly merged exported to sys_call
  assign from_alignment_illegal =
    ((ENABLE_EXCEPTIONS != 0) &&
     (((func3[1] == 1'b1) && (address_unaligned[1:0] != 2'b00)) ||
      ((func3[0] == 1'b1) && (address_unaligned[0] != 1'b0)))) ? to_lsu_valid : 1'b0;
  assign from_lsu_misalign = from_alignment_illegal;
  assign from_lsu_illegal  = from_instruction_illegal;

  assign store_valid = store_select & (~from_alignment_illegal);
  assign load_valid  = load_select & (~from_alignment_illegal);

  assign oimm_requestvalid = (load_valid | store_valid) & to_lsu_valid;
  assign oimm_readnotwrite = (opcode[5] == LOAD_OP_C[5]) ? 1'b1 : 1'b0;

  assign imm = (instruction[5] == 1'b1) ? {instruction[31:25], instruction[11:7]} :
               instruction[31:20];

  assign address_unaligned = {sign_extension[REGISTER_SIZE-12-1:0], imm} + base_address;

  //Little endian byte-enables
  always @(*) begin
    if ((func3 == `LS_BYTE_FUNC3) && (address_unaligned[1:0] == 2'b00))
      oimm_byteenable = 4'b0001;
    else if ((func3 == `LS_BYTE_FUNC3) && (address_unaligned[1:0] == 2'b01))
      oimm_byteenable = 4'b0010;
    else if ((func3 == `LS_BYTE_FUNC3) && (address_unaligned[1:0] == 2'b10))
      oimm_byteenable = 4'b0100;
    else if ((func3 == `LS_BYTE_FUNC3) && (address_unaligned[1:0] == 2'b11))
      oimm_byteenable = 4'b1000;
    else if ((func3 == `LS_HALF_FUNC3) && (address_unaligned[1:0] == 2'b00))
      oimm_byteenable = 4'b0011;
    else if ((func3 == `LS_HALF_FUNC3) && (address_unaligned[1:0] == 2'b10))
      oimm_byteenable = 4'b1100;
    else
      oimm_byteenable = 4'b1111;
  end

  //Align bytes for stores
  assign store_byte3 = (address_unaligned[1:0] == 2'b11) ? source_data[7:0] :
                       (address_unaligned[1:0] == 2'b10) ? source_data[15:8] :
                       source_data[31:24];
  assign store_byte2 = (address_unaligned[1:0] == 2'b10) ? source_data[7:0] :
                       source_data[23:16];
  assign store_byte1 = (address_unaligned[1:0] == 2'b01) ? source_data[7:0] :
                       source_data[15:8];
  assign store_byte0 = source_data[7:0];

  assign oimm_writedata = {store_byte3, store_byte2, store_byte1, store_byte0};

  //Addresses are aligned to word boundary by memory_interface module
  assign oimm_address = address_unaligned[REGISTER_SIZE-1:0];

  //Stall if sending a request and slave is not ready or if awaiting readdata
  //and it hasn't arrived yet
  assign writeback_stall_from_lsu = load_in_progress & (~oimm_readdatavalid);
  assign lsu_ready                = ((~load_valid) & (~store_valid)) | (~oimm_waitrequest);
  assign lsu_idle                 = ~load_in_progress;  //idle is state-only

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      load_in_progress <= 1'b0;
      load_alignment   <= 2'b00;
      load_func3       <= 3'b000;
    end else begin
      if (oimm_readdatavalid == 1'b1) begin
        load_in_progress <= 1'b0;
      end
      if (((oimm_requestvalid == 1'b1) && (oimm_readnotwrite == 1'b1)) && (oimm_waitrequest == 1'b0)) begin
        load_alignment   <= address_unaligned[1:0];
        load_func3       <= func3;
        load_in_progress <= 1'b1;
      end
    end
  end

  //Align bytes after load
  assign load_byte3 = oimm_readdata[31:24];
  assign load_byte2 = oimm_readdata[23:16];
  assign load_byte1 = (load_alignment == 2'b00) ? oimm_readdata[15:8] :
                      oimm_readdata[31:24];
  assign load_byte0 = (load_alignment == 2'b00) ? oimm_readdata[7:0] :
                      (load_alignment == 2'b01) ? oimm_readdata[15:8] :
                      (load_alignment == 2'b10) ? oimm_readdata[23:16] :
                      oimm_readdata[31:24];

  //Zero/sign extend the read data
  always @(*) begin
    case (load_func3)
      `LS_BYTE_FUNC3:  from_lsu_data = {{(REGISTER_SIZE-8){load_byte0[7]}}, load_byte0};
      `LS_HALF_FUNC3:  from_lsu_data = {{(REGISTER_SIZE-16){load_byte1[7]}}, load_byte1, load_byte0};
      `LS_UBYTE_FUNC3: from_lsu_data = {{(REGISTER_SIZE-8){1'b0}}, load_byte0};
      `LS_UHALF_FUNC3: from_lsu_data = {{(REGISTER_SIZE-16){1'b0}}, load_byte1, load_byte0};
      default:         from_lsu_data = {load_byte3, load_byte2, load_byte1, load_byte0};
    endcase
  end

  assign from_lsu_valid = oimm_readdatavalid;

endmodule
