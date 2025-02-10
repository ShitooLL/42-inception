# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/12 01:30:41 by laliao            #+#    #+#              #
#    Updated: 2025/02/10 19:20:06 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

RUN		apt update && apt upgrade -y
RUN 	apt install -y	\
		nginx	\
		openssl

RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=laliao.42.fr/UID=laliao"
RUN		chmod 600 /etc/nginx/ssl/inception.crt
RUN		chmod 600 /etc/nginx/ssl/inception.key


RUN		mkdir -p /var/run/nginx
RUN		mkdir -p /var/www

COPY	conf/default	/etc/nginx/sites-available/default

EXPOSE	443

CMD 	[ "nginx", "-g", "daemon off;" ]
