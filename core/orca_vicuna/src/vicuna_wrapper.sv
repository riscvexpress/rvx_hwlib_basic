module vicuna_wrapper #(
        parameter int unsigned XIF_ID_W = 3
    )(
        input  logic                clk,
        input  logic                rstnn,

        input  logic                xif_issue_valid,
        output logic                xif_issue_ready,
        input  logic [31:0]         xif_issue_req_instr,
        input  logic [1:0]          xif_issue_req_mode,
        input  logic [XIF_ID_W-1:0] xif_issue_req_id,
        input  logic [31:0]         xif_issue_req_rs0,
        input  logic [31:0]         xif_issue_req_rs1,
        input  logic [1:0]          xif_issue_req_rs_valid,
        output logic                xif_issue_resp_accept,
        output logic                xif_issue_resp_writeback,

        input  logic                xif_commit_valid,
        input  logic [XIF_ID_W-1:0] xif_commit_id,
        input  logic                xif_commit_kill,

        output logic                xif_mem_valid,
        input  logic                xif_mem_ready,
        output logic [XIF_ID_W-1:0] xif_mem_req_id,
        output logic [31:0]         xif_mem_req_addr,
        output logic                xif_mem_req_we,
        output logic [3:0]          xif_mem_req_be,
        output logic [31:0]         xif_mem_req_wdata,

        input  logic                xif_mem_result_valid,
        input  logic [XIF_ID_W-1:0] xif_mem_result_id,
        input  logic [31:0]         xif_mem_result_rdata,

        output logic                xif_result_valid,
        input  logic                xif_result_ready,
        output logic [XIF_ID_W-1:0] xif_result_id,
        output logic [31:0]         xif_result_data,
        output logic                xif_result_we,

        output logic                xif_pending_load,
        output logic                xif_pending_store
    );

    vproc_xif #(
        .X_NUM_RS    ( 2        ),
        .X_ID_WIDTH  ( XIF_ID_W ),
        .X_MEM_WIDTH ( 32       ),
        .X_RFR_WIDTH ( 32       ),
        .X_RFW_WIDTH ( 32       ),
        .X_MISA      ( '0       )
    ) vcore_xif ();

    assign vcore_xif.issue_valid        = xif_issue_valid;
    assign xif_issue_ready              = vcore_xif.issue_ready;
    assign vcore_xif.issue_req.instr    = xif_issue_req_instr;
    assign vcore_xif.issue_req.mode     = xif_issue_req_mode;
    assign vcore_xif.issue_req.id       = xif_issue_req_id;
    assign vcore_xif.issue_req.rs[0]    = xif_issue_req_rs0;
    assign vcore_xif.issue_req.rs[1]    = xif_issue_req_rs1;
    assign vcore_xif.issue_req.rs_valid = xif_issue_req_rs_valid;
    assign xif_issue_resp_accept        = vcore_xif.issue_resp.accept;
    assign xif_issue_resp_writeback     = vcore_xif.issue_resp.writeback;

    assign vcore_xif.commit_valid       = xif_commit_valid;
    assign vcore_xif.commit.id          = xif_commit_id;
    assign vcore_xif.commit.commit_kill = xif_commit_kill;

    assign xif_mem_valid                = vcore_xif.mem_valid;
    assign vcore_xif.mem_ready          = xif_mem_ready;
    assign xif_mem_req_id               = vcore_xif.mem_req.id;
    assign xif_mem_req_addr             = vcore_xif.mem_req.addr;
    assign xif_mem_req_we               = vcore_xif.mem_req.we;
    assign xif_mem_req_be               = vcore_xif.mem_req.be;
    assign xif_mem_req_wdata            = vcore_xif.mem_req.wdata;
    assign vcore_xif.mem_resp.exc       = 1'b0;
    assign vcore_xif.mem_resp.exccode   = '0;
    assign vcore_xif.mem_resp.dbg       = 1'b0;

    assign vcore_xif.mem_result_valid   = xif_mem_result_valid;
    assign vcore_xif.mem_result.id      = xif_mem_result_id;
    assign vcore_xif.mem_result.rdata   = xif_mem_result_rdata;
    assign vcore_xif.mem_result.err     = 1'b0;
    assign vcore_xif.mem_result.dbg     = 1'b0;

    assign xif_result_valid             = vcore_xif.result_valid;
    assign vcore_xif.result_ready       = xif_result_ready;
    assign xif_result_id                = vcore_xif.result.id;
    assign xif_result_data              = vcore_xif.result.data;
    assign xif_result_we                = vcore_xif.result.we[0];

    vproc_core #(
        .XIF_ID_W         ( XIF_ID_W          ),
        .XIF_MEM_W        ( 32                ),
        .DONT_CARE_ZERO   ( 1'b1              ),
        .ASYNC_RESET      ( 1'b1              )
    ) v_core (
        .clk_i            ( clk               ),
        .rst_ni           ( rstnn             ),

        .xif_issue_if     ( vcore_xif         ),
        .xif_commit_if    ( vcore_xif         ),
        .xif_mem_if       ( vcore_xif         ),
        .xif_memres_if    ( vcore_xif         ),
        .xif_result_if    ( vcore_xif         ),

        .pending_load_o   ( xif_pending_load  ),
        .pending_store_o  ( xif_pending_store ),

        .csr_vtype_o      (                   ),
        .csr_vl_o         (                   ),
        .csr_vlenb_o      (                   ),
        .csr_vstart_o     (                   ),
        .csr_vstart_i     ( '0                ),
        .csr_vstart_set_i ( 1'b0              ),
        .csr_vxrm_o       (                   ),
        .csr_vxrm_i       ( '0                ),
        .csr_vxrm_set_i   ( 1'b0              ),
        .csr_vxsat_o      (                   ),
        .csr_vxsat_i      ( 1'b0              ),
        .csr_vxsat_set_i  ( 1'b0              ),

        .pend_vreg_wr_map_o (                 )
    );

endmodule
