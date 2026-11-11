`include "constants_pkg.vh"

module xif_handler
  #(
    parameter REGISTER_SIZE = 32,
    parameter XIF_ID_W      = 3
    )
  (
   input  wire                     clk,
   input  wire                     reset,

   input  wire                     to_xif_valid,
   input  wire [31:0]              instruction,
   input  wire [REGISTER_SIZE-1:0] rs1_data,
   input  wire [REGISTER_SIZE-1:0] rs2_data,
   output wire                     from_xif_ready,
   output wire                     from_xif_illegal,

   output wire                     xif_writeback_en,
   output wire [REGISTER_SIZE-1:0] xif_writeback_data,

   output wire                     xif_issue_valid,
   input  wire                     xif_issue_ready,
   output wire [31:0]              xif_issue_req_instr,
   output wire [1:0]               xif_issue_req_mode,
   output wire [XIF_ID_W-1:0]      xif_issue_req_id,
   output wire [REGISTER_SIZE-1:0] xif_issue_req_rs0,
   output wire [REGISTER_SIZE-1:0] xif_issue_req_rs1,
   output wire [1:0]               xif_issue_req_rs_valid,
   input  wire                     xif_issue_resp_accept,
   input  wire                     xif_issue_resp_writeback,

   output reg                      xif_commit_valid,
   output reg  [XIF_ID_W-1:0]      xif_commit_id,
   output wire                     xif_commit_kill,

   input  wire                     xif_result_valid,
   output wire                     xif_result_ready,
   input  wire [XIF_ID_W-1:0]      xif_result_id,
   input  wire [REGISTER_SIZE-1:0] xif_result_data,
   input  wire                     xif_result_we
   );

  reg  [XIF_ID_W-1:0]      issue_id;
  reg                      wait_result;
  reg  [XIF_ID_W-1:0]      wait_id;
  reg                      got_result;
  reg                      got_we;
  reg  [REGISTER_SIZE-1:0] got_data;

  wire                     issue_fire;
  wire                     result_match;
  wire                     result_available;
  wire                     result_we;
  wire [REGISTER_SIZE-1:0] result_data;
  wire                     result_done;

  assign xif_issue_valid        = to_xif_valid & (~wait_result);
  assign xif_issue_req_instr    = instruction;
  assign xif_issue_req_mode     = 2'b11;
  assign xif_issue_req_id       = issue_id;
  assign xif_issue_req_rs0      = rs1_data;
  assign xif_issue_req_rs1      = rs2_data;
  assign xif_issue_req_rs_valid = 2'b11;

  assign issue_fire = xif_issue_valid & xif_issue_ready;

  assign xif_commit_kill  = 1'b0;
  assign xif_result_ready = 1'b1;

  assign result_match     = wait_result & xif_result_valid & (xif_result_id == wait_id);
  assign result_available = got_result | result_match;
  assign result_we        = got_result ? got_we : xif_result_we;
  assign result_data      = got_result ? got_data : xif_result_data;
  assign result_done      = wait_result & to_xif_valid & result_available;

  assign from_xif_illegal   = issue_fire & (~xif_issue_resp_accept);
  assign from_xif_ready     = (issue_fire & ((~xif_issue_resp_accept) | (~xif_issue_resp_writeback))) | result_done;
  assign xif_writeback_en   = result_done & result_we;
  assign xif_writeback_data = result_data;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      issue_id         <= {XIF_ID_W{1'b0}};
      wait_result      <= 1'b0;
      wait_id          <= {XIF_ID_W{1'b0}};
      got_result       <= 1'b0;
      got_we           <= 1'b0;
      got_data         <= {REGISTER_SIZE{1'b0}};
      xif_commit_valid <= 1'b0;
      xif_commit_id    <= {XIF_ID_W{1'b0}};
    end else begin
      xif_commit_valid <= issue_fire & xif_issue_resp_accept;
      if (issue_fire == 1'b1) begin
        issue_id      <= issue_id + {{(XIF_ID_W-1){1'b0}}, 1'b1};
        xif_commit_id <= issue_id;
      end

      if ((issue_fire & xif_issue_resp_accept & xif_issue_resp_writeback) == 1'b1) begin
        wait_result <= 1'b1;
        wait_id     <= issue_id;
      end else if (result_done == 1'b1) begin
        wait_result <= 1'b0;
      end

      if (result_done == 1'b1) begin
        got_result <= 1'b0;
      end else if (result_match == 1'b1) begin
        got_result <= 1'b1;
        got_we     <= xif_result_we;
        got_data   <= xif_result_data;
      end
    end
  end

endmodule
