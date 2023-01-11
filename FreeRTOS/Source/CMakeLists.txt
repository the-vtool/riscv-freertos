cmake_minimum_required(VERSION 3.22)

# add_library to FreeRTOS
add_library(FreeRTOS_source STATIC  
    ${CMAKE_CURRENT_SOURCE_DIR}/croutine.c
    ${CMAKE_CURRENT_SOURCE_DIR}/event_groups.c
    ${CMAKE_CURRENT_SOURCE_DIR}/list.c
    ${CMAKE_CURRENT_SOURCE_DIR}/queue.c
    ${CMAKE_CURRENT_SOURCE_DIR}/stream_buffer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/tasks.c
    ${CMAKE_CURRENT_SOURCE_DIR}/timers.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/MemMang/heap_1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/MemMang/heap_2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/MemMang/heap_3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/MemMang/heap_4.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/MemMang/heap_5.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/GCC/RISC-V/port.c
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/GCC/RISC-V/portASM.S
    

)

# link HAL driver lib with CMSIS library in it
# target_link_libraries(FreeRTOS_source stm32h7xx_hal)

target_include_directories(FreeRTOS_source PUBLIC  

    ${CMAKE_CURRENT_SOURCE_DIR}/
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/portable/GCC/RISC-V
    
)

target_link_libraries(FreeRTOS_source PUBLIC psp)

# add_subdirectory(CMSIS_RTOS_V2)

