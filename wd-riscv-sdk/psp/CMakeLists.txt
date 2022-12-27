cmake_minimum_required(VERSION 3.22)

add_library(psp STATIC
${CMAKE_CURRENT_SOURCE_DIR}/psp_cache_control_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_corr_err_cnt_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_ext_interrupts_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_interrupts_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_int_vect_eh1.S

${CMAKE_CURRENT_SOURCE_DIR}/psp_memory_utils.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_nmi_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_performance_monitor_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_pmc_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_timers_eh1.c

${CMAKE_CURRENT_SOURCE_DIR}/psp_version.c
)  

target_include_directories(psp PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/api_inc
	${PROJ_PATH}/wd-riscv-sdk/common/api_inc
) 

target_compile_options(psp PUBLIC "-march=rv32imac")
target_compile_options(psp PUBLIC "-mabi=ilp32")
target_compile_options(psp PUBLIC "-mcmodel=medlow")     
