;int		get_num(char c)
;{
;	if (c == 'a' || c == 'A')
;		return (10);
;	if (c == 'b' || c == 'B')
;		return (11);
;	if (c == 'c' || c == 'C')
;		return (12);
;	if (c == 'd' || c == 'D')
;		return (13);
;	if (c == 'e' || c == 'E')
;		return (14);
;	if (c == 'f' || c == 'F')
;		return (15);
;	else
;		return (c - 48);
;}
;
;                       [rdi]     [rsi]
;int		atoi_base(char *str, int base)
;{
;	int i;
;	int res;
;
;	while (*str != '\0' && *str != 'x')
;		str++;
;	if (*str == '\0')
;		return (0);
;	i = 1;
;	res = 0;
;	while (str[i] != '\0')
;	{
;		if (ft_strlen(str) > 1 && i == 0)
;			res = base * rax;
;		else if (ft_strlen(str) > 1 && i > 0)
;			res *= base;
;		res += rax;
;		i++;
;	}
;	return (res);
;}
;
segment .text
    global _ft_atoi_base

_ft_atoi_base:
    xor     rax, rax
    xor     rdx, rdx
    xor     r15b, r15b
    xor     r8, r8
    xor     r9, r9
    xor     r11, r11
    xor     rcx, rcx
    jmp     cmpr

cmpr:
    cmp     byte [rdi + r9], 0x20           ;' '
    je      short incr
    cmp     byte [rdi + r9], 0x0B           ;\v
    je      short incr
    cmp     byte [rdi + r9], 0x09           ;\t
    je      short incr
    cmp     byte [rdi + r9], 0x0D           ;\r
    je      short incr
    cmp     byte [rdi + r9], 0x0A           ;\n
    je      short incr
    cmp     byte [rdi + r9], 0x0C           ;\f
    je      short incr
    cmp     byte [rdi + r9], 0x2D           ;\-
    je      short sign_minus
    jne     short __get_num

____error:
    mov     rax, -1
    ret

sign_minus:
    add     r15b, 21

incr:
    add     r9, 1
    jmp     short cmpr

number:
    xor     al, al
    mov     al, byte [rdi + r9]
    jmp     short __get_num

__get_num:
    cmp    rax, 0x30                          ;0
    je     convert_from_ascii
    cmp    rax, 0x31                          ;1
    je     short convert_from_ascii
    cmp    rax, 0x32                          ;2
    je     short convert_from_ascii
    cmp    rax, 0x33                          ;3
    je     short convert_from_ascii
    cmp    rax, 0x34                          ;4
    je     short convert_from_ascii
    cmp    rax, 0x35                          ;5
    je     short convert_from_ascii
    cmp    rax, 0x36                          ;6
    je     short convert_from_ascii
    cmp    rax, 0x37                          ;7
    je     short convert_from_ascii
    cmp    rax, 0x38                          ;8
    je     short convert_from_ascii
    cmp    rax, 0x39                          ;9
    je     short convert_from_ascii
    cmp    rax, 0x41                          ;A
    je     short x16_A
    cmp    rax, 0x42                          ;B
    je     short x16_B
    cmp    rax, 0x43                          ;C
    je     short x16_C
    cmp    rax, 0x44                          ;D
    je     short x16_D
    cmp    rax, 0x45                          ;E
    je     short x16_E
    cmp    rax, 0x46                          ;F
    je     short x16_F
    cmp    rax, 0x61                          ;a
    je     short x16_A
    cmp    rax, 0x62                          ;b
    je     short x16_B
    cmp    rax, 0x63                          ;c
    je     short x16_C
    cmp    rax, 0x64                          ;d
    je     short x16_D
    cmp    rax, 0x65                          ;e
    je     short x16_E
    cmp    rax, 0x66                          ;f
    je     short x16_F
    ;jne     ____error

convert_from_ascii:
    sub     rax, 0x30
    jmp     short natural_number

x16_A:
    mov     rax, 10
    jmp     short natural_number

x16_B:
    mov     rax, 11
    jmp     short natural_number

x16_C:
    mov     rax, 12
    jmp     short natural_number
    add     rax, r11
    mov     r8, rax
    jmp     short __check_next_position

x16_D:
    mov     rax, 13
    jmp     short natural_number

x16_E:
    mov     rax, 14
    jmp     short natural_number

x16_F:
    mov     rax, 15
    jmp     short natural_number

__next:
    mov     rax, r8
    xor     r8, r8
    mov     cl, sil
    mul     rcx
    add     rax, r11
    mov     r8, rax
    jmp     short __check_next_position

__firts_it:
    add     r8, rax
    jmp     short __check_next_position

__check_next_position:
    add     r9, 1
    cmp     byte [rdi + r9], 0
    je      short __return
    jmp     cmpr

natural_number:
    mov     r11, rax
    cmp     r8, 0
    je      short __firts_it
    jmp     short __next

__return:
    mov     rax, r8
    ;cmp     r15b, 21
    ;je      short __negative
    ret

 __negative:
    ;neg     rax
    ret