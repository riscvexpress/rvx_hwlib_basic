//------------------------------------------------------------------------------
// alu.v
// Converted 1:1 from alu.vhd; contains three modules exactly as the VHDL file
// contains three entities: arithmetic_unit, shifter, divider.
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module arithmetic_unit
  #(
    parameter REGISTER_SIZE       = 32,
    parameter SIGN_EXTENSION_SIZE = 20,
    parameter POWER_OPTIMIZED     = 0,  // boolean
    parameter MULTIPLY_ENABLE     = 0,  // boolean
    parameter DIVIDE_ENABLE       = 0,  // boolean
    parameter SHIFTER_MAX_CYCLES  = 1,
    parameter ENABLE_EXCEPTIONS   = 0,  // boolean
    parameter FAMILY              = "GENERIC"
    )
  (
   input  wire                           clk,

   input  wire                           to_alu_valid,
   input  wire [REGISTER_SIZE-1:0]       to_alu_rs1_data,
   input  wire [REGISTER_SIZE-1:0]       to_alu_rs2_data,
   output wire                           from_alu_ready,
   output reg                            from_alu_illegal,

   input  wire                           vcp_source_valid,
   input  wire                           vcp_select,

   input  wire                           from_execute_ready,
   input  wire [31:0]                    instruction,
   input  wire [SIGN_EXTENSION_SIZE-1:0] sign_extension,
   input  wire [REGISTER_SIZE-1:0]       current_pc,

   output reg  [REGISTER_SIZE-1:0]       from_alu_data,
   output reg                            from_alu_valid
   );

  localparam SHIFTER_USE_MULTIPLIER = MULTIPLY_ENABLE;  // boolean

  // aliases
  wire [2:0] func3;
  wire [6:0] func7;
  wire [6:0] opcode;

  wire [REGISTER_SIZE-1:0] data1;
  wire [REGISTER_SIZE-1:0] data2;

  wire                     source_valid;

  //Submodules: LUI, AUIPC, add/sub/logic, shift, mul, div
  reg                      lui_select;
  reg                      auipc_select;
  reg                      addsub_logic_select;
  reg                      shift_select;
  wire                     from_shift_ready;
  wire                     from_shift_valid;
  reg                      mul_select;
  wire                     from_mul_ready;
  wire [REGISTER_SIZE-1:0] from_mul_data;
  wire                     from_mul_valid;
  reg                      div_select;
  wire                     from_div_ready;
  wire                     from_div_valid;
  wire [REGISTER_SIZE-1:0] from_div_data;

  wire                     from_base_alu_valid;
  reg  [REGISTER_SIZE-1:0] from_base_alu_data;

  wire [`log2(REGISTER_SIZE)-1:0] shift_amt;
  wire [REGISTER_SIZE:0]          shift_value;
  wire [REGISTER_SIZE-1:0]        lshifted_result;
  wire [REGISTER_SIZE-1:0]        rshifted_result;

  wire [REGISTER_SIZE-1:0]        upper_immediate;

  wire [(REGISTER_SIZE+1)*2-1:0]  mul_dest;
  wire                            mul_dest_shift_by_zero;
  wire                            mul_dest_valid;

  //operand creation signals
  wire                            not_immediate;  // alias instruction(5)
  wire [REGISTER_SIZE-1:0]        immediate_value;
  wire [REGISTER_SIZE:0]          shifter_multiply;
  wire                            m_op1_mask;
  wire                            m_op2_mask;
  wire [REGISTER_SIZE:0]          m_op1;
  wire [REGISTER_SIZE:0]          m_op2;

  wire                            is_add;
  wire [REGISTER_SIZE:0]          op1;
  wire [REGISTER_SIZE:0]          op2;
  wire                            op1_msb;
  wire                            op2_msb;
  wire [REGISTER_SIZE:0]          addsub;
  wire [REGISTER_SIZE-1:0]        slt_result;

  // constant vectors for bit-selects of `define literals
  wire [6:0] MUL_FUNC7_C = `MUL_FUNC7;
  wire [2:0] MUL_FUNC3_C = `MUL_FUNC3;

  assign func3         = instruction[14:12];
  assign func7         = instruction[31:25];
  assign opcode        = instruction[6:0];
  assign not_immediate = instruction[5];

  //Decode instruction to select submodule.  All paths must decode to exactly
  //one submodule.
  //ASSUMES only ALU_OP | VCP32_OP | VCP64_OP | ALUI_OP | LUI_OP | AUIPC_OP for opcode.
  always @(*) begin
    lui_select          = 1'b0;
    auipc_select        = 1'b0;
    shift_select        = 1'b0;
    addsub_logic_select = 1'b0;
    div_select          = 1'b0;
    mul_select          = 1'b0;
    from_alu_illegal    = 1'b0;

    //Top bit and bottom two bits are identical for all cases we care about
    case (opcode[5:2])
      4'b1101: begin                    //LUI_OP(5 downto 2)
        lui_select = 1'b1;
      end
      4'b0101: begin                    //AUIPC_OP(5 downto 2)
        auipc_select = 1'b1;
      end
      4'b0100: begin                    //ALUI_OP(5 downto 2)
        case (func3)
          `SLL_FUNC3: begin
            if (ENABLE_EXCEPTIONS != 0) begin
              if (func7 == `SHIFT_LOGIC_FUNC7) begin
                shift_select = 1'b1;
              end else begin
                from_alu_illegal = 1'b1;
              end
            end else begin
              shift_select = 1'b1;
            end
          end
          `SR_FUNC3: begin
            if (ENABLE_EXCEPTIONS != 0) begin
              case (func7)
                `SHIFT_LOGIC_FUNC7, `SHIFT_ARITH_FUNC7: begin
                  shift_select = 1'b1;
                end
                default: begin
                  from_alu_illegal = 1'b1;
                end
              endcase
            end else begin
              shift_select = 1'b1;
            end
          end
          default: begin
            addsub_logic_select = 1'b1;
          end
        endcase
      end
      default: begin                    //ALU_OP or from VCP
        if ((MULTIPLY_ENABLE != 0) && (func3[2] == 1'b0) &&
            (func7[5] == MUL_FUNC7_C[5]) && (func7[0] == MUL_FUNC7_C[0]) &&
            ((vcp_select == 1'b1) || ((func7[6] == MUL_FUNC7_C[6]) && (func7[4:1] == MUL_FUNC7_C[4:1])))) begin
          mul_select = 1'b1;
        end else if ((ENABLE_EXCEPTIONS != 0) && (func3[2] == 1'b0) &&
                     (func7[5] == MUL_FUNC7_C[5]) && (func7[0] == MUL_FUNC7_C[0]) &&
                     ((vcp_select == 1'b1) || ((func7[6] == MUL_FUNC7_C[6]) && (func7[4:1] == MUL_FUNC7_C[4:1])))) begin
          from_alu_illegal = 1'b1;
        end else if ((DIVIDE_ENABLE != 0) && (func3[2] == 1'b1) &&
                     (func7[5] == MUL_FUNC7_C[5]) && (func7[0] == MUL_FUNC7_C[0]) &&
                     ((vcp_select == 1'b1) || ((func7[6] == MUL_FUNC7_C[6]) && (func7[4:1] == MUL_FUNC7_C[4:1])))) begin
          div_select = 1'b1;
        end else if ((ENABLE_EXCEPTIONS != 0) && (func3[2] == 1'b1) &&
                     (func7[5] == MUL_FUNC7_C[5]) && (func7[0] == MUL_FUNC7_C[0]) &&
                     ((vcp_select == 1'b1) || ((func7[6] == MUL_FUNC7_C[6]) && (func7[4:1] == MUL_FUNC7_C[4:1])))) begin
          from_alu_illegal = 1'b1;
        end else begin
          case (func3)
            `SLL_FUNC3: begin
              if (ENABLE_EXCEPTIONS != 0) begin
                if (func7 == `SHIFT_LOGIC_FUNC7) begin
                  shift_select = 1'b1;
                end else begin
                  if (vcp_select == 1'b1) begin
                    shift_select = 1'b1;
                  end else begin
                    from_alu_illegal = 1'b1;
                  end
                end
              end else begin
                shift_select = 1'b1;
              end
            end
            `SR_FUNC3: begin
              if (ENABLE_EXCEPTIONS != 0) begin
                case (func7)
                  `SHIFT_LOGIC_FUNC7, `SHIFT_ARITH_FUNC7: begin
                    shift_select = 1'b1;
                  end
                  default: begin
                    if (vcp_select == 1'b1) begin
                      shift_select = 1'b1;
                    end else begin
                      from_alu_illegal = 1'b1;
                    end
                  end
                endcase
              end else begin
                shift_select = 1'b1;
              end
            end
            `ADDSUB_FUNC3: begin
              if (ENABLE_EXCEPTIONS != 0) begin
                case (func7)
                  `ADDSUB_ADD_FUNC7, `ADDSUB_SUB_FUNC7: begin
                    addsub_logic_select = 1'b1;
                  end
                  default: begin
                    if (vcp_select == 1'b1) begin
                      addsub_logic_select = 1'b1;
                    end else begin
                      from_alu_illegal = 1'b1;
                    end
                  end
                endcase
              end else begin
                addsub_logic_select = 1'b1;
              end
            end
            default: begin  //SLT_FUNC3 | SLTU_FUNC3 | XOR_FUNC3 | OR_FUNC3 | AND_FUNC3
              if (ENABLE_EXCEPTIONS != 0) begin
                if (func7 == `ALU_FUNC7) begin
                  addsub_logic_select = 1'b1;
                end else begin
                  if (vcp_select == 1'b1) begin
                    addsub_logic_select = 1'b1;
                  end else begin
                    from_alu_illegal = 1'b1;
                  end
                end
              end else begin
                addsub_logic_select = 1'b1;
              end
            end
          endcase
        end
      end
    endcase
  end

  assign immediate_value = {sign_extension[REGISTER_SIZE-`OP_IMM_IMMEDIATE_SIZE-1:0],
                            instruction[31:20]};
  assign data1 = ((source_valid == 1'b0) && (POWER_OPTIMIZED != 0)) ? {REGISTER_SIZE{1'b0}} :
                 to_alu_rs1_data;
  assign data2 = ((source_valid == 1'b0) && (POWER_OPTIMIZED != 0)) ? {REGISTER_SIZE{1'b0}} :
                 ((not_immediate == 1'b1) ? to_alu_rs2_data : immediate_value);

  assign shift_amt = (SHIFTER_USE_MULTIPLIER == 0) ? data2[`log2(REGISTER_SIZE)-1:0] :
                     ((func3[2] == 1'b0) ? data2[`log2(REGISTER_SIZE)-1:0] :
                      (-data2[`log2(REGISTER_SIZE)-1:0]));
  assign shift_value = {instruction[30] & to_alu_rs1_data[REGISTER_SIZE-1], to_alu_rs1_data};

  assign is_add = (instruction[5] == 1'b0) ? (func3 == `ADDSUB_FUNC3) :
                  ((func3 == `ADDSUB_FUNC3) && (instruction[30] == 1'b0));

  //Sign extend; only matters for SLT{I}/SLT{I}U
  assign op1_msb = (instruction[12] == 1'b0) ? data1[REGISTER_SIZE-1] : 1'b0;
  assign op2_msb = (instruction[12] == 1'b0) ? data2[REGISTER_SIZE-1] : 1'b0;

  assign op1 = {op1_msb, data1};
  assign op2 = {op2_msb, data2};

  assign addsub = is_add ? (op1 + op2) : (op1 - op2);

  assign m_op1_mask = (instruction[13:12] == 2'b11) ? 1'b0 : 1'b1;
  assign m_op2_mask = ~instruction[13];
  assign m_op1      = {m_op1_mask & to_alu_rs1_data[REGISTER_SIZE-1], data1};
  assign m_op2      = {m_op2_mask & to_alu_rs2_data[REGISTER_SIZE-1], data2};

  assign source_valid = (vcp_select == 1'b1) ? vcp_source_valid : to_alu_valid;

  assign from_shift_ready = from_shift_valid | (~shift_select);

  generate
    if (SHIFTER_USE_MULTIPLIER != 0) begin : shift_using_multiplier_gen
      // VHDL assert: multiplier must be enabled when SHIFTER_USE_MULTIPLIER is
      // true (always holds since SHIFTER_USE_MULTIPLIER = MULTIPLY_ENABLE).
      reg [REGISTER_SIZE-1:0] lshifted_result_reg;
      reg [REGISTER_SIZE-1:0] rshifted_result_reg;
      reg                     from_shift_valid_reg;
      genvar gbit;

      assign lshifted_result  = lshifted_result_reg;
      assign rshifted_result  = rshifted_result_reg;
      assign from_shift_valid = from_shift_valid_reg;

      for (gbit = 0; gbit <= REGISTER_SIZE-1; gbit = gbit + 1) begin : shift_mul_gen
        assign shifter_multiply[gbit] = (shift_amt == gbit) ? 1'b1 : 1'b0;
      end
      assign shifter_multiply[REGISTER_SIZE] = 1'b0;

      always @(posedge clk) begin
        lshifted_result_reg <= mul_dest[REGISTER_SIZE-1:0];
        rshifted_result_reg <= mul_dest[REGISTER_SIZE*2-1:REGISTER_SIZE];
        if (mul_dest_shift_by_zero == 1'b1) begin
          rshifted_result_reg <= mul_dest[REGISTER_SIZE-1:0];
        end
        from_shift_valid_reg <= mul_dest_valid & shift_select;

        if (from_execute_ready == 1'b1) begin
          from_shift_valid_reg <= 1'b0;
        end
      end
    end
    if (SHIFTER_USE_MULTIPLIER == 0) begin : shift_using_shifter_gen
      wire shift_enable;

      assign shifter_multiply = {(REGISTER_SIZE+1){1'b0}};  // unused in this configuration

      assign shift_enable = source_valid & shift_select;
      shifter
        #(
          .REGISTER_SIZE      (REGISTER_SIZE),
          .SHIFTER_MAX_CYCLES (SHIFTER_MAX_CYCLES)
          )
      sh (
          .clk              (clk),
          .shift_amt        (shift_amt),
          .shift_value      (shift_value),
          .lshifted_result  (lshifted_result),
          .rshifted_result  (rshifted_result),
          .from_shift_valid (from_shift_valid),
          .shift_enable     (shift_enable)
          );
    end
  endgenerate

  assign slt_result = {{(REGISTER_SIZE-1){1'b0}}, addsub[REGISTER_SIZE]};

  assign upper_immediate = {instruction[31:12], 12'b000000000000};

  //Base ALU (Add/sub, logical ops, shifts)
  always @(*) begin
    case (func3)
      `AND_FUNC3:              from_base_alu_data = data1 & data2;
      `OR_FUNC3:               from_base_alu_data = data1 | data2;
      `SR_FUNC3:               from_base_alu_data = rshifted_result;
      `XOR_FUNC3:              from_base_alu_data = data1 ^ data2;
      `SLT_FUNC3, `SLTU_FUNC3: from_base_alu_data = slt_result;
      `SLL_FUNC3:              from_base_alu_data = lshifted_result;
      default:                 from_base_alu_data = addsub[REGISTER_SIZE-1:0];
    endcase
  end

  assign from_base_alu_valid = (addsub_logic_select == 1'b1) ? source_valid : from_shift_valid;

  //Mux in and register final result
  always @(posedge clk) begin
    if (lui_select == 1'b1) begin
      from_alu_data  <= upper_immediate;
      from_alu_valid <= source_valid;
    end else if (auipc_select == 1'b1) begin
      from_alu_data  <= upper_immediate + current_pc;
      from_alu_valid <= source_valid;
    end else if (div_select == 1'b1) begin
      from_alu_data  <= from_div_data;
      from_alu_valid <= from_div_valid;
    end else if (mul_select == 1'b1) begin
      from_alu_data  <= from_mul_data;
      from_alu_valid <= from_mul_valid;
    end else begin
      from_alu_data  <= from_base_alu_data;
      from_alu_valid <= from_base_alu_valid;
    end
  end

  generate
    if (MULTIPLY_ENABLE != 0) begin : mul_gen
      wire                                 mul_enable;

      wire signed [REGISTER_SIZE:0]        mul_srca;
      wire signed [REGISTER_SIZE:0]        mul_srcb;
      wire                                 mul_src_valid;

      reg signed [REGISTER_SIZE:0]         mul_a;
      reg signed [REGISTER_SIZE:0]         mul_b;
      reg                                  mul_ab_shift_by_zero;
      reg                                  mul_ab_valid;
      reg                                  mul_dest_shift_by_zero_reg;
      reg                                  mul_dest_valid_reg;

      assign mul_dest_shift_by_zero = mul_dest_shift_by_zero_reg;
      assign mul_dest_valid         = mul_dest_valid_reg;

      assign mul_enable = (SHIFTER_USE_MULTIPLIER != 0) ?
                          (source_valid & (mul_select | shift_select)) :
                          (source_valid & mul_select);
      assign from_mul_ready = mul_dest_valid | (~mul_select);

      assign mul_srca = ((instruction[25] == 1'b1) || (SHIFTER_USE_MULTIPLIER == 0)) ?
                        $signed(m_op1) : $signed(shifter_multiply);
      assign mul_srcb = ((instruction[25] == 1'b1) || (SHIFTER_USE_MULTIPLIER == 0)) ?
                        $signed(m_op2) : $signed(shift_value);
      assign mul_src_valid = source_valid;

      if (FAMILY == "LATTICE") begin : lattice_mul_gen
        wire [REGISTER_SIZE-1:0] afix;
        wire [REGISTER_SIZE-1:0] bfix;
        reg  [REGISTER_SIZE-1:0] abfix;

        wire [REGISTER_SIZE-1:0]     mul_a_unsigned;
        wire [REGISTER_SIZE-1:0]     mul_b_unsigned;
        reg  [(REGISTER_SIZE*2)-1:0] mul_dest_unsigned;

        assign afix = (mul_b[REGISTER_SIZE] == 1'b1) ? mul_a[REGISTER_SIZE-1:0] :
                      {REGISTER_SIZE{1'b0}};
        assign bfix = (mul_a[REGISTER_SIZE] == 1'b1) ? mul_b[REGISTER_SIZE-1:0] :
                      {REGISTER_SIZE{1'b0}};

        assign mul_a_unsigned = mul_a[REGISTER_SIZE-1:0];
        assign mul_b_unsigned = mul_b[REGISTER_SIZE-1:0];

        always @(posedge clk) begin
          // The multiplication of the absolute value of the source operands.
          mul_dest_unsigned <= mul_a_unsigned * mul_b_unsigned;
          abfix             <= afix + bfix;
        end

        assign mul_dest[REGISTER_SIZE-1:0] = mul_dest_unsigned[REGISTER_SIZE-1:0];
        assign mul_dest[(REGISTER_SIZE*2)-1:REGISTER_SIZE] =
          mul_dest_unsigned[(REGISTER_SIZE*2)-1:REGISTER_SIZE] - abfix;
        //Upper two bits not assigned in VHDL for LATTICE (unused)
        assign mul_dest[(REGISTER_SIZE+1)*2-1:REGISTER_SIZE*2] = 2'bxx;
      end

      if (FAMILY != "LATTICE") begin : default_mul_gen
        reg signed [(REGISTER_SIZE+1)*2-1:0] mul_dest_reg;

        always @(posedge clk) begin
          mul_dest_reg <= mul_a * mul_b;
        end
        assign mul_dest = mul_dest_reg;
      end

      always @(posedge clk) begin
        //Register multiplier inputs
        mul_a <= mul_srca;
        mul_b <= mul_srcb;
        if ((POWER_OPTIMIZED != 0) && (mul_select == 1'b0) && (shift_select == 1'b0)) begin
          mul_a <= {(REGISTER_SIZE+1){1'b0}};
          mul_b <= {(REGISTER_SIZE+1){1'b0}};
        end
        if (shift_amt == {`log2(REGISTER_SIZE){1'b0}}) begin
          mul_ab_shift_by_zero <= 1'b1;
        end else begin
          mul_ab_shift_by_zero <= 1'b0;
        end
        mul_ab_valid <= mul_src_valid;

        //Register multiplier output
        mul_dest_shift_by_zero_reg <= mul_ab_shift_by_zero;
        mul_dest_valid_reg         <= mul_ab_valid;

        //If we don't want to pipeline multiple multiplies (as is the case when we are not using VCP)
        //we only want mul_dest_valid to be high for one cycle
        if (from_execute_ready == 1'b1) begin
          mul_ab_valid       <= 1'b0;
          mul_dest_valid_reg <= 1'b0;
        end
      end

      //MUL/MULH/MULHSU/MULHU select
      assign from_mul_data = (func3[1:0] == MUL_FUNC3_C[1:0]) ? mul_dest[REGISTER_SIZE-1:0] :
                             mul_dest[REGISTER_SIZE*2-1:REGISTER_SIZE];
      assign from_mul_valid = mul_dest_valid & mul_select;
    end

    if (MULTIPLY_ENABLE == 0) begin : no_mul_gen
      assign mul_dest_valid         = 1'b0;
      assign mul_dest_shift_by_zero = 1'bx;
      assign mul_dest               = {((REGISTER_SIZE+1)*2){1'bx}};
      assign from_mul_ready         = 1'b1;
      assign from_mul_data          = {REGISTER_SIZE{1'bx}};
      assign from_mul_valid         = 1'b0;
    end
  endgenerate

  generate
    if (DIVIDE_ENABLE != 0) begin : divide_gen
      wire                     div_enable;
      wire [REGISTER_SIZE-1:0] quotient;
      wire [REGISTER_SIZE-1:0] remainder;

      assign div_enable = source_valid & div_select;
      divider
        #(
          .REGISTER_SIZE (REGISTER_SIZE)
          )
      div (
           .clk            (clk),
           .div_enable     (div_enable),
           .div_unsigned   (instruction[12]),
           .rs1_data       (to_alu_rs1_data),
           .rs2_data       (to_alu_rs2_data),
           .quotient       (quotient),
           .remainder      (remainder),
           .from_div_valid (from_div_valid)
           );

      assign from_div_data = (func3[1] == 1'b0) ? quotient : remainder;

      assign from_div_ready = from_div_valid | (~div_select);
    end
    if (DIVIDE_ENABLE == 0) begin : no_divide_gen
      assign from_div_ready = 1'b1;
      assign from_div_data  = {REGISTER_SIZE{1'bx}};
      assign from_div_valid = 1'b0;
    end
  endgenerate

  assign from_alu_ready = from_div_ready & from_mul_ready & from_shift_ready;

endmodule


//-------------------------------------------------------------------------------
// Shifter
//-------------------------------------------------------------------------------
`include "utils_pkg.vh"

module shifter
  #(
    parameter REGISTER_SIZE      = 32,
    parameter SHIFTER_MAX_CYCLES = 1
    )
  (
   input  wire                                clk,
   input  wire [`log2(REGISTER_SIZE)-1:0]     shift_amt,
   input  wire [REGISTER_SIZE:0]              shift_value,
   output wire [REGISTER_SIZE-1:0]            lshifted_result,
   output wire [REGISTER_SIZE-1:0]            rshifted_result,
   output wire                                from_shift_valid,
   input  wire                                shift_enable
   );

  localparam SHIFT_AMT_SIZE = `log2(REGISTER_SIZE);

  wire [REGISTER_SIZE:0] left_tmp;
  wire [REGISTER_SIZE:0] right_tmp;

  // VHDL assert: SHIFTER_MAX_CYCLES must be 1, 8, or 32.

  generate
    if (SHIFTER_MAX_CYCLES == 1) begin : cycle1
      assign left_tmp         = shift_value << shift_amt;
      assign right_tmp        = $signed(shift_value) >>> shift_amt;
      assign from_shift_valid = shift_enable;
    end

    if (SHIFTER_MAX_CYCLES == 8) begin : cycle4N
      localparam [1:0] IDLE    = 2'd0;
      localparam [1:0] RUNNING = 2'd1;
      localparam [1:0] DONE    = 2'd2;

      reg  [REGISTER_SIZE:0]   left_tmp_reg;
      reg  [REGISTER_SIZE:0]   right_tmp_reg;
      wire [REGISTER_SIZE:0]   left_nxt;
      wire [REGISTER_SIZE:0]   right_nxt;
      reg  [SHIFT_AMT_SIZE:0]  count;
      wire [SHIFT_AMT_SIZE:0]  count_next;
      wire [SHIFT_AMT_SIZE:0]  count_sub4;
      wire                     shift4;
      reg  [1:0]               state = IDLE;  // VHDL enum default init = IDLE
      reg                      from_shift_valid_reg;

      assign left_tmp         = left_tmp_reg;
      assign right_tmp        = right_tmp_reg;
      assign from_shift_valid = from_shift_valid_reg;

      assign count_sub4 = count - 4;
      assign shift4     = ~count_sub4[SHIFT_AMT_SIZE];
      assign count_next = (shift4 == 1'b1) ? count_sub4 : (count - 1);
      assign left_nxt   = (shift4 == 1'b1) ? (left_tmp_reg << 4) : (left_tmp_reg << 1);
      assign right_nxt  = (shift4 == 1'b1) ? ($signed(right_tmp_reg) >>> 4) : ($signed(right_tmp_reg) >>> 1);

      always @(posedge clk) begin
        from_shift_valid_reg <= 1'b0;
        if (shift_enable == 1'b1) begin
          case (state)
            IDLE: begin
              left_tmp_reg  <= shift_value;
              right_tmp_reg <= shift_value;
              count         <= {1'b0, shift_amt};
              if (shift_amt != {SHIFT_AMT_SIZE{1'b0}}) begin
                state <= RUNNING;
              end else begin
                state                <= IDLE;
                from_shift_valid_reg <= 1'b1;
              end
            end
            RUNNING: begin
              left_tmp_reg  <= left_nxt;
              right_tmp_reg <= right_nxt;
              count         <= count_next;
              if ((count == 1) || (count == 4)) begin
                from_shift_valid_reg <= 1'b1;
                state                <= DONE;
              end
            end
            DONE: begin
              state <= IDLE;
            end
            default: begin
            end
          endcase
        end else begin
          state <= IDLE;
        end
      end
    end

    if (SHIFTER_MAX_CYCLES == 32) begin : cycle1N
      localparam [1:0] IDLE    = 2'd0;
      localparam [1:0] RUNNING = 2'd1;
      localparam [1:0] DONE    = 2'd2;

      reg  [REGISTER_SIZE:0]    left_tmp_reg;
      reg  [REGISTER_SIZE:0]    right_tmp_reg;
      wire [REGISTER_SIZE:0]    left_nxt;
      wire [REGISTER_SIZE:0]    right_nxt;
      reg  [SHIFT_AMT_SIZE-1:0] count;
      reg  [1:0]                state = IDLE;  // VHDL enum default init = IDLE
      reg                       from_shift_valid_reg;

      assign left_tmp         = left_tmp_reg;
      assign right_tmp        = right_tmp_reg;
      assign from_shift_valid = from_shift_valid_reg;

      assign left_nxt  = left_tmp_reg << 1;
      assign right_nxt = $signed(right_tmp_reg) >>> 1;

      always @(posedge clk) begin
        from_shift_valid_reg <= 1'b0;
        if (shift_enable == 1'b1) begin
          case (state)
            IDLE: begin
              left_tmp_reg  <= shift_value;
              right_tmp_reg <= shift_value;
              count         <= shift_amt;
              if (shift_amt != {SHIFT_AMT_SIZE{1'b0}}) begin
                state <= RUNNING;
              end else begin
                state                <= IDLE;
                from_shift_valid_reg <= 1'b1;
              end
            end
            RUNNING: begin
              left_tmp_reg  <= left_nxt;
              right_tmp_reg <= right_nxt;
              count         <= count - 1;
              if (count == 1) begin
                from_shift_valid_reg <= 1'b1;
                state                <= DONE;
              end
            end
            DONE: begin
              state <= IDLE;
            end
            default: begin
            end
          endcase
        end else begin
          state <= IDLE;
        end
      end
    end
  endgenerate

  assign rshifted_result = right_tmp[REGISTER_SIZE-1:0];
  assign lshifted_result = left_tmp[REGISTER_SIZE-1:0];

endmodule


//-------------------------------------------------------------------------------
// Divider
//-------------------------------------------------------------------------------
module divider
  #(
    parameter REGISTER_SIZE = 32
    )
  (
   input  wire                     clk,
   input  wire                     div_enable,
   input  wire                     div_unsigned,
   input  wire [REGISTER_SIZE-1:0] rs1_data,
   input  wire [REGISTER_SIZE-1:0] rs2_data,
   output wire [REGISTER_SIZE-1:0] quotient,
   output wire [REGISTER_SIZE-1:0] remainder,
   output reg                      from_div_valid
   );

  // type div_state is (IDLE, DIVIDING, DONE)
  localparam [1:0] IDLE     = 2'd0;
  localparam [1:0] DIVIDING = 2'd1;
  localparam [1:0] DONE     = 2'd2;

  reg [1:0]                state = IDLE;  // VHDL enum default init = IDLE
  // VHDL: signal count : natural range REGISTER_SIZE-1 downto 0;  (0..31 -> 5 bits)
  reg [`log2(REGISTER_SIZE)-1:0] count;
  wire [REGISTER_SIZE-1:0] numerator;
  wire [REGISTER_SIZE-1:0] denominator;

  wire                     div_neg_op1;
  wire                     div_neg_op2;
  reg                      div_neg_quotient;
  reg                      div_neg_remainder;

  wire                     div_by_zero;
  wire                     div_overflow;

  reg [REGISTER_SIZE-1:0]  div_res;
  reg [REGISTER_SIZE-1:0]  rem_res;
  wire [REGISTER_SIZE-1:0] min_signed;

  // VHDL process variables (persist across cycles; blocking assignments)
  reg [REGISTER_SIZE-1:0]  D;
  reg [REGISTER_SIZE-1:0]  N;
  reg [REGISTER_SIZE-1:0]  R;
  reg [REGISTER_SIZE-1:0]  Q;
  reg [REGISTER_SIZE:0]    sub;
  reg                      Q_lsb;

  assign div_neg_op1 = ($signed(rs1_data) < 0) ? ~div_unsigned : 1'b0;
  assign div_neg_op2 = ($signed(rs2_data) < 0) ? ~div_unsigned : 1'b0;

  assign min_signed = {1'b1, {(REGISTER_SIZE-1){1'b0}}};

  assign div_by_zero  = (rs2_data == {REGISTER_SIZE{1'b0}});
  assign div_overflow = ((rs1_data == min_signed) &&
                         (rs2_data == {REGISTER_SIZE{1'b1}}) &&
                         (div_unsigned == 1'b0));

  assign numerator   = (div_neg_op1 == 1'b0) ? rs1_data : (-rs1_data);
  assign denominator = (div_neg_op2 == 1'b0) ? rs2_data : (-rs2_data);

  always @(posedge clk) begin : div_proc
    from_div_valid <= 1'b0;
    if (div_enable == 1'b1) begin
      case (state)
        IDLE: begin
          div_neg_quotient  <= div_neg_op2 ^ div_neg_op1;
          div_neg_remainder <= div_neg_op1;
          D                  = denominator;
          N                  = numerator;
          R                  = {REGISTER_SIZE{1'b0}};
          if (div_by_zero) begin
            Q                  = {REGISTER_SIZE{1'b1}};
            R                  = rs1_data;
            from_div_valid    <= 1'b1;
            div_neg_remainder <= 1'b0;
            div_neg_quotient  <= 1'b0;
          end else if (div_overflow) begin
            Q                  = min_signed;
            from_div_valid    <= 1'b1;
            div_neg_remainder <= 1'b0;
            div_neg_quotient  <= 1'b0;
          end else begin
            state <= DIVIDING;
            count <= REGISTER_SIZE - 1;
          end
        end
        DIVIDING: begin
          R[REGISTER_SIZE-1:1] = R[REGISTER_SIZE-2:0];
          R[0]                 = N[REGISTER_SIZE-1];
          N                    = N << 1;

          Q_lsb = 1'b0;
          sub   = {1'b0, R} - {1'b0, D};
          if (sub[REGISTER_SIZE] == 1'b0) begin
            R     = sub[REGISTER_SIZE-1:0];
            Q_lsb = 1'b1;
          end
          Q = {Q[REGISTER_SIZE-2:0], Q_lsb};
          if (count != 0) begin
            count <= count - 1;
          end else begin
            from_div_valid <= 1'b1;
            state          <= DONE;
          end
        end
        DONE: begin
          state <= IDLE;
        end
        default: begin
        end
      endcase
      div_res <= Q;
      rem_res <= R;
    end else begin
      state <= IDLE;
    end
  end

  assign remainder = (div_neg_remainder == 1'b0) ? rem_res : (-rem_res);
  assign quotient  = (div_neg_quotient == 1'b0)  ? div_res : (-div_res);

endmodule
