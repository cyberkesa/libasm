;char        *ft_strdup(const char *s1);
segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	xor		rax, rax
	push	rdi
	call	_ft_strlen
	mov		rdi, rax
	add		rdi, 1
	call	_malloc
	pop		rdi
	cmp		rax, 0
	je		short return
	jne		short return_str

return_str:
	mov		rsi, rdi
	mov		rdi, rax
	call	_ft_strcpy
	ret

return:
	ret