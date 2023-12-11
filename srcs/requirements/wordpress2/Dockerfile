FROM debian:buster

WORKDIR /var/www/html

RUN apt-get update -y && apt-get install php-fpm php-mysql -y
RUN apt-get install curl -y
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/;access.log = log\/$pool.access.log/access.log = log\/$pool.access.log/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root
RUN mkdir /run/php && mkdir /usr/log && touch /usr/log/www.access.log

COPY ./conf/create_wordpress.sh /
RUN chmod +x /create_wordpress.sh

EXPOSE 9000
CMD ["/create_wordpress.sh"]
