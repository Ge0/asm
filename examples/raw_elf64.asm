%include "elf/defines.inc"
bits 64
ORG 0x0000000000400000
header:
  istruc Elf64_Ehdr
    at Elf64_Ehdr.e_ident,      db `\x7FELF`, ELFCLASS64, ELFDATA2LSB 
                                db EV_CURRENT, ELFOSABI_NONE, 0, 0, 0, 0
    at Elf64_Ehdr.e_type,       dw ET_EXEC
    at Elf64_Ehdr.e_machine,    dw EM_X86_64
    at Elf64_Ehdr.e_version,    dd EV_CURRENT
    at Elf64_Ehdr.e_entry,      dd _start
    at Elf64_Ehdr.e_phoff,      dq (program_section_headers - header)
    at Elf64_Ehdr.e_shoff,      dq 0
    at Elf64_Ehdr.e_flags,      dd 0
    at Elf64_Ehdr.e_ehsize,     dw Elf64_Ehdr.size
    at Elf64_Ehdr.e_phentsize,  dw Elf64_Phdr.size
    at Elf64_Ehdr.e_phnum,      dw 1
    at Elf64_Ehdr.e_shentsize,  dw 0
    at Elf64_Ehdr.e_shnum,      dw 0
    at Elf64_Ehdr.e_shstrndx,   dw 0
  iend

program_section_headers:
  istruc Elf64_Phdr
    at Elf64_Phdr.p_type,   dd PT_LOAD
    at Elf64_Phdr.p_flags,  dd PF_X | PF_R
    at Elf64_Phdr.p_offset, dq 0
    at Elf64_Phdr.p_vaddr,  dq header
    at Elf64_Phdr.p_paddr,  dq header
    at Elf64_Phdr.p_filesz, dq (end - header)
    at Elf64_Phdr.p_memsz,  dq (end - header)
    at Elf64_Phdr.p_align,  dq 0x1000
  iend


data:
  HelloWorld  db "Hello world!", 10
_start:
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, HelloWorld
  mov rdx, 13
  syscall

  mov rax, 60 ; sys_exit
  xor rdi, rdi ; exit(0)
  syscall
end:
