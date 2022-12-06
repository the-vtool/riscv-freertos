cmake_minimum_required(VERSION 3.22)
# project(CMSIS) 
# set(cmsis_startup stm32h743zitx)

# add_library(cmsis STATIC ${CMAKE_SOURCE_DIR}/Core/Startup/startup_${cmsis_startup}.s ${CMAKE_SOURCE_DIR}/Core/Src/system_stm32h7xx.c)
add_library(comrv STATIC #${CMAKE_CURRENT_SOURCE_DIR}/comrv.c
${CMAKE_CURRENT_SOURCE_DIR}/comrv_entry.S)  


#it has to be public because stm32h7xx_hal_def.h depends on stm32h7xx.h
target_include_directories(comrv PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/loc_inc
	${CMAKE_CURRENT_SOURCE_DIR}/api_inc
    ${PROJ_PATH}/framework-wd-riscv-sdk/common/api_inc
    #this include is needed for cmsis because it depends on stm32h7xx_hal.h file
    # ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc
) 

target_link_libraries(comrv PUBLIC psp)
# target_include_directories(cmsis PRIVATE  ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc)       
