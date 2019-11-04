CC = arm-none-eabi-gcc
LINKER = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-OBJCOPY
CFLAGS = -O0 -g -mcpu=cortex-m4 -mthumb
INCLUDE = -I../

SRCS    := $(wildcard *.c)
OBJ     := ./obj
OBJS    := $(patsubst %.c,$(OBJ)/%.o,$(SRCS))

all: $(OBJS)

$(OBJ)/%.o: %.c | $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDE) -Dgcc -c $< -o $@
