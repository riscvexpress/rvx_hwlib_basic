`default_nettype wire
`include "timescale.vh"
module TLB_1(
  input  [31:0] io_req_bits_vaddr,
  output [31:0] io_resp_paddr,
  output        io_resp_ae_inst,
  output        io_resp_cacheable
);
  wire [19:0] vpn = io_req_bits_vaddr[31:12];
  wire [19:0] mpu_ppn = io_req_bits_vaddr[31:12];
  wire [31:0] mpu_physaddr = {mpu_ppn,io_req_bits_vaddr[11:0]};
  wire [31:0] _legal_address_T = mpu_physaddr ^ 32'h3000;
  wire [32:0] _legal_address_T_1 = {1'b0,$signed(_legal_address_T)};
  wire [32:0] _legal_address_T_3 = $signed(_legal_address_T_1) & -33'sh1000;
  wire  _legal_address_T_4 = $signed(_legal_address_T_3) == 33'sh0;
  wire [31:0] _legal_address_T_5 = mpu_physaddr ^ 32'hc000000;
  wire [32:0] _legal_address_T_6 = {1'b0,$signed(_legal_address_T_5)};
  wire [32:0] _legal_address_T_8 = $signed(_legal_address_T_6) & -33'sh4000000;
  wire  _legal_address_T_9 = $signed(_legal_address_T_8) == 33'sh0;
  wire [31:0] _legal_address_T_10 = mpu_physaddr ^ 32'h2000000;
  wire [32:0] _legal_address_T_11 = {1'b0,$signed(_legal_address_T_10)};
  wire [32:0] _legal_address_T_13 = $signed(_legal_address_T_11) & -33'sh10000;
  wire  _legal_address_T_14 = $signed(_legal_address_T_13) == 33'sh0;
  wire [32:0] _legal_address_T_16 = {1'b0,$signed(mpu_physaddr)};
  wire [32:0] _legal_address_T_18 = $signed(_legal_address_T_16) & -33'sh1000;
  wire  _legal_address_T_19 = $signed(_legal_address_T_18) == 33'sh0;
  wire [31:0] _legal_address_T_20 = mpu_physaddr ^ 32'h10000;
  wire [32:0] _legal_address_T_21 = {1'b0,$signed(_legal_address_T_20)};
  wire [32:0] _legal_address_T_23 = $signed(_legal_address_T_21) & -33'sh10000;
  wire  _legal_address_T_24 = $signed(_legal_address_T_23) == 33'sh0;
  wire [31:0] _legal_address_T_25 = mpu_physaddr ^ 32'h10000000;
  wire [32:0] _legal_address_T_26 = {1'b0,$signed(_legal_address_T_25)};
  wire [32:0] _legal_address_T_28 = $signed(_legal_address_T_26) & -33'sh10000000;
  wire  _legal_address_T_29 = $signed(_legal_address_T_28) == 33'sh0;
  wire [31:0] _legal_address_T_30 = mpu_physaddr ^ 32'h20000000;
  wire [32:0] _legal_address_T_31 = {1'b0,$signed(_legal_address_T_30)};
  wire [32:0] _legal_address_T_33 = $signed(_legal_address_T_31) & -33'sh20000000;
  wire  _legal_address_T_34 = $signed(_legal_address_T_33) == 33'sh0;
  wire [31:0] _legal_address_T_35 = mpu_physaddr ^ 32'h40000000;
  wire [32:0] _legal_address_T_36 = {1'b0,$signed(_legal_address_T_35)};
  wire [32:0] _legal_address_T_38 = $signed(_legal_address_T_36) & -33'sh40000000;
  wire  _legal_address_T_39 = $signed(_legal_address_T_38) == 33'sh0;
  wire [31:0] _legal_address_T_40 = mpu_physaddr ^ 32'h80000000;
  wire [32:0] _legal_address_T_41 = {1'b0,$signed(_legal_address_T_40)};
  wire [32:0] _legal_address_T_43 = $signed(_legal_address_T_41) & -33'sh40000000;
  wire  _legal_address_T_44 = $signed(_legal_address_T_43) == 33'sh0;
  wire  _legal_address_T_47 = _legal_address_T_29 | _legal_address_T_34 | _legal_address_T_39 | _legal_address_T_44;
  wire [31:0] _legal_address_T_48 = mpu_physaddr ^ 32'hc0000000;
  wire [32:0] _legal_address_T_49 = {1'b0,$signed(_legal_address_T_48)};
  wire [32:0] _legal_address_T_51 = $signed(_legal_address_T_49) & -33'sh40000000;
  wire  _legal_address_T_52 = $signed(_legal_address_T_51) == 33'sh0;
  wire  legal_address = _legal_address_T_4 | _legal_address_T_9 | _legal_address_T_14 | _legal_address_T_19 |
    _legal_address_T_24 | _legal_address_T_47 | _legal_address_T_52;
  wire [32:0] _cacheable_T_20 = $signed(_legal_address_T_21) & 33'shf8010000;
  wire  _cacheable_T_21 = $signed(_cacheable_T_20) == 33'sh0;
  wire [32:0] _cacheable_T_25 = $signed(_legal_address_T_26) & 33'shf0000000;
  wire  _cacheable_T_26 = $signed(_cacheable_T_25) == 33'sh0;
  wire [32:0] _cacheable_T_30 = $signed(_legal_address_T_31) & 33'she0000000;
  wire  _cacheable_T_31 = $signed(_cacheable_T_30) == 33'sh0;
  wire [32:0] _cacheable_T_35 = $signed(_legal_address_T_36) & 33'shc0000000;
  wire  _cacheable_T_36 = $signed(_cacheable_T_35) == 33'sh0;
  wire [32:0] _cacheable_T_40 = $signed(_legal_address_T_41) & 33'shc0000000;
  wire  _cacheable_T_41 = $signed(_cacheable_T_40) == 33'sh0;
  wire  _cacheable_T_45 = _cacheable_T_21 | _cacheable_T_26 | _cacheable_T_31 | _cacheable_T_36 | _cacheable_T_41;
  wire  cacheable = legal_address & _cacheable_T_45;
  wire  _prot_r_T_6 = ~_legal_address_T_19;
  wire [32:0] _prot_w_T_28 = $signed(_legal_address_T_41) & 33'sh80000000;
  wire  _prot_w_T_29 = $signed(_prot_w_T_28) == 33'sh0;
  wire [32:0] _prot_x_T_3 = $signed(_legal_address_T_16) & 33'shfa000000;
  wire  _prot_x_T_4 = $signed(_prot_x_T_3) == 33'sh0;
  wire  _prot_x_T_28 = _prot_x_T_4 | _cacheable_T_26 | _cacheable_T_31 | _cacheable_T_36 | _prot_w_T_29;
  wire  _prot_x_T_43 = legal_address & _prot_x_T_28;
  wire  prot_x = _prot_x_T_43 & _prot_r_T_6;
  wire [1:0] _px_array_T_1 = prot_x ? 2'h3 : 2'h0;
  wire [6:0] px_array = {_px_array_T_1,5'h0};
  wire [1:0] _c_array_T_1 = cacheable ? 2'h3 : 2'h0;
  wire [6:0] c_array = {_c_array_T_1,5'h0};
  wire [6:0] _io_resp_ae_inst_T = ~px_array;
  wire [6:0] _io_resp_ae_inst_T_1 = _io_resp_ae_inst_T & 7'h40;
  wire [6:0] _io_resp_cacheable_T = c_array & 7'h40;
  assign io_resp_paddr = {vpn,io_req_bits_vaddr[11:0]};
  assign io_resp_ae_inst = |_io_resp_ae_inst_T_1;
  assign io_resp_cacheable = |_io_resp_cacheable_T;
endmodule