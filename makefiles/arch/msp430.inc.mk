# Target architecture for the build. Use msp430 if you are unsure.
export TARGET_ARCH ?= msp430

# define build specific options
CFLAGS_CPU   = -mmcu=$(CPU_MODEL)
CFLAGS_LINK  = -ffunction-sections -fdata-sections
CFLAGS_DBG  ?= -gdwarf-2
CFLAGS_OPT  ?= -Os

LINKER_SCRIPTS_PATH = -I$(RIOTCPU)/msp430_common/ldscripts/msp430-gcc-support-files/include \
					  -L$(RIOTCPU)/msp430_common/ldscripts/msp430-gcc-support-files/include
# export compiler flags
export CFLAGS += $(CFLAGS_CPU) $(LINKER_SCRIPTS_PATH) $(CFLAGS_LINK) $(CFLAGS_DBG) $(CFLAGS_OPT)
# export assmebly flags
export ASFLAGS += $(CFLAGS_CPU) $(LINKER_SCRIPTS_PATH) --defsym $(CPU_MODEL)=1 $(CFLAGS_DBG)
# export linker flags
export LINKFLAGS += $(CFLAGS_CPU) $(LINKER_SCRIPTS_PATH) $(CFLAGS_DBG) $(CFLAGS_OPT) -Wl,--gc-sections -static -lgcc

# compiler
COMPILER_PATH_PREFIX = $(RIOTCPU)/msp430_common/toolchain/msp430-gcc-7.3.1.24_linux64
PREFIX = $(COMPILER_PATH_PREFIX)/bin/msp430-elf-

# include library path
INCLUDES += -I$(COMPILER_PATH_PREFIX)/include \
			-I$(COMPILER_PATH_PREFIX)/msp430-elf/include \
			-I$(COMPILER_PATH_PREFIX)/lib/gcc/msp430-elf/7.3.1/include
