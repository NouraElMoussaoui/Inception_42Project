FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y mariadb-server nano vim curl

RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /

RUN chmod +x ./mariadb.sh

ENTRYPOINT [ "./mariadb.sh" ]

EXPOSE 3306

CMD ["mariadbd", "--user=root"]
