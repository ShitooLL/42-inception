# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 02:37:29 by laliao            #+#    #+#              #
#    Updated: 2025/02/08 21:58:06 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get -y install wget
RUN		apt-get install -y php7.4 \
		php7.4-fpm \
		php7.4-mysql \
		mariadb-client \
		curl \
		sudo

RUN		wget https://fr.wordpress.org/wordpress-6.7.1-fr_FR.tar.gz -P /var/www
RUN		cd /var/www \
		&& tar -xzf wordpress-6.7.1-fr_FR.tar.gz \
		&& rm wordpress-6.7.1-fr_FR.tar.gz

RUN 	chown -R root:root /var/www/wordpress

RUN 	chown -R www-data:www-data /var/www/wordpress
RUN		chmod -R 755 /var/www/wordpress


COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN 	chmod +x /usr/local/bin/auto_config.sh

#RUN		mkdir -p /run/php

EXPOSE	443 9000


ENTRYPOINT [ "/usr/local/bin/auto_config.sh" ]

CMD [ "/usr/sbin/php-fpm7.4", "-F" ]








#FROM	debian:buster
#
#RUN		apt-get update -y
#RUN		apt-get -y install wget
#RUN		apt-get install -y php7.3\
#		php-fpm\
#		php-mysql\
#		mariadb-client\
#		curl
#
#RUN		wget https://fr.wordpress.org/wordpress-6.7.1-fr_FR.tar.gz -P /var/www
#RUN		cd /var/www && tar -xzf wordpress-6.7.1-fr_FR.tar.gz && rm wordpress-6.7.1-fr_FR.tar.gz
#
#RUN 	chown -R root:root /var/www/wordpress
#
#RUN 	chown -R www-data:www-data /var/www/wordpress
#
#
#COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
#
#RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN		chmod +x wp-cli.phar
#RUN		mv wp-cli.phar /usr/local/bin/wp
#
#COPY	conf/auto_config.sh /usr/local/bin/auto_config.sh
#RUN 	chmod +x /usr/local/bin/auto_config.sh
#
#
#RUN		mkdir -p /run/php
#
#ENTRYPOINT [ "/usr/local/bin/auto_config.sh" ]
#
#CMD [ "/usr/sbin/php-fpm7.3 -F" ]