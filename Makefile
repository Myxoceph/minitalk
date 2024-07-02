# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abakirca <abakirca@student.42kocaeli.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/01 13:29:38 by abakirca          #+#    #+#              #
#    Updated: 2024/03/01 13:29:38 by abakirca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = server.c client.c
OBJECTS = $(SOURCES:.c=.o)

SERVER = server
CLIENT = client
CC = cc
CFLAGS = -Wall -Wextra -Werror

all: libft.a server client

server: server.o
	$(CC) $(CFLAGS) server.o libft.a -o $(SERVER)

client: client.o
	$(CC) $(CFLAGS) client.o libft.a -o $(CLIENT)

libft.a:
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean
	
fclean: clean
	rm -f server client libft.a

re: fclean all

.PHONY: all bonus libft clean fclean re