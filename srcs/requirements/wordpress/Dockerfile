FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get -y install vim nano curl

RUN apt-get install -y php8.2 \
						php-fpm \
						php-mysql \
						mariadb-client

COPY ./tools/wordpress.sh /

RUN chmod +x /wordpress.sh

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 9000#' /etc/php/8.2/fpm/pool.d/www.conf

ENTRYPOINT [ "/wordpress.sh" ]

EXPOSE 9000

WORKDIR /var/www/html

CMD [ "php-fpm8.2", "-F" ]