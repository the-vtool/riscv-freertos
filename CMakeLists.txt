cmake_minimum_required(VERSION 3.22)

# preventing cmake to create binaries in source root directory
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR “In-source build detected!”)
endif()

# Setup compiler settings
set(CMAKE_C_STANDARD                11)    
set(CMAKE_C_STANDARD_REQUIRED       ON)  
set(CMAKE_C_EXTENSIONS              ON)      
set(CMAKE_CXX_STANDARD              20)
set(CMAKE_CXX_STANDARD_REQUIRED     ON)
set(CMAKE_CXX_EXTENSIONS            ON)
set(PROJ_PATH                       ${CMAKE_CURRENT_SOURCE_DIR})
message("Build type: "              ${CMAKE_BUILD_TYPE})
  
# 
# Core project settings
#
project(riscv_freertos)     
enable_language(C CXX ASM)
 
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
# include(gcc-arm-none-eabi)
 
# Set linker script
set(EXECUTABLE                      ${CMAKE_PROJECT_NAME})
  
#  
# List of source files to compile 
#     
set(sources_SRCS    
# Put here your source files, one in each line, relative to CMakeLists.txt file location
    ${PROJ_PATH}/src/main.c
)    
    
#    
# Include directories 
#
set(include_path_DIRS
    ${PROJ_PATH}/inc
    ${PROJ_PATH}/framework-wd-riscv-sdk/common/api_inc

    # Put here your include dirs, one in each line, relative to CMakeLists.txt file location
)

#  
# Instruction from lwip library
#
# set(LWIP_DIR ${PROJ_PATH}/lwip)      
 
#
# Adding subdirectories
#

add_subdirectory(FreeRTOS/Source)

add_subdirectory(framework-wd-riscv-sdk) 
 

# Executable files 
add_executable(${EXECUTABLE} ${sources_SRCS})

# Include paths
target_include_directories(${EXECUTABLE} PRIVATE ${include_path_DIRS})

# Link builded library FreeRTOS Middleware    
target_link_libraries(${EXECUTABLE} bsp 
                                    psp
                                    comrv
                                    #common
                                    FreeRTOS_source)  


# Execute post-build to print size
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${EXECUTABLE}>
)

# Convert output to hex and binary
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.hex
)

# Convert to bin file -> add conditional check?
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${EXECUTABLE}> ${EXECUTABLE}.bin
) 
