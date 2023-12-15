#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	echo "CREATING $DB_NAME"
	chown -R www-data:root /var/www/html
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PSWD --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	echo "CHECKPOINT 1"
	wp config set WP_DEBUG true --allow-root
	echo "CHECKPOINT 2"
	wp config set WP_DEBUG_LOG true --allow-root
	echo "DONE CONFIG"
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PSWD --allow-root
	wp theme install neve --activate --allow-root
	echo "DONE INSTALL"

	# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    # sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    # sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    # sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    # cp wp-config-sample.php wp-config.php
fi

/usr/sbin/php-fpm7.3 -F
