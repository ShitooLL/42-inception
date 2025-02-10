# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 02:37:29 by laliao            #+#    #+#              #
#    Updated: 2025/02/09 23:18:53 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get -y install wget \
		php \
		php7.4-fpm \
		php-mysqli \
		&& service php7.4-fpm start

#RUN		wget https://fr.wordpress.org/wordpress-6.7.1-fr_FR.tar.gz -P /var/www
#RUN		cd /var/www \
#		&& tar -xzf wordpress-6.7.1-fr_FR.tar.gz \
#		&& rm wordpress-6.7.1-fr_FR.tar.gz
#RUN 	chown -R root:root /var/www/wordpress
#
#RUN 	chown -R www-data:www-data /var/www/wordpress
#RUN		chmod -R 755 /var/www/wordpress


COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf




#COPY	conf/auto_config.sh /usr/local/bin/auto_config.sh
#RUN 	chmod +x /usr/local/bin/auto_config.sh

COPY	./tools/auto_config.sh .
RUN		chmod +x auto_config.sh

CMD [ "./auto_config.sh" ]
