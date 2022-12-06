cmake_minimum_required(VERSION 3.22)
# project(CMSIS) 
# set(cmsis_startup stm32h743zitx)

# add_library(cmsis STATIC ${CMAKE_SOURCE_DIR}/Core/Startup/startup_${cmsis_startup}.s ${CMAKE_SOURCE_DIR}/Core/Src/system_stm32h7xx.c)
add_library(bsp STATIC ${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/startup.S
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_external_interrupts.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_printf.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_timer.c
${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp/bsp_version.c)  


#it has to be public because stm32h7xx_hal_def.h depends on stm32h7xx.h
target_include_directories(bsp PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/nexys_a7_eh1/bsp
#	${CMAKE_CURRENT_SOURCE_DIR}/Include
    #this include is needed for cmsis because it depends on stm32h7xx_hal.h file
    # ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc
) 
  
# target_include_directories(cmsis PRIVATE  ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc)       
