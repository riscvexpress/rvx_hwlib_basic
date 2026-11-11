module prim_clock_buf #(
  parameter bit NoFpgaBuf = 1'b0,
  parameter bit RegionSel = 1'b0
) (
  input        clk_i,
  output logic clk_o
);

  prim_generic_clock_buf #(
    .NoFpgaBuf(NoFpgaBuf),
    .RegionSel(RegionSel)
  ) u_impl_generic (
    .*
  );

endmodule
