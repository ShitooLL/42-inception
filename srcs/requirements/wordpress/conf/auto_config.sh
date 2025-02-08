#!/bin/bash
sleep 10;

WP_PATH="/var/www/wordpress"

#Si le fichier wp-config.php n'existe pas
if [ ! -f "$WP_PATH/wp-config.php" ]; then
	echo "wp-config.php not found. Creating WordPress configuration file..."

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

					#--allow-root \
					#--dbname="database_name" \
					#--dbuser="database_user" \
					#--dbpass="database_password" \
					#--dbhost=mariadb:3306 \
					#--path='/var/www/wordpress'

#install WordPress
wp core install		--allow-root \
					--url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--path=$WP_PATH
					
					#--url="htttp://localhost" \
					#--title="Mon Site WordPresss" \
					#--admin_user="admin" \
					#--admin_password="password123" \
					#--admin_email="admin@test.com" \
					#--path=$WP_PATH
					#--allow-root

#Creer un user
wp user create 		$WP_USER $WP_USER_EMAIL \
					--role=author \
					--user_pass=$WP_USER_PASS
					--allow-root \
					--path=$WP_PATH

					#second_user second_user@test.com \
					#--role=author \
					#--user_pass="second_password" \
					#--path=$WP_PATH \
					#--allow-root


	echo "WordPress configuration file over with success."
else
	echo "wp-config.php already exist. No configuration needed."
fi