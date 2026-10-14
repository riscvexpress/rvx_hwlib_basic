//------------------------------------------------------------------------------
// vcp_handler.v
// Converted 1:1 from vcp_handler.vhd (entity vcp_handler, arch rtl)
// VCP_ENABLE encoding (vcp_type): 0=DISABLED, 1=THIRTY_TWO_BIT, 2=SIXTY_FOUR_BIT
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module vcp_handler
  #(
    parameter REGISTER_SIZE = 32,
    parameter VCP_ENABLE    = `VCP_DISABLED
    )
  (
   input  wire                                          clk,
   input  wire                                          reset,

   input  wire [`INSTRUCTION_SIZE(VCP_ENABLE)-1:0]      instruction,
   input  wire                                          to_vcp_valid,
   input  wire                                          vcp_select,

   input  wire [REGISTER_SIZE-1:0]                      rs1_data,
   input  wire [REGISTER_SIZE-1:0]                      rs2_data,
   input  wire [REGISTER_SIZE-1:0]                      rs3_data,

   output wire [REGISTER_SIZE-1:0]                      vcp_data0,
   output wire [REGISTER_SIZE-1:0]                      vcp_data1,
   output wire [REGISTER_SIZE-1:0]                      vcp_data2,

   output wire [40:0]                                   vcp_instruction,
   output wire                                          vcp_valid_instr,
   output wire                                          vcp_writeback_select
   );

  // alias opcode : instruction(6 downto 0)
  wire [6:0] opcode;
  wire [1:0] dest_size;
  wire       vcp64_instruction;

  assign opcode = instruction[6:0];

  //extended bits
  assign dest_size         = {instruction[31], instruction[29]};
  assign vcp64_instruction = (opcode[2] == 1'b1);

  generate
    if (VCP_ENABLE == `VCP_SIXTY_FOUR_BIT) begin : full_vcp_gen
      assign vcp_instruction[40]    = vcp64_instruction ? instruction[40]    : 1'b0;      //extra instruction
      assign vcp_instruction[39]    = vcp64_instruction ? instruction[39]    : 1'b0;      //masked
      assign vcp_instruction[38]    = vcp64_instruction ? instruction[38]    : 1'b1;      //bsign
      assign vcp_instruction[37]    = vcp64_instruction ? instruction[37]    : 1'b1;      //asign
      assign vcp_instruction[36]    = vcp64_instruction ? instruction[36]    : 1'b1;      //opsign
      assign vcp_instruction[35:34] = vcp64_instruction ? instruction[35:34] : dest_size; //b size
      assign vcp_instruction[33:32] = vcp64_instruction ? instruction[33:32] : dest_size; //a size
    end
    if (VCP_ENABLE != `VCP_SIXTY_FOUR_BIT) begin : light_vcp_gen
      assign vcp_instruction[40]    = 1'b0;      //extra instruction
      assign vcp_instruction[39]    = 1'b0;      //masked
      assign vcp_instruction[38]    = 1'b1;      //bsign
      assign vcp_instruction[37]    = 1'b1;      //asign
      assign vcp_instruction[36]    = 1'b1;      //opsign
      assign vcp_instruction[35:34] = dest_size; //b size
      assign vcp_instruction[33:32] = dest_size; //a size
    end
  endgenerate
  assign vcp_instruction[31:0] = instruction[31:0];

  assign vcp_data0 = rs1_data;
  assign vcp_data1 = rs2_data;
  assign vcp_data2 = rs3_data;

  generate
    if (VCP_ENABLE != `VCP_DISABLED) begin : vcp_enabled_gen
      reg vcp_writeback_select_reg;

      assign vcp_valid_instr      = to_vcp_valid;
      assign vcp_writeback_select = vcp_writeback_select_reg;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          vcp_writeback_select_reg <= 1'b0;
        end else begin
          vcp_writeback_select_reg <= vcp_select;
        end
      end
    end
    if (VCP_ENABLE == `VCP_DISABLED) begin : vcp_disabled_gen
      assign vcp_valid_instr      = 1'b0;
      assign vcp_writeback_select = 1'b0;
    end
  endgenerate

endmodule
