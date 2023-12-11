#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
    echo "----- BEFORE GET TAR -----"

    #Download wordpress and all config file
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    echo "BEFORE SED CHECKPOINT -----"
    #Inport env variables in the config file
    sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
    sed -i "s/password_here/$DB_PSWD/g" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
    sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    echo "DONE WORDPRESS SH"
fi

# exec is just used to replace existing process, where this process is killed the moment the command is ran - for optimization
# e.g sh exec command (would repladce the sh process, and run ./command as the main process)
# just to free up resources
exec "$@"