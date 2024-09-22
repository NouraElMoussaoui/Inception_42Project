FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y nginx openssl nano vim curl

COPY conf/nginx.conf /etc/nginx/conf.d/default_n.conf

COPY ./tools/nginx.sh /

RUN chmod +x ./nginx.sh

ENTRYPOINT [ "./nginx.sh" ]

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]