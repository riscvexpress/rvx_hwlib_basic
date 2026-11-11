module prim_clock_mux2 #(
  parameter bit NoFpgaBufG = 1'b0
) (
  input        clk0_i,
  input        clk1_i,
  input        sel_i,
  output logic clk_o
);

  prim_generic_clock_mux2 #(
    .NoFpgaBufG(NoFpgaBufG)
  ) u_impl_generic (
    .*
  );

endmodule
