# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/12 01:30:41 by laliao            #+#    #+#              #
#    Updated: 2025/02/08 22:17:50 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

RUN		apt update && apt upgrade -y
RUN 	apt install -y	\
		nginx	\
		curl	\
		vim		\
		openssl
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=laliao.42.fr/UID=laliao"
RUN		mkdir -p /var/run/nginx
RUN		mkdir -p /var/www

COPY	conf/nginx.conf	/etc/nginx/nginx.conf

RUN 	chmod -R 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

CMD 	[ "nginx", "-g", "daemon off;" ]
