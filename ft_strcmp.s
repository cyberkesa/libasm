;int         ft_strcmp(const char *s1, const char *s2);
segment .text
	global _ft_strcmp

_ft_strcmp: 
	xor     rax, rax
	xor     rcx, rcx
	xor     rdx, rdx
	
cmpr:
	mov     al, byte [rdi + rcx]
	mov     dl, byte [rsi + rcx]
	cmp     al, dl
	jne     short return
	cmp     byte [rdi + rcx], 0
	je      short return
	jmp		short new_loop

new_loop:
	inc     rcx
	jmp     short cmpr

return:
	sub     rax, rdx
	ret
