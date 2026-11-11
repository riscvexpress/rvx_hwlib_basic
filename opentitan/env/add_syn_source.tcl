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
## 2026-11-05
## Kyuseung Han (han@etri.re.kr)
## ****************************************************************************
## ****************************************************************************

set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/prim/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/top/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/tlul/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/entropy_src/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/csrng/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/edn/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/lc_ctrl/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/keymgr/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/gpio/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/aes/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/otp_ctrl/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/otbn/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/spi_device/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/spi_host/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/trvp/*.sv]
set verilog_module_list [concat_file_list $verilog_module_list ${RVX_HWLIB_BASIC_HOME}/opentitan/trvp/*.v]
lappend verilog_include_list ${RVX_HWLIB_BASIC_HOME}/opentitan/include
lappend define_list SYNTHESIS