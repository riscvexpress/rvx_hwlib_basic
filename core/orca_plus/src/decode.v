//------------------------------------------------------------------------------
// decode.v
// Converted 1:1 from decode.vhd (entity decode, arch rtl)
// Instantiates register_file (instance name: the_register_file).
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module decode
  #(
    parameter REGISTER_SIZE          = 32,
    parameter SIGN_EXTENSION_SIZE    = 20,
    parameter VCP_ENABLE             = `VCP_DISABLED,
    parameter PIPELINE_STAGES        = 1,
    parameter WRITE_FIRST_SMALL_RAMS = 0,  // boolean
    parameter FAMILY                 = "GENERIC"
    )
  (
   input  wire                                          clk,
   input  wire                                          reset,

   input  wire [`REGISTER_NAME_SIZE-1:0]                to_rf_select,
   input  wire [REGISTER_SIZE-1:0]                      to_rf_data,
   input  wire                                          to_rf_valid,

   input  wire [`INSTRUCTION_SIZE(`VCP_DISABLED)-1:0]   to_decode_instruction,
   input  wire [REGISTER_SIZE-1:0]                      to_decode_program_counter,
   input  wire [REGISTER_SIZE-1:0]                      to_decode_predicted_pc,
   input  wire                                          to_decode_valid,
   output wire                                          from_decode_ready,
   output wire                                          from_decode_incomplete_instruction,

   input  wire                                          quash_decode,
   output wire                                          decode_idle,

   output wire [REGISTER_SIZE-1:0]                      from_decode_rs1_data,
   output wire [REGISTER_SIZE-1:0]                      from_decode_rs2_data,
   output wire [REGISTER_SIZE-1:0]                      from_decode_rs3_data,
   output wire [SIGN_EXTENSION_SIZE-1:0]                from_decode_sign_extension,
   output wire [REGISTER_SIZE-1:0]                      from_decode_program_counter,
   output wire [REGISTER_SIZE-1:0]                      from_decode_predicted_pc,
   output wire [`INSTRUCTION_SIZE(VCP_ENABLE)-1:0]      from_decode_instruction,
   output wire [`INSTRUCTION_SIZE(`VCP_DISABLED)-1:0]   from_decode_next_instruction,
   output wire                                          from_decode_next_valid,
   output wire                                          from_decode_valid,
   input  wire                                          to_decode_ready
   );

  localparam INSTR_WIDTH = `INSTRUCTION_SIZE(VCP_ENABLE);

  wire                                 from_decode_incomplete_instruction_signal;
  wire [INSTR_WIDTH-1:0]               from_decode_instruction_signal;
  wire                                 from_decode_valid_signal;

  // aliases into to_decode_instruction
  wire [`REGISTER_NAME_SIZE-1:0]       to_decode_rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0]       to_decode_rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0]       to_decode_rs3_select;

  wire [`REGISTER_NAME_SIZE-1:0]       rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0]       rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0]       rs3_select;

  reg  [REGISTER_SIZE-1:0]             from_stage1_program_counter;
  reg  [REGISTER_SIZE-1:0]             from_stage1_predicted_pc;
  reg  [INSTR_WIDTH-1:0]               from_stage1_instruction;
  reg                                  from_stage1_valid;
  wire                                 to_stage1_ready;

  // aliases into from_stage1_instruction
  wire [`REGISTER_NAME_SIZE-1:0]       from_stage1_rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0]       from_stage1_rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0]       from_stage1_rs3_select;

  // aliases into from_decode_instruction_signal
  wire [`REGISTER_NAME_SIZE-1:0]       from_decode_rs1_select;
  wire [`REGISTER_NAME_SIZE-1:0]       from_decode_rs2_select;
  wire [`REGISTER_NAME_SIZE-1:0]       from_decode_rs3_select;

  wire [REGISTER_SIZE-1:0]             rs1_data;
  wire [REGISTER_SIZE-1:0]             rs2_data;
  wire [REGISTER_SIZE-1:0]             rs3_data;

  wire [`REGISTER_NAME_SIZE-1:0]       wb_select;
  wire [REGISTER_SIZE-1:0]             wb_data;
  wire                                 wb_enable;

  wire                                 to_decode_sixty_four_bit_instruction;
  reg                                  from_stage1_incomplete_instruction;

  assign from_decode_incomplete_instruction = from_decode_incomplete_instruction_signal;
  assign from_decode_instruction            = from_decode_instruction_signal;
  assign from_decode_valid                  = from_decode_valid_signal;

  assign to_decode_rs1_select = to_decode_instruction[19:15];
  assign to_decode_rs2_select = to_decode_instruction[24:20];
  assign to_decode_rs3_select = to_decode_instruction[11:7];

  assign from_stage1_rs1_select = from_stage1_instruction[19:15];
  assign from_stage1_rs2_select = from_stage1_instruction[24:20];
  assign from_stage1_rs3_select = from_stage1_instruction[11:7];

  assign from_decode_rs1_select = from_decode_instruction_signal[19:15];
  assign from_decode_rs2_select = from_decode_instruction_signal[24:20];
  assign from_decode_rs3_select = from_decode_instruction_signal[11:7];

  register_file
    #(
      .REGISTER_SIZE          (REGISTER_SIZE),
      .REGISTER_NAME_SIZE     (`REGISTER_NAME_SIZE),
      .READ_PORTS             ((VCP_ENABLE != `VCP_DISABLED) ? 3 : 2),  // CONDITIONAL(...)
      .WRITE_FIRST_SMALL_RAMS (WRITE_FIRST_SMALL_RAMS)
      )
  the_register_file (
      .clk        (clk),
      .reset      (reset),
      .rs1_select (rs1_select),
      .rs2_select (rs2_select),
      .rs3_select (rs3_select),
      .wb_select  (wb_select),
      .wb_data    (wb_data),
      .wb_enable  (wb_enable),
      .rs1_data   (rs1_data),
      .rs2_data   (rs2_data),
      .rs3_data   (rs3_data)
      );

  // This is to handle Microsemi board's inability to initialize RAM to zero on startup.
  generate
    if (FAMILY == "MICROSEMI") begin : reg_rst_en
      assign wb_select = (reset == 1'b0) ? to_rf_select : {`REGISTER_NAME_SIZE{1'b0}};
      assign wb_data   = (reset == 1'b0) ? to_rf_data   : {REGISTER_SIZE{1'b0}};
      assign wb_enable = (reset == 1'b0) ? to_rf_valid  : 1'b1;
    end
    if (FAMILY != "MICROSEMI") begin : reg_rst_nen
      assign wb_select = to_rf_select;
      assign wb_data   = to_rf_data;
      assign wb_enable = to_rf_valid;
    end
  endgenerate

  //----------------------------------------------------------------------------
  // 32/64-bit logic
  //----------------------------------------------------------------------------
  generate
    if (VCP_ENABLE == `VCP_SIXTY_FOUR_BIT) begin : sixty_four_bit_gen
      assign to_decode_sixty_four_bit_instruction =
        (to_decode_instruction[6:0] == `VCP64_OP) ?
        (~from_decode_incomplete_instruction_signal) : 1'b0;
      assign from_decode_incomplete_instruction_signal = from_stage1_incomplete_instruction;
    end
    if (VCP_ENABLE != `VCP_SIXTY_FOUR_BIT) begin : thirty_two_bit_gen
      assign to_decode_sixty_four_bit_instruction      = 1'b0;
      assign from_decode_incomplete_instruction_signal = 1'b0;
    end
  endgenerate

  //----------------------------------------------------------------------------
  // First stage
  //----------------------------------------------------------------------------
  assign from_decode_ready = to_stage1_ready | (~from_stage1_valid);

  //Reread registers if stalled
  assign rs1_select =
    ((from_decode_ready == 1'b1) && (from_decode_incomplete_instruction_signal == 1'b0)) ?
    to_decode_rs1_select : from_stage1_rs1_select;
  assign rs2_select =
    ((from_decode_ready == 1'b1) && (from_decode_incomplete_instruction_signal == 1'b0)) ?
    to_decode_rs2_select : from_stage1_rs2_select;
  assign rs3_select =
    ((from_decode_ready == 1'b1) && (from_decode_incomplete_instruction_signal == 1'b0)) ?
    to_decode_rs3_select : from_stage1_rs3_select;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      from_stage1_incomplete_instruction <= 1'b0;
      from_stage1_valid                  <= 1'b0;
      from_stage1_instruction            <= {INSTR_WIDTH{1'b0}};
      from_stage1_program_counter        <= {REGISTER_SIZE{1'b0}};
      from_stage1_predicted_pc           <= {REGISTER_SIZE{1'b0}};
    end else begin
      if (quash_decode == 1'b1) begin
        from_stage1_incomplete_instruction <= 1'b0;
        from_stage1_valid                  <= 1'b0;
        from_stage1_instruction            <= {INSTR_WIDTH{1'b0}};
        from_stage1_program_counter        <= {REGISTER_SIZE{1'b0}};
        from_stage1_predicted_pc           <= {REGISTER_SIZE{1'b0}};
      end else begin
        if (from_decode_ready == 1'b1) begin
          from_stage1_instruction[INSTR_WIDTH-1:INSTR_WIDTH-32] <= to_decode_instruction;
        end

        if (from_decode_incomplete_instruction_signal == 1'b1) begin
          if ((from_decode_ready == 1'b1) && (to_decode_valid == 1'b1)) begin
            from_stage1_incomplete_instruction <= 1'b0;
            from_stage1_valid                  <= 1'b1;
          end
        end else begin
          if (from_decode_ready == 1'b1) begin
            from_stage1_incomplete_instruction <= to_decode_valid &
                                                  to_decode_sixty_four_bit_instruction;
            from_stage1_program_counter <= to_decode_program_counter;
            from_stage1_predicted_pc    <= to_decode_predicted_pc;
            from_stage1_instruction[31:0] <= to_decode_instruction;
            from_stage1_valid           <= to_decode_valid & (~to_decode_sixty_four_bit_instruction);
          end
        end
      end
    end
  end

  //----------------------------------------------------------------------------
  // Second stage bypass (if one-stage)
  //----------------------------------------------------------------------------
  generate
    if (PIPELINE_STAGES == 1) begin : one_cycle
      assign to_stage1_ready = to_decode_ready;

      assign decode_idle = (~from_decode_valid_signal) &
                           (~from_decode_incomplete_instruction_signal);

      assign from_decode_rs1_data = rs1_data;
      assign from_decode_rs2_data = rs2_data;
      assign from_decode_rs3_data = rs3_data;
      // resize(signed(instruction MSB), SIGN_EXTENSION_SIZE)
      assign from_decode_sign_extension =
        {SIGN_EXTENSION_SIZE{from_stage1_instruction[INSTR_WIDTH-1]}};
      assign from_decode_program_counter    = from_stage1_program_counter;
      assign from_decode_predicted_pc       = from_stage1_predicted_pc;
      assign from_decode_instruction_signal = from_stage1_instruction;
      assign from_decode_valid_signal       = from_stage1_valid;
      assign from_decode_next_instruction   = to_decode_instruction;
      assign from_decode_next_valid         = to_decode_valid;
    end

    //--------------------------------------------------------------------------
    // Second stage (if two-stage)
    //--------------------------------------------------------------------------
    if (PIPELINE_STAGES == 2) begin : two_cycle
      reg                       from_decode_valid_reg;
      reg [REGISTER_SIZE-1:0]   from_decode_rs1_data_reg;
      reg [REGISTER_SIZE-1:0]   from_decode_rs2_data_reg;
      reg [REGISTER_SIZE-1:0]   from_decode_rs3_data_reg;
      reg [SIGN_EXTENSION_SIZE-1:0] from_decode_sign_extension_reg;
      reg [REGISTER_SIZE-1:0]   from_decode_program_counter_reg;
      reg [REGISTER_SIZE-1:0]   from_decode_predicted_pc_reg;
      reg [INSTR_WIDTH-1:0]     from_decode_instruction_reg;

      assign from_decode_valid_signal       = from_decode_valid_reg;
      assign from_decode_rs1_data           = from_decode_rs1_data_reg;
      assign from_decode_rs2_data           = from_decode_rs2_data_reg;
      assign from_decode_rs3_data           = from_decode_rs3_data_reg;
      assign from_decode_sign_extension     = from_decode_sign_extension_reg;
      assign from_decode_program_counter    = from_decode_program_counter_reg;
      assign from_decode_predicted_pc       = from_decode_predicted_pc_reg;
      assign from_decode_instruction_signal = from_decode_instruction_reg;

      assign to_stage1_ready = to_decode_ready | (~from_decode_valid_signal);

      assign decode_idle = (~from_stage1_valid) &
                           (~from_decode_valid_signal) &
                           (~from_decode_incomplete_instruction_signal);

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          from_decode_valid_reg           <= 1'b0;
          from_decode_rs1_data_reg        <= {REGISTER_SIZE{1'b0}};
          from_decode_rs2_data_reg        <= {REGISTER_SIZE{1'b0}};
          from_decode_rs3_data_reg        <= {REGISTER_SIZE{1'b0}};
          from_decode_sign_extension_reg  <= {SIGN_EXTENSION_SIZE{1'b0}};
          from_decode_program_counter_reg <= {REGISTER_SIZE{1'b0}};
          from_decode_predicted_pc_reg    <= {REGISTER_SIZE{1'b0}};
          from_decode_instruction_reg     <= {INSTR_WIDTH{1'b0}};
        end else begin
          if (to_stage1_ready == 1'b1) begin
            from_decode_rs1_data_reg <= rs1_data;
            from_decode_rs2_data_reg <= rs2_data;
            from_decode_rs3_data_reg <= rs3_data;
            from_decode_sign_extension_reg <=
              {SIGN_EXTENSION_SIZE{from_stage1_instruction[INSTR_WIDTH-1]}};
            from_decode_program_counter_reg <= from_stage1_program_counter;
            from_decode_predicted_pc_reg    <= from_stage1_predicted_pc;
            from_decode_instruction_reg     <= from_stage1_instruction;
          end

          if (quash_decode == 1'b1) begin
            from_decode_valid_reg <= 1'b0;
          end else if (to_stage1_ready == 1'b1) begin
            from_decode_valid_reg <= from_stage1_valid;
          end

          //Bypass registers already read out of register file
          if (to_rf_valid == 1'b1) begin
            if (to_stage1_ready == 1'b1) begin  //Bypass registers just being read in
              if (to_rf_select == from_stage1_rs1_select) begin
                from_decode_rs1_data_reg <= to_rf_data;
              end
              if (to_rf_select == from_stage1_rs2_select) begin
                from_decode_rs2_data_reg <= to_rf_data;
              end
              if (to_rf_select == from_stage1_rs3_select) begin
                from_decode_rs3_data_reg <= to_rf_data;
              end
            end else begin                      //Bypass data already read in
              if (to_rf_select == from_decode_rs1_select) begin
                from_decode_rs1_data_reg <= to_rf_data;
              end
              if (to_rf_select == from_decode_rs2_select) begin
                from_decode_rs2_data_reg <= to_rf_data;
              end
              if (to_rf_select == from_decode_rs3_select) begin
                from_decode_rs3_data_reg <= to_rf_data;
              end
            end
          end
        end
      end
      assign from_decode_next_instruction = from_stage1_instruction[31:0];
      assign from_decode_next_valid       = from_stage1_valid;
    end
  endgenerate

endmodule
