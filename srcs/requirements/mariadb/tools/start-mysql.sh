#!/bin/bash

touch init.sql

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" >> init.sql

echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> init.sql

echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';" >> init.sql

echo "FLUSH PRIVILEGES;" >> init.sql

mkdir -p /run/mysqld

mv init.sql /etc/mysql/init.sql

exec "mysqld"

#service mariadb start;
#
#
##Attente que MariaDB se lance completement
#until mysqladmin ping -h localhost --silent; do
#	echo "Waiting for MariaDB to be ready..."
#	sleep 2
#done
#
#echo "Root password: ${SQL_ROOT_PASSWORD}"
#
#echo "Creating database if does not exist..."
#mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#
#echo "Creating user if does not exist..."
#mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#echo "Granting privileges..."
##mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#
#echo "Modifying root password..."
#mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#
#echo "Applying modifications..."
#mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
#
#mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown;
#
#echo "Executing MariaDB in safe mode..."
#exec mysqld_safe