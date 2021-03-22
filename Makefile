# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vwinfred <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/19 20:00:36 by vwinfred          #+#    #+#              #
#    Updated: 2021/03/19 20:00:37 by vwinfred         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =			libasm.a

ASM =			nasm
ASMFLAGS =		-f macho64

CC =			gcc
CCFLAGS =		-Wall -Werror -Wextra

SRCS =			ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s	\
				ft_read.s	\
				ft_strdup.s

OBJECTS =		$(addprefix $(OBJD), $(patsubst %.s, %.o, $(SRCS)))

OBJD = 			objects/

$(OBJD)%.o	: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJD) $(OBJECTS) 
	ar rcs $(NAME) $(OBJECTS)

$(OBJD):
	@mkdir -p objects

all: $(NAME)

clean:
	rm -f $(OBJECTS)

test: all
	$(CC) $(CCFLAGS) -I./libasm.h libasm.a main.c -o test_my_libasm
	./test_my_libasm

fclean: clean
	rm -rf $(OBJD)
	rm -f $(NAME)
	rm -f test_my_libasm

re: fclean all
