echo Compiling... &&^
arm-none-eabi-gcc -O0 -c -g -mcpu=cortex-m4 -mthumb -o obj/main.o main.c -Iinclude &&^
arm-none-eabi-gcc -O0 -c -g -mcpu=cortex-m4 -mthumb -o obj/tm4c1294xl_startup.o tm4c1294xl_startup.c &&^
echo Linking... &&^
arm-none-eabi-ld -Ttm4c1294xl.lds -o bin/out.elf obj/*.o &&^
echo Objcopy... &&^
arm-none-eabi-objcopy -O binary bin/out.elf bin/out.bin &&^
echo Flashing... &&^
lmflash -q ek-tm4c1294xl -v -r bin/out.bin