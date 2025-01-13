# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 02:37:29 by laliao            #+#    #+#              #
#    Updated: 2025/01/13 03:40:03 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN		apt-get update -y
RUN		apt-get -y install wget
RUN		apt-get install -y php7.3\
		php-fpm\
		php-mysql\
		mariadb-client

RUN		wget https://fr.wordpress.org/wordpress-6.7.1-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.7.1-fr_FR.tar.gz && rm wordpress-6.7.1-fr_FR.tar.gz

RUN 	chown -R root:root /var/www/wordpress

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
