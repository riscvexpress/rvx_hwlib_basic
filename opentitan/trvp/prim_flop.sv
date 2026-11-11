module prim_flop #(
  parameter int               Width      = 1,
  parameter logic [Width-1:0] ResetValue = 0
) (
  input                    clk_i,
  input                    rst_ni,
  input        [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

  prim_generic_flop #(
    .Width(Width),
    .ResetValue(ResetValue)
  ) u_impl_generic (
    .*
  );

endmodule
