raw_elf: raw_elf.asm

raw_elf.asm:
	nasm -f bin examples/raw_elf.asm
	chmod +x examples/raw_elf

clean:
	@rm -f examples/raw_elf
