#!/bin/bash

touch init.sql

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" >> init.sql

echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> init.sql

echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';" >> init.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> init.sql

echo "FLUSH PRIVILEGES;" >> init.sql

mkdir -p /run/mysqld

mv init.sql /etc/mysql/init.sql

exec "mysqld"
