`default_nettype wire
`include "timescale.vh"
module DCache(
  input         clock,
  input         reset,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output        auto_out_a_bits_user_amba_prot_bufferable,
  output        auto_out_a_bits_user_amba_prot_modifiable,
  output        auto_out_a_bits_user_amba_prot_readalloc,
  output        auto_out_a_bits_user_amba_prot_writealloc,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [31:0] auto_out_c_bits_address,
  output [31:0] auto_out_c_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [2:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_e_ready,
  output        auto_out_e_valid,
  output [2:0]  auto_out_e_bits_sink,
  output        io_cpu_req_ready,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_addr,
  input  [5:0]  io_cpu_req_bits_tag,
  input  [4:0]  io_cpu_req_bits_cmd,
  input  [1:0]  io_cpu_req_bits_size,
  input         io_cpu_req_bits_signed,
  input         io_cpu_s1_kill,
  input  [31:0] io_cpu_s1_data_data,
  input  [3:0]  io_cpu_s1_data_mask,
  output        io_cpu_s2_nack,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_addr,
  output [5:0]  io_cpu_resp_bits_tag,
  output [4:0]  io_cpu_resp_bits_cmd,
  output [1:0]  io_cpu_resp_bits_size,
  output        io_cpu_resp_bits_signed,
  output [1:0]  io_cpu_resp_bits_dprv,
  output        io_cpu_resp_bits_dv,
  output [31:0] io_cpu_resp_bits_data,
  output [3:0]  io_cpu_resp_bits_mask,
  output        io_cpu_resp_bits_replay,
  output        io_cpu_resp_bits_has_data,
  output [31:0] io_cpu_resp_bits_data_word_bypass,
  output [31:0] io_cpu_resp_bits_data_raw,
  output [31:0] io_cpu_resp_bits_store_data,
  output        io_cpu_replay_next,
  output        io_cpu_s2_xcpt_ma_ld,
  output        io_cpu_s2_xcpt_ma_st,
  output        io_cpu_s2_xcpt_pf_ld,
  output        io_cpu_s2_xcpt_pf_st,
  output        io_cpu_s2_xcpt_gf_ld,
  output        io_cpu_s2_xcpt_gf_st,
  output        io_cpu_s2_xcpt_ae_ld,
  output        io_cpu_s2_xcpt_ae_st,
  output        io_cpu_ordered,
  output        io_cpu_perf_release,
  output        io_cpu_perf_grant
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
`endif // RANDOMIZE_REG_INIT
  wire  tlb_io_req_valid;
  wire [31:0] tlb_io_req_bits_vaddr;
  wire [1:0] tlb_io_req_bits_size;
  wire [4:0] tlb_io_req_bits_cmd;
  wire [31:0] tlb_io_resp_paddr;
  wire  tlb_io_resp_pf_ld;
  wire  tlb_io_resp_pf_st;
  wire  tlb_io_resp_ae_ld;
  wire  tlb_io_resp_ae_st;
  wire  tlb_io_resp_ma_ld;
  wire  tlb_io_resp_ma_st;
  wire  tlb_io_resp_cacheable;
  wire [19:0] tlb_vpn = tlb_io_req_bits_vaddr[31:12];
  wire [19:0] tlb__mpu_ppn_T_23 = tlb_io_req_bits_vaddr[31:12];
  wire [11:0] tlb__mpu_physaddr_T = tlb_io_req_bits_vaddr[11:0];
  wire [31:0] tlb_mpu_physaddr = {tlb__mpu_ppn_T_23,tlb__mpu_physaddr_T};
  wire [31:0] tlb__legal_address_T = tlb_mpu_physaddr ^ 32'h3000;
  wire [32:0] tlb__legal_address_T_1 = {1'b0,$signed(tlb__legal_address_T)};
  wire [32:0] tlb__legal_address_T_3 = $signed(tlb__legal_address_T_1) & -33'sh1000;
  wire  tlb__legal_address_T_4 = $signed(tlb__legal_address_T_3) == 33'sh0;
  wire [31:0] tlb__legal_address_T_5 = tlb_mpu_physaddr ^ 32'hc000000;
  wire [32:0] tlb__legal_address_T_6 = {1'b0,$signed(tlb__legal_address_T_5)};
  wire [32:0] tlb__legal_address_T_8 = $signed(tlb__legal_address_T_6) & -33'sh4000000;
  wire  tlb__legal_address_T_9 = $signed(tlb__legal_address_T_8) == 33'sh0;
  wire [31:0] tlb__legal_address_T_10 = tlb_mpu_physaddr ^ 32'h2000000;
  wire [32:0] tlb__legal_address_T_11 = {1'b0,$signed(tlb__legal_address_T_10)};
  wire [32:0] tlb__legal_address_T_13 = $signed(tlb__legal_address_T_11) & -33'sh10000;
  wire  tlb__legal_address_T_14 = $signed(tlb__legal_address_T_13) == 33'sh0;
  wire [32:0] tlb__legal_address_T_16 = {1'b0,$signed(tlb_mpu_physaddr)};
  wire [32:0] tlb__legal_address_T_18 = $signed(tlb__legal_address_T_16) & -33'sh1000;
  wire  tlb__legal_address_T_19 = $signed(tlb__legal_address_T_18) == 33'sh0;
  wire [31:0] tlb__legal_address_T_20 = tlb_mpu_physaddr ^ 32'h10000;
  wire [32:0] tlb__legal_address_T_21 = {1'b0,$signed(tlb__legal_address_T_20)};
  wire [32:0] tlb__legal_address_T_23 = $signed(tlb__legal_address_T_21) & -33'sh10000;
  wire  tlb__legal_address_T_24 = $signed(tlb__legal_address_T_23) == 33'sh0;
  wire [31:0] tlb__legal_address_T_25 = tlb_mpu_physaddr ^ 32'h10000000;
  wire [32:0] tlb__legal_address_T_26 = {1'b0,$signed(tlb__legal_address_T_25)};
  wire [32:0] tlb__legal_address_T_28 = $signed(tlb__legal_address_T_26) & -33'sh10000000;
  wire  tlb__legal_address_T_29 = $signed(tlb__legal_address_T_28) == 33'sh0;
  wire [31:0] tlb__legal_address_T_30 = tlb_mpu_physaddr ^ 32'h20000000;
  wire [32:0] tlb__legal_address_T_31 = {1'b0,$signed(tlb__legal_address_T_30)};
  wire [32:0] tlb__legal_address_T_33 = $signed(tlb__legal_address_T_31) & -33'sh20000000;
  wire  tlb__legal_address_T_34 = $signed(tlb__legal_address_T_33) == 33'sh0;
  wire [31:0] tlb__legal_address_T_35 = tlb_mpu_physaddr ^ 32'h40000000;
  wire [32:0] tlb__legal_address_T_36 = {1'b0,$signed(tlb__legal_address_T_35)};
  wire [32:0] tlb__legal_address_T_38 = $signed(tlb__legal_address_T_36) & -33'sh40000000;
  wire  tlb__legal_address_T_39 = $signed(tlb__legal_address_T_38) == 33'sh0;
  wire [31:0] tlb__legal_address_T_40 = tlb_mpu_physaddr ^ 32'h80000000;
  wire [32:0] tlb__legal_address_T_41 = {1'b0,$signed(tlb__legal_address_T_40)};
  wire [32:0] tlb__legal_address_T_43 = $signed(tlb__legal_address_T_41) & -33'sh40000000;
  wire  tlb__legal_address_T_44 = $signed(tlb__legal_address_T_43) == 33'sh0;
  wire  tlb__legal_address_T_45 = tlb__legal_address_T_29 | tlb__legal_address_T_34;
  wire  tlb__legal_address_T_46 = tlb__legal_address_T_45 | tlb__legal_address_T_39;
  wire  tlb__legal_address_T_47 = tlb__legal_address_T_46 | tlb__legal_address_T_44;
  wire [31:0] tlb__legal_address_T_48 = tlb_mpu_physaddr ^ 32'hc0000000;
  wire [32:0] tlb__legal_address_T_49 = {1'b0,$signed(tlb__legal_address_T_48)};
  wire [32:0] tlb__legal_address_T_51 = $signed(tlb__legal_address_T_49) & -33'sh40000000;
  wire  tlb__legal_address_T_52 = $signed(tlb__legal_address_T_51) == 33'sh0;
  wire  tlb__legal_address_T_53 = tlb__legal_address_T_4 | tlb__legal_address_T_9;
  wire  tlb__legal_address_T_54 = tlb__legal_address_T_53 | tlb__legal_address_T_14;
  wire  tlb__legal_address_T_55 = tlb__legal_address_T_54 | tlb__legal_address_T_19;
  wire  tlb__legal_address_T_56 = tlb__legal_address_T_55 | tlb__legal_address_T_24;
  wire  tlb__legal_address_T_57 = tlb__legal_address_T_56 | tlb__legal_address_T_47;
  wire  tlb_legal_address = tlb__legal_address_T_57 | tlb__legal_address_T_52;
  wire [32:0] tlb__cacheable_T_3 = $signed(tlb__legal_address_T_16) & 33'shf8010000;
  wire  tlb__cacheable_T_4 = $signed(tlb__cacheable_T_3) == 33'sh0;
  wire [31:0] tlb__cacheable_T_5 = tlb_mpu_physaddr ^ 32'h8000000;
  wire [32:0] tlb__cacheable_T_6 = {1'b0,$signed(tlb__cacheable_T_5)};
  wire [32:0] tlb__cacheable_T_8 = $signed(tlb__cacheable_T_6) & 33'shf8000000;
  wire  tlb__cacheable_T_9 = $signed(tlb__cacheable_T_8) == 33'sh0;
  wire [32:0] tlb__cacheable_T_13 = $signed(tlb__legal_address_T_49) & 33'shc0000000;
  wire  tlb__cacheable_T_14 = $signed(tlb__cacheable_T_13) == 33'sh0;
  wire  tlb__cacheable_T_15 = tlb__cacheable_T_4 | tlb__cacheable_T_9;
  wire [32:0] tlb__cacheable_T_20 = $signed(tlb__legal_address_T_21) & 33'shf8010000;
  wire  tlb__cacheable_T_21 = $signed(tlb__cacheable_T_20) == 33'sh0;
  wire [32:0] tlb__cacheable_T_25 = $signed(tlb__legal_address_T_26) & 33'shf0000000;
  wire  tlb__cacheable_T_26 = $signed(tlb__cacheable_T_25) == 33'sh0;
  wire [32:0] tlb__cacheable_T_30 = $signed(tlb__legal_address_T_31) & 33'she0000000;
  wire  tlb__cacheable_T_31 = $signed(tlb__cacheable_T_30) == 33'sh0;
  wire [32:0] tlb__cacheable_T_35 = $signed(tlb__legal_address_T_36) & 33'shc0000000;
  wire  tlb__cacheable_T_36 = $signed(tlb__cacheable_T_35) == 33'sh0;
  wire [32:0] tlb__cacheable_T_40 = $signed(tlb__legal_address_T_41) & 33'shc0000000;
  wire  tlb__cacheable_T_41 = $signed(tlb__cacheable_T_40) == 33'sh0;
  wire  tlb__cacheable_T_42 = tlb__cacheable_T_21 | tlb__cacheable_T_26;
  wire  tlb__cacheable_T_43 = tlb__cacheable_T_42 | tlb__cacheable_T_31;
  wire  tlb__cacheable_T_44 = tlb__cacheable_T_43 | tlb__cacheable_T_36;
  wire  tlb__cacheable_T_45 = tlb__cacheable_T_44 | tlb__cacheable_T_41;
  wire  tlb__cacheable_T_49 = tlb_legal_address & tlb__cacheable_T_45;
  wire  tlb__prot_r_T_6 = ~tlb__legal_address_T_19;
  wire  tlb__prot_r_T_7 = tlb_legal_address & tlb__prot_r_T_6;
  wire [32:0] tlb__prot_w_T_28 = $signed(tlb__legal_address_T_41) & 33'sh80000000;
  wire  tlb__prot_w_T_29 = $signed(tlb__prot_w_T_28) == 33'sh0;
  wire  tlb__prot_w_T_31 = tlb__cacheable_T_15 | tlb__cacheable_T_26;
  wire  tlb__prot_w_T_32 = tlb__prot_w_T_31 | tlb__cacheable_T_31;
  wire  tlb__prot_w_T_33 = tlb__prot_w_T_32 | tlb__cacheable_T_36;
  wire  tlb__prot_w_T_34 = tlb__prot_w_T_33 | tlb__prot_w_T_29;
  wire  tlb__prot_w_T_43 = tlb_legal_address & tlb__prot_w_T_34;
  wire  tlb__prot_w_T_45 = tlb__prot_w_T_43 & tlb__prot_r_T_6;
  wire [32:0] tlb__prot_eff_T_38 = $signed(tlb__legal_address_T_16) & 33'shfa012000;
  wire  tlb__prot_eff_T_39 = $signed(tlb__prot_eff_T_38) == 33'sh0;
  wire [32:0] tlb__prot_eff_T_43 = $signed(tlb__legal_address_T_11) & 33'shfa010000;
  wire  tlb__prot_eff_T_44 = $signed(tlb__prot_eff_T_43) == 33'sh0;
  wire  tlb__prot_eff_T_55 = tlb__prot_eff_T_39 | tlb__prot_eff_T_44;
  wire  tlb__prot_eff_T_56 = tlb__prot_eff_T_55 | tlb__cacheable_T_9;
  wire  tlb__prot_eff_T_57 = tlb__prot_eff_T_56 | tlb__cacheable_T_14;
  wire  tlb_prot_eff = tlb_legal_address & tlb__prot_eff_T_57;
  wire [1:0] tlb__pr_array_T_1 = tlb__prot_r_T_7 ? 2'h3 : 2'h0;
  wire [6:0] tlb__pr_array_T_3 = {tlb__pr_array_T_1,5'h0};
  wire [1:0] tlb__pw_array_T_1 = tlb__prot_w_T_45 ? 2'h3 : 2'h0;
  wire [6:0] tlb__pw_array_T_3 = {tlb__pw_array_T_1,5'h0};
  wire [1:0] tlb__eff_array_T_1 = tlb_prot_eff ? 2'h3 : 2'h0;
  wire [6:0] tlb_eff_array = {tlb__eff_array_T_1,5'h0};
  wire [1:0] tlb__c_array_T_1 = tlb__cacheable_T_49 ? 2'h3 : 2'h0;
  wire [6:0] tlb_c_array = {tlb__c_array_T_1,5'h0};
  wire [1:0] tlb__ppp_array_T_1 = tlb__prot_w_T_43 ? 2'h3 : 2'h0;
  wire [6:0] tlb_ppp_array = {tlb__ppp_array_T_1,5'h0};
  wire [6:0] tlb_ppp_array_if_cached = tlb_ppp_array | tlb_c_array;
  wire [3:0] tlb__misaligned_T = 4'h1 << tlb_io_req_bits_size;
  wire [3:0] tlb__misaligned_T_2 = tlb__misaligned_T - 4'h1;
  wire [31:0] _GEN_470 = {{28'd0}, tlb__misaligned_T_2};
  wire [31:0] tlb__misaligned_T_3 = tlb_io_req_bits_vaddr & _GEN_470;
  wire  tlb_misaligned = |tlb__misaligned_T_3;
  wire  tlb__cmd_lrsc_T = tlb_io_req_bits_cmd == 5'h6;
  wire  tlb__cmd_lrsc_T_1 = tlb_io_req_bits_cmd == 5'h7;
  wire  tlb__cmd_amo_logical_T = tlb_io_req_bits_cmd == 5'h4;
  wire  tlb__cmd_amo_logical_T_1 = tlb_io_req_bits_cmd == 5'h9;
  wire  tlb__cmd_amo_logical_T_2 = tlb_io_req_bits_cmd == 5'ha;
  wire  tlb__cmd_amo_logical_T_3 = tlb_io_req_bits_cmd == 5'hb;
  wire  tlb__cmd_amo_logical_T_4 = tlb__cmd_amo_logical_T | tlb__cmd_amo_logical_T_1;
  wire  tlb__cmd_amo_logical_T_5 = tlb__cmd_amo_logical_T_4 | tlb__cmd_amo_logical_T_2;
  wire  tlb__cmd_amo_logical_T_6 = tlb__cmd_amo_logical_T_5 | tlb__cmd_amo_logical_T_3;
  wire  tlb__cmd_amo_arithmetic_T = tlb_io_req_bits_cmd == 5'h8;
  wire  tlb__cmd_amo_arithmetic_T_1 = tlb_io_req_bits_cmd == 5'hc;
  wire  tlb__cmd_amo_arithmetic_T_2 = tlb_io_req_bits_cmd == 5'hd;
  wire  tlb__cmd_amo_arithmetic_T_3 = tlb_io_req_bits_cmd == 5'he;
  wire  tlb__cmd_amo_arithmetic_T_4 = tlb_io_req_bits_cmd == 5'hf;
  wire  tlb__cmd_amo_arithmetic_T_5 = tlb__cmd_amo_arithmetic_T | tlb__cmd_amo_arithmetic_T_1;
  wire  tlb__cmd_amo_arithmetic_T_6 = tlb__cmd_amo_arithmetic_T_5 | tlb__cmd_amo_arithmetic_T_2;
  wire  tlb__cmd_amo_arithmetic_T_7 = tlb__cmd_amo_arithmetic_T_6 | tlb__cmd_amo_arithmetic_T_3;
  wire  tlb__cmd_amo_arithmetic_T_8 = tlb__cmd_amo_arithmetic_T_7 | tlb__cmd_amo_arithmetic_T_4;
  wire  tlb_cmd_put_partial = tlb_io_req_bits_cmd == 5'h11;
  wire  tlb__cmd_read_T = tlb_io_req_bits_cmd == 5'h0;
  wire  tlb__cmd_read_T_1 = tlb_io_req_bits_cmd == 5'h10;
  wire  tlb__cmd_read_T_4 = tlb__cmd_read_T | tlb__cmd_read_T_1;
  wire  tlb__cmd_read_T_5 = tlb__cmd_read_T_4 | tlb__cmd_lrsc_T;
  wire  tlb__cmd_read_T_6 = tlb__cmd_read_T_5 | tlb__cmd_lrsc_T_1;
  wire  tlb__cmd_read_T_23 = tlb__cmd_amo_logical_T_6 | tlb__cmd_amo_arithmetic_T_8;
  wire  tlb_cmd_read = tlb__cmd_read_T_6 | tlb__cmd_read_T_23;
  wire  tlb__cmd_write_T = tlb_io_req_bits_cmd == 5'h1;
  wire  tlb__cmd_write_T_2 = tlb__cmd_write_T | tlb_cmd_put_partial;
  wire  tlb__cmd_write_T_4 = tlb__cmd_write_T_2 | tlb__cmd_lrsc_T_1;
  wire  tlb_cmd_write = tlb__cmd_write_T_4 | tlb__cmd_read_T_23;
  wire  tlb__cmd_write_perms_T = tlb_io_req_bits_cmd == 5'h5;
  wire  tlb__cmd_write_perms_T_1 = tlb_io_req_bits_cmd == 5'h17;
  wire  tlb__cmd_write_perms_T_2 = tlb__cmd_write_perms_T | tlb__cmd_write_perms_T_1;
  wire  tlb_cmd_write_perms = tlb_cmd_write | tlb__cmd_write_perms_T_2;
  wire [6:0] tlb__ae_array_T = tlb_misaligned ? tlb_eff_array : 7'h0;
  wire [6:0] tlb__ae_ld_array_T = ~tlb__pr_array_T_3;
  wire [6:0] tlb__ae_ld_array_T_1 = tlb__ae_array_T | tlb__ae_ld_array_T;
  wire [6:0] tlb_ae_ld_array = tlb_cmd_read ? tlb__ae_ld_array_T_1 : 7'h0;
  wire [6:0] tlb__ae_st_array_T = ~tlb__pw_array_T_3;
  wire [6:0] tlb__ae_st_array_T_1 = tlb__ae_array_T | tlb__ae_st_array_T;
  wire [6:0] tlb__ae_st_array_T_2 = tlb_cmd_write_perms ? tlb__ae_st_array_T_1 : 7'h0;
  wire [6:0] tlb__ae_st_array_T_3 = ~tlb_ppp_array_if_cached;
  wire [6:0] tlb__ae_st_array_T_4 = tlb_cmd_put_partial ? tlb__ae_st_array_T_3 : 7'h0;
  wire [6:0] tlb__ae_st_array_T_5 = tlb__ae_st_array_T_2 | tlb__ae_st_array_T_4;
  wire [6:0] tlb_pf_ld_array = tlb_cmd_read ? 7'h3f : 7'h0;
  wire [6:0] tlb_pf_st_array = tlb_cmd_write_perms ? 7'h3f : 7'h0;
  wire [6:0] tlb__io_resp_pf_ld_T_1 = tlb_pf_ld_array & 7'h40;
  wire [6:0] tlb__io_resp_pf_st_T_1 = tlb_pf_st_array & 7'h40;
  wire [6:0] tlb__io_resp_ae_ld_T = tlb_ae_ld_array & 7'h40;
  wire [6:0] tlb__io_resp_ae_st_T = tlb__ae_st_array_T_5 & 7'h40;
  wire [6:0] tlb__io_resp_cacheable_T = tlb_c_array & 7'h40;
  wire  lfsr_prng_clock;
  wire  lfsr_prng_reset;
  wire  lfsr_prng_io_increment;
  wire  lfsr_prng_io_out_0;
  wire  lfsr_prng_io_out_1;
  wire  lfsr_prng_io_out_2;
  wire  lfsr_prng_io_out_3;
  wire  lfsr_prng_io_out_4;
  wire  lfsr_prng_io_out_5;
  wire  lfsr_prng_io_out_6;
  wire  lfsr_prng_io_out_7;
  wire  lfsr_prng_io_out_8;
  wire  lfsr_prng_io_out_9;
  wire  lfsr_prng_io_out_10;
  wire  lfsr_prng_io_out_11;
  wire  lfsr_prng_io_out_12;
  wire  lfsr_prng_io_out_13;
  wire  lfsr_prng_io_out_14;
  wire  lfsr_prng_io_out_15;
  wire  metaArb_io_in_0_valid;
  wire [31:0] metaArb_io_in_0_bits_addr;
  wire [5:0] metaArb_io_in_0_bits_idx;
  wire  metaArb_io_in_2_valid;
  wire [31:0] metaArb_io_in_2_bits_addr;
  wire [5:0] metaArb_io_in_2_bits_idx;
  wire [3:0] metaArb_io_in_2_bits_way_en;
  wire [21:0] metaArb_io_in_2_bits_data;
  wire  metaArb_io_in_3_valid;
  wire [31:0] metaArb_io_in_3_bits_addr;
  wire [5:0] metaArb_io_in_3_bits_idx;
  wire [3:0] metaArb_io_in_3_bits_way_en;
  wire [21:0] metaArb_io_in_3_bits_data;
  wire  metaArb_io_in_4_ready;
  wire  metaArb_io_in_4_valid;
  wire [31:0] metaArb_io_in_4_bits_addr;
  wire [5:0] metaArb_io_in_4_bits_idx;
  wire [3:0] metaArb_io_in_4_bits_way_en;
  wire [21:0] metaArb_io_in_4_bits_data;
  wire  metaArb_io_in_5_ready;
  wire  metaArb_io_in_5_valid;
  wire [31:0] metaArb_io_in_5_bits_addr;
  wire [5:0] metaArb_io_in_5_bits_idx;
  wire [3:0] metaArb_io_in_5_bits_way_en;
  wire [21:0] metaArb_io_in_5_bits_data;
  wire  metaArb_io_in_6_ready;
  wire  metaArb_io_in_6_valid;
  wire [31:0] metaArb_io_in_6_bits_addr;
  wire [5:0] metaArb_io_in_6_bits_idx;
  wire [3:0] metaArb_io_in_6_bits_way_en;
  wire [21:0] metaArb_io_in_6_bits_data;
  wire  metaArb_io_in_7_ready;
  wire  metaArb_io_in_7_valid;
  wire [31:0] metaArb_io_in_7_bits_addr;
  wire [5:0] metaArb_io_in_7_bits_idx;
  wire [3:0] metaArb_io_in_7_bits_way_en;
  wire [21:0] metaArb_io_in_7_bits_data;
  wire  metaArb_io_out_valid;
  wire  metaArb_io_out_bits_write;
  wire [31:0] metaArb_io_out_bits_addr;
  wire [5:0] metaArb_io_out_bits_idx;
  wire [3:0] metaArb_io_out_bits_way_en;
  wire [21:0] metaArb_io_out_bits_data;
  wire [31:0] metaArb__GEN_2 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_addr : metaArb_io_in_7_bits_addr;
  wire [5:0] metaArb__GEN_3 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_idx : metaArb_io_in_7_bits_idx;
  wire [3:0] metaArb__GEN_4 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_way_en : metaArb_io_in_7_bits_way_en;
  wire [21:0] metaArb__GEN_5 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_data : metaArb_io_in_7_bits_data;
  wire [31:0] metaArb__GEN_8 = metaArb_io_in_5_valid ? metaArb_io_in_5_bits_addr : metaArb__GEN_2;
  wire [5:0] metaArb__GEN_9 = metaArb_io_in_5_valid ? metaArb_io_in_5_bits_idx : metaArb__GEN_3;
  wire [3:0] metaArb__GEN_10 = metaArb_io_in_5_valid ? metaArb_io_in_5_bits_way_en : metaArb__GEN_4;
  wire [21:0] metaArb__GEN_11 = metaArb_io_in_5_valid ? metaArb_io_in_5_bits_data : metaArb__GEN_5;
  wire [31:0] metaArb__GEN_14 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_addr : metaArb__GEN_8;
  wire [5:0] metaArb__GEN_15 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_idx : metaArb__GEN_9;
  wire [3:0] metaArb__GEN_16 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_way_en : metaArb__GEN_10;
  wire [21:0] metaArb__GEN_17 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_data : metaArb__GEN_11;
  wire  metaArb__GEN_19 = metaArb_io_in_3_valid | metaArb_io_in_4_valid;
  wire [31:0] metaArb__GEN_20 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_addr : metaArb__GEN_14;
  wire [5:0] metaArb__GEN_21 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_idx : metaArb__GEN_15;
  wire [3:0] metaArb__GEN_22 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_way_en : metaArb__GEN_16;
  wire [21:0] metaArb__GEN_23 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_data : metaArb__GEN_17;
  wire  metaArb__GEN_25 = metaArb_io_in_2_valid | metaArb__GEN_19;
  wire [31:0] metaArb__GEN_26 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_addr : metaArb__GEN_20;
  wire [5:0] metaArb__GEN_27 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_idx : metaArb__GEN_21;
  wire [3:0] metaArb__GEN_28 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_way_en : metaArb__GEN_22;
  wire [21:0] metaArb__GEN_29 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_data : metaArb__GEN_23;
  wire  metaArb__grant_T_1 = metaArb_io_in_0_valid | metaArb_io_in_2_valid;
  wire  metaArb__grant_T_2 = metaArb__grant_T_1 | metaArb_io_in_3_valid;
  wire  metaArb__grant_T_3 = metaArb__grant_T_2 | metaArb_io_in_4_valid;
  wire  metaArb__grant_T_4 = metaArb__grant_T_3 | metaArb_io_in_5_valid;
  wire  metaArb__grant_T_5 = metaArb__grant_T_4 | metaArb_io_in_6_valid;
  wire  metaArb_grant_7 = ~metaArb__grant_T_5;
  wire  metaArb__io_out_valid_T = ~metaArb_grant_7;
  wire [5:0] tag_array_RW0_addr;
  wire  tag_array_RW0_en;
  wire  tag_array_RW0_clk;
  wire  tag_array_RW0_wmode;
  wire [21:0] tag_array_RW0_wdata_0;
  wire [21:0] tag_array_RW0_wdata_1;
  wire [21:0] tag_array_RW0_wdata_2;
  wire [21:0] tag_array_RW0_wdata_3;
  wire [21:0] tag_array_RW0_rdata_0;
  wire [21:0] tag_array_RW0_rdata_1;
  wire [21:0] tag_array_RW0_rdata_2;
  wire [21:0] tag_array_RW0_rdata_3;
  wire  tag_array_RW0_wmask_0;
  wire  tag_array_RW0_wmask_1;
  wire  tag_array_RW0_wmask_2;
  wire  tag_array_RW0_wmask_3;
  wire  data_clock;
  wire  data_io_req_valid;
  wire [11:0] data_io_req_bits_addr;
  wire  data_io_req_bits_write;
  wire [31:0] data_io_req_bits_wdata;
  wire [3:0] data_io_req_bits_eccMask;
  wire [3:0] data_io_req_bits_way_en;
  wire [31:0] data_io_resp_0;
  wire [31:0] data_io_resp_1;
  wire [31:0] data_io_resp_2;
  wire [31:0] data_io_resp_3;
  wire  dataArb_io_in_0_valid;
  wire [11:0] dataArb_io_in_0_bits_addr;
  wire  dataArb_io_in_0_bits_write;
  wire [31:0] dataArb_io_in_0_bits_wdata;
  wire [3:0] dataArb_io_in_0_bits_eccMask;
  wire [3:0] dataArb_io_in_0_bits_way_en;
  wire  dataArb_io_in_1_ready;
  wire  dataArb_io_in_1_valid;
  wire [11:0] dataArb_io_in_1_bits_addr;
  wire  dataArb_io_in_1_bits_write;
  wire [31:0] dataArb_io_in_1_bits_wdata;
  wire [3:0] dataArb_io_in_1_bits_way_en;
  wire  dataArb_io_in_2_ready;
  wire  dataArb_io_in_2_valid;
  wire [11:0] dataArb_io_in_2_bits_addr;
  wire [31:0] dataArb_io_in_2_bits_wdata;
  wire  dataArb_io_in_3_ready;
  wire  dataArb_io_in_3_valid;
  wire [11:0] dataArb_io_in_3_bits_addr;
  wire [31:0] dataArb_io_in_3_bits_wdata;
  wire  dataArb_io_out_valid;
  wire [11:0] dataArb_io_out_bits_addr;
  wire  dataArb_io_out_bits_write;
  wire [31:0] dataArb_io_out_bits_wdata;
  wire [3:0] dataArb_io_out_bits_eccMask;
  wire [3:0] dataArb_io_out_bits_way_en;
  wire [11:0] dataArb__GEN_1 = dataArb_io_in_2_valid ? dataArb_io_in_2_bits_addr : dataArb_io_in_3_bits_addr;
  wire [31:0] dataArb__GEN_3 = dataArb_io_in_2_valid ? dataArb_io_in_2_bits_wdata : dataArb_io_in_3_bits_wdata;
  wire [11:0] dataArb__GEN_8 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_addr : dataArb__GEN_1;
  wire  dataArb__GEN_9 = dataArb_io_in_1_valid & dataArb_io_in_1_bits_write;
  wire [31:0] dataArb__GEN_10 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_wdata : dataArb__GEN_3;
  wire [3:0] dataArb__GEN_13 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_way_en : 4'hf;
  wire  dataArb__grant_T = dataArb_io_in_0_valid | dataArb_io_in_1_valid;
  wire  dataArb__grant_T_1 = dataArb__grant_T | dataArb_io_in_2_valid;
  wire  dataArb_grant_3 = ~dataArb__grant_T_1;
  wire  dataArb__io_out_valid_T = ~dataArb_grant_3;
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0};
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo};
  wire  s1_valid_x12 = io_cpu_req_ready & io_cpu_req_valid;
  reg  s1_valid;
  reg  s1_probe;
  reg  s2_probe;
  reg [3:0] release_state;
  wire  releaseInFlight = s1_probe | s2_probe | release_state != 4'h0;
  reg  release_ack_wait;
  reg [31:0] release_ack_addr;
  reg  s2_valid;
  reg [31:0] probe_bits_address;
  wire  s1_valid_masked = s1_valid & ~io_cpu_s1_kill;
  reg [1:0] s2_probe_state_state;
  wire [3:0] _T_138 = {2'h0,s2_probe_state_state};
  wire  _T_195 = 4'h3 == _T_138;
  wire  _T_191 = 4'h2 == _T_138;
  wire  _T_187 = 4'h1 == _T_138;
  wire  _T_183 = 4'h0 == _T_138;
  wire  _T_179 = 4'h7 == _T_138;
  wire  _T_175 = 4'h6 == _T_138;
  wire  _T_171 = 4'h5 == _T_138;
  wire  _T_167 = 4'h4 == _T_138;
  wire  _T_163 = 4'hb == _T_138;
  wire  _T_159 = 4'ha == _T_138;
  wire  _T_155 = 4'h9 == _T_138;
  wire  _T_151 = 4'h8 == _T_138;
  wire  _T_168 = _T_167 ? 1'h0 : _T_163;
  wire  _T_172 = _T_171 ? 1'h0 : _T_168;
  wire  _T_176 = _T_175 ? 1'h0 : _T_172;
  wire  _T_184 = _T_183 ? 1'h0 : _T_179 | _T_176;
  wire  _T_188 = _T_187 ? 1'h0 : _T_184;
  wire  _T_192 = _T_191 ? 1'h0 : _T_188;
  wire  s2_prb_ack_data = _T_195 | _T_192;
  wire  _T_324 = s2_probe_state_state > 2'h0;
  reg [9:0] counter_1;
  wire  _T_329 = release_state == 4'h1;
  wire  _T_330 = release_state == 4'h6;
  wire  _T_331 = release_state == 4'h9;
  wire  _T_333 = _T_329 | _T_330 | _T_331;
  wire [2:0] _GEN_388 = _T_331 ? 3'h6 : 3'h7;
  wire  _T_328 = release_state == 4'h2;
  wire [2:0] _GEN_373 = release_state == 4'h2 ? 3'h5 : 3'h4;
  wire [2:0] tl_out__c_bits_opcode = _T_333 ? _GEN_388 : _GEN_373;
  wire  beats1_opdata_1 = tl_out__c_bits_opcode[0];
  wire [3:0] tl_out__c_bits_size = _T_333 ? 4'h6 : 4'h0;
  wire [26:0] _beats1_decode_T_5 = 27'hfff << tl_out__c_bits_size;
  wire [11:0] _beats1_decode_T_7 = ~_beats1_decode_T_5[11:0];
  wire [9:0] beats1_decode_1 = _beats1_decode_T_7[11:2];
  wire [9:0] beats1_1 = beats1_opdata_1 ? beats1_decode_1 : 10'h0;
  wire  c_last = counter_1 == 10'h1 | beats1_1 == 10'h0;
  reg  s2_release_data_valid;
  wire  c_first = counter_1 == 10'h0;
  wire  _GEN_294 = s2_prb_ack_data ? s2_release_data_valid & ~(c_first & release_ack_wait) : 1'h1;
  wire  _GEN_329 = s2_probe ? _GEN_294 : s2_release_data_valid & ~(c_first & release_ack_wait);
  wire  _GEN_353 = release_state == 4'h5 | _GEN_329;
  wire  tl_out__c_valid = release_state == 4'h3 | _GEN_353;
  wire  _T_318 = auto_out_c_ready & tl_out__c_valid;
  wire  releaseDone = c_last & _T_318;
  wire  _GEN_292 = _T_324 | ~releaseDone;
  wire  probeNack = s2_prb_ack_data | _GEN_292;
  reg [4:0] s1_req_cmd;
  wire  _s1_read_T = s1_req_cmd == 5'h0;
  wire  _s1_read_T_1 = s1_req_cmd == 5'h10;
  wire  _s1_read_T_2 = s1_req_cmd == 5'h6;
  wire  _s1_read_T_3 = s1_req_cmd == 5'h7;
  wire  _s1_read_T_6 = _s1_read_T | _s1_read_T_1 | _s1_read_T_2 | _s1_read_T_3;
  wire  _s1_read_T_7 = s1_req_cmd == 5'h4;
  wire  _s1_read_T_8 = s1_req_cmd == 5'h9;
  wire  _s1_read_T_9 = s1_req_cmd == 5'ha;
  wire  _s1_read_T_10 = s1_req_cmd == 5'hb;
  wire  _s1_read_T_13 = _s1_read_T_7 | _s1_read_T_8 | _s1_read_T_9 | _s1_read_T_10;
  wire  _s1_read_T_14 = s1_req_cmd == 5'h8;
  wire  _s1_read_T_15 = s1_req_cmd == 5'hc;
  wire  _s1_read_T_16 = s1_req_cmd == 5'hd;
  wire  _s1_read_T_17 = s1_req_cmd == 5'he;
  wire  _s1_read_T_18 = s1_req_cmd == 5'hf;
  wire  _s1_read_T_22 = _s1_read_T_14 | _s1_read_T_15 | _s1_read_T_16 | _s1_read_T_17 | _s1_read_T_18;
  wire  _s1_read_T_23 = _s1_read_T_13 | _s1_read_T_22;
  wire  s1_read = _s1_read_T_6 | _s1_read_T_23;
  reg [4:0] s2_req_cmd;
  wire  _s2_write_T_1 = s2_req_cmd == 5'h11;
  wire  _s2_write_T_3 = s2_req_cmd == 5'h7;
  wire  _s2_write_T_5 = s2_req_cmd == 5'h4;
  wire  _s2_write_T_6 = s2_req_cmd == 5'h9;
  wire  _s2_write_T_7 = s2_req_cmd == 5'ha;
  wire  _s2_write_T_8 = s2_req_cmd == 5'hb;
  wire  _s2_write_T_11 = _s2_write_T_5 | _s2_write_T_6 | _s2_write_T_7 | _s2_write_T_8;
  wire  _s2_write_T_12 = s2_req_cmd == 5'h8;
  wire  _s2_write_T_13 = s2_req_cmd == 5'hc;
  wire  _s2_write_T_14 = s2_req_cmd == 5'hd;
  wire  _s2_write_T_15 = s2_req_cmd == 5'he;
  wire  _s2_write_T_16 = s2_req_cmd == 5'hf;
  wire  _s2_write_T_20 = _s2_write_T_12 | _s2_write_T_13 | _s2_write_T_14 | _s2_write_T_15 | _s2_write_T_16;
  wire  _s2_write_T_21 = _s2_write_T_11 | _s2_write_T_20;
  wire  s2_write = s2_req_cmd == 5'h1 | s2_req_cmd == 5'h11 | s2_req_cmd == 5'h7 | _s2_write_T_21;
  reg  pstore1_held;
  wire  pstore1_valid_likely = s2_valid & s2_write | pstore1_held;
  reg [31:0] pstore1_addr;
  reg [31:0] s1_req_addr;
  wire [31:0] s1_vaddr = {s1_req_addr[31:12],s1_req_addr[11:0]};
  wire  _s1_write_T_1 = s1_req_cmd == 5'h11;
  wire  s1_write = s1_req_cmd == 5'h1 | s1_req_cmd == 5'h11 | _s1_read_T_3 | _s1_read_T_23;
  reg [3:0] pstore1_mask;
  wire  _s1_hazard_T_10 = |pstore1_mask[3];
  wire  _s1_hazard_T_9 = |pstore1_mask[2];
  wire  _s1_hazard_T_8 = |pstore1_mask[1];
  wire  _s1_hazard_T_7 = |pstore1_mask[0];
  wire [3:0] _s1_hazard_T_11 = {_s1_hazard_T_10,_s1_hazard_T_9,_s1_hazard_T_8,_s1_hazard_T_7};
  wire [3:0] _s1_hazard_T_16 = {_s1_hazard_T_11[3],_s1_hazard_T_11[2],_s1_hazard_T_11[1],_s1_hazard_T_11[0]};
  reg [1:0] s1_req_size;
  wire  s1_mask_xwr_upper = s1_req_addr[0] | s1_req_size >= 2'h1;
  wire  s1_mask_xwr_lower = s1_req_addr[0] ? 1'h0 : 1'h1;
  wire [1:0] _s1_mask_xwr_T = {s1_mask_xwr_upper,s1_mask_xwr_lower};
  wire [1:0] _s1_mask_xwr_upper_T_5 = s1_req_addr[1] ? _s1_mask_xwr_T : 2'h0;
  wire [1:0] _s1_mask_xwr_upper_T_7 = s1_req_size >= 2'h2 ? 2'h3 : 2'h0;
  wire [1:0] s1_mask_xwr_upper_1 = _s1_mask_xwr_upper_T_5 | _s1_mask_xwr_upper_T_7;
  wire [1:0] s1_mask_xwr_lower_1 = s1_req_addr[1] ? 2'h0 : _s1_mask_xwr_T;
  wire [3:0] s1_mask_xwr = {s1_mask_xwr_upper_1,s1_mask_xwr_lower_1};
  wire  _s1_hazard_T_24 = |s1_mask_xwr[3];
  wire  _s1_hazard_T_23 = |s1_mask_xwr[2];
  wire  _s1_hazard_T_22 = |s1_mask_xwr[1];
  wire  _s1_hazard_T_21 = |s1_mask_xwr[0];
  wire [3:0] _s1_hazard_T_25 = {_s1_hazard_T_24,_s1_hazard_T_23,_s1_hazard_T_22,_s1_hazard_T_21};
  wire [3:0] _s1_hazard_T_30 = {_s1_hazard_T_25[3],_s1_hazard_T_25[2],_s1_hazard_T_25[1],_s1_hazard_T_25[0]};
  wire [3:0] _s1_hazard_T_31 = _s1_hazard_T_16 & _s1_hazard_T_30;
  wire [3:0] _s1_hazard_T_33 = pstore1_mask & s1_mask_xwr;
  wire  _s1_hazard_T_35 = s1_write ? |_s1_hazard_T_31 : |_s1_hazard_T_33;
  wire  _s1_hazard_T_36 = pstore1_addr[11:2] == s1_vaddr[11:2] & _s1_hazard_T_35;
  reg  pstore2_valid;
  reg [31:0] pstore2_addr;
  reg [3:0] mask;
  wire  _s1_hazard_T_48 = |mask[3];
  wire  _s1_hazard_T_47 = |mask[2];
  wire  _s1_hazard_T_46 = |mask[1];
  wire  _s1_hazard_T_45 = |mask[0];
  wire [3:0] _s1_hazard_T_49 = {_s1_hazard_T_48,_s1_hazard_T_47,_s1_hazard_T_46,_s1_hazard_T_45};
  wire [3:0] _s1_hazard_T_54 = {_s1_hazard_T_49[3],_s1_hazard_T_49[2],_s1_hazard_T_49[1],_s1_hazard_T_49[0]};
  wire [3:0] _s1_hazard_T_69 = _s1_hazard_T_54 & _s1_hazard_T_30;
  wire [3:0] _s1_hazard_T_71 = mask & s1_mask_xwr;
  wire  _s1_hazard_T_73 = s1_write ? |_s1_hazard_T_69 : |_s1_hazard_T_71;
  wire  _s1_hazard_T_74 = pstore2_addr[11:2] == s1_vaddr[11:2] & _s1_hazard_T_73;
  wire  _s1_hazard_T_75 = pstore2_valid & _s1_hazard_T_74;
  wire  s1_hazard = pstore1_valid_likely & _s1_hazard_T_36 | _s1_hazard_T_75;
  wire  s1_raw_hazard = s1_read & s1_hazard;
  wire [7:0] _s2_valid_no_xcpt_T = {io_cpu_s2_xcpt_ma_ld,io_cpu_s2_xcpt_ma_st,io_cpu_s2_xcpt_pf_ld,io_cpu_s2_xcpt_pf_st,
    io_cpu_s2_xcpt_gf_ld,io_cpu_s2_xcpt_gf_st,io_cpu_s2_xcpt_ae_ld,io_cpu_s2_xcpt_ae_st};
  wire  s2_valid_no_xcpt = s2_valid & ~(|_s2_valid_no_xcpt_T);
  reg  s2_not_nacked_in_s1;
  wire  s2_valid_masked = s2_valid_no_xcpt & s2_not_nacked_in_s1;
  wire  _c_cat_T_48 = s2_req_cmd == 5'h6;
  wire  _c_cat_T_49 = s2_write | s2_req_cmd == 5'h3 | s2_req_cmd == 5'h6;
  reg [1:0] s2_hit_state_state;
  wire [3:0] _T_75 = {s2_write,_c_cat_T_49,s2_hit_state_state};
  wire  _T_133 = 4'h3 == _T_75;
  wire  _T_130 = 4'h2 == _T_75;
  wire  _T_127 = 4'h1 == _T_75;
  wire  _T_124 = 4'h7 == _T_75;
  wire  _T_121 = 4'h6 == _T_75;
  wire  _T_118 = 4'hf == _T_75;
  wire  _T_115 = 4'he == _T_75;
  wire  _T_112 = 4'h0 == _T_75;
  wire  _T_109 = 4'h5 == _T_75;
  wire  _T_106 = 4'h4 == _T_75;
  wire  _T_103 = 4'hd == _T_75;
  wire  _T_100 = 4'hc == _T_75;
  wire  s2_hit = _T_133 | (_T_130 | (_T_127 | (_T_124 | (_T_121 | (_T_118 | _T_115)))));
  wire  s2_valid_hit_maybe_flush_pre_data_ecc_and_waw = s2_valid_masked & s2_hit;
  wire  _s2_read_T = s2_req_cmd == 5'h0;
  wire  _s2_read_T_1 = s2_req_cmd == 5'h10;
  wire  _s2_read_T_6 = _s2_read_T | _s2_read_T_1 | _c_cat_T_48 | _s2_write_T_3;
  wire  s2_read = _s2_read_T_6 | _s2_write_T_21;
  wire  s2_readwrite = s2_read | s2_write;
  wire  s2_valid_hit_pre_data_ecc_and_waw = s2_valid_hit_maybe_flush_pre_data_ecc_and_waw & s2_readwrite;
  wire [1:0] _T_102 = _T_100 ? 2'h1 : 2'h0;
  wire [1:0] _T_105 = _T_103 ? 2'h2 : _T_102;
  wire [1:0] _T_108 = _T_106 ? 2'h1 : _T_105;
  wire [1:0] _T_111 = _T_109 ? 2'h2 : _T_108;
  wire [1:0] _T_114 = _T_112 ? 2'h0 : _T_111;
  wire [1:0] _T_117 = _T_115 ? 2'h3 : _T_114;
  wire [1:0] _T_120 = _T_118 ? 2'h3 : _T_117;
  wire [1:0] _T_123 = _T_121 ? 2'h2 : _T_120;
  wire [1:0] _T_126 = _T_124 ? 2'h3 : _T_123;
  wire [1:0] _T_129 = _T_127 ? 2'h1 : _T_126;
  wire [1:0] _T_132 = _T_130 ? 2'h2 : _T_129;
  wire [1:0] s2_grow_param = _T_133 ? 2'h3 : _T_132;
  wire  _s2_update_meta_T = s2_hit_state_state == s2_grow_param;
  wire  s2_update_meta = ~_s2_update_meta_T;
  wire  _T_263 = io_cpu_s2_nack | s2_valid_hit_pre_data_ecc_and_waw & s2_update_meta;
  wire  s1_readwrite = s1_read | s1_write;
  wire  s1_flush_line = s1_req_cmd == 5'h5 & s1_req_size[0];
  wire  s1_cmd_uses_tlb = s1_readwrite | s1_flush_line | s1_req_cmd == 5'h17;
  wire  _GEN_161 = s1_valid & s1_raw_hazard | _T_263;
  wire  _GEN_327 = probeNack | _GEN_161;
  wire  s1_nack = s2_probe ? _GEN_327 : _GEN_161;
  wire  _s1_valid_not_nacked_T = ~s1_nack;
  wire  s1_valid_not_nacked = s1_valid & ~s1_nack;
  wire  s0_clk_en = metaArb_io_out_valid & ~metaArb_io_out_bits_write;
  wire [31:0] s0_req_addr = {metaArb_io_out_bits_addr[31:6],io_cpu_req_bits_addr[5:0]};
  wire  s0_req_phys = ~metaArb_io_in_7_ready;
  reg [5:0] s1_req_tag;
  reg  s1_req_signed;
  reg [31:0] s1_tlb_req_vaddr;
  reg [1:0] s1_tlb_req_size;
  reg [4:0] s1_tlb_req_cmd;
  wire  s1_sfence = s1_req_cmd == 5'h14 | s1_req_cmd == 5'h15 | s1_req_cmd == 5'h16;
  reg  s1_flush_valid;
  reg  flushed;
  reg  flushing;
  reg [1:0] flushing_req_size;
  reg  cached_grant_wait;
  reg  resetting;
  reg [7:0] flushCounter;
  reg [3:0] refill_way;
  wire  inWriteback = _T_329 | _T_328;
  wire  _io_cpu_req_ready_T = release_state == 4'h0;
  wire  _io_cpu_req_ready_T_1 = ~cached_grant_wait;
  reg  uncachedInFlight_0;
  reg [31:0] uncachedReqs_0_addr;
  reg [5:0] uncachedReqs_0_tag;
  reg [1:0] uncachedReqs_0_size;
  reg  uncachedReqs_0_signed;
  wire  _s0_read_T = io_cpu_req_bits_cmd == 5'h0;
  wire  _s0_read_T_1 = io_cpu_req_bits_cmd == 5'h10;
  wire  _s0_read_T_2 = io_cpu_req_bits_cmd == 5'h6;
  wire  _s0_read_T_3 = io_cpu_req_bits_cmd == 5'h7;
  wire  _s0_read_T_6 = _s0_read_T | _s0_read_T_1 | _s0_read_T_2 | _s0_read_T_3;
  wire  _s0_read_T_7 = io_cpu_req_bits_cmd == 5'h4;
  wire  _s0_read_T_8 = io_cpu_req_bits_cmd == 5'h9;
  wire  _s0_read_T_9 = io_cpu_req_bits_cmd == 5'ha;
  wire  _s0_read_T_10 = io_cpu_req_bits_cmd == 5'hb;
  wire  _s0_read_T_13 = _s0_read_T_7 | _s0_read_T_8 | _s0_read_T_9 | _s0_read_T_10;
  wire  _s0_read_T_14 = io_cpu_req_bits_cmd == 5'h8;
  wire  _s0_read_T_15 = io_cpu_req_bits_cmd == 5'hc;
  wire  _s0_read_T_16 = io_cpu_req_bits_cmd == 5'hd;
  wire  _s0_read_T_17 = io_cpu_req_bits_cmd == 5'he;
  wire  _s0_read_T_18 = io_cpu_req_bits_cmd == 5'hf;
  wire  _s0_read_T_22 = _s0_read_T_14 | _s0_read_T_15 | _s0_read_T_16 | _s0_read_T_17 | _s0_read_T_18;
  wire  _s0_read_T_23 = _s0_read_T_13 | _s0_read_T_22;
  wire  s0_read = _s0_read_T_6 | _s0_read_T_23;
  wire  _dataArb_io_in_3_valid_res_T = io_cpu_req_bits_cmd == 5'h1;
  wire  _dataArb_io_in_3_valid_res_T_1 = io_cpu_req_bits_cmd == 5'h3;
  wire  _dataArb_io_in_3_valid_res_T_2 = _dataArb_io_in_3_valid_res_T | _dataArb_io_in_3_valid_res_T_1;
  wire  res = ~_dataArb_io_in_3_valid_res_T_2;
  wire  _dataArb_io_in_3_valid_T_26 = io_cpu_req_bits_cmd == 5'h11;
  wire  _dataArb_io_in_3_valid_T_47 = _dataArb_io_in_3_valid_res_T | io_cpu_req_bits_cmd == 5'h11 | _s0_read_T_3 |
    _s0_read_T_23;
  wire  _dataArb_io_in_3_valid_T_51 = _dataArb_io_in_3_valid_T_47 & _dataArb_io_in_3_valid_T_26;
  wire  _dataArb_io_in_3_valid_T_52 = s0_read | _dataArb_io_in_3_valid_T_51;
  wire  _dataArb_io_in_3_valid_T_56 = ~reset;
  wire  _dataArb_io_in_3_valid_T_58 = io_cpu_req_valid & res;
  wire [31:0] _dataArb_io_in_3_bits_addr_T_2 = {io_cpu_req_bits_addr[31:12],io_cpu_req_bits_addr[11:0]};
  wire  _GEN_33 = ~dataArb_io_in_3_ready & s0_read ? 1'h0 : release_state == 4'h0 & ~cached_grant_wait &
    _s1_valid_not_nacked_T;
  wire  _s1_did_read_T_54 = dataArb_io_in_3_ready & (io_cpu_req_valid & _dataArb_io_in_3_valid_T_52);
  reg  s1_did_read;
  wire  _GEN_36 = s0_req_phys ? 1'h0 : _GEN_33;
  wire [31:0] s1_paddr = {tlb_io_resp_paddr[31:12],s1_req_addr[11:0]};
  wire  _T_19 = metaArb_io_out_valid & metaArb_io_out_bits_write;
  wire [21:0] _WIRE_2 = tag_array_RW0_rdata_0;
  wire [19:0] s1_meta_uncorrected_0_tag = _WIRE_2[19:0];
  wire [1:0] s1_meta_uncorrected_0_coh_state = _WIRE_2[21:20];
  wire [21:0] _WIRE_3 = tag_array_RW0_rdata_1;
  wire [19:0] s1_meta_uncorrected_1_tag = _WIRE_3[19:0];
  wire [1:0] s1_meta_uncorrected_1_coh_state = _WIRE_3[21:20];
  wire [21:0] _WIRE_4 = tag_array_RW0_rdata_2;
  wire [19:0] s1_meta_uncorrected_2_tag = _WIRE_4[19:0];
  wire [1:0] s1_meta_uncorrected_2_coh_state = _WIRE_4[21:20];
  wire [21:0] _WIRE_5 = tag_array_RW0_rdata_3;
  wire [19:0] s1_meta_uncorrected_3_tag = _WIRE_5[19:0];
  wire [1:0] s1_meta_uncorrected_3_coh_state = _WIRE_5[21:20];
  wire [19:0] s1_tag = s1_paddr[31:12];
  wire  _T_32 = s1_meta_uncorrected_0_coh_state > 2'h0;
  wire  _T_33 = s1_meta_uncorrected_0_tag == s1_tag;
  wire  _T_34 = _T_32 & s1_meta_uncorrected_0_tag == s1_tag;
  wire  _T_35 = s1_meta_uncorrected_1_coh_state > 2'h0;
  wire  _T_36 = s1_meta_uncorrected_1_tag == s1_tag;
  wire  _T_37 = _T_35 & s1_meta_uncorrected_1_tag == s1_tag;
  wire  _T_38 = s1_meta_uncorrected_2_coh_state > 2'h0;
  wire  _T_39 = s1_meta_uncorrected_2_tag == s1_tag;
  wire  _T_40 = _T_38 & s1_meta_uncorrected_2_tag == s1_tag;
  wire  _T_41 = s1_meta_uncorrected_3_coh_state > 2'h0;
  wire  _T_42 = s1_meta_uncorrected_3_tag == s1_tag;
  wire  _T_43 = _T_41 & s1_meta_uncorrected_3_tag == s1_tag;
  wire [3:0] s1_meta_hit_way = {_T_43,_T_40,_T_37,_T_34};
  wire  _T_45 = ~s1_flush_valid;
  wire [1:0] _T_47 = _T_33 & ~s1_flush_valid ? s1_meta_uncorrected_0_coh_state : 2'h0;
  wire [1:0] _T_51 = _T_36 & ~s1_flush_valid ? s1_meta_uncorrected_1_coh_state : 2'h0;
  wire [1:0] _T_55 = _T_39 & ~s1_flush_valid ? s1_meta_uncorrected_2_coh_state : 2'h0;
  wire [1:0] _T_59 = _T_42 & ~s1_flush_valid ? s1_meta_uncorrected_3_coh_state : 2'h0;
  wire [1:0] _T_60 = _T_47 | _T_51;
  wire [1:0] _T_61 = _T_60 | _T_55;
  wire [1:0] s1_meta_hit_state_state = _T_61 | _T_59;
  wire  s2_hit_valid = s2_hit_state_state > 2'h0;
  reg [3:0] s2_hit_way;
  reg [1:0] s2_victim_way_r;
  wire [3:0] s2_victim_way = 4'h1 << s2_victim_way_r;
  wire [3:0] s2_victim_or_hit_way = s2_hit_valid ? s2_hit_way : s2_victim_way;
  reg [3:0] s2_probe_way;
  wire [3:0] releaseWay = _T_333 ? s2_victim_or_hit_way : s2_probe_way;
  wire [3:0] s1_data_way_x42 = inWriteback ? releaseWay : s1_meta_hit_way;
  wire [15:0] tl_d_data_encoded_lo = {auto_out_d_bits_data[15:8],auto_out_d_bits_data[7:0]};
  wire [15:0] tl_d_data_encoded_hi = {auto_out_d_bits_data[31:24],auto_out_d_bits_data[23:16]};
  wire [31:0] _tl_d_data_encoded_T_4 = {auto_out_d_bits_data[31:24],auto_out_d_bits_data[23:16],auto_out_d_bits_data[15:
    8],auto_out_d_bits_data[7:0]};
  wire [3:0] _T_67 = ~io_cpu_s1_data_mask;
  wire [3:0] _T_68 = s1_mask_xwr | _T_67;
  wire  s2_valid_x44 = s1_valid_masked & ~s1_sfence;
  reg [31:0] s2_req_addr;
  reg [5:0] s2_req_tag;
  reg [1:0] s2_req_size;
  reg  s2_req_signed;
  wire  _s2_cmd_flush_all_T = s2_req_cmd == 5'h5;
  wire  s2_cmd_flush_all = s2_req_cmd == 5'h5 & ~s2_req_size[0];
  wire  s2_cmd_flush_line = _s2_cmd_flush_all_T & s2_req_size[0];
  reg  s2_tlb_xcpt_pf_ld;
  reg  s2_tlb_xcpt_pf_st;
  reg  s2_tlb_xcpt_ae_ld;
  reg  s2_tlb_xcpt_ae_st;
  reg  s2_tlb_xcpt_ma_ld;
  reg  s2_tlb_xcpt_ma_st;
  reg  s2_pma_cacheable;
  reg [31:0] s2_uncached_resp_addr;
  wire  _T_74 = s1_valid_not_nacked | s1_flush_valid;
  wire [31:0] _GEN_63 = s1_valid_not_nacked | s1_flush_valid ? s1_paddr : s2_req_addr;
  wire [5:0] _GEN_64 = s1_valid_not_nacked | s1_flush_valid ? s1_req_tag : s2_req_tag;
  wire [4:0] _GEN_65 = s1_valid_not_nacked | s1_flush_valid ? s1_req_cmd : s2_req_cmd;
  wire [1:0] _GEN_66 = s1_valid_not_nacked | s1_flush_valid ? s1_req_size : s2_req_size;
  wire  _GEN_67 = s1_valid_not_nacked | s1_flush_valid ? s1_req_signed : s2_req_signed;
  reg [31:0] s2_vaddr_r;
  wire [31:0] s2_vaddr = {s2_vaddr_r[31:12],s2_req_addr[11:0]};
  reg  s2_flush_valid_pre_tag_ecc;
  wire  s1_meta_clk_en = _T_74 | s1_probe;
  reg [21:0] s2_meta_corrected_r;
  wire [19:0] s2_meta_corrected_0_tag = s2_meta_corrected_r[19:0];
  wire [1:0] s2_meta_corrected_0_coh_state = s2_meta_corrected_r[21:20];
  reg [21:0] s2_meta_corrected_r_1;
  wire [19:0] s2_meta_corrected_1_tag = s2_meta_corrected_r_1[19:0];
  wire [1:0] s2_meta_corrected_1_coh_state = s2_meta_corrected_r_1[21:20];
  reg [21:0] s2_meta_corrected_r_2;
  wire [19:0] s2_meta_corrected_2_tag = s2_meta_corrected_r_2[19:0];
  wire [1:0] s2_meta_corrected_2_coh_state = s2_meta_corrected_r_2[21:20];
  reg [21:0] s2_meta_corrected_r_3;
  wire [19:0] s2_meta_corrected_3_tag = s2_meta_corrected_r_3[19:0];
  wire [1:0] s2_meta_corrected_3_coh_state = s2_meta_corrected_r_3[21:20];
  wire  en = s1_valid | inWriteback | io_cpu_replay_next;
  wire  word_en = inWriteback | s1_did_read;
  wire [31:0] s1_all_data_ways_0 = data_io_resp_0;
  wire [31:0] s1_all_data_ways_1 = data_io_resp_1;
  wire [31:0] s1_all_data_ways_2 = data_io_resp_2;
  wire [31:0] s1_all_data_ways_3 = data_io_resp_3;
  wire  s1_word_en = ~io_cpu_replay_next ? word_en : 1'h1;
  wire  grantIsUncachedData = auto_out_d_bits_opcode == 3'h1;
  reg  blockUncachedGrant;
  wire  grantIsRefill = auto_out_d_bits_opcode == 3'h5;
  wire  _T_312 = ~dataArb_io_in_1_ready;
  wire  _grantIsCached_T = auto_out_d_bits_opcode == 3'h4;
  wire  grantIsCached = _grantIsCached_T | grantIsRefill;
  reg [9:0] counter;
  wire  d_first = counter == 10'h0;
  wire  canAcceptCachedGrant = ~_T_333;
  wire  _bundleOut_0_d_ready_T_3 = grantIsCached ? (~d_first | auto_out_e_ready) & canAcceptCachedGrant : 1'h1;
  wire  _GEN_256 = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : _bundleOut_0_d_ready_T_3;
  wire  tl_out__d_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? 1'h0 : _GEN_256;
  wire  _T_292 = tl_out__d_ready & auto_out_d_valid;
  wire  _T_288 = auto_out_d_bits_opcode == 3'h0;
  wire  _T_289 = auto_out_d_bits_opcode == 3'h2;
  wire  grantIsUncached = grantIsUncachedData | _T_288 | _T_289;
  wire [4:0] _GEN_212 = grantIsUncachedData ? 5'h10 : {{1'd0}, s1_data_way_x42};
  wire [4:0] _GEN_221 = grantIsUncached ? _GEN_212 : {{1'd0}, s1_data_way_x42};
  wire [4:0] _GEN_234 = grantIsCached ? {{1'd0}, s1_data_way_x42} : _GEN_221;
  wire [4:0] s1_data_way = _T_292 ? _GEN_234 : {{1'd0}, s1_data_way_x42};
  wire [4:0] _s2_data_T_1 = s1_word_en ? s1_data_way : 5'h0;
  wire [31:0] _s2_data_T_7 = _s2_data_T_1[0] ? s1_all_data_ways_0 : 32'h0;
  wire [31:0] _s2_data_T_8 = _s2_data_T_1[1] ? s1_all_data_ways_1 : 32'h0;
  wire [31:0] _s2_data_T_9 = _s2_data_T_1[2] ? s1_all_data_ways_2 : 32'h0;
  wire [31:0] _s2_data_T_10 = _s2_data_T_1[3] ? s1_all_data_ways_3 : 32'h0;
  wire [31:0] _s2_data_T_11 = _s2_data_T_1[4] ? _tl_d_data_encoded_T_4 : 32'h0;
  wire [31:0] _s2_data_T_12 = _s2_data_T_7 | _s2_data_T_8;
  wire [31:0] _s2_data_T_13 = _s2_data_T_12 | _s2_data_T_9;
  wire [31:0] _s2_data_T_14 = _s2_data_T_13 | _s2_data_T_10;
  wire [31:0] _s2_data_T_15 = _s2_data_T_14 | _s2_data_T_11;
  reg [31:0] s2_data;
  wire [15:0] s2_data_corrected_lo = {s2_data[15:8],s2_data[7:0]};
  wire [15:0] s2_data_corrected_hi = {s2_data[31:24],s2_data[23:16]};
  wire [31:0] s2_data_corrected = {s2_data[31:24],s2_data[23:16],s2_data[15:8],s2_data[7:0]};
  wire  s2_valid_flush_line = s2_valid_hit_maybe_flush_pre_data_ecc_and_waw & s2_cmd_flush_line;
  wire  _s2_valid_miss_T_3 = ~s2_hit;
  wire  s2_valid_miss = s2_valid_masked & s2_readwrite & ~s2_hit;
  wire  s2_uncached = ~s2_pma_cacheable;
  wire  _s2_valid_cached_miss_T = ~s2_uncached;
  wire  _s2_valid_cached_miss_T_2 = |uncachedInFlight_0;
  wire  _s2_valid_cached_miss_T_3 = ~(|uncachedInFlight_0);
  wire  s2_valid_cached_miss = s2_valid_miss & ~s2_uncached & ~(|uncachedInFlight_0);
  wire  s2_want_victimize = s2_valid_cached_miss | s2_valid_flush_line | s2_flush_valid_pre_tag_ecc;
  wire  _s2_cannot_victimize_T = ~s2_flush_valid_pre_tag_ecc;
  wire  s2_valid_uncached_pending = s2_valid_miss & s2_uncached & ~(&uncachedInFlight_0);
  wire [19:0] _s2_victim_tag_T_6 = s2_victim_way[0] ? s2_meta_corrected_0_tag : 20'h0;
  wire [19:0] _s2_victim_tag_T_7 = s2_victim_way[1] ? s2_meta_corrected_1_tag : 20'h0;
  wire [19:0] _s2_victim_tag_T_8 = s2_victim_way[2] ? s2_meta_corrected_2_tag : 20'h0;
  wire [19:0] _s2_victim_tag_T_9 = s2_victim_way[3] ? s2_meta_corrected_3_tag : 20'h0;
  wire [19:0] _s2_victim_tag_T_10 = _s2_victim_tag_T_6 | _s2_victim_tag_T_7;
  wire [19:0] _s2_victim_tag_T_11 = _s2_victim_tag_T_10 | _s2_victim_tag_T_8;
  wire [19:0] _s2_victim_tag_T_12 = _s2_victim_tag_T_11 | _s2_victim_tag_T_9;
  wire [1:0] _s2_victim_tag_T_13 = s2_victim_way[0] ? s2_meta_corrected_0_coh_state : 2'h0;
  wire [1:0] _s2_victim_tag_T_14 = s2_victim_way[1] ? s2_meta_corrected_1_coh_state : 2'h0;
  wire [1:0] _s2_victim_tag_T_15 = s2_victim_way[2] ? s2_meta_corrected_2_coh_state : 2'h0;
  wire [1:0] _s2_victim_tag_T_16 = s2_victim_way[3] ? s2_meta_corrected_3_coh_state : 2'h0;
  wire [1:0] _s2_victim_tag_T_17 = _s2_victim_tag_T_13 | _s2_victim_tag_T_14;
  wire [1:0] _s2_victim_tag_T_18 = _s2_victim_tag_T_17 | _s2_victim_tag_T_15;
  wire [1:0] _s2_victim_tag_T_19 = _s2_victim_tag_T_18 | _s2_victim_tag_T_16;
  wire [19:0] s2_victim_tag = s2_valid_flush_line ? s2_req_addr[31:12] : _s2_victim_tag_T_12;
  wire [1:0] s2_victim_state_state = s2_hit_valid ? s2_hit_state_state : _s2_victim_tag_T_19;
  wire [2:0] _T_153 = _T_151 ? 3'h5 : 3'h0;
  wire [2:0] _T_157 = _T_155 ? 3'h2 : _T_153;
  wire [2:0] _T_161 = _T_159 ? 3'h1 : _T_157;
  wire [2:0] _T_165 = _T_163 ? 3'h1 : _T_161;
  wire [2:0] _T_169 = _T_167 ? 3'h5 : _T_165;
  wire [2:0] _T_173 = _T_171 ? 3'h4 : _T_169;
  wire [1:0] _T_174 = _T_171 ? 2'h1 : 2'h0;
  wire [2:0] _T_177 = _T_175 ? 3'h0 : _T_173;
  wire [1:0] _T_178 = _T_175 ? 2'h1 : _T_174;
  wire [2:0] _T_181 = _T_179 ? 3'h0 : _T_177;
  wire [1:0] _T_182 = _T_179 ? 2'h1 : _T_178;
  wire [2:0] _T_185 = _T_183 ? 3'h5 : _T_181;
  wire [1:0] _T_186 = _T_183 ? 2'h0 : _T_182;
  wire [2:0] _T_189 = _T_187 ? 3'h4 : _T_185;
  wire [1:0] _T_190 = _T_187 ? 2'h1 : _T_186;
  wire [2:0] _T_193 = _T_191 ? 3'h3 : _T_189;
  wire [1:0] _T_194 = _T_191 ? 2'h2 : _T_190;
  wire [2:0] s2_report_param = _T_195 ? 3'h3 : _T_193;
  wire [1:0] probeNewCoh_state = _T_195 ? 2'h2 : _T_194;
  wire [3:0] _T_203 = {2'h2,s2_victim_state_state};
  wire  _T_216 = 4'h8 == _T_203;
  wire [2:0] _T_218 = _T_216 ? 3'h5 : 3'h0;
  wire  _T_220 = 4'h9 == _T_203;
  wire [2:0] _T_222 = _T_220 ? 3'h2 : _T_218;
  wire  _T_224 = 4'ha == _T_203;
  wire [2:0] _T_226 = _T_224 ? 3'h1 : _T_222;
  wire  _T_228 = 4'hb == _T_203;
  wire [2:0] _T_230 = _T_228 ? 3'h1 : _T_226;
  wire  _T_232 = 4'h4 == _T_203;
  wire  _T_233 = _T_232 ? 1'h0 : _T_228;
  wire [2:0] _T_234 = _T_232 ? 3'h5 : _T_230;
  wire  _T_236 = 4'h5 == _T_203;
  wire  _T_237 = _T_236 ? 1'h0 : _T_233;
  wire [2:0] _T_238 = _T_236 ? 3'h4 : _T_234;
  wire [1:0] _T_239 = _T_236 ? 2'h1 : 2'h0;
  wire  _T_240 = 4'h6 == _T_203;
  wire  _T_241 = _T_240 ? 1'h0 : _T_237;
  wire [2:0] _T_242 = _T_240 ? 3'h0 : _T_238;
  wire [1:0] _T_243 = _T_240 ? 2'h1 : _T_239;
  wire  _T_244 = 4'h7 == _T_203;
  wire [2:0] _T_246 = _T_244 ? 3'h0 : _T_242;
  wire [1:0] _T_247 = _T_244 ? 2'h1 : _T_243;
  wire  _T_248 = 4'h0 == _T_203;
  wire  _T_249 = _T_248 ? 1'h0 : _T_244 | _T_241;
  wire [2:0] _T_250 = _T_248 ? 3'h5 : _T_246;
  wire [1:0] _T_251 = _T_248 ? 2'h0 : _T_247;
  wire  _T_252 = 4'h1 == _T_203;
  wire  _T_253 = _T_252 ? 1'h0 : _T_249;
  wire [2:0] _T_254 = _T_252 ? 3'h4 : _T_250;
  wire [1:0] _T_255 = _T_252 ? 2'h1 : _T_251;
  wire  _T_256 = 4'h2 == _T_203;
  wire  _T_257 = _T_256 ? 1'h0 : _T_253;
  wire [2:0] _T_258 = _T_256 ? 3'h3 : _T_254;
  wire [1:0] _T_259 = _T_256 ? 2'h2 : _T_255;
  wire  _T_260 = 4'h3 == _T_203;
  wire  s2_victim_dirty = _T_260 | _T_257;
  wire [2:0] s2_shrink_param = _T_260 ? 3'h3 : _T_258;
  wire [1:0] voluntaryNewCoh_state = _T_260 ? 2'h2 : _T_259;
  wire  s2_dont_nack_uncached = s2_valid_uncached_pending & auto_out_a_ready;
  wire  _s2_dont_nack_misc_T_8 = s2_cmd_flush_line & _s2_valid_miss_T_3;
  wire  _s2_dont_nack_misc_T_9 = s2_cmd_flush_all & flushed & ~flushing | _s2_dont_nack_misc_T_8;
  wire  _s2_dont_nack_misc_T_10 = s2_req_cmd == 5'h17;
  wire  _s2_dont_nack_misc_T_11 = _s2_dont_nack_misc_T_9 | _s2_dont_nack_misc_T_10;
  wire  s2_dont_nack_misc = s2_valid_masked & _s2_dont_nack_misc_T_11;
  wire  _io_cpu_s2_nack_T_4 = ~s2_valid_hit_pre_data_ecc_and_waw;
  wire [19:0] metaArb_io_in_2_bits_data_meta_tag = s2_req_addr[31:12];
  wire  _pstore1_cmd_T = s1_valid_not_nacked & s1_write;
  reg [31:0] pstore1_data;
  reg [3:0] pstore1_way;
  wire  _pstore1_merge_T = s2_valid_hit_pre_data_ecc_and_waw & s2_write;
  wire  pstore_drain_opportunistic = ~_dataArb_io_in_3_valid_T_58;
  reg  pstore_drain_on_miss_REG;
  wire  pstore_drain_on_miss = releaseInFlight | pstore_drain_on_miss_REG;
  wire  pstore1_valid = _pstore1_merge_T | pstore1_held;
  wire  pstore_drain = (pstore1_valid | pstore2_valid) & (pstore_drain_opportunistic | pstore_drain_on_miss);
  wire  _pstore1_held_T_9 = ~pstore_drain;
  wire  advance_pstore1 = pstore1_valid & pstore2_valid == pstore_drain;
  reg [3:0] pstore2_way;
  reg [7:0] pstore2_storegen_data_r;
  reg [7:0] pstore2_storegen_data_r_1;
  reg [7:0] pstore2_storegen_data_r_2;
  reg [7:0] pstore2_storegen_data_r_3;
  wire [31:0] pstore2_storegen_data = {pstore2_storegen_data_r_3,pstore2_storegen_data_r_2,pstore2_storegen_data_r_1,
    pstore2_storegen_data_r};
  wire [3:0] _pstore2_storegen_mask_mask_T = ~pstore1_mask;
  wire [3:0] _pstore2_storegen_mask_mask_T_2 = ~_pstore2_storegen_mask_mask_T;
  wire [31:0] _dataArb_io_in_0_bits_addr_T = pstore2_valid ? pstore2_addr : pstore1_addr;
  wire [31:0] _dataArb_io_in_0_bits_wdata_T = pstore2_valid ? pstore2_storegen_data : pstore1_data;
  wire [15:0] dataArb_io_in_0_bits_wdata_lo = {_dataArb_io_in_0_bits_wdata_T[15:8],_dataArb_io_in_0_bits_wdata_T[7:0]};
  wire [15:0] dataArb_io_in_0_bits_wdata_hi = {_dataArb_io_in_0_bits_wdata_T[31:24],_dataArb_io_in_0_bits_wdata_T[23:16]
    };
  wire [3:0] _dataArb_io_in_0_bits_eccMask_T = pstore2_valid ? mask : pstore1_mask;
  wire  _dataArb_io_in_0_bits_eccMask_T_5 = |_dataArb_io_in_0_bits_eccMask_T[0];
  wire  _dataArb_io_in_0_bits_eccMask_T_6 = |_dataArb_io_in_0_bits_eccMask_T[1];
  wire  _dataArb_io_in_0_bits_eccMask_T_7 = |_dataArb_io_in_0_bits_eccMask_T[2];
  wire  _dataArb_io_in_0_bits_eccMask_T_8 = |_dataArb_io_in_0_bits_eccMask_T[3];
  wire [1:0] dataArb_io_in_0_bits_eccMask_lo = {_dataArb_io_in_0_bits_eccMask_T_6,_dataArb_io_in_0_bits_eccMask_T_5};
  wire [1:0] dataArb_io_in_0_bits_eccMask_hi = {_dataArb_io_in_0_bits_eccMask_T_8,_dataArb_io_in_0_bits_eccMask_T_7};
  wire  _a_source_T = ~uncachedInFlight_0;
  wire [1:0] _a_source_T_1 = {_a_source_T, 1'h0};
  wire  a_source = _a_source_T_1[0] ? 1'h0 : 1'h1;
  wire [31:0] acquire_address = {s2_req_addr[31:6], 6'h0};
  wire [18:0] a_mask = {{15'd0}, pstore1_mask};
  wire [1:0] _get_a_mask_sizeOH_T_1 = 2'h1 << s2_req_size[0];
  wire [1:0] get_a_mask_sizeOH = _get_a_mask_sizeOH_T_1 | 2'h1;
  wire  _get_a_mask_T = s2_req_size >= 2'h2;
  wire  get_a_mask_size = get_a_mask_sizeOH[1];
  wire  get_a_mask_bit = s2_req_addr[1];
  wire  get_a_mask_nbit = ~get_a_mask_bit;
  wire  get_a_mask_acc = _get_a_mask_T | get_a_mask_size & get_a_mask_nbit;
  wire  get_a_mask_acc_1 = _get_a_mask_T | get_a_mask_size & get_a_mask_bit;
  wire  get_a_mask_size_1 = get_a_mask_sizeOH[0];
  wire  get_a_mask_bit_1 = s2_req_addr[0];
  wire  get_a_mask_nbit_1 = ~get_a_mask_bit_1;
  wire  get_a_mask_eq_2 = get_a_mask_nbit & get_a_mask_nbit_1;
  wire  get_a_mask_acc_2 = get_a_mask_acc | get_a_mask_size_1 & get_a_mask_eq_2;
  wire  get_a_mask_eq_3 = get_a_mask_nbit & get_a_mask_bit_1;
  wire  get_a_mask_acc_3 = get_a_mask_acc | get_a_mask_size_1 & get_a_mask_eq_3;
  wire  get_a_mask_eq_4 = get_a_mask_bit & get_a_mask_nbit_1;
  wire  get_a_mask_acc_4 = get_a_mask_acc_1 | get_a_mask_size_1 & get_a_mask_eq_4;
  wire  get_a_mask_eq_5 = get_a_mask_bit & get_a_mask_bit_1;
  wire  get_a_mask_acc_5 = get_a_mask_acc_1 | get_a_mask_size_1 & get_a_mask_eq_5;
  wire [3:0] get_mask = {get_a_mask_acc_5,get_a_mask_acc_4,get_a_mask_acc_3,get_a_mask_acc_2};
  wire [2:0] _atomics_T_1_opcode = 5'h4 == s2_req_cmd ? 3'h3 : 3'h0;
  wire [3:0] atomics_a_size = {{2'd0}, s2_req_size};
  wire [3:0] _atomics_T_1_size = 5'h4 == s2_req_cmd ? atomics_a_size : 4'h0;
  wire [31:0] _atomics_T_1_address = 5'h4 == s2_req_cmd ? s2_req_addr : 32'h0;
  wire [3:0] _atomics_T_1_mask = 5'h4 == s2_req_cmd ? get_mask : 4'h0;
  wire [31:0] _atomics_T_1_data = 5'h4 == s2_req_cmd ? pstore1_data : 32'h0;
  wire [2:0] _atomics_T_3_opcode = 5'h9 == s2_req_cmd ? 3'h3 : _atomics_T_1_opcode;
  wire [2:0] _atomics_T_3_param = 5'h9 == s2_req_cmd ? 3'h0 : _atomics_T_1_opcode;
  wire [3:0] _atomics_T_3_size = 5'h9 == s2_req_cmd ? atomics_a_size : _atomics_T_1_size;
  wire  _atomics_T_3_source = 5'h9 == s2_req_cmd ? a_source : 5'h4 == s2_req_cmd & a_source;
  wire [31:0] _atomics_T_3_address = 5'h9 == s2_req_cmd ? s2_req_addr : _atomics_T_1_address;
  wire [3:0] _atomics_T_3_mask = 5'h9 == s2_req_cmd ? get_mask : _atomics_T_1_mask;
  wire [31:0] _atomics_T_3_data = 5'h9 == s2_req_cmd ? pstore1_data : _atomics_T_1_data;
  wire [2:0] _atomics_T_5_opcode = 5'ha == s2_req_cmd ? 3'h3 : _atomics_T_3_opcode;
  wire [2:0] _atomics_T_5_param = 5'ha == s2_req_cmd ? 3'h1 : _atomics_T_3_param;
  wire [3:0] _atomics_T_5_size = 5'ha == s2_req_cmd ? atomics_a_size : _atomics_T_3_size;
  wire  _atomics_T_5_source = 5'ha == s2_req_cmd ? a_source : _atomics_T_3_source;
  wire [31:0] _atomics_T_5_address = 5'ha == s2_req_cmd ? s2_req_addr : _atomics_T_3_address;
  wire [3:0] _atomics_T_5_mask = 5'ha == s2_req_cmd ? get_mask : _atomics_T_3_mask;
  wire [31:0] _atomics_T_5_data = 5'ha == s2_req_cmd ? pstore1_data : _atomics_T_3_data;
  wire [2:0] _atomics_T_7_opcode = 5'hb == s2_req_cmd ? 3'h3 : _atomics_T_5_opcode;
  wire [2:0] _atomics_T_7_param = 5'hb == s2_req_cmd ? 3'h2 : _atomics_T_5_param;
  wire [3:0] _atomics_T_7_size = 5'hb == s2_req_cmd ? atomics_a_size : _atomics_T_5_size;
  wire  _atomics_T_7_source = 5'hb == s2_req_cmd ? a_source : _atomics_T_5_source;
  wire [31:0] _atomics_T_7_address = 5'hb == s2_req_cmd ? s2_req_addr : _atomics_T_5_address;
  wire [3:0] _atomics_T_7_mask = 5'hb == s2_req_cmd ? get_mask : _atomics_T_5_mask;
  wire [31:0] _atomics_T_7_data = 5'hb == s2_req_cmd ? pstore1_data : _atomics_T_5_data;
  wire [2:0] _atomics_T_9_opcode = 5'h8 == s2_req_cmd ? 3'h2 : _atomics_T_7_opcode;
  wire [2:0] _atomics_T_9_param = 5'h8 == s2_req_cmd ? 3'h4 : _atomics_T_7_param;
  wire [3:0] _atomics_T_9_size = 5'h8 == s2_req_cmd ? atomics_a_size : _atomics_T_7_size;
  wire  _atomics_T_9_source = 5'h8 == s2_req_cmd ? a_source : _atomics_T_7_source;
  wire [31:0] _atomics_T_9_address = 5'h8 == s2_req_cmd ? s2_req_addr : _atomics_T_7_address;
  wire [3:0] _atomics_T_9_mask = 5'h8 == s2_req_cmd ? get_mask : _atomics_T_7_mask;
  wire [31:0] _atomics_T_9_data = 5'h8 == s2_req_cmd ? pstore1_data : _atomics_T_7_data;
  wire [2:0] _atomics_T_11_opcode = 5'hc == s2_req_cmd ? 3'h2 : _atomics_T_9_opcode;
  wire [2:0] _atomics_T_11_param = 5'hc == s2_req_cmd ? 3'h0 : _atomics_T_9_param;
  wire [3:0] _atomics_T_11_size = 5'hc == s2_req_cmd ? atomics_a_size : _atomics_T_9_size;
  wire  _atomics_T_11_source = 5'hc == s2_req_cmd ? a_source : _atomics_T_9_source;
  wire [31:0] _atomics_T_11_address = 5'hc == s2_req_cmd ? s2_req_addr : _atomics_T_9_address;
  wire [3:0] _atomics_T_11_mask = 5'hc == s2_req_cmd ? get_mask : _atomics_T_9_mask;
  wire [31:0] _atomics_T_11_data = 5'hc == s2_req_cmd ? pstore1_data : _atomics_T_9_data;
  wire [2:0] _atomics_T_13_opcode = 5'hd == s2_req_cmd ? 3'h2 : _atomics_T_11_opcode;
  wire [2:0] _atomics_T_13_param = 5'hd == s2_req_cmd ? 3'h1 : _atomics_T_11_param;
  wire [3:0] _atomics_T_13_size = 5'hd == s2_req_cmd ? atomics_a_size : _atomics_T_11_size;
  wire  _atomics_T_13_source = 5'hd == s2_req_cmd ? a_source : _atomics_T_11_source;
  wire [31:0] _atomics_T_13_address = 5'hd == s2_req_cmd ? s2_req_addr : _atomics_T_11_address;
  wire [3:0] _atomics_T_13_mask = 5'hd == s2_req_cmd ? get_mask : _atomics_T_11_mask;
  wire [31:0] _atomics_T_13_data = 5'hd == s2_req_cmd ? pstore1_data : _atomics_T_11_data;
  wire [2:0] _atomics_T_15_opcode = 5'he == s2_req_cmd ? 3'h2 : _atomics_T_13_opcode;
  wire [2:0] _atomics_T_15_param = 5'he == s2_req_cmd ? 3'h2 : _atomics_T_13_param;
  wire [3:0] _atomics_T_15_size = 5'he == s2_req_cmd ? atomics_a_size : _atomics_T_13_size;
  wire  _atomics_T_15_source = 5'he == s2_req_cmd ? a_source : _atomics_T_13_source;
  wire [31:0] _atomics_T_15_address = 5'he == s2_req_cmd ? s2_req_addr : _atomics_T_13_address;
  wire [3:0] _atomics_T_15_mask = 5'he == s2_req_cmd ? get_mask : _atomics_T_13_mask;
  wire [31:0] _atomics_T_15_data = 5'he == s2_req_cmd ? pstore1_data : _atomics_T_13_data;
  wire [2:0] atomics_opcode = 5'hf == s2_req_cmd ? 3'h2 : _atomics_T_15_opcode;
  wire [2:0] atomics_param = 5'hf == s2_req_cmd ? 3'h3 : _atomics_T_15_param;
  wire [3:0] atomics_size = 5'hf == s2_req_cmd ? atomics_a_size : _atomics_T_15_size;
  wire  atomics_source = 5'hf == s2_req_cmd ? a_source : _atomics_T_15_source;
  wire [31:0] atomics_address = 5'hf == s2_req_cmd ? s2_req_addr : _atomics_T_15_address;
  wire [3:0] atomics_mask = 5'hf == s2_req_cmd ? get_mask : _atomics_T_15_mask;
  wire [31:0] atomics_data = 5'hf == s2_req_cmd ? pstore1_data : _atomics_T_15_data;
  wire [31:0] _tl_out_a_valid_T_1 = s2_req_addr ^ release_ack_addr;
  wire  _tl_out_a_valid_T_5 = ~(release_ack_wait & _tl_out_a_valid_T_1[21:6] == 16'h0);
  wire  _tl_out_a_valid_T_6 = s2_valid_cached_miss & _tl_out_a_valid_T_5;
  wire  _tl_out_a_valid_T_7 = ~release_ack_wait;
  wire  _tl_out_a_valid_T_10 = ~s2_victim_dirty;
  wire  _tl_out_a_valid_T_12 = _tl_out_a_valid_T_6 & _tl_out_a_valid_T_10;
  wire  tl_out_a_valid = s2_valid_uncached_pending | _tl_out_a_valid_T_12;
  wire [2:0] _tl_out_a_bits_T_6_opcode = ~s2_read ? 3'h0 : atomics_opcode;
  wire [2:0] _tl_out_a_bits_T_6_param = ~s2_read ? 3'h0 : atomics_param;
  wire [3:0] _tl_out_a_bits_T_6_size = ~s2_read ? atomics_a_size : atomics_size;
  wire  _tl_out_a_bits_T_6_source = ~s2_read ? a_source : atomics_source;
  wire [31:0] _tl_out_a_bits_T_6_address = ~s2_read ? s2_req_addr : atomics_address;
  wire [3:0] _tl_out_a_bits_T_6_mask = ~s2_read ? get_mask : atomics_mask;
  wire [31:0] _tl_out_a_bits_T_6_data = ~s2_read ? pstore1_data : atomics_data;
  wire [2:0] _tl_out_a_bits_T_7_opcode = _s2_write_T_1 ? 3'h1 : _tl_out_a_bits_T_6_opcode;
  wire [2:0] _tl_out_a_bits_T_7_param = _s2_write_T_1 ? 3'h0 : _tl_out_a_bits_T_6_param;
  wire [3:0] _tl_out_a_bits_T_7_size = _s2_write_T_1 ? atomics_a_size : _tl_out_a_bits_T_6_size;
  wire  _tl_out_a_bits_T_7_source = _s2_write_T_1 ? a_source : _tl_out_a_bits_T_6_source;
  wire [31:0] _tl_out_a_bits_T_7_address = _s2_write_T_1 ? s2_req_addr : _tl_out_a_bits_T_6_address;
  wire [3:0] putpartial_mask = a_mask[3:0];
  wire [3:0] _tl_out_a_bits_T_7_mask = _s2_write_T_1 ? putpartial_mask : _tl_out_a_bits_T_6_mask;
  wire [31:0] _tl_out_a_bits_T_7_data = _s2_write_T_1 ? pstore1_data : _tl_out_a_bits_T_6_data;
  wire [2:0] _tl_out_a_bits_T_8_opcode = ~s2_write ? 3'h4 : _tl_out_a_bits_T_7_opcode;
  wire [2:0] _tl_out_a_bits_T_8_param = ~s2_write ? 3'h0 : _tl_out_a_bits_T_7_param;
  wire [3:0] _tl_out_a_bits_T_8_size = ~s2_write ? atomics_a_size : _tl_out_a_bits_T_7_size;
  wire  _tl_out_a_bits_T_8_source = ~s2_write ? a_source : _tl_out_a_bits_T_7_source;
  wire [31:0] _tl_out_a_bits_T_8_address = ~s2_write ? s2_req_addr : _tl_out_a_bits_T_7_address;
  wire [3:0] _tl_out_a_bits_T_8_mask = ~s2_write ? get_mask : _tl_out_a_bits_T_7_mask;
  wire [31:0] _tl_out_a_bits_T_8_data = ~s2_write ? 32'h0 : _tl_out_a_bits_T_7_data;
  wire [2:0] tl_out_a_bits_a_param = {{1'd0}, s2_grow_param};
  wire [1:0] _a_sel_T = 2'h1 << a_source;
  wire  a_sel = _a_sel_T[1];
  wire  _T_284 = auto_out_a_ready & tl_out_a_valid;
  wire  _GEN_162 = a_sel | uncachedInFlight_0;
  wire  _GEN_175 = s2_uncached ? _GEN_162 : uncachedInFlight_0;
  wire  _GEN_188 = s2_uncached ? cached_grant_wait : 1'h1;
  wire  _GEN_190 = _T_284 ? _GEN_175 : uncachedInFlight_0;
  wire  _GEN_203 = _T_284 ? _GEN_188 : cached_grant_wait;
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size;
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0];
  wire [9:0] beats1_decode = _beats1_decode_T_3[11:2];
  wire  beats1_opdata = auto_out_d_bits_opcode[0];
  wire [9:0] beats1 = beats1_opdata ? beats1_decode : 10'h0;
  wire [9:0] counter1 = counter - 10'h1;
  wire  d_last = counter == 10'h1 | beats1 == 10'h0;
  wire  d_done = d_last & _T_292;
  wire [9:0] _count_T = ~counter1;
  wire [9:0] count = beats1 & _count_T;
  wire [11:0] d_address_inc = {count, 2'h0};
  wire  _tl_d_data_encoded_T_8 = ~grantIsUncached;
  wire  grantIsVoluntary = auto_out_d_bits_opcode == 3'h6;
  wire [1:0] _uncachedRespIdxOH_T = 2'h1 << auto_out_d_bits_source;
  wire  uncachedRespIdxOH = _uncachedRespIdxOH_T[1];
  wire  _T_297 = uncachedRespIdxOH & d_last;
  wire  _GEN_211 = uncachedRespIdxOH & d_last ? 1'h0 : _GEN_190;
  wire [31:0] dontCareBits = {s1_paddr[31:2], 2'h0};
  wire [31:0] _GEN_472 = {{30'd0}, uncachedReqs_0_addr[1:0]};
  wire [31:0] _s2_req_addr_T_1 = dontCareBits | _GEN_472;
  wire  _GEN_219 = grantIsVoluntary ? 1'h0 : release_ack_wait;
  wire  _GEN_228 = grantIsUncached ? release_ack_wait : _GEN_219;
  wire  _GEN_232 = grantIsCached & d_last;
  wire  _GEN_241 = grantIsCached ? release_ack_wait : _GEN_228;
  wire  _GEN_254 = _T_292 ? _GEN_241 : release_ack_wait;
  wire  tl_out__e_valid = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : auto_out_d_valid & d_first & grantIsCached &
    canAcceptCachedGrant;
  wire  _T_304 = auto_out_e_ready & tl_out__e_valid;
  wire [31:0] _dataArb_io_in_1_bits_addr_T_1 = {s2_vaddr[31:6], 6'h0};
  wire [31:0] _GEN_473 = {{20'd0}, d_address_inc};
  wire [31:0] _dataArb_io_in_1_bits_addr_T_2 = _dataArb_io_in_1_bits_addr_T_1 | _GEN_473;
  wire [3:0] _metaArb_io_in_3_bits_data_T_1 = {s2_write,_c_cat_T_49,auto_out_d_bits_param};
  wire [1:0] _metaArb_io_in_3_bits_data_T_11 = 4'h1 == _metaArb_io_in_3_bits_data_T_1 ? 2'h1 : 2'h0;
  wire [1:0] _metaArb_io_in_3_bits_data_T_13 = 4'h0 == _metaArb_io_in_3_bits_data_T_1 ? 2'h2 :
    _metaArb_io_in_3_bits_data_T_11;
  wire [1:0] _metaArb_io_in_3_bits_data_T_15 = 4'h4 == _metaArb_io_in_3_bits_data_T_1 ? 2'h2 :
    _metaArb_io_in_3_bits_data_T_13;
  wire [1:0] metaArb_io_in_3_bits_data_meta_state = 4'hc == _metaArb_io_in_3_bits_data_T_1 ? 2'h3 :
    _metaArb_io_in_3_bits_data_T_15;
  wire  _GEN_257 = auto_out_d_valid ? 1'h0 : _GEN_36;
  wire  _GEN_258 = auto_out_d_valid | auto_out_d_valid & grantIsRefill & canAcceptCachedGrant;
  wire  _GEN_259 = auto_out_d_valid ? 1'h0 : 1'h1;
  wire [9:0] counter1_1 = counter_1 - 10'h1;
  wire [9:0] _count_T_1 = ~counter1_1;
  wire [9:0] c_count = beats1_1 & _count_T_1;
  reg  s1_release_data_valid;
  wire  releaseRejected = s2_release_data_valid & ~_T_318;
  wire [10:0] _releaseDataBeat_T = {1'h0,c_count};
  wire [1:0] _releaseDataBeat_T_1 = {1'h0,s2_release_data_valid};
  wire [1:0] _GEN_474 = {{1'd0}, s1_release_data_valid};
  wire [1:0] _releaseDataBeat_T_3 = _GEN_474 + _releaseDataBeat_T_1;
  wire [1:0] _releaseDataBeat_T_4 = releaseRejected ? 2'h0 : _releaseDataBeat_T_3;
  wire [10:0] _GEN_475 = {{9'd0}, _releaseDataBeat_T_4};
  wire [10:0] releaseDataBeat = _releaseDataBeat_T + _GEN_475;
  wire  discard_line = s2_valid_flush_line & s2_req_size[1] | s2_flush_valid_pre_tag_ecc & flushing_req_size[1];
  wire [3:0] _release_state_T_13 = s2_victim_dirty & ~discard_line ? 4'h1 : 4'h6;
  wire [25:0] _probe_bits_T_2 = {s2_victim_tag,s2_req_addr[11:6]};
  wire [31:0] res_2_address = {_probe_bits_T_2, 6'h0};
  wire [3:0] _GEN_267 = s2_want_victimize ? _release_state_T_13 : release_state;
  wire [3:0] _release_state_T_14 = releaseDone ? 4'h7 : 4'h3;
  wire [3:0] _release_state_T_15 = releaseDone ? 4'h0 : 4'h5;
  wire [2:0] _GEN_278 = _T_324 ? s2_report_param : 3'h5;
  wire [3:0] _GEN_291 = _T_324 ? _release_state_T_14 : _release_state_T_15;
  wire [3:0] _GEN_293 = s2_prb_ack_data ? 4'h2 : _GEN_291;
  wire [2:0] _GEN_296 = s2_prb_ack_data ? 3'h5 : _GEN_278;
  wire [3:0] _GEN_328 = s2_probe ? _GEN_293 : _GEN_267;
  wire [2:0] _GEN_331 = s2_probe ? _GEN_296 : 3'h5;
  wire [32:0] _metaArb_io_in_6_bits_addr_T_3 = {1'h0,probe_bits_address};
  wire [3:0] _GEN_345 = metaArb_io_in_6_ready ? 4'h0 : _GEN_328;
  wire [32:0] _GEN_349 = release_state == 4'h4 ? _metaArb_io_in_6_bits_addr_T_3 : 33'h0;
  wire [3:0] _GEN_350 = release_state == 4'h4 ? _GEN_345 : _GEN_328;
  wire  _GEN_351 = release_state == 4'h4 & metaArb_io_in_6_ready;
  wire [3:0] _GEN_352 = releaseDone ? 4'h0 : _GEN_350;
  wire [3:0] _GEN_354 = release_state == 4'h5 ? _GEN_352 : _GEN_350;
  wire [3:0] _GEN_355 = releaseDone ? 4'h7 : _GEN_354;
  wire [2:0] _GEN_358 = release_state == 4'h3 ? s2_report_param : _GEN_331;
  wire [3:0] _GEN_371 = release_state == 4'h3 ? _GEN_355 : _GEN_354;
  wire [3:0] _GEN_372 = releaseDone ? 4'h7 : _GEN_371;
  wire [2:0] _GEN_374 = release_state == 4'h2 ? s2_report_param : _GEN_358;
  wire [3:0] _GEN_387 = release_state == 4'h2 ? _GEN_372 : _GEN_371;
  wire  _GEN_403 = _T_318 & c_first | _GEN_254;
  wire [1:0] newCoh_state = _T_333 ? voluntaryNewCoh_state : probeNewCoh_state;
  wire [11:0] _dataArb_io_in_2_bits_addr_T_1 = {probe_bits_address[11:6], 6'h0};
  wire [5:0] _dataArb_io_in_2_bits_addr_T_3 = {releaseDataBeat[3:0], 2'h0};
  wire [11:0] _GEN_488 = {{6'd0}, _dataArb_io_in_2_bits_addr_T_3};
  wire  _metaArb_io_in_4_valid_T_1 = release_state == 4'h7;
  wire [19:0] metaArb_io_in_4_bits_data_meta_tag = probe_bits_address[31:12];
  wire  _T_337 = metaArb_io_in_4_ready & metaArb_io_in_4_valid;
  reg  io_cpu_s2_xcpt_REG;
  reg  doUncachedResp;
  wire [15:0] io_cpu_resp_bits_data_shifted = get_a_mask_bit ? s2_data_corrected[31:16] : s2_data_corrected[15:0];
  wire  _io_cpu_resp_bits_data_T_3 = s2_req_signed & io_cpu_resp_bits_data_shifted[15];
  wire [15:0] _io_cpu_resp_bits_data_T_5 = _io_cpu_resp_bits_data_T_3 ? 16'hffff : 16'h0;
  wire [15:0] _io_cpu_resp_bits_data_T_7 = s2_req_size == 2'h1 ? _io_cpu_resp_bits_data_T_5 : s2_data_corrected[31:16];
  wire [31:0] _io_cpu_resp_bits_data_T_8 = {_io_cpu_resp_bits_data_T_7,io_cpu_resp_bits_data_shifted};
  wire [7:0] io_cpu_resp_bits_data_shifted_1 = get_a_mask_bit_1 ? _io_cpu_resp_bits_data_T_8[15:8] :
    _io_cpu_resp_bits_data_T_8[7:0];
  wire  _io_cpu_resp_bits_data_T_12 = s2_req_signed & io_cpu_resp_bits_data_shifted_1[7];
  wire [23:0] _io_cpu_resp_bits_data_T_14 = _io_cpu_resp_bits_data_T_12 ? 24'hffffff : 24'h0;
  wire [23:0] _io_cpu_resp_bits_data_T_16 = s2_req_size == 2'h0 ? _io_cpu_resp_bits_data_T_14 :
    _io_cpu_resp_bits_data_T_8[31:8];
  reg  REG;
  wire  _GEN_428 = REG | resetting;
  wire [8:0] flushCounterNext = flushCounter + 8'h1;
  wire  flushDone = flushCounterNext[8:6] == 3'h4;
  wire  _T_351 = s2_valid_masked & s2_cmd_flush_all;
  wire  _s1_flush_valid_T = metaArb_io_in_5_ready & metaArb_io_in_5_valid;
  wire  _metaArb_io_in_5_valid_T = ~flushed;
  wire [11:0] _metaArb_io_in_5_bits_addr_T_1 = {metaArb_io_in_5_bits_idx, 6'h0};
  wire  _GEN_429 = _metaArb_io_in_5_valid_T & _tl_out_a_valid_T_7 & _s2_valid_cached_miss_T_3 | flushing;
  wire  _GEN_442 = _T_351 ? _GEN_429 : flushing;
  wire  _GEN_455 = _T_284 & _s2_valid_cached_miss_T ? 1'h0 : flushed;
  wire  _GEN_456 = flushDone | _GEN_455;
  wire [8:0] _GEN_457 = s2_flush_valid_pre_tag_ecc ? flushCounterNext : {{1'd0}, flushCounter};
  wire  _GEN_458 = s2_flush_valid_pre_tag_ecc ? _GEN_456 : _GEN_455;
  wire [8:0] _GEN_461 = flushing ? _GEN_457 : {{1'd0}, flushCounter};
  wire  _GEN_462 = flushing ? _GEN_458 : _GEN_455;
  wire [8:0] _GEN_465 = resetting ? flushCounterNext : _GEN_461;
  reg [9:0] io_cpu_perf_release_counter;
  wire [9:0] io_cpu_perf_release_counter1 = io_cpu_perf_release_counter - 10'h1;
  wire  io_cpu_perf_release_first = io_cpu_perf_release_counter == 10'h0;
  wire  io_cpu_perf_release_last = io_cpu_perf_release_counter == 10'h1 | beats1_1 == 10'h0;
  wire  _T_375 = ~grantIsCached;
  wire  _GEN_500 = _T_292 & _T_375;
  MaxPeriodFibonacciLFSR lfsr_prng (
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  tag_array tag_array (
    .RW0_addr(tag_array_RW0_addr),
    .RW0_en(tag_array_RW0_en),
    .RW0_clk(tag_array_RW0_clk),
    .RW0_wmode(tag_array_RW0_wmode),
    .RW0_wdata_0(tag_array_RW0_wdata_0),
    .RW0_wdata_1(tag_array_RW0_wdata_1),
    .RW0_wdata_2(tag_array_RW0_wdata_2),
    .RW0_wdata_3(tag_array_RW0_wdata_3),
    .RW0_rdata_0(tag_array_RW0_rdata_0),
    .RW0_rdata_1(tag_array_RW0_rdata_1),
    .RW0_rdata_2(tag_array_RW0_rdata_2),
    .RW0_rdata_3(tag_array_RW0_rdata_3),
    .RW0_wmask_0(tag_array_RW0_wmask_0),
    .RW0_wmask_1(tag_array_RW0_wmask_1),
    .RW0_wmask_2(tag_array_RW0_wmask_2),
    .RW0_wmask_3(tag_array_RW0_wmask_3)
  );
  DCacheDataArray data (
    .clock(data_clock),
    .reset(reset),
    .io_req_valid(data_io_req_valid),
    .io_req_bits_addr(data_io_req_bits_addr),
    .io_req_bits_write(data_io_req_bits_write),
    .io_req_bits_wdata(data_io_req_bits_wdata),
    .io_req_bits_eccMask(data_io_req_bits_eccMask),
    .io_req_bits_way_en(data_io_req_bits_way_en),
    .io_resp_0(data_io_resp_0),
    .io_resp_1(data_io_resp_1),
    .io_resp_2(data_io_resp_2),
    .io_resp_3(data_io_resp_3)
  );
  assign tlb_io_resp_paddr = {tlb_vpn,tlb__mpu_physaddr_T};
  assign tlb_io_resp_pf_ld = |tlb__io_resp_pf_ld_T_1;
  assign tlb_io_resp_pf_st = |tlb__io_resp_pf_st_T_1;
  assign tlb_io_resp_ae_ld = |tlb__io_resp_ae_ld_T;
  assign tlb_io_resp_ae_st = |tlb__io_resp_ae_st_T;
  assign tlb_io_resp_ma_ld = tlb_misaligned & tlb_cmd_read;
  assign tlb_io_resp_ma_st = tlb_misaligned & tlb_cmd_write;
  assign tlb_io_resp_cacheable = |tlb__io_resp_cacheable_T;
  assign metaArb_io_in_4_ready = ~metaArb__grant_T_2;
  assign metaArb_io_in_5_ready = ~metaArb__grant_T_3;
  assign metaArb_io_in_6_ready = ~metaArb__grant_T_4;
  assign metaArb_io_in_7_ready = ~metaArb__grant_T_5;
  assign metaArb_io_out_valid = metaArb__io_out_valid_T | metaArb_io_in_7_valid;
  assign metaArb_io_out_bits_write = metaArb_io_in_0_valid | metaArb__GEN_25;
  assign metaArb_io_out_bits_addr = metaArb_io_in_0_valid ? metaArb_io_in_0_bits_addr : metaArb__GEN_26;
  assign metaArb_io_out_bits_idx = metaArb_io_in_0_valid ? metaArb_io_in_0_bits_idx : metaArb__GEN_27;
  assign metaArb_io_out_bits_way_en = metaArb_io_in_0_valid ? 4'hf : metaArb__GEN_28;
  assign metaArb_io_out_bits_data = metaArb_io_in_0_valid ? 22'h0 : metaArb__GEN_29;
  assign dataArb_io_in_1_ready = ~dataArb_io_in_0_valid;
  assign dataArb_io_in_2_ready = ~dataArb__grant_T;
  assign dataArb_io_in_3_ready = ~dataArb__grant_T_1;
  assign dataArb_io_out_valid = dataArb__io_out_valid_T | dataArb_io_in_3_valid;
  assign dataArb_io_out_bits_addr = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_addr : dataArb__GEN_8;
  assign dataArb_io_out_bits_write = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_write : dataArb__GEN_9;
  assign dataArb_io_out_bits_wdata = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_wdata : dataArb__GEN_10;
  assign dataArb_io_out_bits_eccMask = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_eccMask : 4'hf;
  assign dataArb_io_out_bits_way_en = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_way_en : dataArb__GEN_13;
  assign auto_out_a_valid = s2_valid_uncached_pending | _tl_out_a_valid_T_12;
  assign auto_out_a_bits_opcode = _s2_valid_cached_miss_T ? 3'h6 : _tl_out_a_bits_T_8_opcode;
  assign auto_out_a_bits_param = _s2_valid_cached_miss_T ? tl_out_a_bits_a_param : _tl_out_a_bits_T_8_param;
  assign auto_out_a_bits_size = _s2_valid_cached_miss_T ? 4'h6 : _tl_out_a_bits_T_8_size;
  assign auto_out_a_bits_source = _s2_valid_cached_miss_T ? 1'h0 : _tl_out_a_bits_T_8_source;
  assign auto_out_a_bits_address = _s2_valid_cached_miss_T ? acquire_address : _tl_out_a_bits_T_8_address;
  assign auto_out_a_bits_user_amba_prot_bufferable = s2_pma_cacheable;
  assign auto_out_a_bits_user_amba_prot_modifiable = s2_pma_cacheable;
  assign auto_out_a_bits_user_amba_prot_readalloc = s2_pma_cacheable;
  assign auto_out_a_bits_user_amba_prot_writealloc = s2_pma_cacheable;
  assign auto_out_a_bits_mask = _s2_valid_cached_miss_T ? 4'hf : _tl_out_a_bits_T_8_mask;
  assign auto_out_a_bits_data = _s2_valid_cached_miss_T ? 32'h0 : _tl_out_a_bits_T_8_data;
  assign auto_out_c_valid = release_state == 4'h3 | _GEN_353;
  assign auto_out_c_bits_opcode = _T_333 ? _GEN_388 : _GEN_373;
  assign auto_out_c_bits_param = _T_333 ? s2_shrink_param : _GEN_374;
  assign auto_out_c_bits_size = _T_333 ? 4'h6 : 4'h0;
  assign auto_out_c_bits_address = probe_bits_address;
  assign auto_out_c_bits_data = {s2_data_corrected_hi,s2_data_corrected_lo};
  assign auto_out_d_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? 1'h0 : _GEN_256;
  assign auto_out_e_valid = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : auto_out_d_valid & d_first & grantIsCached
     & canAcceptCachedGrant;
  assign auto_out_e_bits_sink = auto_out_d_bits_sink;
  assign io_cpu_req_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_257 : _GEN_36;
  assign io_cpu_s2_nack = s2_valid_no_xcpt & ~s2_dont_nack_uncached & ~s2_dont_nack_misc & ~
    s2_valid_hit_pre_data_ecc_and_waw;
  assign io_cpu_resp_valid = s2_valid_hit_pre_data_ecc_and_waw | doUncachedResp;
  assign io_cpu_resp_bits_addr = doUncachedResp ? s2_uncached_resp_addr : s2_req_addr;
  assign io_cpu_resp_bits_tag = s2_req_tag;
  assign io_cpu_resp_bits_cmd = s2_req_cmd;
  assign io_cpu_resp_bits_size = s2_req_size;
  assign io_cpu_resp_bits_signed = s2_req_signed;
  assign io_cpu_resp_bits_dprv = 2'h3;
  assign io_cpu_resp_bits_dv = 1'h0;
  assign io_cpu_resp_bits_data = {_io_cpu_resp_bits_data_T_16,io_cpu_resp_bits_data_shifted_1};
  assign io_cpu_resp_bits_mask = 4'h0;
  assign io_cpu_resp_bits_replay = doUncachedResp;
  assign io_cpu_resp_bits_has_data = _s2_read_T_6 | _s2_write_T_21;
  assign io_cpu_resp_bits_data_word_bypass = {s2_data_corrected_hi,s2_data_corrected_lo};
  assign io_cpu_resp_bits_data_raw = {s2_data_corrected_hi,s2_data_corrected_lo};
  assign io_cpu_resp_bits_store_data = pstore1_data;
  assign io_cpu_replay_next = _T_292 & grantIsUncachedData;
  assign io_cpu_s2_xcpt_ma_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ma_ld;
  assign io_cpu_s2_xcpt_ma_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ma_st;
  assign io_cpu_s2_xcpt_pf_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_pf_ld;
  assign io_cpu_s2_xcpt_pf_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_pf_st;
  assign io_cpu_s2_xcpt_gf_ld = 1'h0;
  assign io_cpu_s2_xcpt_gf_st = 1'h0;
  assign io_cpu_s2_xcpt_ae_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ae_ld;
  assign io_cpu_s2_xcpt_ae_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ae_st;
  assign io_cpu_ordered = ~(s1_valid | s2_valid | cached_grant_wait | _s2_valid_cached_miss_T_2);
  assign io_cpu_perf_release = io_cpu_perf_release_last & _T_318;
  assign io_cpu_perf_grant = auto_out_d_valid & d_last;
  assign tlb_io_req_valid = s1_valid_masked & s1_cmd_uses_tlb;
  assign tlb_io_req_bits_vaddr = s1_tlb_req_vaddr;
  assign tlb_io_req_bits_size = s1_tlb_req_size;
  assign tlb_io_req_bits_cmd = s1_tlb_req_cmd;
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = _T_292 & _GEN_232;
  assign metaArb_io_in_0_valid = resetting;
  assign metaArb_io_in_0_bits_addr = metaArb_io_in_5_bits_addr;
  assign metaArb_io_in_0_bits_idx = metaArb_io_in_5_bits_idx;
  assign metaArb_io_in_2_valid = s2_valid_hit_pre_data_ecc_and_waw & s2_update_meta;
  assign metaArb_io_in_2_bits_addr = {io_cpu_req_bits_addr[31:12],s2_vaddr[11:0]};
  assign metaArb_io_in_2_bits_idx = s2_vaddr[11:6];
  assign metaArb_io_in_2_bits_way_en = s2_hit_valid ? s2_hit_way : s2_victim_way;
  assign metaArb_io_in_2_bits_data = {s2_grow_param,metaArb_io_in_2_bits_data_meta_tag};
  assign metaArb_io_in_3_valid = grantIsCached & d_done & ~auto_out_d_bits_denied;
  assign metaArb_io_in_3_bits_addr = {io_cpu_req_bits_addr[31:12],s2_vaddr[11:0]};
  assign metaArb_io_in_3_bits_idx = s2_vaddr[11:6];
  assign metaArb_io_in_3_bits_way_en = refill_way;
  assign metaArb_io_in_3_bits_data = {metaArb_io_in_3_bits_data_meta_state,metaArb_io_in_2_bits_data_meta_tag};
  assign metaArb_io_in_4_valid = _T_330 | _metaArb_io_in_4_valid_T_1;
  assign metaArb_io_in_4_bits_addr = {io_cpu_req_bits_addr[31:12],probe_bits_address[11:0]};
  assign metaArb_io_in_4_bits_idx = probe_bits_address[11:6];
  assign metaArb_io_in_4_bits_way_en = _T_333 ? s2_victim_or_hit_way : s2_probe_way;
  assign metaArb_io_in_4_bits_data = {newCoh_state,metaArb_io_in_4_bits_data_meta_tag};
  assign metaArb_io_in_5_valid = flushing & ~flushed;
  assign metaArb_io_in_5_bits_addr = {io_cpu_req_bits_addr[31:12],_metaArb_io_in_5_bits_addr_T_1};
  assign metaArb_io_in_5_bits_idx = flushCounter[5:0];
  assign metaArb_io_in_5_bits_way_en = metaArb_io_in_4_bits_way_en;
  assign metaArb_io_in_5_bits_data = metaArb_io_in_4_bits_data;
  assign metaArb_io_in_6_valid = release_state == 4'h4;
  assign metaArb_io_in_6_bits_addr = _GEN_349[31:0];
  assign metaArb_io_in_6_bits_idx = release_state == 4'h4 ? probe_bits_address[11:6] : 6'h0;
  assign metaArb_io_in_6_bits_way_en = metaArb_io_in_4_bits_way_en;
  assign metaArb_io_in_6_bits_data = metaArb_io_in_4_bits_data;
  assign metaArb_io_in_7_valid = io_cpu_req_valid;
  assign metaArb_io_in_7_bits_addr = io_cpu_req_bits_addr;
  assign metaArb_io_in_7_bits_idx = dataArb_io_in_3_bits_addr[11:6];
  assign metaArb_io_in_7_bits_way_en = metaArb_io_in_4_bits_way_en;
  assign metaArb_io_in_7_bits_data = metaArb_io_in_4_bits_data;
  assign tag_array_RW0_clk = clock;
  assign tag_array_RW0_wdata_0 = metaArb_io_out_bits_data;
  assign tag_array_RW0_wdata_1 = metaArb_io_out_bits_data;
  assign tag_array_RW0_wdata_2 = metaArb_io_out_bits_data;
  assign tag_array_RW0_wdata_3 = metaArb_io_out_bits_data;
  assign tag_array_RW0_wmask_0 = metaArb_io_out_bits_way_en[0];
  assign tag_array_RW0_wmask_1 = metaArb_io_out_bits_way_en[1];
  assign tag_array_RW0_wmask_2 = metaArb_io_out_bits_way_en[2];
  assign tag_array_RW0_wmask_3 = metaArb_io_out_bits_way_en[3];
  assign data_clock = clock;
  assign data_io_req_valid = dataArb_io_out_valid;
  assign data_io_req_bits_addr = dataArb_io_out_bits_addr;
  assign data_io_req_bits_write = dataArb_io_out_bits_write;
  assign data_io_req_bits_wdata = dataArb_io_out_bits_wdata;
  assign data_io_req_bits_eccMask = dataArb_io_out_bits_eccMask;
  assign data_io_req_bits_way_en = dataArb_io_out_bits_way_en;
  assign dataArb_io_in_0_valid = (pstore1_valid | pstore2_valid) & (pstore_drain_opportunistic | pstore_drain_on_miss);
  assign dataArb_io_in_0_bits_addr = _dataArb_io_in_0_bits_addr_T[11:0];
  assign dataArb_io_in_0_bits_write = (pstore1_valid | pstore2_valid) & (pstore_drain_opportunistic |
    pstore_drain_on_miss);
  assign dataArb_io_in_0_bits_wdata = {dataArb_io_in_0_bits_wdata_hi,dataArb_io_in_0_bits_wdata_lo};
  assign dataArb_io_in_0_bits_eccMask = {dataArb_io_in_0_bits_eccMask_hi,dataArb_io_in_0_bits_eccMask_lo};
  assign dataArb_io_in_0_bits_way_en = pstore2_valid ? pstore2_way : pstore1_way;
  assign dataArb_io_in_1_valid = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_258 : auto_out_d_valid &
    grantIsRefill & canAcceptCachedGrant;
  assign dataArb_io_in_1_bits_addr = _dataArb_io_in_1_bits_addr_T_2[11:0];
  assign dataArb_io_in_1_bits_write = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_259 : 1'h1;
  assign dataArb_io_in_1_bits_wdata = {tl_d_data_encoded_hi,tl_d_data_encoded_lo};
  assign dataArb_io_in_1_bits_way_en = refill_way;
  assign dataArb_io_in_2_valid = inWriteback & releaseDataBeat < 11'h10;
  assign dataArb_io_in_2_bits_addr = _dataArb_io_in_2_bits_addr_T_1 | _GEN_488;
  assign dataArb_io_in_2_bits_wdata = dataArb_io_in_1_bits_wdata;
  assign dataArb_io_in_3_valid = io_cpu_req_valid & res;
  assign dataArb_io_in_3_bits_addr = _dataArb_io_in_3_bits_addr_T_2[11:0];
  assign dataArb_io_in_3_bits_wdata = dataArb_io_in_1_bits_wdata;
  assign tag_array_RW0_en = s0_clk_en | _T_19;
  assign tag_array_RW0_wmode = metaArb_io_out_bits_write;
  assign tag_array_RW0_addr = metaArb_io_out_bits_idx;
  always @(posedge clock) begin
    if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= s1_valid_x12;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      s1_probe <= 1'h0;
    end else begin
      s1_probe <= _GEN_351;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      s2_probe <= 1'h0;
    end else begin
      s2_probe <= s1_probe;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      release_state <= 4'h0;
    end else if (_T_337) begin
      release_state <= 4'h0;
    end else if (_T_333) begin
      if (releaseDone) begin
        release_state <= 4'h6;
      end else begin
        release_state <= _GEN_387;
      end
    end else begin
      release_state <= _GEN_387;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      release_ack_wait <= 1'h0;
    end else if (_T_333) begin
      release_ack_wait <= _GEN_403;
    end else if (_T_292) begin
      if (!(grantIsCached)) begin
        release_ack_wait <= _GEN_228;
      end
    end
  end
  always @(posedge clock) begin
    if (_T_333) begin
      if (_T_318 & c_first) begin
        release_ack_addr <= probe_bits_address;
      end
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      s2_valid <= s2_valid_x44;
    end
  end
  always @(posedge clock) begin
    if (s2_want_victimize) begin
      probe_bits_address <= res_2_address;
    end
  end
  always @(posedge clock) begin
    if (s1_probe) begin
      s2_probe_state_state <= s1_meta_hit_state_state;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      counter_1 <= 10'h0;
    end else if (_T_318) begin
      if (c_first) begin
        if (beats1_opdata_1) begin
          counter_1 <= beats1_decode_1;
        end else begin
          counter_1 <= 10'h0;
        end
      end else begin
        counter_1 <= counter1_1;
      end
    end
  end
  always @(posedge clock) begin
    s2_release_data_valid <= s1_release_data_valid & ~releaseRejected;
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_req_cmd <= io_cpu_req_bits_cmd;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (grantIsCached) begin
        s2_req_cmd <= _GEN_65;
      end else if (grantIsUncached) begin
        if (grantIsUncachedData) begin
          s2_req_cmd <= 5'h0;
        end else begin
          s2_req_cmd <= _GEN_65;
        end
      end else begin
        s2_req_cmd <= _GEN_65;
      end
    end else begin
      s2_req_cmd <= _GEN_65;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      pstore1_held <= 1'h0;
    end else begin
      pstore1_held <= pstore1_valid & pstore2_valid & ~pstore_drain;
    end
  end
  always @(posedge clock) begin
    if (_pstore1_cmd_T) begin
      pstore1_addr <= s1_vaddr;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_req_addr <= s0_req_addr;
    end
  end
  always @(posedge clock) begin
    if (_pstore1_cmd_T) begin
      if (_s1_write_T_1) begin
        pstore1_mask <= io_cpu_s1_data_mask;
      end else begin
        pstore1_mask <= s1_mask_xwr;
      end
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_req_size <= io_cpu_req_bits_size;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      pstore2_valid <= 1'h0;
    end else begin
      pstore2_valid <= pstore2_valid & _pstore1_held_T_9 | advance_pstore1;
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_addr <= pstore1_addr;
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      mask <= _pstore2_storegen_mask_mask_T_2;
    end
  end
  always @(posedge clock) begin
    s2_not_nacked_in_s1 <= ~s1_nack;
  end
  always @(posedge clock) begin
    if (_T_74) begin
      s2_hit_state_state <= s1_meta_hit_state_state;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_req_tag <= io_cpu_req_bits_tag;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_req_signed <= io_cpu_req_bits_signed;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_tlb_req_vaddr <= s0_req_addr;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_tlb_req_size <= io_cpu_req_bits_size;
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_tlb_req_cmd <= io_cpu_req_bits_cmd;
    end
  end
  always @(posedge clock) begin
    s1_flush_valid <= _s1_flush_valid_T & _T_45 & _s2_cannot_victimize_T & _io_cpu_req_ready_T & _tl_out_a_valid_T_7;
  end
  always @(posedge clock) begin
    flushed <= reset | _GEN_462;
  end
  always @(posedge clock) begin
    if (reset) begin
      flushing <= 1'h0;
    end else if (flushing) begin
      if (flushed & _io_cpu_req_ready_T & _tl_out_a_valid_T_7) begin
        flushing <= 1'h0;
      end else begin
        flushing <= _GEN_442;
      end
    end else begin
      flushing <= _GEN_442;
    end
  end
  always @(posedge clock) begin
    if (_T_351) begin
      if (_metaArb_io_in_5_valid_T & _tl_out_a_valid_T_7 & _s2_valid_cached_miss_T_3) begin
        flushing_req_size <= s2_req_size;
      end
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      cached_grant_wait <= 1'h0;
    end else if (_T_292) begin
      if (grantIsCached) begin
        if (d_last) begin
          cached_grant_wait <= 1'h0;
        end else begin
          cached_grant_wait <= _GEN_203;
        end
      end else begin
        cached_grant_wait <= _GEN_203;
      end
    end else begin
      cached_grant_wait <= _GEN_203;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      resetting <= 1'h0;
    end else if (resetting) begin
      if (flushDone) begin
        resetting <= 1'h0;
      end else begin
        resetting <= _GEN_428;
      end
    end else begin
      resetting <= _GEN_428;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      flushCounter <= 8'hc0;
    end else begin
      flushCounter <= _GEN_465[7:0];
    end
  end
  always @(posedge clock) begin
    if (_T_284) begin
      if (!(s2_uncached)) begin
        if (s2_hit_valid) begin
          refill_way <= s2_hit_way;
        end else begin
          refill_way <= s2_victim_way;
        end
      end
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      uncachedInFlight_0 <= 1'h0;
    end else if (_T_292) begin
      if (grantIsCached) begin
        uncachedInFlight_0 <= _GEN_190;
      end else if (grantIsUncached) begin
        uncachedInFlight_0 <= _GEN_211;
      end else begin
        uncachedInFlight_0 <= _GEN_190;
      end
    end else begin
      uncachedInFlight_0 <= _GEN_190;
    end
  end
  always @(posedge clock) begin
    if (_T_284) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_addr <= s2_req_addr;
        end
      end
    end
  end
  always @(posedge clock) begin
    if (_T_284) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_tag <= s2_req_tag;
        end
      end
    end
  end
  always @(posedge clock) begin
    if (_T_284) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_size <= s2_req_size;
        end
      end
    end
  end
  always @(posedge clock) begin
    if (_T_284) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_signed <= s2_req_signed;
        end
      end
    end
  end
  always @(posedge clock) begin
    if (s0_clk_en) begin
      s1_did_read <= _s1_did_read_T_54;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked) begin
      s2_hit_way <= s1_meta_hit_way;
    end
  end
  always @(posedge clock) begin
    if (_T_74) begin
      if (flushing) begin
        s2_victim_way_r <= flushCounter[7:6];
      end else begin
        s2_victim_way_r <= lfsr[1:0];
      end
    end
  end
  always @(posedge clock) begin
    if (s1_probe) begin
      s2_probe_way <= s1_meta_hit_way;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (grantIsCached) begin
        s2_req_addr <= _GEN_63;
      end else if (grantIsUncached) begin
        if (grantIsUncachedData) begin
          s2_req_addr <= _s2_req_addr_T_1;
        end else begin
          s2_req_addr <= _GEN_63;
        end
      end else begin
        s2_req_addr <= _GEN_63;
      end
    end else begin
      s2_req_addr <= _GEN_63;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (grantIsCached) begin
        s2_req_tag <= _GEN_64;
      end else if (grantIsUncached) begin
        if (grantIsUncachedData) begin
          s2_req_tag <= uncachedReqs_0_tag;
        end else begin
          s2_req_tag <= _GEN_64;
        end
      end else begin
        s2_req_tag <= _GEN_64;
      end
    end else begin
      s2_req_tag <= _GEN_64;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (grantIsCached) begin
        s2_req_size <= _GEN_66;
      end else if (grantIsUncached) begin
        if (grantIsUncachedData) begin
          s2_req_size <= uncachedReqs_0_size;
        end else begin
          s2_req_size <= _GEN_66;
        end
      end else begin
        s2_req_size <= _GEN_66;
      end
    end else begin
      s2_req_size <= _GEN_66;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (grantIsCached) begin
        s2_req_signed <= _GEN_67;
      end else if (grantIsUncached) begin
        if (grantIsUncachedData) begin
          s2_req_signed <= uncachedReqs_0_signed;
        end else begin
          s2_req_signed <= _GEN_67;
        end
      end else begin
        s2_req_signed <= _GEN_67;
      end
    end else begin
      s2_req_signed <= _GEN_67;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_pf_ld <= tlb_io_resp_pf_ld;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_pf_st <= tlb_io_resp_pf_st;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_ae_ld <= tlb_io_resp_ae_ld;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_ae_st <= tlb_io_resp_ae_st;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_ma_ld <= tlb_io_resp_ma_ld;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_tlb_xcpt_ma_st <= tlb_io_resp_ma_st;
    end
  end
  always @(posedge clock) begin
    if (s1_valid_not_nacked | s1_flush_valid) begin
      s2_pma_cacheable <= tlb_io_resp_cacheable;
    end
  end
  always @(posedge clock) begin
    if (_T_292) begin
      if (!(grantIsCached)) begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_uncached_resp_addr <= uncachedReqs_0_addr;
          end
        end
      end
    end
  end
  always @(posedge clock) begin
    if (_T_74) begin
      s2_vaddr_r <= s1_vaddr;
    end
  end
  always @(posedge clock) begin
    s2_flush_valid_pre_tag_ecc <= s1_flush_valid;
  end
  always @(posedge clock) begin
    if (s1_meta_clk_en) begin
      s2_meta_corrected_r <= tag_array_RW0_rdata_0;
    end
  end
  always @(posedge clock) begin
    if (s1_meta_clk_en) begin
      s2_meta_corrected_r_1 <= tag_array_RW0_rdata_1;
    end
  end
  always @(posedge clock) begin
    if (s1_meta_clk_en) begin
      s2_meta_corrected_r_2 <= tag_array_RW0_rdata_2;
    end
  end
  always @(posedge clock) begin
    if (s1_meta_clk_en) begin
      s2_meta_corrected_r_3 <= tag_array_RW0_rdata_3;
    end
  end
  always @(posedge clock) begin
    if (grantIsUncachedData & (blockUncachedGrant | s1_valid)) begin
      if (auto_out_d_valid) begin
        blockUncachedGrant <= _T_312;
      end else begin
        blockUncachedGrant <= dataArb_io_out_valid;
      end
    end else begin
      blockUncachedGrant <= dataArb_io_out_valid;
    end
  end
  always @(posedge clock) begin
    if (reset) begin
      counter <= 10'h0;
    end else if (_T_292) begin
      if (d_first) begin
        if (beats1_opdata) begin
          counter <= beats1_decode;
        end else begin
          counter <= 10'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
  end
  always @(posedge clock) begin
    if (en) begin
      s2_data <= _s2_data_T_15;
    end
  end
  always @(posedge clock) begin
    if (_pstore1_cmd_T) begin
      pstore1_data <= io_cpu_s1_data_data;
    end
  end
  always @(posedge clock) begin
    if (_pstore1_cmd_T) begin
      pstore1_way <= s1_meta_hit_way;
    end
  end
  always @(posedge clock) begin
    pstore_drain_on_miss_REG <= io_cpu_s2_nack;
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_way <= pstore1_way;
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_storegen_data_r <= pstore1_data[7:0];
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_storegen_data_r_1 <= pstore1_data[15:8];
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_storegen_data_r_2 <= pstore1_data[23:16];
    end
  end
  always @(posedge clock) begin
    if (advance_pstore1) begin
      pstore2_storegen_data_r_3 <= pstore1_data[31:24];
    end
  end
  always @(posedge clock) begin
    s1_release_data_valid <= dataArb_io_in_2_ready & dataArb_io_in_2_valid;
  end
  always @(posedge clock) begin
    io_cpu_s2_xcpt_REG <= tlb_io_req_valid & _s1_valid_not_nacked_T;
  end
  always @(posedge clock) begin
    doUncachedResp <= io_cpu_replay_next;
  end
  always @(posedge clock) begin
    REG <= reset;
  end
  always @(posedge clock) begin
    if (reset) begin
      io_cpu_perf_release_counter <= 10'h0;
    end else if (_T_318) begin
      if (io_cpu_perf_release_first) begin
        if (beats1_opdata_1) begin
          io_cpu_perf_release_counter <= beats1_decode_1;
        end else begin
          io_cpu_perf_release_counter <= 10'h0;
        end
      end else begin
        io_cpu_perf_release_counter <= io_cpu_perf_release_counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_dataArb_io_in_3_valid_T_52 | res) & ~reset) begin
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
        if (~reset & ~(~_dataArb_io_in_3_valid_T_52 | res)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:1158 assert(!needsRead(req) || res)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(s1_valid_masked & _s1_write_T_1) | &_T_68) & _dataArb_io_in_3_valid_T_56) begin
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
        if (_dataArb_io_in_3_valid_T_56 & ~(~(s1_valid_masked & _s1_write_T_1) | &_T_68)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:302 assert(!(s1_valid_masked && s1_req.cmd === M_PWR) || (s1_mask_xwr | ~io.cpu.s1_data.mask).andR)\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_dataArb_io_in_3_valid_T_52 | res) & ~reset) begin
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
        if (~reset & ~(~_dataArb_io_in_3_valid_T_52 | res)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:1158 assert(!needsRead(req) || res)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(pstore1_valid == pstore1_valid) & _dataArb_io_in_3_valid_T_56) begin
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
        if (_dataArb_io_in_3_valid_T_56 & ~(pstore1_valid == pstore1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:483 assert(pstore1_rmw || pstore1_valid_not_rmw(io.cpu.s2_kill) === pstore1_valid)\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_io_cpu_req_ready_T_1 & (_T_292 & grantIsCached & _dataArb_io_in_3_valid_T_56)) begin
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
        if (_T_292 & grantIsCached & _dataArb_io_in_3_valid_T_56 & _io_cpu_req_ready_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: A GrantData was unexpected by the dcache.\n    at DCache.scala:650 assert(cached_grant_wait, \"A GrantData was unexpected by the dcache.\")\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_a_source_T & (_T_292 & _T_375 & grantIsUncached & _T_297 & _dataArb_io_in_3_valid_T_56)) begin
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
        if (_T_292 & _T_375 & grantIsUncached & _T_297 & _dataArb_io_in_3_valid_T_56 & _a_source_T) begin
          $fwrite(32'h80000002,
            "Assertion failed: An AccessAck was unexpected by the dcache.\n    at DCache.scala:660 assert(f, \"An AccessAck was unexpected by the dcache.\") // TODO must handle Ack coming back on same cycle!\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_tl_out_a_valid_T_7 & (_GEN_500 & _tl_d_data_encoded_T_8 & grantIsVoluntary & _dataArb_io_in_3_valid_T_56)
          ) begin
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
        if (_GEN_500 & _tl_d_data_encoded_T_8 & grantIsVoluntary & _dataArb_io_in_3_valid_T_56 & _tl_out_a_valid_T_7
          ) begin
          $fwrite(32'h80000002,
            "Assertion failed: A ReleaseAck was unexpected by the dcache.\n    at DCache.scala:681 assert(release_ack_wait, \"A ReleaseAck was unexpected by the dcache.\") // TODO should handle Ack coming back on same cycle!\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_304 == (_T_292 & d_first & grantIsCached)) & _dataArb_io_in_3_valid_T_56) begin
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
        if (_dataArb_io_in_3_valid_T_56 & ~(_T_304 == (_T_292 & d_first & grantIsCached))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:689 assert(tl_out.e.fire() === (tl_out.d.fire() && d_first && grantIsCached))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(s2_valid_flush_line | s2_flush_valid_pre_tag_ecc | io_cpu_s2_nack) & (s2_want_victimize &
          _dataArb_io_in_3_valid_T_56)) begin
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
        if (s2_want_victimize & _dataArb_io_in_3_valid_T_56 & ~(s2_valid_flush_line | s2_flush_valid_pre_tag_ecc |
          io_cpu_s2_nack)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:790 assert(s2_valid_flush_line || s2_flush_valid || io.cpu.s2_nack)\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_io_cpu_s2_nack_T_4 & (doUncachedResp & _dataArb_io_in_3_valid_T_56)) begin
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
        if (doUncachedResp & _dataArb_io_in_3_valid_T_56 & ~_io_cpu_s2_nack_T_4) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:924 assert(!s2_valid_hit)\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(s1_valid_masked & s1_read & s1_write)) & _dataArb_io_in_3_valid_T_56) begin
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
        if (_dataArb_io_in_3_valid_T_56 & ~(~(s1_valid_masked & s1_read & s1_write))) begin
          $fwrite(32'h80000002,
            "Assertion failed: unsupported D$ operation\n    at DCache.scala:966 assert(!(s1_valid_masked && s1_read && s1_write), \"unsupported D$ operation\")\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_probe = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_probe = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  release_state = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  release_ack_wait = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  release_ack_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s2_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  probe_bits_address = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s2_probe_state_state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  counter_1 = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  s2_release_data_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s1_req_cmd = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  s2_req_cmd = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  pstore1_held = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  pstore1_addr = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_req_addr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  pstore1_mask = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  s1_req_size = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  pstore2_valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  pstore2_addr = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mask = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  s2_not_nacked_in_s1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s2_hit_state_state = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  s1_req_tag = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  s1_req_signed = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  s1_tlb_req_vaddr = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_tlb_req_size = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  s1_tlb_req_cmd = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  s1_flush_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  flushed = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  flushing = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  flushing_req_size = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  cached_grant_wait = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  resetting = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  flushCounter = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  refill_way = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  uncachedInFlight_0 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uncachedReqs_0_addr = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  uncachedReqs_0_tag = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  uncachedReqs_0_size = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  uncachedReqs_0_signed = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  s1_did_read = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  s2_hit_way = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  s2_victim_way_r = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  s2_probe_way = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  s2_req_addr = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  s2_req_tag = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  s2_req_size = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  s2_req_signed = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  s2_tlb_xcpt_pf_ld = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  s2_tlb_xcpt_pf_st = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  s2_tlb_xcpt_ae_ld = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  s2_tlb_xcpt_ae_st = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  s2_tlb_xcpt_ma_ld = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  s2_tlb_xcpt_ma_st = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  s2_pma_cacheable = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s2_uncached_resp_addr = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  s2_vaddr_r = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  s2_flush_valid_pre_tag_ecc = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  s2_meta_corrected_r = _RAND_59[21:0];
  _RAND_60 = {1{`RANDOM}};
  s2_meta_corrected_r_1 = _RAND_60[21:0];
  _RAND_61 = {1{`RANDOM}};
  s2_meta_corrected_r_2 = _RAND_61[21:0];
  _RAND_62 = {1{`RANDOM}};
  s2_meta_corrected_r_3 = _RAND_62[21:0];
  _RAND_63 = {1{`RANDOM}};
  blockUncachedGrant = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  counter = _RAND_64[9:0];
  _RAND_65 = {1{`RANDOM}};
  s2_data = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  pstore1_data = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  pstore1_way = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  pstore_drain_on_miss_REG = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  pstore2_way = _RAND_69[3:0];
  _RAND_70 = {1{`RANDOM}};
  pstore2_storegen_data_r = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  pstore2_storegen_data_r_1 = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  pstore2_storegen_data_r_2 = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  pstore2_storegen_data_r_3 = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  s1_release_data_valid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  io_cpu_s2_xcpt_REG = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  doUncachedResp = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  io_cpu_perf_release_counter = _RAND_78[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule