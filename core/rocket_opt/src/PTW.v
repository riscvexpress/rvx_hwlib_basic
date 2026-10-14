`default_nettype wire
`include "timescale.vh"
module PTW(
  input         clock,
  input         reset,
  output [31:0] io_requestor_1_customCSRs_csrs_0_value,
  output        io_dpath_perf_l2hit,
  output        io_dpath_perf_pte_miss,
  output        io_dpath_perf_pte_hit,
  input  [31:0] io_dpath_customCSRs_csrs_0_value
);
  assign io_requestor_1_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value;
  assign io_dpath_perf_l2hit = 1'h0;
  assign io_dpath_perf_pte_miss = 1'h0;
  assign io_dpath_perf_pte_hit = 1'h0;
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit))) & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit)))) begin
          $fwrite(32'h80000002,
            "Assertion failed: PTE Cache Hit/Miss Performance Monitor Events are lower priority than L2TLB Hit event\n    at PTW.scala:264 assert(!(io.dpath.perf.l2hit && (io.dpath.perf.pte_miss || io.dpath.perf.pte_hit)),\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule