module prim_ram_1p import prim_ram_1p_pkg::*; #(
  parameter  int Width           = 32,
  parameter  int Depth           = 128,
  parameter  int DataBitsPerMask = 1,
  parameter      MemInitFile     = "",
  localparam int Aw              = $clog2(Depth)
) (
  input  logic             clk_i,
  input  logic             req_i,
  input  logic             write_i,
  input  logic [Aw-1:0]    addr_i,
  input  logic [Width-1:0] wdata_i,
  input  logic [Width-1:0] wmask_i,
  output logic [Width-1:0] rdata_o,
  input ram_1p_cfg_t       cfg_i
);

  prim_generic_ram_1p #(
    .Width(Width),
    .Depth(Depth),
    .DataBitsPerMask(DataBitsPerMask),
    .MemInitFile(MemInitFile)
  ) u_impl_generic (
    .*
  );

endmodule
