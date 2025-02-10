# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 02:37:29 by laliao            #+#    #+#              #
#    Updated: 2025/02/10 19:19:48 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get -y install wget \
		php \
		php7.4-fpm \
		php-mysqli \
		&& service php7.4-fpm start

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


COPY	./tools/auto_config.sh .
RUN		chmod +x auto_config.sh

EXPOSE	9000

CMD [ "./auto_config.sh" ]
