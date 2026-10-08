`default_nettype wire
`include "timescale.vh"
module RocketTile(
  input         clock,
  input         reset,
  output        auto_wfi_out_0,
  input         auto_int_local_in_2_0,
  input         auto_int_local_in_1_0,
  input         auto_int_local_in_1_1,
  input         auto_int_local_in_0_0,
  input         auto_hartid_in,
  input         auto_tl_other_masters_out_a_ready,
  output        auto_tl_other_masters_out_a_valid,
  output [2:0]  auto_tl_other_masters_out_a_bits_opcode,
  output [2:0]  auto_tl_other_masters_out_a_bits_param,
  output [3:0]  auto_tl_other_masters_out_a_bits_size,
  output [1:0]  auto_tl_other_masters_out_a_bits_source,
  output [31:0] auto_tl_other_masters_out_a_bits_address,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_bufferable,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_modifiable,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_readalloc,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_writealloc,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_privileged,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_secure,
  output        auto_tl_other_masters_out_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_tl_other_masters_out_a_bits_mask,
  output [31:0] auto_tl_other_masters_out_a_bits_data,
  input         auto_tl_other_masters_out_c_ready,
  output        auto_tl_other_masters_out_c_valid,
  output [2:0]  auto_tl_other_masters_out_c_bits_opcode,
  output [2:0]  auto_tl_other_masters_out_c_bits_param,
  output [3:0]  auto_tl_other_masters_out_c_bits_size,
  output [31:0] auto_tl_other_masters_out_c_bits_address,
  output [31:0] auto_tl_other_masters_out_c_bits_data,
  output        auto_tl_other_masters_out_d_ready,
  input         auto_tl_other_masters_out_d_valid,
  input  [2:0]  auto_tl_other_masters_out_d_bits_opcode,
  input  [1:0]  auto_tl_other_masters_out_d_bits_param,
  input  [3:0]  auto_tl_other_masters_out_d_bits_size,
  input  [1:0]  auto_tl_other_masters_out_d_bits_source,
  input  [2:0]  auto_tl_other_masters_out_d_bits_sink,
  input         auto_tl_other_masters_out_d_bits_denied,
  input  [31:0] auto_tl_other_masters_out_d_bits_data,
  input         auto_tl_other_masters_out_d_bits_corrupt,
  input         auto_tl_other_masters_out_e_ready,
  output        auto_tl_other_masters_out_e_valid,
  output [2:0]  auto_tl_other_masters_out_e_bits_sink
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  tlMasterXbar_clock;
  wire  tlMasterXbar_reset;
  wire  tlMasterXbar_auto_in_1_a_ready;
  wire  tlMasterXbar_auto_in_1_a_valid;
  wire [31:0] tlMasterXbar_auto_in_1_a_bits_address;
  wire  tlMasterXbar_auto_in_1_a_bits_user_amba_prot_readalloc;
  wire  tlMasterXbar_auto_in_1_a_bits_user_amba_prot_writealloc;
  wire  tlMasterXbar_auto_in_1_d_valid;
  wire [2:0] tlMasterXbar_auto_in_1_d_bits_opcode;
  wire [3:0] tlMasterXbar_auto_in_1_d_bits_size;
  wire [31:0] tlMasterXbar_auto_in_1_d_bits_data;
  wire  tlMasterXbar_auto_in_1_d_bits_corrupt;
  wire  tlMasterXbar_auto_in_0_a_ready;
  wire  tlMasterXbar_auto_in_0_a_valid;
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_opcode;
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_param;
  wire [3:0] tlMasterXbar_auto_in_0_a_bits_size;
  wire  tlMasterXbar_auto_in_0_a_bits_source;
  wire [31:0] tlMasterXbar_auto_in_0_a_bits_address;
  wire  tlMasterXbar_auto_in_0_a_bits_user_amba_prot_bufferable;
  wire  tlMasterXbar_auto_in_0_a_bits_user_amba_prot_modifiable;
  wire  tlMasterXbar_auto_in_0_a_bits_user_amba_prot_readalloc;
  wire  tlMasterXbar_auto_in_0_a_bits_user_amba_prot_writealloc;
  wire [3:0] tlMasterXbar_auto_in_0_a_bits_mask;
  wire [31:0] tlMasterXbar_auto_in_0_a_bits_data;
  wire  tlMasterXbar_auto_in_0_c_ready;
  wire  tlMasterXbar_auto_in_0_c_valid;
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_opcode;
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_param;
  wire [3:0] tlMasterXbar_auto_in_0_c_bits_size;
  wire [31:0] tlMasterXbar_auto_in_0_c_bits_address;
  wire [31:0] tlMasterXbar_auto_in_0_c_bits_data;
  wire  tlMasterXbar_auto_in_0_d_ready;
  wire  tlMasterXbar_auto_in_0_d_valid;
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_opcode;
  wire [1:0] tlMasterXbar_auto_in_0_d_bits_param;
  wire [3:0] tlMasterXbar_auto_in_0_d_bits_size;
  wire  tlMasterXbar_auto_in_0_d_bits_source;
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_sink;
  wire  tlMasterXbar_auto_in_0_d_bits_denied;
  wire [31:0] tlMasterXbar_auto_in_0_d_bits_data;
  wire  tlMasterXbar_auto_in_0_e_ready;
  wire  tlMasterXbar_auto_in_0_e_valid;
  wire [2:0] tlMasterXbar_auto_in_0_e_bits_sink;
  wire  tlMasterXbar_auto_out_a_ready;
  wire  tlMasterXbar_auto_out_a_valid;
  wire [2:0] tlMasterXbar_auto_out_a_bits_opcode;
  wire [2:0] tlMasterXbar_auto_out_a_bits_param;
  wire [3:0] tlMasterXbar_auto_out_a_bits_size;
  wire [1:0] tlMasterXbar_auto_out_a_bits_source;
  wire [31:0] tlMasterXbar_auto_out_a_bits_address;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_bufferable;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_modifiable;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_readalloc;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_writealloc;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_privileged;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_secure;
  wire  tlMasterXbar_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] tlMasterXbar_auto_out_a_bits_mask;
  wire [31:0] tlMasterXbar_auto_out_a_bits_data;
  wire  tlMasterXbar_auto_out_c_ready;
  wire  tlMasterXbar_auto_out_c_valid;
  wire [2:0] tlMasterXbar_auto_out_c_bits_opcode;
  wire [2:0] tlMasterXbar_auto_out_c_bits_param;
  wire [3:0] tlMasterXbar_auto_out_c_bits_size;
  wire [31:0] tlMasterXbar_auto_out_c_bits_address;
  wire [31:0] tlMasterXbar_auto_out_c_bits_data;
  wire  tlMasterXbar_auto_out_d_ready;
  wire  tlMasterXbar_auto_out_d_valid;
  wire [2:0] tlMasterXbar_auto_out_d_bits_opcode;
  wire [1:0] tlMasterXbar_auto_out_d_bits_param;
  wire [3:0] tlMasterXbar_auto_out_d_bits_size;
  wire [1:0] tlMasterXbar_auto_out_d_bits_source;
  wire [2:0] tlMasterXbar_auto_out_d_bits_sink;
  wire  tlMasterXbar_auto_out_d_bits_denied;
  wire [31:0] tlMasterXbar_auto_out_d_bits_data;
  wire  tlMasterXbar_auto_out_d_bits_corrupt;
  wire  tlMasterXbar_auto_out_e_ready;
  wire  tlMasterXbar_auto_out_e_valid;
  wire [2:0] tlMasterXbar_auto_out_e_bits_sink;
  wire  intXbar_auto_int_in_2_0;
  wire  intXbar_auto_int_in_1_0;
  wire  intXbar_auto_int_in_1_1;
  wire  intXbar_auto_int_in_0_0;
  wire  intXbar_auto_int_out_0;
  wire  intXbar_auto_int_out_1;
  wire  intXbar_auto_int_out_2;
  wire  intXbar_auto_int_out_3;
  wire  broadcast_auto_in;
  wire  broadcast_auto_out;
  wire  dcache_clock;
  wire  dcache_reset;
  wire  dcache_auto_out_a_ready;
  wire  dcache_auto_out_a_valid;
  wire [2:0] dcache_auto_out_a_bits_opcode;
  wire [2:0] dcache_auto_out_a_bits_param;
  wire [3:0] dcache_auto_out_a_bits_size;
  wire  dcache_auto_out_a_bits_source;
  wire [31:0] dcache_auto_out_a_bits_address;
  wire  dcache_auto_out_a_bits_user_amba_prot_bufferable;
  wire  dcache_auto_out_a_bits_user_amba_prot_modifiable;
  wire  dcache_auto_out_a_bits_user_amba_prot_readalloc;
  wire  dcache_auto_out_a_bits_user_amba_prot_writealloc;
  wire [3:0] dcache_auto_out_a_bits_mask;
  wire [31:0] dcache_auto_out_a_bits_data;
  wire  dcache_auto_out_c_ready;
  wire  dcache_auto_out_c_valid;
  wire [2:0] dcache_auto_out_c_bits_opcode;
  wire [2:0] dcache_auto_out_c_bits_param;
  wire [3:0] dcache_auto_out_c_bits_size;
  wire [31:0] dcache_auto_out_c_bits_address;
  wire [31:0] dcache_auto_out_c_bits_data;
  wire  dcache_auto_out_d_ready;
  wire  dcache_auto_out_d_valid;
  wire [2:0] dcache_auto_out_d_bits_opcode;
  wire [1:0] dcache_auto_out_d_bits_param;
  wire [3:0] dcache_auto_out_d_bits_size;
  wire  dcache_auto_out_d_bits_source;
  wire [2:0] dcache_auto_out_d_bits_sink;
  wire  dcache_auto_out_d_bits_denied;
  wire [31:0] dcache_auto_out_d_bits_data;
  wire  dcache_auto_out_e_ready;
  wire  dcache_auto_out_e_valid;
  wire [2:0] dcache_auto_out_e_bits_sink;
  wire  dcache_io_cpu_req_ready;
  wire  dcache_io_cpu_req_valid;
  wire [31:0] dcache_io_cpu_req_bits_addr;
  wire [5:0] dcache_io_cpu_req_bits_tag;
  wire [4:0] dcache_io_cpu_req_bits_cmd;
  wire [1:0] dcache_io_cpu_req_bits_size;
  wire  dcache_io_cpu_req_bits_signed;
  wire  dcache_io_cpu_s1_kill;
  wire [31:0] dcache_io_cpu_s1_data_data;
  wire [3:0] dcache_io_cpu_s1_data_mask;
  wire  dcache_io_cpu_s2_nack;
  wire  dcache_io_cpu_resp_valid;
  wire [31:0] dcache_io_cpu_resp_bits_addr;
  wire [5:0] dcache_io_cpu_resp_bits_tag;
  wire [4:0] dcache_io_cpu_resp_bits_cmd;
  wire [1:0] dcache_io_cpu_resp_bits_size;
  wire  dcache_io_cpu_resp_bits_signed;
  wire [1:0] dcache_io_cpu_resp_bits_dprv;
  wire  dcache_io_cpu_resp_bits_dv;
  wire [31:0] dcache_io_cpu_resp_bits_data;
  wire [3:0] dcache_io_cpu_resp_bits_mask;
  wire  dcache_io_cpu_resp_bits_replay;
  wire  dcache_io_cpu_resp_bits_has_data;
  wire [31:0] dcache_io_cpu_resp_bits_data_word_bypass;
  wire [31:0] dcache_io_cpu_resp_bits_data_raw;
  wire [31:0] dcache_io_cpu_resp_bits_store_data;
  wire  dcache_io_cpu_replay_next;
  wire  dcache_io_cpu_s2_xcpt_ma_ld;
  wire  dcache_io_cpu_s2_xcpt_ma_st;
  wire  dcache_io_cpu_s2_xcpt_pf_ld;
  wire  dcache_io_cpu_s2_xcpt_pf_st;
  wire  dcache_io_cpu_s2_xcpt_gf_ld;
  wire  dcache_io_cpu_s2_xcpt_gf_st;
  wire  dcache_io_cpu_s2_xcpt_ae_ld;
  wire  dcache_io_cpu_s2_xcpt_ae_st;
  wire  dcache_io_cpu_ordered;
  wire  dcache_io_cpu_perf_release;
  wire  dcache_io_cpu_perf_grant;
  wire  frontend_clock;
  wire  frontend_reset;
  wire  frontend_auto_icache_master_out_a_ready;
  wire  frontend_auto_icache_master_out_a_valid;
  wire [31:0] frontend_auto_icache_master_out_a_bits_address;
  wire  frontend_auto_icache_master_out_a_bits_user_amba_prot_readalloc;
  wire  frontend_auto_icache_master_out_a_bits_user_amba_prot_writealloc;
  wire  frontend_auto_icache_master_out_d_valid;
  wire [2:0] frontend_auto_icache_master_out_d_bits_opcode;
  wire [3:0] frontend_auto_icache_master_out_d_bits_size;
  wire [31:0] frontend_auto_icache_master_out_d_bits_data;
  wire  frontend_auto_icache_master_out_d_bits_corrupt;
  wire  frontend_io_cpu_might_request;
  wire  frontend_io_cpu_req_valid;
  wire [31:0] frontend_io_cpu_req_bits_pc;
  wire  frontend_io_cpu_req_bits_speculative;
  wire  frontend_io_cpu_resp_ready;
  wire  frontend_io_cpu_resp_valid;
  wire  frontend_io_cpu_resp_bits_btb_taken;
  wire  frontend_io_cpu_resp_bits_btb_bridx;
  wire [4:0] frontend_io_cpu_resp_bits_btb_entry;
  wire [7:0] frontend_io_cpu_resp_bits_btb_bht_history;
  wire [31:0] frontend_io_cpu_resp_bits_pc;
  wire [31:0] frontend_io_cpu_resp_bits_data;
  wire  frontend_io_cpu_resp_bits_xcpt_ae_inst;
  wire  frontend_io_cpu_resp_bits_replay;
  wire  frontend_io_cpu_btb_update_valid;
  wire [4:0] frontend_io_cpu_btb_update_bits_prediction_entry;
  wire [31:0] frontend_io_cpu_btb_update_bits_pc;
  wire  frontend_io_cpu_btb_update_bits_isValid;
  wire [31:0] frontend_io_cpu_btb_update_bits_br_pc;
  wire [1:0] frontend_io_cpu_btb_update_bits_cfiType;
  wire  frontend_io_cpu_bht_update_valid;
  wire [7:0] frontend_io_cpu_bht_update_bits_prediction_history;
  wire [31:0] frontend_io_cpu_bht_update_bits_pc;
  wire  frontend_io_cpu_bht_update_bits_branch;
  wire  frontend_io_cpu_bht_update_bits_taken;
  wire  frontend_io_cpu_bht_update_bits_mispredict;
  wire  frontend_io_cpu_flush_icache;
  wire [31:0] frontend_io_cpu_npc;
  wire [31:0] frontend_io_ptw_customCSRs_csrs_0_value;
  wire  fpuOpt_clock;
  wire  fpuOpt_reset;
  wire [31:0] fpuOpt_io_inst;
  wire [31:0] fpuOpt_io_fromint_data;
  wire [2:0] fpuOpt_io_fcsr_rm;
  wire  fpuOpt_io_fcsr_flags_valid;
  wire [4:0] fpuOpt_io_fcsr_flags_bits;
  wire [31:0] fpuOpt_io_store_data;
  wire [31:0] fpuOpt_io_toint_data;
  wire  fpuOpt_io_dmem_resp_val;
  wire [4:0] fpuOpt_io_dmem_resp_tag;
  wire [31:0] fpuOpt_io_dmem_resp_data;
  wire  fpuOpt_io_valid;
  wire  fpuOpt_io_fcsr_rdy;
  wire  fpuOpt_io_nack_mem;
  wire  fpuOpt_io_illegal_rm;
  wire  fpuOpt_io_killx;
  wire  fpuOpt_io_killm;
  wire  fpuOpt_io_dec_wen;
  wire  fpuOpt_io_dec_ren1;
  wire  fpuOpt_io_dec_ren2;
  wire  fpuOpt_io_dec_ren3;
  wire  fpuOpt_io_sboard_set;
  wire  fpuOpt_io_sboard_clr;
  wire [4:0] fpuOpt_io_sboard_clra;
  wire  dcacheArb_io_requestor_0_req_ready;
  wire  dcacheArb_io_requestor_0_req_valid;
  wire [31:0] dcacheArb_io_requestor_0_req_bits_addr;
  wire [5:0] dcacheArb_io_requestor_0_req_bits_tag;
  wire [4:0] dcacheArb_io_requestor_0_req_bits_cmd;
  wire [1:0] dcacheArb_io_requestor_0_req_bits_size;
  wire  dcacheArb_io_requestor_0_req_bits_signed;
  wire  dcacheArb_io_requestor_0_s1_kill;
  wire [31:0] dcacheArb_io_requestor_0_s1_data_data;
  wire  dcacheArb_io_requestor_0_s2_nack;
  wire  dcacheArb_io_requestor_0_resp_valid;
  wire [5:0] dcacheArb_io_requestor_0_resp_bits_tag;
  wire [31:0] dcacheArb_io_requestor_0_resp_bits_data;
  wire  dcacheArb_io_requestor_0_resp_bits_replay;
  wire  dcacheArb_io_requestor_0_resp_bits_has_data;
  wire [31:0] dcacheArb_io_requestor_0_resp_bits_data_word_bypass;
  wire  dcacheArb_io_requestor_0_replay_next;
  wire  dcacheArb_io_requestor_0_s2_xcpt_ma_ld;
  wire  dcacheArb_io_requestor_0_s2_xcpt_ma_st;
  wire  dcacheArb_io_requestor_0_s2_xcpt_pf_ld;
  wire  dcacheArb_io_requestor_0_s2_xcpt_pf_st;
  wire  dcacheArb_io_requestor_0_s2_xcpt_ae_ld;
  wire  dcacheArb_io_requestor_0_s2_xcpt_ae_st;
  wire  dcacheArb_io_requestor_0_ordered;
  wire  dcacheArb_io_requestor_0_perf_release;
  wire  dcacheArb_io_requestor_0_perf_grant;
  wire  dcacheArb_io_mem_req_ready;
  wire  dcacheArb_io_mem_req_valid;
  wire [31:0] dcacheArb_io_mem_req_bits_addr;
  wire [5:0] dcacheArb_io_mem_req_bits_tag;
  wire [4:0] dcacheArb_io_mem_req_bits_cmd;
  wire [1:0] dcacheArb_io_mem_req_bits_size;
  wire  dcacheArb_io_mem_req_bits_signed;
  wire  dcacheArb_io_mem_s1_kill;
  wire [31:0] dcacheArb_io_mem_s1_data_data;
  wire  dcacheArb_io_mem_s2_nack;
  wire  dcacheArb_io_mem_resp_valid;
  wire [5:0] dcacheArb_io_mem_resp_bits_tag;
  wire [31:0] dcacheArb_io_mem_resp_bits_data;
  wire  dcacheArb_io_mem_resp_bits_replay;
  wire  dcacheArb_io_mem_resp_bits_has_data;
  wire [31:0] dcacheArb_io_mem_resp_bits_data_word_bypass;
  wire  dcacheArb_io_mem_replay_next;
  wire  dcacheArb_io_mem_s2_xcpt_ma_ld;
  wire  dcacheArb_io_mem_s2_xcpt_ma_st;
  wire  dcacheArb_io_mem_s2_xcpt_pf_ld;
  wire  dcacheArb_io_mem_s2_xcpt_pf_st;
  wire  dcacheArb_io_mem_s2_xcpt_ae_ld;
  wire  dcacheArb_io_mem_s2_xcpt_ae_st;
  wire  dcacheArb_io_mem_ordered;
  wire  dcacheArb_io_mem_perf_release;
  wire  dcacheArb_io_mem_perf_grant;
  wire  ptw_clock;
  wire  ptw_reset;
  wire [31:0] ptw_io_requestor_1_customCSRs_csrs_0_value;
  wire  ptw_io_dpath_perf_l2hit;
  wire  ptw_io_dpath_perf_pte_miss;
  wire  ptw_io_dpath_perf_pte_hit;
  wire [31:0] ptw_io_dpath_customCSRs_csrs_0_value;
  wire  core_clock;
  wire  core_reset;
  wire  core_io_hartid;
  wire  core_io_interrupts_debug;
  wire  core_io_interrupts_mtip;
  wire  core_io_interrupts_msip;
  wire  core_io_interrupts_meip;
  wire  core_io_imem_might_request;
  wire  core_io_imem_req_valid;
  wire [31:0] core_io_imem_req_bits_pc;
  wire  core_io_imem_req_bits_speculative;
  wire  core_io_imem_resp_ready;
  wire  core_io_imem_resp_valid;
  wire  core_io_imem_resp_bits_btb_taken;
  wire  core_io_imem_resp_bits_btb_bridx;
  wire [4:0] core_io_imem_resp_bits_btb_entry;
  wire [7:0] core_io_imem_resp_bits_btb_bht_history;
  wire [31:0] core_io_imem_resp_bits_pc;
  wire [31:0] core_io_imem_resp_bits_data;
  wire  core_io_imem_resp_bits_xcpt_ae_inst;
  wire  core_io_imem_resp_bits_replay;
  wire  core_io_imem_btb_update_valid;
  wire [4:0] core_io_imem_btb_update_bits_prediction_entry;
  wire [31:0] core_io_imem_btb_update_bits_pc;
  wire  core_io_imem_btb_update_bits_isValid;
  wire [31:0] core_io_imem_btb_update_bits_br_pc;
  wire [1:0] core_io_imem_btb_update_bits_cfiType;
  wire  core_io_imem_bht_update_valid;
  wire [7:0] core_io_imem_bht_update_bits_prediction_history;
  wire [31:0] core_io_imem_bht_update_bits_pc;
  wire  core_io_imem_bht_update_bits_branch;
  wire  core_io_imem_bht_update_bits_taken;
  wire  core_io_imem_bht_update_bits_mispredict;
  wire  core_io_imem_flush_icache;
  wire  core_io_dmem_req_ready;
  wire  core_io_dmem_req_valid;
  wire [31:0] core_io_dmem_req_bits_addr;
  wire [5:0] core_io_dmem_req_bits_tag;
  wire [4:0] core_io_dmem_req_bits_cmd;
  wire [1:0] core_io_dmem_req_bits_size;
  wire  core_io_dmem_req_bits_signed;
  wire  core_io_dmem_req_bits_dv;
  wire  core_io_dmem_s1_kill;
  wire [31:0] core_io_dmem_s1_data_data;
  wire  core_io_dmem_s2_nack;
  wire  core_io_dmem_resp_valid;
  wire [5:0] core_io_dmem_resp_bits_tag;
  wire [31:0] core_io_dmem_resp_bits_data;
  wire  core_io_dmem_resp_bits_replay;
  wire  core_io_dmem_resp_bits_has_data;
  wire [31:0] core_io_dmem_resp_bits_data_word_bypass;
  wire  core_io_dmem_replay_next;
  wire  core_io_dmem_s2_xcpt_ma_ld;
  wire  core_io_dmem_s2_xcpt_ma_st;
  wire  core_io_dmem_s2_xcpt_pf_ld;
  wire  core_io_dmem_s2_xcpt_pf_st;
  wire  core_io_dmem_s2_xcpt_ae_ld;
  wire  core_io_dmem_s2_xcpt_ae_st;
  wire  core_io_dmem_ordered;
  wire  core_io_dmem_perf_release;
  wire  core_io_dmem_perf_grant;
  wire [31:0] core_io_ptw_customCSRs_csrs_0_value;
  wire [31:0] core_io_fpu_inst;
  wire [31:0] core_io_fpu_fromint_data;
  wire [2:0] core_io_fpu_fcsr_rm;
  wire  core_io_fpu_fcsr_flags_valid;
  wire [4:0] core_io_fpu_fcsr_flags_bits;
  wire [31:0] core_io_fpu_store_data;
  wire [31:0] core_io_fpu_toint_data;
  wire  core_io_fpu_dmem_resp_val;
  wire [4:0] core_io_fpu_dmem_resp_tag;
  wire [31:0] core_io_fpu_dmem_resp_data;
  wire  core_io_fpu_valid;
  wire  core_io_fpu_fcsr_rdy;
  wire  core_io_fpu_nack_mem;
  wire  core_io_fpu_illegal_rm;
  wire  core_io_fpu_killx;
  wire  core_io_fpu_killm;
  wire  core_io_fpu_dec_wen;
  wire  core_io_fpu_dec_ren1;
  wire  core_io_fpu_dec_ren2;
  wire  core_io_fpu_dec_ren3;
  wire  core_io_fpu_sboard_set;
  wire  core_io_fpu_sboard_clr;
  wire [4:0] core_io_fpu_sboard_clra;
  wire  core_io_rocc_cmd_valid;
  wire  core_io_wfi;
  reg  bundleOut_0_0_REG;
  TLXbar_7 tlMasterXbar (
    .clock(tlMasterXbar_clock),
    .reset(tlMasterXbar_reset),
    .auto_in_1_a_ready(tlMasterXbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(tlMasterXbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_address(tlMasterXbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_user_amba_prot_readalloc(tlMasterXbar_auto_in_1_a_bits_user_amba_prot_readalloc),
    .auto_in_1_a_bits_user_amba_prot_writealloc(tlMasterXbar_auto_in_1_a_bits_user_amba_prot_writealloc),
    .auto_in_1_d_valid(tlMasterXbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(tlMasterXbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_size(tlMasterXbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_data(tlMasterXbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(tlMasterXbar_auto_in_1_d_bits_corrupt),
    .auto_in_0_a_ready(tlMasterXbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(tlMasterXbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(tlMasterXbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(tlMasterXbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(tlMasterXbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(tlMasterXbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(tlMasterXbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_user_amba_prot_bufferable(tlMasterXbar_auto_in_0_a_bits_user_amba_prot_bufferable),
    .auto_in_0_a_bits_user_amba_prot_modifiable(tlMasterXbar_auto_in_0_a_bits_user_amba_prot_modifiable),
    .auto_in_0_a_bits_user_amba_prot_readalloc(tlMasterXbar_auto_in_0_a_bits_user_amba_prot_readalloc),
    .auto_in_0_a_bits_user_amba_prot_writealloc(tlMasterXbar_auto_in_0_a_bits_user_amba_prot_writealloc),
    .auto_in_0_a_bits_mask(tlMasterXbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(tlMasterXbar_auto_in_0_a_bits_data),
    .auto_in_0_c_ready(tlMasterXbar_auto_in_0_c_ready),
    .auto_in_0_c_valid(tlMasterXbar_auto_in_0_c_valid),
    .auto_in_0_c_bits_opcode(tlMasterXbar_auto_in_0_c_bits_opcode),
    .auto_in_0_c_bits_param(tlMasterXbar_auto_in_0_c_bits_param),
    .auto_in_0_c_bits_size(tlMasterXbar_auto_in_0_c_bits_size),
    .auto_in_0_c_bits_address(tlMasterXbar_auto_in_0_c_bits_address),
    .auto_in_0_c_bits_data(tlMasterXbar_auto_in_0_c_bits_data),
    .auto_in_0_d_ready(tlMasterXbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(tlMasterXbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(tlMasterXbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(tlMasterXbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(tlMasterXbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(tlMasterXbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(tlMasterXbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(tlMasterXbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(tlMasterXbar_auto_in_0_d_bits_data),
    .auto_in_0_e_ready(tlMasterXbar_auto_in_0_e_ready),
    .auto_in_0_e_valid(tlMasterXbar_auto_in_0_e_valid),
    .auto_in_0_e_bits_sink(tlMasterXbar_auto_in_0_e_bits_sink),
    .auto_out_a_ready(tlMasterXbar_auto_out_a_ready),
    .auto_out_a_valid(tlMasterXbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(tlMasterXbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(tlMasterXbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(tlMasterXbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(tlMasterXbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(tlMasterXbar_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(tlMasterXbar_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(tlMasterXbar_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(tlMasterXbar_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(tlMasterXbar_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(tlMasterXbar_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(tlMasterXbar_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(tlMasterXbar_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(tlMasterXbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(tlMasterXbar_auto_out_a_bits_data),
    .auto_out_c_ready(tlMasterXbar_auto_out_c_ready),
    .auto_out_c_valid(tlMasterXbar_auto_out_c_valid),
    .auto_out_c_bits_opcode(tlMasterXbar_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(tlMasterXbar_auto_out_c_bits_param),
    .auto_out_c_bits_size(tlMasterXbar_auto_out_c_bits_size),
    .auto_out_c_bits_address(tlMasterXbar_auto_out_c_bits_address),
    .auto_out_c_bits_data(tlMasterXbar_auto_out_c_bits_data),
    .auto_out_d_ready(tlMasterXbar_auto_out_d_ready),
    .auto_out_d_valid(tlMasterXbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(tlMasterXbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(tlMasterXbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(tlMasterXbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(tlMasterXbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(tlMasterXbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(tlMasterXbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(tlMasterXbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(tlMasterXbar_auto_out_d_bits_corrupt),
    .auto_out_e_ready(tlMasterXbar_auto_out_e_ready),
    .auto_out_e_valid(tlMasterXbar_auto_out_e_valid),
    .auto_out_e_bits_sink(tlMasterXbar_auto_out_e_bits_sink)
  );
  IntXbar_1 intXbar (
    .auto_int_in_2_0(intXbar_auto_int_in_2_0),
    .auto_int_in_1_0(intXbar_auto_int_in_1_0),
    .auto_int_in_1_1(intXbar_auto_int_in_1_1),
    .auto_int_in_0_0(intXbar_auto_int_in_0_0),
    .auto_int_out_0(intXbar_auto_int_out_0),
    .auto_int_out_1(intXbar_auto_int_out_1),
    .auto_int_out_2(intXbar_auto_int_out_2),
    .auto_int_out_3(intXbar_auto_int_out_3)
  );
  DCache dcache (
    .clock(dcache_clock),
    .reset(dcache_reset),
    .auto_out_a_ready(dcache_auto_out_a_ready),
    .auto_out_a_valid(dcache_auto_out_a_valid),
    .auto_out_a_bits_opcode(dcache_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dcache_auto_out_a_bits_param),
    .auto_out_a_bits_size(dcache_auto_out_a_bits_size),
    .auto_out_a_bits_source(dcache_auto_out_a_bits_source),
    .auto_out_a_bits_address(dcache_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(dcache_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(dcache_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(dcache_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(dcache_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_mask(dcache_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dcache_auto_out_a_bits_data),
    .auto_out_c_ready(dcache_auto_out_c_ready),
    .auto_out_c_valid(dcache_auto_out_c_valid),
    .auto_out_c_bits_opcode(dcache_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(dcache_auto_out_c_bits_param),
    .auto_out_c_bits_size(dcache_auto_out_c_bits_size),
    .auto_out_c_bits_address(dcache_auto_out_c_bits_address),
    .auto_out_c_bits_data(dcache_auto_out_c_bits_data),
    .auto_out_d_ready(dcache_auto_out_d_ready),
    .auto_out_d_valid(dcache_auto_out_d_valid),
    .auto_out_d_bits_opcode(dcache_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(dcache_auto_out_d_bits_param),
    .auto_out_d_bits_size(dcache_auto_out_d_bits_size),
    .auto_out_d_bits_source(dcache_auto_out_d_bits_source),
    .auto_out_d_bits_sink(dcache_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(dcache_auto_out_d_bits_denied),
    .auto_out_d_bits_data(dcache_auto_out_d_bits_data),
    .auto_out_e_ready(dcache_auto_out_e_ready),
    .auto_out_e_valid(dcache_auto_out_e_valid),
    .auto_out_e_bits_sink(dcache_auto_out_e_bits_sink),
    .io_cpu_req_ready(dcache_io_cpu_req_ready),
    .io_cpu_req_valid(dcache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(dcache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_tag(dcache_io_cpu_req_bits_tag),
    .io_cpu_req_bits_cmd(dcache_io_cpu_req_bits_cmd),
    .io_cpu_req_bits_size(dcache_io_cpu_req_bits_size),
    .io_cpu_req_bits_signed(dcache_io_cpu_req_bits_signed),
    .io_cpu_s1_kill(dcache_io_cpu_s1_kill),
    .io_cpu_s1_data_data(dcache_io_cpu_s1_data_data),
    .io_cpu_s1_data_mask(dcache_io_cpu_s1_data_mask),
    .io_cpu_s2_nack(dcache_io_cpu_s2_nack),
    .io_cpu_resp_valid(dcache_io_cpu_resp_valid),
    .io_cpu_resp_bits_addr(dcache_io_cpu_resp_bits_addr),
    .io_cpu_resp_bits_tag(dcache_io_cpu_resp_bits_tag),
    .io_cpu_resp_bits_cmd(dcache_io_cpu_resp_bits_cmd),
    .io_cpu_resp_bits_size(dcache_io_cpu_resp_bits_size),
    .io_cpu_resp_bits_signed(dcache_io_cpu_resp_bits_signed),
    .io_cpu_resp_bits_dprv(dcache_io_cpu_resp_bits_dprv),
    .io_cpu_resp_bits_dv(dcache_io_cpu_resp_bits_dv),
    .io_cpu_resp_bits_data(dcache_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_mask(dcache_io_cpu_resp_bits_mask),
    .io_cpu_resp_bits_replay(dcache_io_cpu_resp_bits_replay),
    .io_cpu_resp_bits_has_data(dcache_io_cpu_resp_bits_has_data),
    .io_cpu_resp_bits_data_word_bypass(dcache_io_cpu_resp_bits_data_word_bypass),
    .io_cpu_resp_bits_data_raw(dcache_io_cpu_resp_bits_data_raw),
    .io_cpu_resp_bits_store_data(dcache_io_cpu_resp_bits_store_data),
    .io_cpu_replay_next(dcache_io_cpu_replay_next),
    .io_cpu_s2_xcpt_ma_ld(dcache_io_cpu_s2_xcpt_ma_ld),
    .io_cpu_s2_xcpt_ma_st(dcache_io_cpu_s2_xcpt_ma_st),
    .io_cpu_s2_xcpt_pf_ld(dcache_io_cpu_s2_xcpt_pf_ld),
    .io_cpu_s2_xcpt_pf_st(dcache_io_cpu_s2_xcpt_pf_st),
    .io_cpu_s2_xcpt_gf_ld(dcache_io_cpu_s2_xcpt_gf_ld),
    .io_cpu_s2_xcpt_gf_st(dcache_io_cpu_s2_xcpt_gf_st),
    .io_cpu_s2_xcpt_ae_ld(dcache_io_cpu_s2_xcpt_ae_ld),
    .io_cpu_s2_xcpt_ae_st(dcache_io_cpu_s2_xcpt_ae_st),
    .io_cpu_ordered(dcache_io_cpu_ordered),
    .io_cpu_perf_release(dcache_io_cpu_perf_release),
    .io_cpu_perf_grant(dcache_io_cpu_perf_grant)
  );
  Frontend frontend (
    .clock(frontend_clock),
    .reset(frontend_reset),
    .auto_icache_master_out_a_ready(frontend_auto_icache_master_out_a_ready),
    .auto_icache_master_out_a_valid(frontend_auto_icache_master_out_a_valid),
    .auto_icache_master_out_a_bits_address(frontend_auto_icache_master_out_a_bits_address),
    .auto_icache_master_out_a_bits_user_amba_prot_readalloc(
      frontend_auto_icache_master_out_a_bits_user_amba_prot_readalloc),
    .auto_icache_master_out_a_bits_user_amba_prot_writealloc(
      frontend_auto_icache_master_out_a_bits_user_amba_prot_writealloc),
    .auto_icache_master_out_d_valid(frontend_auto_icache_master_out_d_valid),
    .auto_icache_master_out_d_bits_opcode(frontend_auto_icache_master_out_d_bits_opcode),
    .auto_icache_master_out_d_bits_size(frontend_auto_icache_master_out_d_bits_size),
    .auto_icache_master_out_d_bits_data(frontend_auto_icache_master_out_d_bits_data),
    .auto_icache_master_out_d_bits_corrupt(frontend_auto_icache_master_out_d_bits_corrupt),
    .io_cpu_might_request(frontend_io_cpu_might_request),
    .io_cpu_req_valid(frontend_io_cpu_req_valid),
    .io_cpu_req_bits_pc(frontend_io_cpu_req_bits_pc),
    .io_cpu_req_bits_speculative(frontend_io_cpu_req_bits_speculative),
    .io_cpu_resp_ready(frontend_io_cpu_resp_ready),
    .io_cpu_resp_valid(frontend_io_cpu_resp_valid),
    .io_cpu_resp_bits_btb_taken(frontend_io_cpu_resp_bits_btb_taken),
    .io_cpu_resp_bits_btb_bridx(frontend_io_cpu_resp_bits_btb_bridx),
    .io_cpu_resp_bits_btb_entry(frontend_io_cpu_resp_bits_btb_entry),
    .io_cpu_resp_bits_btb_bht_history(frontend_io_cpu_resp_bits_btb_bht_history),
    .io_cpu_resp_bits_pc(frontend_io_cpu_resp_bits_pc),
    .io_cpu_resp_bits_data(frontend_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_xcpt_ae_inst(frontend_io_cpu_resp_bits_xcpt_ae_inst),
    .io_cpu_resp_bits_replay(frontend_io_cpu_resp_bits_replay),
    .io_cpu_btb_update_valid(frontend_io_cpu_btb_update_valid),
    .io_cpu_btb_update_bits_prediction_entry(frontend_io_cpu_btb_update_bits_prediction_entry),
    .io_cpu_btb_update_bits_pc(frontend_io_cpu_btb_update_bits_pc),
    .io_cpu_btb_update_bits_isValid(frontend_io_cpu_btb_update_bits_isValid),
    .io_cpu_btb_update_bits_br_pc(frontend_io_cpu_btb_update_bits_br_pc),
    .io_cpu_btb_update_bits_cfiType(frontend_io_cpu_btb_update_bits_cfiType),
    .io_cpu_bht_update_valid(frontend_io_cpu_bht_update_valid),
    .io_cpu_bht_update_bits_prediction_history(frontend_io_cpu_bht_update_bits_prediction_history),
    .io_cpu_bht_update_bits_pc(frontend_io_cpu_bht_update_bits_pc),
    .io_cpu_bht_update_bits_branch(frontend_io_cpu_bht_update_bits_branch),
    .io_cpu_bht_update_bits_taken(frontend_io_cpu_bht_update_bits_taken),
    .io_cpu_bht_update_bits_mispredict(frontend_io_cpu_bht_update_bits_mispredict),
    .io_cpu_flush_icache(frontend_io_cpu_flush_icache),
    .io_cpu_npc(frontend_io_cpu_npc),
    .io_ptw_customCSRs_csrs_0_value(frontend_io_ptw_customCSRs_csrs_0_value)
  );
  FPU fpuOpt (
    .clock(fpuOpt_clock),
    .reset(fpuOpt_reset),
    .io_inst(fpuOpt_io_inst),
    .io_fromint_data(fpuOpt_io_fromint_data),
    .io_fcsr_rm(fpuOpt_io_fcsr_rm),
    .io_fcsr_flags_valid(fpuOpt_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(fpuOpt_io_fcsr_flags_bits),
    .io_store_data(fpuOpt_io_store_data),
    .io_toint_data(fpuOpt_io_toint_data),
    .io_dmem_resp_val(fpuOpt_io_dmem_resp_val),
    .io_dmem_resp_tag(fpuOpt_io_dmem_resp_tag),
    .io_dmem_resp_data(fpuOpt_io_dmem_resp_data),
    .io_valid(fpuOpt_io_valid),
    .io_fcsr_rdy(fpuOpt_io_fcsr_rdy),
    .io_nack_mem(fpuOpt_io_nack_mem),
    .io_illegal_rm(fpuOpt_io_illegal_rm),
    .io_killx(fpuOpt_io_killx),
    .io_killm(fpuOpt_io_killm),
    .io_dec_wen(fpuOpt_io_dec_wen),
    .io_dec_ren1(fpuOpt_io_dec_ren1),
    .io_dec_ren2(fpuOpt_io_dec_ren2),
    .io_dec_ren3(fpuOpt_io_dec_ren3),
    .io_sboard_set(fpuOpt_io_sboard_set),
    .io_sboard_clr(fpuOpt_io_sboard_clr),
    .io_sboard_clra(fpuOpt_io_sboard_clra)
  );
  HellaCacheArbiter dcacheArb (
    .io_requestor_0_req_ready(dcacheArb_io_requestor_0_req_ready),
    .io_requestor_0_req_valid(dcacheArb_io_requestor_0_req_valid),
    .io_requestor_0_req_bits_addr(dcacheArb_io_requestor_0_req_bits_addr),
    .io_requestor_0_req_bits_tag(dcacheArb_io_requestor_0_req_bits_tag),
    .io_requestor_0_req_bits_cmd(dcacheArb_io_requestor_0_req_bits_cmd),
    .io_requestor_0_req_bits_size(dcacheArb_io_requestor_0_req_bits_size),
    .io_requestor_0_req_bits_signed(dcacheArb_io_requestor_0_req_bits_signed),
    .io_requestor_0_s1_kill(dcacheArb_io_requestor_0_s1_kill),
    .io_requestor_0_s1_data_data(dcacheArb_io_requestor_0_s1_data_data),
    .io_requestor_0_s2_nack(dcacheArb_io_requestor_0_s2_nack),
    .io_requestor_0_resp_valid(dcacheArb_io_requestor_0_resp_valid),
    .io_requestor_0_resp_bits_tag(dcacheArb_io_requestor_0_resp_bits_tag),
    .io_requestor_0_resp_bits_data(dcacheArb_io_requestor_0_resp_bits_data),
    .io_requestor_0_resp_bits_replay(dcacheArb_io_requestor_0_resp_bits_replay),
    .io_requestor_0_resp_bits_has_data(dcacheArb_io_requestor_0_resp_bits_has_data),
    .io_requestor_0_resp_bits_data_word_bypass(dcacheArb_io_requestor_0_resp_bits_data_word_bypass),
    .io_requestor_0_replay_next(dcacheArb_io_requestor_0_replay_next),
    .io_requestor_0_s2_xcpt_ma_ld(dcacheArb_io_requestor_0_s2_xcpt_ma_ld),
    .io_requestor_0_s2_xcpt_ma_st(dcacheArb_io_requestor_0_s2_xcpt_ma_st),
    .io_requestor_0_s2_xcpt_pf_ld(dcacheArb_io_requestor_0_s2_xcpt_pf_ld),
    .io_requestor_0_s2_xcpt_pf_st(dcacheArb_io_requestor_0_s2_xcpt_pf_st),
    .io_requestor_0_s2_xcpt_ae_ld(dcacheArb_io_requestor_0_s2_xcpt_ae_ld),
    .io_requestor_0_s2_xcpt_ae_st(dcacheArb_io_requestor_0_s2_xcpt_ae_st),
    .io_requestor_0_ordered(dcacheArb_io_requestor_0_ordered),
    .io_requestor_0_perf_release(dcacheArb_io_requestor_0_perf_release),
    .io_requestor_0_perf_grant(dcacheArb_io_requestor_0_perf_grant),
    .io_mem_req_ready(dcacheArb_io_mem_req_ready),
    .io_mem_req_valid(dcacheArb_io_mem_req_valid),
    .io_mem_req_bits_addr(dcacheArb_io_mem_req_bits_addr),
    .io_mem_req_bits_tag(dcacheArb_io_mem_req_bits_tag),
    .io_mem_req_bits_cmd(dcacheArb_io_mem_req_bits_cmd),
    .io_mem_req_bits_size(dcacheArb_io_mem_req_bits_size),
    .io_mem_req_bits_signed(dcacheArb_io_mem_req_bits_signed),
    .io_mem_s1_kill(dcacheArb_io_mem_s1_kill),
    .io_mem_s1_data_data(dcacheArb_io_mem_s1_data_data),
    .io_mem_s2_nack(dcacheArb_io_mem_s2_nack),
    .io_mem_resp_valid(dcacheArb_io_mem_resp_valid),
    .io_mem_resp_bits_tag(dcacheArb_io_mem_resp_bits_tag),
    .io_mem_resp_bits_data(dcacheArb_io_mem_resp_bits_data),
    .io_mem_resp_bits_replay(dcacheArb_io_mem_resp_bits_replay),
    .io_mem_resp_bits_has_data(dcacheArb_io_mem_resp_bits_has_data),
    .io_mem_resp_bits_data_word_bypass(dcacheArb_io_mem_resp_bits_data_word_bypass),
    .io_mem_replay_next(dcacheArb_io_mem_replay_next),
    .io_mem_s2_xcpt_ma_ld(dcacheArb_io_mem_s2_xcpt_ma_ld),
    .io_mem_s2_xcpt_ma_st(dcacheArb_io_mem_s2_xcpt_ma_st),
    .io_mem_s2_xcpt_pf_ld(dcacheArb_io_mem_s2_xcpt_pf_ld),
    .io_mem_s2_xcpt_pf_st(dcacheArb_io_mem_s2_xcpt_pf_st),
    .io_mem_s2_xcpt_ae_ld(dcacheArb_io_mem_s2_xcpt_ae_ld),
    .io_mem_s2_xcpt_ae_st(dcacheArb_io_mem_s2_xcpt_ae_st),
    .io_mem_ordered(dcacheArb_io_mem_ordered),
    .io_mem_perf_release(dcacheArb_io_mem_perf_release),
    .io_mem_perf_grant(dcacheArb_io_mem_perf_grant)
  );
  PTW ptw (
    .clock(ptw_clock),
    .reset(ptw_reset),
    .io_requestor_1_customCSRs_csrs_0_value(ptw_io_requestor_1_customCSRs_csrs_0_value),
    .io_dpath_perf_l2hit(ptw_io_dpath_perf_l2hit),
    .io_dpath_perf_pte_miss(ptw_io_dpath_perf_pte_miss),
    .io_dpath_perf_pte_hit(ptw_io_dpath_perf_pte_hit),
    .io_dpath_customCSRs_csrs_0_value(ptw_io_dpath_customCSRs_csrs_0_value)
  );
  Rocket core (
    .clock(core_clock),
    .reset(core_reset),
    .io_hartid(core_io_hartid),
    .io_interrupts_debug(core_io_interrupts_debug),
    .io_interrupts_mtip(core_io_interrupts_mtip),
    .io_interrupts_msip(core_io_interrupts_msip),
    .io_interrupts_meip(core_io_interrupts_meip),
    .io_imem_might_request(core_io_imem_might_request),
    .io_imem_req_valid(core_io_imem_req_valid),
    .io_imem_req_bits_pc(core_io_imem_req_bits_pc),
    .io_imem_req_bits_speculative(core_io_imem_req_bits_speculative),
    .io_imem_resp_ready(core_io_imem_resp_ready),
    .io_imem_resp_valid(core_io_imem_resp_valid),
    .io_imem_resp_bits_btb_taken(core_io_imem_resp_bits_btb_taken),
    .io_imem_resp_bits_btb_bridx(core_io_imem_resp_bits_btb_bridx),
    .io_imem_resp_bits_btb_entry(core_io_imem_resp_bits_btb_entry),
    .io_imem_resp_bits_btb_bht_history(core_io_imem_resp_bits_btb_bht_history),
    .io_imem_resp_bits_pc(core_io_imem_resp_bits_pc),
    .io_imem_resp_bits_data(core_io_imem_resp_bits_data),
    .io_imem_resp_bits_xcpt_ae_inst(core_io_imem_resp_bits_xcpt_ae_inst),
    .io_imem_resp_bits_replay(core_io_imem_resp_bits_replay),
    .io_imem_btb_update_valid(core_io_imem_btb_update_valid),
    .io_imem_btb_update_bits_prediction_entry(core_io_imem_btb_update_bits_prediction_entry),
    .io_imem_btb_update_bits_pc(core_io_imem_btb_update_bits_pc),
    .io_imem_btb_update_bits_isValid(core_io_imem_btb_update_bits_isValid),
    .io_imem_btb_update_bits_br_pc(core_io_imem_btb_update_bits_br_pc),
    .io_imem_btb_update_bits_cfiType(core_io_imem_btb_update_bits_cfiType),
    .io_imem_bht_update_valid(core_io_imem_bht_update_valid),
    .io_imem_bht_update_bits_prediction_history(core_io_imem_bht_update_bits_prediction_history),
    .io_imem_bht_update_bits_pc(core_io_imem_bht_update_bits_pc),
    .io_imem_bht_update_bits_branch(core_io_imem_bht_update_bits_branch),
    .io_imem_bht_update_bits_taken(core_io_imem_bht_update_bits_taken),
    .io_imem_bht_update_bits_mispredict(core_io_imem_bht_update_bits_mispredict),
    .io_imem_flush_icache(core_io_imem_flush_icache),
    .io_dmem_req_ready(core_io_dmem_req_ready),
    .io_dmem_req_valid(core_io_dmem_req_valid),
    .io_dmem_req_bits_addr(core_io_dmem_req_bits_addr),
    .io_dmem_req_bits_tag(core_io_dmem_req_bits_tag),
    .io_dmem_req_bits_cmd(core_io_dmem_req_bits_cmd),
    .io_dmem_req_bits_size(core_io_dmem_req_bits_size),
    .io_dmem_req_bits_signed(core_io_dmem_req_bits_signed),
    .io_dmem_req_bits_dv(core_io_dmem_req_bits_dv),
    .io_dmem_s1_kill(core_io_dmem_s1_kill),
    .io_dmem_s1_data_data(core_io_dmem_s1_data_data),
    .io_dmem_s2_nack(core_io_dmem_s2_nack),
    .io_dmem_resp_valid(core_io_dmem_resp_valid),
    .io_dmem_resp_bits_tag(core_io_dmem_resp_bits_tag),
    .io_dmem_resp_bits_data(core_io_dmem_resp_bits_data),
    .io_dmem_resp_bits_replay(core_io_dmem_resp_bits_replay),
    .io_dmem_resp_bits_has_data(core_io_dmem_resp_bits_has_data),
    .io_dmem_resp_bits_data_word_bypass(core_io_dmem_resp_bits_data_word_bypass),
    .io_dmem_replay_next(core_io_dmem_replay_next),
    .io_dmem_s2_xcpt_ma_ld(core_io_dmem_s2_xcpt_ma_ld),
    .io_dmem_s2_xcpt_ma_st(core_io_dmem_s2_xcpt_ma_st),
    .io_dmem_s2_xcpt_pf_ld(core_io_dmem_s2_xcpt_pf_ld),
    .io_dmem_s2_xcpt_pf_st(core_io_dmem_s2_xcpt_pf_st),
    .io_dmem_s2_xcpt_ae_ld(core_io_dmem_s2_xcpt_ae_ld),
    .io_dmem_s2_xcpt_ae_st(core_io_dmem_s2_xcpt_ae_st),
    .io_dmem_ordered(core_io_dmem_ordered),
    .io_dmem_perf_release(core_io_dmem_perf_release),
    .io_dmem_perf_grant(core_io_dmem_perf_grant),
    .io_ptw_customCSRs_csrs_0_value(core_io_ptw_customCSRs_csrs_0_value),
    .io_fpu_inst(core_io_fpu_inst),
    .io_fpu_fromint_data(core_io_fpu_fromint_data),
    .io_fpu_fcsr_rm(core_io_fpu_fcsr_rm),
    .io_fpu_fcsr_flags_valid(core_io_fpu_fcsr_flags_valid),
    .io_fpu_fcsr_flags_bits(core_io_fpu_fcsr_flags_bits),
    .io_fpu_store_data(core_io_fpu_store_data),
    .io_fpu_toint_data(core_io_fpu_toint_data),
    .io_fpu_dmem_resp_val(core_io_fpu_dmem_resp_val),
    .io_fpu_dmem_resp_tag(core_io_fpu_dmem_resp_tag),
    .io_fpu_dmem_resp_data(core_io_fpu_dmem_resp_data),
    .io_fpu_valid(core_io_fpu_valid),
    .io_fpu_fcsr_rdy(core_io_fpu_fcsr_rdy),
    .io_fpu_nack_mem(core_io_fpu_nack_mem),
    .io_fpu_illegal_rm(core_io_fpu_illegal_rm),
    .io_fpu_killx(core_io_fpu_killx),
    .io_fpu_killm(core_io_fpu_killm),
    .io_fpu_dec_wen(core_io_fpu_dec_wen),
    .io_fpu_dec_ren1(core_io_fpu_dec_ren1),
    .io_fpu_dec_ren2(core_io_fpu_dec_ren2),
    .io_fpu_dec_ren3(core_io_fpu_dec_ren3),
    .io_fpu_sboard_set(core_io_fpu_sboard_set),
    .io_fpu_sboard_clr(core_io_fpu_sboard_clr),
    .io_fpu_sboard_clra(core_io_fpu_sboard_clra),
    .io_rocc_cmd_valid(core_io_rocc_cmd_valid),
    .io_wfi(core_io_wfi)
  );
  assign broadcast_auto_out = broadcast_auto_in;
  assign auto_wfi_out_0 = bundleOut_0_0_REG;
  assign auto_tl_other_masters_out_a_valid = tlMasterXbar_auto_out_a_valid;
  assign auto_tl_other_masters_out_a_bits_opcode = tlMasterXbar_auto_out_a_bits_opcode;
  assign auto_tl_other_masters_out_a_bits_param = tlMasterXbar_auto_out_a_bits_param;
  assign auto_tl_other_masters_out_a_bits_size = tlMasterXbar_auto_out_a_bits_size;
  assign auto_tl_other_masters_out_a_bits_source = tlMasterXbar_auto_out_a_bits_source;
  assign auto_tl_other_masters_out_a_bits_address = tlMasterXbar_auto_out_a_bits_address;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_bufferable =
    tlMasterXbar_auto_out_a_bits_user_amba_prot_bufferable;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_modifiable =
    tlMasterXbar_auto_out_a_bits_user_amba_prot_modifiable;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_readalloc =
    tlMasterXbar_auto_out_a_bits_user_amba_prot_readalloc;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_writealloc =
    tlMasterXbar_auto_out_a_bits_user_amba_prot_writealloc;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_privileged =
    tlMasterXbar_auto_out_a_bits_user_amba_prot_privileged;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_secure = tlMasterXbar_auto_out_a_bits_user_amba_prot_secure;
  assign auto_tl_other_masters_out_a_bits_user_amba_prot_fetch = tlMasterXbar_auto_out_a_bits_user_amba_prot_fetch;
  assign auto_tl_other_masters_out_a_bits_mask = tlMasterXbar_auto_out_a_bits_mask;
  assign auto_tl_other_masters_out_a_bits_data = tlMasterXbar_auto_out_a_bits_data;
  assign auto_tl_other_masters_out_c_valid = tlMasterXbar_auto_out_c_valid;
  assign auto_tl_other_masters_out_c_bits_opcode = tlMasterXbar_auto_out_c_bits_opcode;
  assign auto_tl_other_masters_out_c_bits_param = tlMasterXbar_auto_out_c_bits_param;
  assign auto_tl_other_masters_out_c_bits_size = tlMasterXbar_auto_out_c_bits_size;
  assign auto_tl_other_masters_out_c_bits_address = tlMasterXbar_auto_out_c_bits_address;
  assign auto_tl_other_masters_out_c_bits_data = tlMasterXbar_auto_out_c_bits_data;
  assign auto_tl_other_masters_out_d_ready = tlMasterXbar_auto_out_d_ready;
  assign auto_tl_other_masters_out_e_valid = tlMasterXbar_auto_out_e_valid;
  assign auto_tl_other_masters_out_e_bits_sink = tlMasterXbar_auto_out_e_bits_sink;
  assign tlMasterXbar_clock = clock;
  assign tlMasterXbar_reset = reset;
  assign tlMasterXbar_auto_in_1_a_valid = frontend_auto_icache_master_out_a_valid;
  assign tlMasterXbar_auto_in_1_a_bits_address = frontend_auto_icache_master_out_a_bits_address;
  assign tlMasterXbar_auto_in_1_a_bits_user_amba_prot_readalloc =
    frontend_auto_icache_master_out_a_bits_user_amba_prot_readalloc;
  assign tlMasterXbar_auto_in_1_a_bits_user_amba_prot_writealloc =
    frontend_auto_icache_master_out_a_bits_user_amba_prot_writealloc;
  assign tlMasterXbar_auto_in_0_a_valid = dcache_auto_out_a_valid;
  assign tlMasterXbar_auto_in_0_a_bits_opcode = dcache_auto_out_a_bits_opcode;
  assign tlMasterXbar_auto_in_0_a_bits_param = dcache_auto_out_a_bits_param;
  assign tlMasterXbar_auto_in_0_a_bits_size = dcache_auto_out_a_bits_size;
  assign tlMasterXbar_auto_in_0_a_bits_source = dcache_auto_out_a_bits_source;
  assign tlMasterXbar_auto_in_0_a_bits_address = dcache_auto_out_a_bits_address;
  assign tlMasterXbar_auto_in_0_a_bits_user_amba_prot_bufferable = dcache_auto_out_a_bits_user_amba_prot_bufferable;
  assign tlMasterXbar_auto_in_0_a_bits_user_amba_prot_modifiable = dcache_auto_out_a_bits_user_amba_prot_modifiable;
  assign tlMasterXbar_auto_in_0_a_bits_user_amba_prot_readalloc = dcache_auto_out_a_bits_user_amba_prot_readalloc;
  assign tlMasterXbar_auto_in_0_a_bits_user_amba_prot_writealloc = dcache_auto_out_a_bits_user_amba_prot_writealloc;
  assign tlMasterXbar_auto_in_0_a_bits_mask = dcache_auto_out_a_bits_mask;
  assign tlMasterXbar_auto_in_0_a_bits_data = dcache_auto_out_a_bits_data;
  assign tlMasterXbar_auto_in_0_c_valid = dcache_auto_out_c_valid;
  assign tlMasterXbar_auto_in_0_c_bits_opcode = dcache_auto_out_c_bits_opcode;
  assign tlMasterXbar_auto_in_0_c_bits_param = dcache_auto_out_c_bits_param;
  assign tlMasterXbar_auto_in_0_c_bits_size = dcache_auto_out_c_bits_size;
  assign tlMasterXbar_auto_in_0_c_bits_address = dcache_auto_out_c_bits_address;
  assign tlMasterXbar_auto_in_0_c_bits_data = dcache_auto_out_c_bits_data;
  assign tlMasterXbar_auto_in_0_d_ready = dcache_auto_out_d_ready;
  assign tlMasterXbar_auto_in_0_e_valid = dcache_auto_out_e_valid;
  assign tlMasterXbar_auto_in_0_e_bits_sink = dcache_auto_out_e_bits_sink;
  assign tlMasterXbar_auto_out_a_ready = auto_tl_other_masters_out_a_ready;
  assign tlMasterXbar_auto_out_c_ready = auto_tl_other_masters_out_c_ready;
  assign tlMasterXbar_auto_out_d_valid = auto_tl_other_masters_out_d_valid;
  assign tlMasterXbar_auto_out_d_bits_opcode = auto_tl_other_masters_out_d_bits_opcode;
  assign tlMasterXbar_auto_out_d_bits_param = auto_tl_other_masters_out_d_bits_param;
  assign tlMasterXbar_auto_out_d_bits_size = auto_tl_other_masters_out_d_bits_size;
  assign tlMasterXbar_auto_out_d_bits_source = auto_tl_other_masters_out_d_bits_source;
  assign tlMasterXbar_auto_out_d_bits_sink = auto_tl_other_masters_out_d_bits_sink;
  assign tlMasterXbar_auto_out_d_bits_denied = auto_tl_other_masters_out_d_bits_denied;
  assign tlMasterXbar_auto_out_d_bits_data = auto_tl_other_masters_out_d_bits_data;
  assign tlMasterXbar_auto_out_d_bits_corrupt = auto_tl_other_masters_out_d_bits_corrupt;
  assign tlMasterXbar_auto_out_e_ready = auto_tl_other_masters_out_e_ready;
  assign intXbar_auto_int_in_2_0 = auto_int_local_in_2_0;
  assign intXbar_auto_int_in_1_0 = auto_int_local_in_1_0;
  assign intXbar_auto_int_in_1_1 = auto_int_local_in_1_1;
  assign intXbar_auto_int_in_0_0 = auto_int_local_in_0_0;
  assign broadcast_auto_in = auto_hartid_in;
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_auto_out_a_ready = tlMasterXbar_auto_in_0_a_ready;
  assign dcache_auto_out_c_ready = tlMasterXbar_auto_in_0_c_ready;
  assign dcache_auto_out_d_valid = tlMasterXbar_auto_in_0_d_valid;
  assign dcache_auto_out_d_bits_opcode = tlMasterXbar_auto_in_0_d_bits_opcode;
  assign dcache_auto_out_d_bits_param = tlMasterXbar_auto_in_0_d_bits_param;
  assign dcache_auto_out_d_bits_size = tlMasterXbar_auto_in_0_d_bits_size;
  assign dcache_auto_out_d_bits_source = tlMasterXbar_auto_in_0_d_bits_source;
  assign dcache_auto_out_d_bits_sink = tlMasterXbar_auto_in_0_d_bits_sink;
  assign dcache_auto_out_d_bits_denied = tlMasterXbar_auto_in_0_d_bits_denied;
  assign dcache_auto_out_d_bits_data = tlMasterXbar_auto_in_0_d_bits_data;
  assign dcache_auto_out_e_ready = tlMasterXbar_auto_in_0_e_ready;
  assign dcache_io_cpu_req_valid = dcacheArb_io_mem_req_valid;
  assign dcache_io_cpu_req_bits_addr = dcacheArb_io_mem_req_bits_addr;
  assign dcache_io_cpu_req_bits_tag = dcacheArb_io_mem_req_bits_tag;
  assign dcache_io_cpu_req_bits_cmd = dcacheArb_io_mem_req_bits_cmd;
  assign dcache_io_cpu_req_bits_size = dcacheArb_io_mem_req_bits_size;
  assign dcache_io_cpu_req_bits_signed = dcacheArb_io_mem_req_bits_signed;
  assign dcache_io_cpu_s1_kill = dcacheArb_io_mem_s1_kill;
  assign dcache_io_cpu_s1_data_data = dcacheArb_io_mem_s1_data_data;
  assign dcache_io_cpu_s1_data_mask = 4'h0;
  assign frontend_clock = clock;
  assign frontend_reset = reset;
  assign frontend_auto_icache_master_out_a_ready = tlMasterXbar_auto_in_1_a_ready;
  assign frontend_auto_icache_master_out_d_valid = tlMasterXbar_auto_in_1_d_valid;
  assign frontend_auto_icache_master_out_d_bits_opcode = tlMasterXbar_auto_in_1_d_bits_opcode;
  assign frontend_auto_icache_master_out_d_bits_size = tlMasterXbar_auto_in_1_d_bits_size;
  assign frontend_auto_icache_master_out_d_bits_data = tlMasterXbar_auto_in_1_d_bits_data;
  assign frontend_auto_icache_master_out_d_bits_corrupt = tlMasterXbar_auto_in_1_d_bits_corrupt;
  assign frontend_io_cpu_might_request = core_io_imem_might_request;
  assign frontend_io_cpu_req_valid = core_io_imem_req_valid;
  assign frontend_io_cpu_req_bits_pc = core_io_imem_req_bits_pc;
  assign frontend_io_cpu_req_bits_speculative = core_io_imem_req_bits_speculative;
  assign frontend_io_cpu_resp_ready = core_io_imem_resp_ready;
  assign frontend_io_cpu_btb_update_valid = core_io_imem_btb_update_valid;
  assign frontend_io_cpu_btb_update_bits_prediction_entry = core_io_imem_btb_update_bits_prediction_entry;
  assign frontend_io_cpu_btb_update_bits_pc = core_io_imem_btb_update_bits_pc;
  assign frontend_io_cpu_btb_update_bits_isValid = core_io_imem_btb_update_bits_isValid;
  assign frontend_io_cpu_btb_update_bits_br_pc = core_io_imem_btb_update_bits_br_pc;
  assign frontend_io_cpu_btb_update_bits_cfiType = core_io_imem_btb_update_bits_cfiType;
  assign frontend_io_cpu_bht_update_valid = core_io_imem_bht_update_valid;
  assign frontend_io_cpu_bht_update_bits_prediction_history = core_io_imem_bht_update_bits_prediction_history;
  assign frontend_io_cpu_bht_update_bits_pc = core_io_imem_bht_update_bits_pc;
  assign frontend_io_cpu_bht_update_bits_branch = core_io_imem_bht_update_bits_branch;
  assign frontend_io_cpu_bht_update_bits_taken = core_io_imem_bht_update_bits_taken;
  assign frontend_io_cpu_bht_update_bits_mispredict = core_io_imem_bht_update_bits_mispredict;
  assign frontend_io_cpu_flush_icache = 0;
  assign frontend_io_ptw_customCSRs_csrs_0_value = ptw_io_requestor_1_customCSRs_csrs_0_value;
  assign fpuOpt_clock = clock;
  assign fpuOpt_reset = reset;
  assign fpuOpt_io_inst = core_io_fpu_inst;
  assign fpuOpt_io_fromint_data = core_io_fpu_fromint_data;
  assign fpuOpt_io_fcsr_rm = core_io_fpu_fcsr_rm;
  assign fpuOpt_io_dmem_resp_val = core_io_fpu_dmem_resp_val;
  assign fpuOpt_io_dmem_resp_tag = core_io_fpu_dmem_resp_tag;
  assign fpuOpt_io_dmem_resp_data = core_io_fpu_dmem_resp_data;
  assign fpuOpt_io_valid = core_io_fpu_valid;
  assign fpuOpt_io_killx = core_io_fpu_killx;
  assign fpuOpt_io_killm = core_io_fpu_killm;
  assign dcacheArb_io_requestor_0_req_valid = core_io_dmem_req_valid;
  assign dcacheArb_io_requestor_0_req_bits_addr = core_io_dmem_req_bits_addr;
  assign dcacheArb_io_requestor_0_req_bits_tag = core_io_dmem_req_bits_tag;
  assign dcacheArb_io_requestor_0_req_bits_cmd = core_io_dmem_req_bits_cmd;
  assign dcacheArb_io_requestor_0_req_bits_size = core_io_dmem_req_bits_size;
  assign dcacheArb_io_requestor_0_req_bits_signed = core_io_dmem_req_bits_signed;
  assign dcacheArb_io_requestor_0_s1_kill = core_io_dmem_s1_kill;
  assign dcacheArb_io_requestor_0_s1_data_data = core_io_dmem_s1_data_data;
  assign dcacheArb_io_mem_req_ready = dcache_io_cpu_req_ready;
  assign dcacheArb_io_mem_s2_nack = dcache_io_cpu_s2_nack;
  assign dcacheArb_io_mem_resp_valid = dcache_io_cpu_resp_valid;
  assign dcacheArb_io_mem_resp_bits_tag = dcache_io_cpu_resp_bits_tag;
  assign dcacheArb_io_mem_resp_bits_data = dcache_io_cpu_resp_bits_data;
  assign dcacheArb_io_mem_resp_bits_replay = dcache_io_cpu_resp_bits_replay;
  assign dcacheArb_io_mem_resp_bits_has_data = dcache_io_cpu_resp_bits_has_data;
  assign dcacheArb_io_mem_resp_bits_data_word_bypass = dcache_io_cpu_resp_bits_data_word_bypass;
  assign dcacheArb_io_mem_replay_next = dcache_io_cpu_replay_next;
  assign dcacheArb_io_mem_s2_xcpt_ma_ld = dcache_io_cpu_s2_xcpt_ma_ld;
  assign dcacheArb_io_mem_s2_xcpt_ma_st = dcache_io_cpu_s2_xcpt_ma_st;
  assign dcacheArb_io_mem_s2_xcpt_pf_ld = dcache_io_cpu_s2_xcpt_pf_ld;
  assign dcacheArb_io_mem_s2_xcpt_pf_st = dcache_io_cpu_s2_xcpt_pf_st;
  assign dcacheArb_io_mem_s2_xcpt_ae_ld = dcache_io_cpu_s2_xcpt_ae_ld;
  assign dcacheArb_io_mem_s2_xcpt_ae_st = dcache_io_cpu_s2_xcpt_ae_st;
  assign dcacheArb_io_mem_ordered = dcache_io_cpu_ordered;
  assign dcacheArb_io_mem_perf_release = dcache_io_cpu_perf_release;
  assign dcacheArb_io_mem_perf_grant = dcache_io_cpu_perf_grant;
  assign ptw_clock = clock;
  assign ptw_reset = reset;
  assign ptw_io_dpath_customCSRs_csrs_0_value = core_io_ptw_customCSRs_csrs_0_value;
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_hartid = broadcast_auto_out;
  assign core_io_interrupts_debug = intXbar_auto_int_out_0;
  assign core_io_interrupts_mtip = intXbar_auto_int_out_2;
  assign core_io_interrupts_msip = intXbar_auto_int_out_1;
  assign core_io_interrupts_meip = intXbar_auto_int_out_3;
  assign core_io_imem_resp_valid = frontend_io_cpu_resp_valid;
  assign core_io_imem_resp_bits_btb_taken = frontend_io_cpu_resp_bits_btb_taken;
  assign core_io_imem_resp_bits_btb_bridx = frontend_io_cpu_resp_bits_btb_bridx;
  assign core_io_imem_resp_bits_btb_entry = frontend_io_cpu_resp_bits_btb_entry;
  assign core_io_imem_resp_bits_btb_bht_history = frontend_io_cpu_resp_bits_btb_bht_history;
  assign core_io_imem_resp_bits_pc = frontend_io_cpu_resp_bits_pc;
  assign core_io_imem_resp_bits_data = frontend_io_cpu_resp_bits_data;
  assign core_io_imem_resp_bits_xcpt_ae_inst = frontend_io_cpu_resp_bits_xcpt_ae_inst;
  assign core_io_imem_resp_bits_replay = frontend_io_cpu_resp_bits_replay;
  assign core_io_dmem_req_ready = dcacheArb_io_requestor_0_req_ready;
  assign core_io_dmem_s2_nack = dcacheArb_io_requestor_0_s2_nack;
  assign core_io_dmem_resp_valid = dcacheArb_io_requestor_0_resp_valid;
  assign core_io_dmem_resp_bits_tag = dcacheArb_io_requestor_0_resp_bits_tag;
  assign core_io_dmem_resp_bits_data = dcacheArb_io_requestor_0_resp_bits_data;
  assign core_io_dmem_resp_bits_replay = dcacheArb_io_requestor_0_resp_bits_replay;
  assign core_io_dmem_resp_bits_has_data = dcacheArb_io_requestor_0_resp_bits_has_data;
  assign core_io_dmem_resp_bits_data_word_bypass = dcacheArb_io_requestor_0_resp_bits_data_word_bypass;
  assign core_io_dmem_replay_next = dcacheArb_io_requestor_0_replay_next;
  assign core_io_dmem_s2_xcpt_ma_ld = dcacheArb_io_requestor_0_s2_xcpt_ma_ld;
  assign core_io_dmem_s2_xcpt_ma_st = dcacheArb_io_requestor_0_s2_xcpt_ma_st;
  assign core_io_dmem_s2_xcpt_pf_ld = dcacheArb_io_requestor_0_s2_xcpt_pf_ld;
  assign core_io_dmem_s2_xcpt_pf_st = dcacheArb_io_requestor_0_s2_xcpt_pf_st;
  assign core_io_dmem_s2_xcpt_ae_ld = dcacheArb_io_requestor_0_s2_xcpt_ae_ld;
  assign core_io_dmem_s2_xcpt_ae_st = dcacheArb_io_requestor_0_s2_xcpt_ae_st;
  assign core_io_dmem_ordered = dcacheArb_io_requestor_0_ordered;
  assign core_io_dmem_perf_release = dcacheArb_io_requestor_0_perf_release;
  assign core_io_dmem_perf_grant = dcacheArb_io_requestor_0_perf_grant;
  assign core_io_fpu_fcsr_flags_valid = fpuOpt_io_fcsr_flags_valid;
  assign core_io_fpu_fcsr_flags_bits = fpuOpt_io_fcsr_flags_bits;
  assign core_io_fpu_store_data = fpuOpt_io_store_data;
  assign core_io_fpu_toint_data = fpuOpt_io_toint_data;
  assign core_io_fpu_fcsr_rdy = fpuOpt_io_fcsr_rdy;
  assign core_io_fpu_nack_mem = fpuOpt_io_nack_mem;
  assign core_io_fpu_illegal_rm = fpuOpt_io_illegal_rm;
  assign core_io_fpu_dec_wen = fpuOpt_io_dec_wen;
  assign core_io_fpu_dec_ren1 = fpuOpt_io_dec_ren1;
  assign core_io_fpu_dec_ren2 = fpuOpt_io_dec_ren2;
  assign core_io_fpu_dec_ren3 = fpuOpt_io_dec_ren3;
  assign core_io_fpu_sboard_set = fpuOpt_io_sboard_set;
  assign core_io_fpu_sboard_clr = fpuOpt_io_sboard_clr;
  assign core_io_fpu_sboard_clra = fpuOpt_io_sboard_clra;
  always @(posedge clock) begin
    if (reset) begin
      bundleOut_0_0_REG <= 1'h0;
    end else begin
      bundleOut_0_0_REG <= core_io_wfi;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  bundleOut_0_0_REG = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
