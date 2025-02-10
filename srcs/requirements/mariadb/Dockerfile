# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 00:29:12 by laliao            #+#    #+#              #
#    Updated: 2025/02/09 22:12:22 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

RUN 	apt update -y && apt-get upgrade -y
RUN		apt-get install -y mariadb-server mariadb-client

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	tools/start-mysql.sh	.

RUN 	chmod +x start-mysql.sh

CMD 	[ "./start-mysql.sh" ]
