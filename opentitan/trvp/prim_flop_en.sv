module prim_flop_en #(
  parameter int               Width      = 1,
  parameter bit               EnSecBuf   = 0,
  parameter logic [Width-1:0] ResetValue = 0
) (
  input                    clk_i,
  input                    rst_ni,
  input                    en_i,
  input        [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

  prim_generic_flop_en #(
    .ResetValue(ResetValue),
    .EnSecBuf(EnSecBuf),
    .Width(Width)
  ) u_impl_generic (
    .*
  );

endmodule
