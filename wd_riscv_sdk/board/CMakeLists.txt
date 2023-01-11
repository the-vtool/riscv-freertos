cmake_minimum_required(VERSION 3.22)

add_library(bsp STATIC ${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/startup.S
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_external_interrupts.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_printf.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_timer.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_version.c)  


target_include_directories(bsp PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp
	${PROJ_PATH}/wd_riscv_sdk/common/api_inc
)

target_link_libraries(bsp PUBLIC psp)



