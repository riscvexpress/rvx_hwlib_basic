include ${RVX_RELEASE_HOME}/rvx_config_path.mh

GIT_DIR=~/riscv_git/cva6_v5

IMPORT_DIR_NAME = imported
TARGET_INC_DIR_NAME = include
TARGET_SRC_DIR_NAME = src
MANUAL_DIR_NAME = manual

IMPORT_DIR = ${CURDIR}/${IMPORT_DIR_NAME}
TARGET_INC_DIR = ${CURDIR}/${TARGET_INC_DIR_NAME}
TARGET_SRC_DIR = ${CURDIR}/${TARGET_SRC_DIR_NAME}
MANUAL_DIR = ${CURDIR}/${MANUAL_DIR_NAME}

IMPORT_LIST = ${CURDIR}/import_list.txt
INFO_FILE = ${CURDIR}/git_info.txt

update: import porting

import: clean_import import_from_git git_info

clean_import:
	rm -rf ./${IMPORT_DIR_NAME}

import_from_git:
	mkdir -p ${IMPORT_DIR}
	cd ${GIT_DIR} && cp --parents $$(cat ${IMPORT_LIST}) ${IMPORT_DIR}
	cp ${GIT_DIR}/LICENSE ${GIT_DIR}/LICENSE.Berkeley ${GIT_DIR}/LICENSE.SiFive ${IMPORT_DIR}

git_info:
	python3 ${RVX_UTIL_HOME}/generate_git_info.py -cmd url -p ${GIT_DIR} -o ${INFO_FILE}
	python3 ${RVX_UTIL_HOME}/generate_git_info.py -cmd version -p ${GIT_DIR} -o ${INFO_FILE}  --append
	cat ${INFO_FILE}

porting: clean_porting copy tracer assertion wfi ni overwrite_manual

clean_porting:
	rm -rf ./${TARGET_INC_DIR_NAME}
	rm -rf ./${TARGET_SRC_DIR_NAME}

copy:
	mkdir -p ${TARGET_INC_DIR}/common_cells
	mkdir -p ${TARGET_SRC_DIR}
	find ${IMPORT_DIR} -name "*.sv" -exec cp {} ${TARGET_SRC_DIR} \;
	cp ${IMPORT_DIR}/core/include/*.svh ${TARGET_INC_DIR}
	cp ${IMPORT_DIR}/vendor/pulp-platform/common_cells/include/common_cells/*.svh ${TARGET_INC_DIR}/common_cells

tracer:
	sed -i -e 's#^`ifndef VERILATOR$$#`ifdef CVA6_INSTR_TRACER\n`ifndef VERILATOR#' -e 's#^`endif  // VERILATOR$$#`endif  // VERILATOR\n`endif#' ${TARGET_SRC_DIR}/cva6.sv
	grep -c "CVA6_INSTR_TRACER" ${TARGET_SRC_DIR}/cva6.sv

assertion:
	sed -i -e 's#disable iff (!rst_ni)#disable iff (rst_ni !== 1'"'"'b1)#g' -e 's#disable iff (~rst_ni)#disable iff (rst_ni !== 1'"'"'b1)#g' -e 's#disable iff (!rst_ni || #disable iff (rst_ni !== 1'"'"'b1 || #g' ${TARGET_SRC_DIR}/*.sv

wfi:
	perl -0pi -e 's#\n(  end\n\n  // -+\n  // CSR OP Select Logic)#\n    if (wfi_q && !wfi_d) flush_o = 1'"'"'b1;\n$$1#' ${TARGET_SRC_DIR}/csr_regfile.sv
	grep -c "wfi_q && !wfi_d" ${TARGET_SRC_DIR}/csr_regfile.sv

ni:
	sed -i 's#CVA6Cfg, {{52 - CVA6Cfg.PPNW{1'"'"'b0}}, dtlb_ppn_i, 12'"'"'d0}#CVA6Cfg, CVA6Cfg.MmuPresent ? {{52 - CVA6Cfg.PPNW{1'"'"'b0}}, dtlb_ppn_i, 12'"'"'d0} : 64'"'"'(lsu_ctrl_i.vaddr)#' ${TARGET_SRC_DIR}/load_unit.sv
	grep -c "64'(lsu_ctrl_i.vaddr)" ${TARGET_SRC_DIR}/load_unit.sv

overwrite_manual:
	cd ${MANUAL_DIR} && cp -r * ${TARGET_SRC_DIR}
