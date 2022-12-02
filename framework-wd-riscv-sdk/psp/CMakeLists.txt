cmake_minimum_required(VERSION 3.22)
# project(CMSIS) 
# set(cmsis_startup stm32h743zitx)

# add_library(cmsis STATIC ${CMAKE_SOURCE_DIR}/Core/Startup/startup_${cmsis_startup}.s ${CMAKE_SOURCE_DIR}/Core/Src/system_stm32h7xx.c)
add_library(psp STATIC ${CMAKE_CURRENT_SOURCE_DIR}/psp_atomics_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_cache_control_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_cache_control_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_corr_err_cnt_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_corr_err_cnt_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_ext_interrupts_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_ext_interrupts_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_internal_mutex_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_interrupts_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_interrupts_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_interrupts_hifive1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_int_vect_eh1.S
${CMAKE_CURRENT_SOURCE_DIR}/psp_int_vect_eh2.S
${CMAKE_CURRENT_SOURCE_DIR}/psp_int_vect_hifive1.S
${CMAKE_CURRENT_SOURCE_DIR}/psp_memory_utils.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_mutex_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_nmi_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_nmi_eh2.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_performance_monitor_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_pmc_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_timer_hifive1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_timers_eh1.c
${CMAKE_CURRENT_SOURCE_DIR}/psp_version.c
)  


#it has to be public because stm32h7xx_hal_def.h depends on stm32h7xx.h
target_include_directories(psp PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/api_inc
	${CMAKE_CURRENT_SOURCE_DIR}/loc_inc
    #this include is needed for cmsis because it depends on stm32h7xx_hal.h file
    # ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc
) 
  
# target_include_directories(cmsis PRIVATE  ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc)       
