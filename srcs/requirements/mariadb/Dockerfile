# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: laliao <laliao@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/13 00:29:12 by laliao            #+#    #+#              #
#    Updated: 2025/01/13 02:43:14 by laliao           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN 	apt update -y
RUN		apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	tools/start-mysql.sh	/usr/local/bin/start-mysql.sh

RUN 	chmod +x /usr/local/bin/start-mysql.sh

CMD [ "/usr/local/bin/start-mysql.sh" ]