//------------------------------------------------------------------------------
// register_file.v
// Converted 1:1 from register_file.vhd (entity register_file, architecture rtl)
// Generic mapping: REGISTER_SIZE, REGISTER_NAME_SIZE, READ_PORTS,
//                  WRITE_FIRST_SMALL_RAMS (boolean -> 0/1)
//------------------------------------------------------------------------------
`include "constants_pkg.vh"

module register_file
  #(
    parameter REGISTER_SIZE          = 32,
    parameter REGISTER_NAME_SIZE     = 5,
    parameter READ_PORTS             = 2,
    parameter WRITE_FIRST_SMALL_RAMS = 0   // boolean
    )
  (
   input  wire                          clk,
   input  wire                          reset,
   input  wire [REGISTER_NAME_SIZE-1:0] rs1_select,
   input  wire [REGISTER_NAME_SIZE-1:0] rs2_select,
   input  wire [REGISTER_NAME_SIZE-1:0] rs3_select,
   input  wire [REGISTER_NAME_SIZE-1:0] wb_select,
   input  wire [REGISTER_SIZE-1:0]      wb_data,
   input  wire                          wb_enable,

   output wire [REGISTER_SIZE-1:0]      rs1_data,
   output wire [REGISTER_SIZE-1:0]      rs2_data,
   output wire [REGISTER_SIZE-1:0]      rs3_data
   );

  reg [REGISTER_SIZE-1:0] registers [31:0];

  generate
    if (WRITE_FIRST_SMALL_RAMS == 0) begin : bypass_gen
      reg [REGISTER_SIZE-1:0] out1;
      reg [REGISTER_SIZE-1:0] out2;
      reg [REGISTER_SIZE-1:0] out3;
      reg                     read_during_write1;
      reg                     read_during_write2;
      reg                     read_during_write3;
      reg [REGISTER_SIZE-1:0] wb_data_latched;
      integer                 i;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          for (i = 0; i < 32; i = i + 1) begin
            registers[i] <= {REGISTER_SIZE{1'b0}};
          end
          out1 <= {REGISTER_SIZE{1'b0}};
          out2 <= {REGISTER_SIZE{1'b0}};
          out3 <= {REGISTER_SIZE{1'b0}};
        end else begin
          out1 <= registers[rs1_select];
          out2 <= registers[rs2_select];
          out3 <= registers[rs3_select];
          if (wb_enable == 1'b1) begin
            registers[wb_select] <= wb_data;
          end
        end
      end

      //read during write logic
      assign rs1_data = (read_during_write1 == 1'b1) ? wb_data_latched : out1;
      assign rs2_data = (read_during_write2 == 1'b1) ? wb_data_latched : out2;
      // VHDL: (others => '-') when READ_PORTS < 3 (don't care -> x)
      assign rs3_data = (READ_PORTS < 3) ? {REGISTER_SIZE{1'bx}} :
                        ((read_during_write3 == 1'b1) ? wb_data_latched : out3);

      always @(posedge clk) begin
        read_during_write3 <= 1'b0;
        read_during_write2 <= 1'b0;
        read_during_write1 <= 1'b0;
        if ((rs1_select == wb_select) && (wb_enable == 1'b1)) begin
          read_during_write1 <= 1'b1;
        end
        if ((rs2_select == wb_select) && (wb_enable == 1'b1)) begin
          read_during_write2 <= 1'b1;
        end
        if ((rs3_select == wb_select) && (wb_enable == 1'b1)) begin
          read_during_write3 <= 1'b1;
        end
        wb_data_latched <= wb_data;
      end
    end else begin : write_first_gen
      reg [REGISTER_SIZE-1:0] rs1_data_reg;
      reg [REGISTER_SIZE-1:0] rs2_data_reg;
      reg [REGISTER_SIZE-1:0] rs3_data_reg;
      integer                 i;

      assign rs1_data = rs1_data_reg;
      assign rs2_data = rs2_data_reg;
      assign rs3_data = rs3_data_reg;

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          rs1_data_reg <= {REGISTER_SIZE{1'b0}};
          rs2_data_reg <= {REGISTER_SIZE{1'b0}};
          rs3_data_reg <= {REGISTER_SIZE{1'b0}};
        end else begin
          if ((wb_enable == 1'b1) && (wb_select == rs1_select)) begin
            rs1_data_reg <= wb_data;
          end else begin
            rs1_data_reg <= registers[rs1_select];
          end
          if ((wb_enable == 1'b1) && (wb_select == rs2_select)) begin
            rs2_data_reg <= wb_data;
          end else begin
            rs2_data_reg <= registers[rs2_select];
          end
          if ((wb_enable == 1'b1) && (wb_select == rs3_select)) begin
            rs3_data_reg <= wb_data;
          end else begin
            rs3_data_reg <= registers[rs3_select];
          end
        end
      end

      always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
          for (i = 0; i < 32; i = i + 1) begin
            registers[i] <= {REGISTER_SIZE{1'b0}};
          end
        end else begin
          if (wb_enable == 1'b1) begin
            registers[wb_select] <= wb_data;
          end
        end
      end
    end
  endgenerate

endmodule
