CC = arm-none-eabi-gcc
LINKER = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -O0 -g -mcpu=cortex-m4 -mthumb
INCLUDE = -I./

SRC		:= src
SRCS    := $(wildcard *.c)
OBJ     := ./obj
OBJS    := $(patsubst %.c,$(OBJ)/%.o,$(SRCS))

STARTUP := tm4c1294xl_startup

all: objcopy

objcopy: link
	$(OBJCOPY) -O binary bin/out.elf bin/out.bin

link: $(OBJS)
	$(LINKER) -Ttm4c1294xl.lds -o bin/out.elf driverlib/obj/*.o obj/*.o

$(OBJ)/%.o: %.c | $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

flash: all
	lmflash -q ek-tm4c1294xl -v -r bin/out.bin
