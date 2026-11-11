module prim_buf #(
  parameter int Width = 1
) (
  input        [Width-1:0] in_i,
  output logic [Width-1:0] out_o
);

  prim_generic_buf #(
    .Width(Width)
  ) u_impl_generic (
    .*
  );

endmodule
