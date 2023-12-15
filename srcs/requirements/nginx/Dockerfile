# NEXT: Setup Dockerfile debian:buster
FROM    debian:buster

# install programs
RUN     apt-get update
RUN     apt-get install -y nginx openssl

RUN     mkdir -p /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/zwong.crt -keyout /etc/nginx/ssl/zwong.key -subj "/C=MY/ST=KualaLumpur/L=KualaLumpur/O=42KL/OU=zwong/CN=zwong"


COPY    ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

#RUN	sed -i 's/ssl_protocols TLSv1 TLSv1.1 TLSv1.2;/ssl_protocols TLSv1.2 TLSv1.3;/g' /etc/nginx/nginx.conf

RUN     mkdir -p /run/nginx

EXPOSE  443

CMD     [ "nginx", "-g", "daemon off;" ]
# daemon is a background process e.g. debugging purpose
