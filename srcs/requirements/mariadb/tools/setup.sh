#!/bin/sh

if [ -d /var/lib/mysql/$DB_NAME ]; then
	echo "Database already exists"
else
	mysql_install_db --basedir=/usr --datadir/var/lib/mysql --user=mysql > /dev/null
	touch /usr/local/bin/init.sql
	echo "USE mysql;
		FLUSH PRIVILEGES;
		CREATE DATABASE IF NOT EXISTS $DB_NAME;
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PSWD';
		GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root' IDENTIFIED BY '$DB_ROOT_PSWD';
		FLUSH PRIVILEGES;" > /usr/local/bin/init.sql
	mysqld --user=mysql --bootstrap < /usr/local/bin/init.sql
fi
exec "$@"
