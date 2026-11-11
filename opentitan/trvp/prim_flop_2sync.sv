module prim_flop_2sync #(
  parameter int               Width      = 16,
  parameter logic [Width-1:0] ResetValue = '0,
  parameter bit               EnablePrimCdcRand = 1
) (
  input                    clk_i,
  input                    rst_ni,
  input        [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

  prim_generic_flop_2sync #(
    .Width(Width),
    .ResetValue(ResetValue),
    .EnablePrimCdcRand(EnablePrimCdcRand)
  ) u_impl_generic (
    .*
  );

endmodule
