#!/bin/sh

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSWD';" | mysql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PSWD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
