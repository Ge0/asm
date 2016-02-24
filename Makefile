all: raw_elf raw_elf64

raw_elf: raw_elf.asm
raw_elf64: raw_elf64.asm

raw_elf.asm:
	nasm -f bin examples/raw_elf.asm
	chmod +x examples/raw_elf

raw_elf64.asm:
	nasm -f bin examples/raw_elf64.asm
	chmod +x examples/raw_elf64

clean:
	@rm -f examples/raw_elf examples/raw_elf64
