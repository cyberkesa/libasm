;size_t      ft_strlen(const char *s);
segment .text
	global _ft_strlen

_ft_strlen:
	xor 	rax, rax
	mov     rsi, rdi
	jmp 	short loop

loop:
	cmp 	byte [rdi], 0
	je 		short return
	inc		rdi
	jmp 	short loop

return:
	sub		rdi, rsi
	mov		rax, rdi
	ret