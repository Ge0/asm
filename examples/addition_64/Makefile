addition64: addition64.o
	gcc -o addition64 addition64.o

addition64.o:
	nasm -f elf64 addition64.asm -o addition64.o

clean:
	@rm -Rf *.o
