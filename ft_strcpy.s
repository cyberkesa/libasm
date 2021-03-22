;char        *ft_strcpy(char *dst, const char *src);
segment .text
	global _ft_strcpy
    extern _ft_strlen

_ft_strcpy:
	push 	rdi
	mov 	rdi, rsi
	call 	_ft_strlen
	mov 	rcx, rax
	pop 	rdi
	cld
	jmp		copy

copy:
	mov 	rax, rdi
	rep 	movsb
	mov 	byte [rdi], 0
	ret