//------------------------------------------------------------------------------
// branch_unit.v
// Converted 1:1 from branch_unit.vhd (entity branch_unit, arch rtl)
// VHDL unsigned ports (current_pc, predicted_pc, to_pc_correction_*) are plain
// vectors in Verilog (same widths, same bit order).
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module branch_unit
  #(
    parameter REGISTER_SIZE       = 32,
    parameter SIGN_EXTENSION_SIZE = 20,
    parameter BTB_ENTRIES         = 0,
    parameter ENABLE_EXCEPTIONS   = 0  // boolean
    )
  (
   input  wire                           clk,
   input  wire                           reset,

   input  wire                           to_branch_valid,
   output reg                            from_branch_illegal,

   input  wire [REGISTER_SIZE-1:0]       rs1_data,
   input  wire [REGISTER_SIZE-1:0]       rs2_data,
   input  wire [REGISTER_SIZE-1:0]       current_pc,
   input  wire [REGISTER_SIZE-1:0]       predicted_pc,
   input  wire [31:0]                    instruction,
   input  wire [SIGN_EXTENSION_SIZE-1:0] sign_extension,

   output reg                            from_branch_valid,
   output reg  [REGISTER_SIZE-1:0]       from_branch_data,
   input  wire                           to_branch_ready,
   output wire                           target_misaligned,
   output wire [REGISTER_SIZE-1:0]       to_pc_correction_data,
   output wire [REGISTER_SIZE-1:0]       to_pc_correction_source_pc,
   output wire                           to_pc_correction_valid,
   input  wire                           from_pc_correction_ready
   );

  //These signals must be one bit larger than a register
  wire [REGISTER_SIZE:0]   op1;
  wire [REGISTER_SIZE:0]   op2;
  wire [REGISTER_SIZE:0]   sub;
  reg                      msb_mask;

  wire [REGISTER_SIZE-1:0] jal_imm;
  wire [REGISTER_SIZE-1:0] jalr_imm;
  wire [REGISTER_SIZE-1:0] b_imm;
  wire [REGISTER_SIZE-1:0] branch_target;
  wire [REGISTER_SIZE-1:0] nbranch_target;
  wire [REGISTER_SIZE-1:0] jalr_target;
  wire [REGISTER_SIZE-1:0] jal_target;
  wire [REGISTER_SIZE-1:0] target_pc;

  wire                     lt_flag;
  wire                     eq_flag;

  reg                      take_if_branch;

  // alias opcode : instruction(6 downto 0); alias func3 : instruction(14 downto 12)
  wire [6:0]               opcode;
  wire [2:0]               func3;

  reg                      jal_select;
  reg                      jalr_select;
  reg                      branch_select;

  assign opcode = instruction[6:0];
  assign func3  = instruction[14:12];

  //Decode instruction to select submodule.  All paths must decode to exactly
  //one submodule.
  //ASSUMES only JAL_OP | JALR_OP | BRANCH_OP for opcode.
  always @(*) begin
    jal_select          = 1'b0;
    jalr_select         = 1'b0;
    branch_select       = 1'b0;
    from_branch_illegal = 1'b0;

    case (opcode[3:2])
      2'b11: begin                      //JAL_OP(3 downto 2)
        jal_select = 1'b1;
      end
      2'b01: begin                      //JALR_OP(3 downto 2)
        if (ENABLE_EXCEPTIONS != 0) begin
          if (func3 == `JALR_FUNC3) begin
            jalr_select = 1'b1;
          end else begin
            from_branch_illegal = 1'b1;
          end
        end else begin
          jalr_select = 1'b1;
        end
      end
      2'b00: begin                      //BRANCH_OP(3 downto 2)
        if (ENABLE_EXCEPTIONS != 0) begin
          if (func3[2:1] == 2'b01) begin
            from_branch_illegal = 1'b1;
          end else begin
            branch_select = 1'b1;
          end
        end else begin
          branch_select = 1'b1;
        end
      end
      default: begin
        if (ENABLE_EXCEPTIONS != 0) begin
          from_branch_illegal = 1'b1;
        end else begin
          //Undefined; pick JAL for easy decoding
          jal_select = 1'b1;
        end
      end
    endcase
  end

  always @(*) begin
    case (func3)
      `BLTU_FUNC3: msb_mask = 1'b0;
      `BGEU_FUNC3: msb_mask = 1'b0;
      default:     msb_mask = 1'b1;
    endcase
  end

  assign op1 = {msb_mask & rs1_data[REGISTER_SIZE-1], rs1_data};
  assign op2 = {msb_mask & rs2_data[REGISTER_SIZE-1], rs2_data};
  assign sub = op1 - op2;

  assign eq_flag = (rs1_data == rs2_data) ? 1'b1 : 1'b0;
  assign lt_flag = sub[REGISTER_SIZE];

  always @(*) begin
    case (func3)
      `BGEU_FUNC3: take_if_branch = (~lt_flag) | eq_flag;
      `BLTU_FUNC3: take_if_branch = lt_flag;
      `BGE_FUNC3:  take_if_branch = (~lt_flag) | eq_flag;
      `BLT_FUNC3:  take_if_branch = lt_flag;
      `BNE_FUNC3:  take_if_branch = ~eq_flag;
      default:     take_if_branch = eq_flag;
    endcase
  end

  assign b_imm = {sign_extension[REGISTER_SIZE-13:0],
                  instruction[7], instruction[30:25], instruction[11:8], 1'b0};

  assign jalr_imm = {sign_extension[REGISTER_SIZE-12-1:0],
                     instruction[31:21], 1'b0};
  // RESIZE(signed(21-bit imm), REGISTER_SIZE) -> sign extend by 11 bits
  assign jal_imm = {{(REGISTER_SIZE-21){instruction[31]}},
                    instruction[31], instruction[19:12], instruction[20],
                    instruction[30:21], 1'b0};

  generate
    if (BTB_ENTRIES == 0) begin : no_predictor_gen
      wire mispredict;
      reg  to_pc_correction_valid_reg;
      reg  [REGISTER_SIZE-1:0] to_pc_correction_data_reg;
      reg  [REGISTER_SIZE-1:0] to_pc_correction_source_pc_reg;

      assign to_pc_correction_valid     = to_pc_correction_valid_reg;
      assign to_pc_correction_data      = to_pc_correction_data_reg;
      assign to_pc_correction_source_pc = to_pc_correction_source_pc_reg;

      //If there's no branch predictor, any taken branch/jump is a mispredict, and
      //there's no need to use PC+4 (nbranch_target) as a correction
      assign target_pc =
        (jal_select == 1'b1)  ? jal_target :
        (jalr_select == 1'b1) ? jalr_target :
        branch_target;
      assign mispredict = (take_if_branch & branch_select) | jal_select | jalr_select;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          to_pc_correction_valid_reg     <= 1'b0;
          to_pc_correction_data_reg      <= {REGISTER_SIZE{1'b0}};
          to_pc_correction_source_pc_reg <= {REGISTER_SIZE{1'b0}};
        end else begin
          if (from_pc_correction_ready == 1'b1) begin
            to_pc_correction_valid_reg <= 1'b0;
          end

          if (to_branch_ready == 1'b1) begin
            if (to_branch_valid == 1'b1) begin
              to_pc_correction_data_reg      <= target_pc;
              to_pc_correction_source_pc_reg <= current_pc;

              if (mispredict == 1'b1) begin
                to_pc_correction_valid_reg <= 1'b1;
              end
            end
          end
        end
      end
    end
    if (BTB_ENTRIES > 0) begin : has_predictor_gen
      reg [REGISTER_SIZE-1:0] previously_targeted_pc;
      reg [REGISTER_SIZE-1:0] previously_predicted_pc;
      reg                     to_pc_correction_valid_if_mispredicted;
      wire                    was_mispredicted;
      reg [REGISTER_SIZE-1:0] to_pc_correction_source_pc_reg;

      assign to_pc_correction_source_pc = to_pc_correction_source_pc_reg;

      assign target_pc =
        (jalr_select == 1'b1)                              ? jalr_target :
        (jal_select == 1'b1)                               ? jal_target :
        ((branch_select == 1'b1) && (take_if_branch == 1'b1)) ? branch_target :
        nbranch_target;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          to_pc_correction_valid_if_mispredicted <= 1'b0;
          previously_targeted_pc                 <= {REGISTER_SIZE{1'b0}};
          previously_predicted_pc                <= {REGISTER_SIZE{1'b0}};
          to_pc_correction_source_pc_reg         <= {REGISTER_SIZE{1'b0}};
        end else begin
          if (from_pc_correction_ready == 1'b1) begin
            to_pc_correction_valid_if_mispredicted <= 1'b0;
          end

          if (to_branch_ready == 1'b1) begin
            if (to_branch_valid == 1'b1) begin
              previously_targeted_pc         <= target_pc;
              to_pc_correction_source_pc_reg <= current_pc;
              previously_predicted_pc        <= predicted_pc;

              to_pc_correction_valid_if_mispredicted <= 1'b1;
            end
          end
        end
      end
      assign to_pc_correction_data = previously_targeted_pc;
      //Note that computing mispredict during the execute cycle (as is done in
      //the no BTB generate) is more readable/consistent.  The latter part of the
      //mispredict calculation was moved to the next cycle only because there is
      //a long combinational path and it can be the critical path in
      //implementations that don't do register retiming.
      assign was_mispredicted       = (previously_targeted_pc != previously_predicted_pc) ? 1'b1 : 1'b0;
      assign to_pc_correction_valid = to_pc_correction_valid_if_mispredicted & was_mispredicted;
    end
  endgenerate

  assign branch_target  = b_imm + current_pc;
  assign nbranch_target = 32'd4 + current_pc;
  assign jalr_target    = jalr_imm + rs1_data;
  assign jal_target     = jal_imm + current_pc;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      from_branch_valid <= 1'b0;
      from_branch_data  <= {REGISTER_SIZE{1'b0}};
    end else begin
      from_branch_valid <= 1'b0;

      if (to_branch_ready == 1'b1) begin
        from_branch_data <= nbranch_target;
        if (target_pc[1:0] == 2'b00) begin
          from_branch_valid <= to_branch_valid & (jal_select | jalr_select);
        end
      end
    end
  end
  assign target_misaligned = (target_pc[1:0] != 2'b00) ? to_branch_valid : 1'b0;

endmodule
