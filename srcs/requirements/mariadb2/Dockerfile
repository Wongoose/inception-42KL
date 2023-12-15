FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client vim
RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/setup.sh /
EXPOSE 3306
CMD ["/setup.sh"]
