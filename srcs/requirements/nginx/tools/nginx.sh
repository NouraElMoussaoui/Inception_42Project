#!/bin/bash

if [ ! -d "/etc/nginx/ssl" ]; then
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MR/ST=TETOUAN/L=MARTIL/O=1337MED/CN=nel-mous.42.fr"

fi
exec "$@"
