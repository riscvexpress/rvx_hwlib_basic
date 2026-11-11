module prim_clock_inv #(
  parameter bit HasScanMode = 1'b1,
  parameter bit NoFpgaBufG  = 1'b0
) (
  input        clk_i,
  input        scanmode_i,
  output logic clk_no
);

  prim_generic_clock_inv #(
    .HasScanMode(HasScanMode),
    .NoFpgaBufG(NoFpgaBufG)
  ) u_impl_generic (
    .*
  );

endmodule
