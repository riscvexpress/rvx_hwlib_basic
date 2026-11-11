module prim_ram_1r1w import prim_ram_2p_pkg::*; #(
  parameter  int Width           = 32,
  parameter  int Depth           = 128,
  parameter  int DataBitsPerMask = 1,
  parameter      MemInitFile     = "",
  localparam int Aw              = $clog2(Depth)
) (
  input                    clk_a_i,
  input                    clk_b_i,
  input                    a_req_i,
  input        [Aw-1:0]    a_addr_i,
  input        [Width-1:0] a_wdata_i,
  input  logic [Width-1:0] a_wmask_i,
  input                    b_req_i,
  input        [Aw-1:0]    b_addr_i,
  output logic [Width-1:0] b_rdata_o,
  input ram_2p_cfg_t       cfg_i
);

  prim_generic_ram_1r1w #(
    .Width(Width),
    .Depth(Depth),
    .DataBitsPerMask(DataBitsPerMask),
    .MemInitFile(MemInitFile)
  ) u_impl_generic (
    .*
  );

endmodule
