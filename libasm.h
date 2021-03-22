/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vwinfred <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/19 20:00:58 by vwinfred          #+#    #+#             */
/*   Updated: 2021/03/19 20:00:59 by vwinfred         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

char        *ft_strcpy(char *dst, const char *src);
char        *ft_strdup(const char *s1);
size_t      ft_strlen(const char *s);
size_t		ft_write(int fd, void *buf, int n);
size_t		ft_read(int fd, void *buf, int n);
int         ft_strcmp(const char *s1, const char *s2);

#endif
