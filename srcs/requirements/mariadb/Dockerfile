FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client vim
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

#COPY		./conf/mysqld.conf ~/my.cnf
#COPY		./conf/mysqld.conf /etc/mysql/my.cnf
#COPY		./conf/mysqld.conf /etc/my.cnf


#Copy of the .sh and .sql in the /bin of the container to be able to run the program
# Give the right to execute + launch the .sh
COPY ./tools/setup.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "/usr/local/bin/setup.sh" ]

#Command to launch mariadb and enable the database to listen globally - also can be put on mysqldump.cnf file
CMD ["mysqld", "--bind-address=0.0.0.0"]
