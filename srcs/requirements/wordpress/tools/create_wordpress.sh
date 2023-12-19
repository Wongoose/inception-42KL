#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

    #Download wordpress
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    chown -R www-data:root /var/www/html


    echo "BEFORE SED CHECKPOINT -----"
    #Import DB env variables in the config file
    sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
    sed -i "s/password_here/$DB_PSWD/g" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
    sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    echo "DONE WORDPRESS SH"

    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PSWD --allow-root
    #wp theme install neve --activate --allow-root
fi

# exec is just used to replace existing process, where this process is killed the moment the command is ran - for optimization
# e.g sh exec command (would repladce the sh process, and run ./command as the main process)
# just to free up resources
exec "$@"
