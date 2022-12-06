set(CMAKE_SYSTEM_NAME               Generic)
set(CMAKE_SYSTEM_PROCESSOR          riscv)

# Some default GCC settings
# arm-none-eabi- must be part of path environment
set(TOOLCHAIN_PREFIX                riscv64-unknown-elf-)
set(FLAGS                           "-fdata-sections -ffunction-sections -Wl,--gc-sections ")
set(CPP_FLAGS                       "-fno-rtti -fno-exceptions -fno-threadsafe-statics")

# Define compiler settings
set(CMAKE_C_COMPILER                ${TOOLCHAIN_PREFIX}gcc)
# string(APPEND CMAKE_C_COMPILER " ${FLAGS}")
set(CMAKE_ASM_COMPILER              ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER              ${TOOLCHAIN_PREFIX}g++ ${FLAGS} ${CPP_FLAGS})
set(CMAKE_OBJCOPY                   ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE                      ${TOOLCHAIN_PREFIX}size)

set(CMAKE_EXECUTABLE_SUFFIX_ASM     ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C       ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX     ".elf")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(linker_script_SRC               ${CMAKE_CURRENT_SOURCE_DIR}/link.ld)

#
# Core MCU flags, CPU, instruction set and FPU setup
# Needs to be set properly for your MCU
# for arm "-mthumb -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard"
# added -specs=picolibc.specs because stdint.h wasn't found
# for picolibc.specs
# sudo apt install picolibc-riscv64-unknown-elf
# riscv64-unknown-elf-gcc -specs=picolibc.specs -march=rv32i -mabi=ilp32 -c test.c
set(CPU_PARAMETERS "-specs=picolibc.specs -march=rv32imac -mabi=ilp32 -mcmodel=medlow")

if( NOT C_FLAGS_INITIALIZED )
    # only do this on the first pass through to avoid overwriting user added options.
    set( C_FLAGS_INITIALIZED "yes" CACHE INTERNAL "Are compiler flags already set?" )

    # Overwrite CMake's defaults...

    string(APPEND CMAKE_C_FLAGS         "${CPU_PARAMETERS} -Wall -Wextra -Wpedantic -Wno-unused-parameter -Og -g3 -ggdb" )
    string(APPEND CMAKE_CXX_FLAGS       "-fno-rtti -fno-exceptions -fno-threadsafe-statics")
    # set( CMAKE_C_FLAGS_DEBUG          "-g -DDEBUG")
    # set( CMAKE_C_FLAGS_RELEASE        "-O3 -DNDEBUG" )
    # set( CMAKE_C_FLAGS_MINSIZEREL     "${CMAKE_C_FLAGS_RELEASE}" )
    # set( CMAKE_C_FLAGS_RELWITHDEBINFO "-O3 -g -gdwarf-3" )
    string(APPEND CMAKE_EXE_LINKER_FLAGS       "-T${linker_script_SRC} ${CPU_PARAMETERS} -Wl,-Map=${CMAKE_PROJECT_NAME}.map --specs=nosys.specs -u _printf_float -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group -Wl,--print-memory-usage")


endif()

#
# Symbols definition
#
set(symbols_SYMB
    "DEBUG"
    "D_NEXYS_A7"
    "D_SWERV_EH1"
    "D_TICK_TIME_MS=4"
    "D_ISR_STACK_SIZE=400"
    "D_MTIME_ADDRESS=0x80001020"
    "D_MTIMECMP_ADDRESS=0x80001028"
    "D_CLOCK_RATE=50000000"
    "D_PIC_BASE_ADDRESS=0xF00C0000"
    "D_PIC_NUM_OF_EXT_INTERRUPTS=256"
    "D_EXT_INTERRUPT_FIRST_SOURCE_USED=0"
    "D_EXT_INTERRUPT_LAST_SOURCE_USED=255"
    "D_EXT_INTS_GENERATION_REG_ADDRESS=0x8000100B"
    "D_TIMER_DURATION_SETUP_ADDRESS=0x80001030"
    "D_TIMER_ACTIVATION_ADDRESS=0x80001034"
    "D_NMI_VEC_ADDRESSS=0x8000100C"
    "__riscv_xlen=32"
    
    # "USE_HAL_DRIVER"
    # "STM32H743xx"
    # "USE_FULL_LL_DRIVER"
    # "LWIP_COMPAT_MUTEX_ALLOWED"
    #"LWIP_TCP" # added for TCP EXAMPLE
    # Put here your symbols (preprocessor defines), one in each line
    # Encapsulate them with double quotes for safety purpose
)


#
# Compile definition that are applied to all subdirectories
#
add_compile_definitions(${symbols_SYMB})


set(CMAKE_C_FLAGS            "${CPU_PARAMETERS} -Wall -Wextra -Wpedantic -Wno-unused-parameter -Og -g3 -ggdb")
set(CMAKE_CXX_FLAGS          "-fno-rtti -fno-exceptions -fno-threadsafe-statics")
set(CMAKE_EXE_LINKER_FLAGS   "-T${linker_script_SRC} ${CPU_PARAMETERS} -Wl,-Map=${CMAKE_PROJECT_NAME}.map --specs=nosys.specs -u _printf_float -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group -Wl,--print-memory-usage")


# Save the current compiler flags to the cache every time cmake configures the project.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "compiler flags" FORCE)

# # Save the current linker flags to the cache every time cmake configures the project.
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "linker flags" FORCE)


