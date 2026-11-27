## ****************************************************************************
## ****************************************************************************
## Copyright SoC Design Research Group, All rights reservxd.
## Electronics and Telecommunications Research Institute (ETRI)
## 
## THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
## WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
## TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
## REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
## SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
## IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
## COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
## ****************************************************************************
## 2026-11-27
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

foreach pkg_name {
	prim_alert_pkg
	prim_cipher_pkg
	prim_count_pkg
	prim_mubi_pkg
	prim_ram_1p_pkg
	prim_ram_2p_pkg
	prim_secded_pkg
	prim_subreg_pkg
	prim_trivium_pkg
	prim_util_pkg
	top_pkg
	tlul_pkg
	entropy_src_pkg
	csrng_pkg
	csrng_reg_pkg
	edn_pkg
	lc_ctrl_reg_pkg
	lc_ctrl_state_pkg
	lc_ctrl_pkg
	keymgr_reg_pkg
	keymgr_pkg
	gpio_reg_pkg
	aes_reg_pkg
	aes_pkg
	aes_sbox_canright_pkg
	otp_ctrl_reg_pkg
	otp_ctrl_pkg
	otbn_pkg
	otbn_reg_pkg
	spi_device_reg_pkg
	spi_device_pkg
	spi_host_reg_pkg
	spi_host_cmd_pkg
} {
	lappend verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/pkg/${pkg_name}.sv
}
