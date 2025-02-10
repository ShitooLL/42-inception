# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/10 15:22:47 by laliao            #+#    #+#              #
#    Updated: 2025/02/10 15:37:58 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		@mkdir -p /home/laliao/data/wordpress
		@mkdir -p /home/laliao/data/mariadb
		docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
		docker-compose -f ./srcs/docker-compose.yml down

re:		down all

.PHONY: all down re
				