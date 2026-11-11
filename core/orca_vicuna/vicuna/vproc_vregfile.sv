// Copyright TU Wien
// Licensed under the Solderpad Hardware License v2.1, see LICENSE.txt for details
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1


module vproc_vregfile #(
        parameter vproc_pkg::vreg_type                   VREG_TYPE              = vproc_pkg::VREG_GENERIC,
        parameter int unsigned                           VREG_W                 = 128,  // vector register width in bits
        parameter int unsigned                           MAX_PORT_W             = 128,  // max port width in bits
        parameter int unsigned                           MAX_ADDR_W             = 128,  // max addr width in bits
        parameter int unsigned                           PORT_RD_CNT            = 1,    // number of read ports
        parameter int unsigned                           PORT_RD_W[PORT_RD_CNT] = '{0}, // read port widths
        parameter int unsigned                           PORT_WR_CNT            = 1,    // number of write ports
        parameter int unsigned                           PORT_WR_W[PORT_WR_CNT] = '{0}  // write port widths
    )(
        input  logic                                     clk_i,
        input  logic                                     async_rst_ni,
        input  logic                                     sync_rst_ni,

        input  logic [PORT_WR_CNT-1:0][MAX_ADDR_W  -1:0] wr_addr_i,
        input  logic [PORT_WR_CNT-1:0][MAX_PORT_W  -1:0] wr_data_i,
        input  logic [PORT_WR_CNT-1:0][MAX_PORT_W  -1:0] wr_be_i,
        input  logic [PORT_WR_CNT-1:0]                   wr_we_i,

        input  logic [PORT_RD_CNT-1:0][MAX_ADDR_W  -1:0] rd_addr_i,
        output logic [PORT_RD_CNT-1:0][MAX_PORT_W  -1:0] rd_data_o
    );

    if (PORT_WR_CNT != 1) begin
        $fatal(1, "vproc_vregfile supports exactly one write port");
    end

    logic [VREG_W-1:0] regs_q [32];
    always_ff @(posedge clk_i or negedge async_rst_ni) begin
        if (~async_rst_ni) begin
            for (int r = 0; r < 32; r++) begin
                regs_q[r] <= '0;
            end
        end
        else if (wr_we_i[0]) begin
            for (int b = 0; b < VREG_W; b++) begin
                if (wr_be_i[0][b]) begin
                    regs_q[wr_addr_i[0][4:0]][b] <= wr_data_i[0][b];
                end
            end
        end
    end

    always_comb begin
        rd_data_o = '0;
        for (int i = 0; i < PORT_RD_CNT; i++) begin
            rd_data_o[i][VREG_W-1:0] = regs_q[rd_addr_i[i][4:0]];
        end
    end

endmodule
