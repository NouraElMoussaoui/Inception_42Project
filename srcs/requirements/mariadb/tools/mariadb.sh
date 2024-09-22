#!/bin/bash

if [ ! -d "/run/mysqld/" ]; then
mkdir -p /run/mysqld/
fi
echo "FLUSH PRIVILEGES;" > data.sql
echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" >> data.sql
echo "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> data.sql
echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> data.sql
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> data.sql
echo "FLUSH PRIVILEGES;" >> data.sql

mariadbd --bootstrap --user=root < data.sql

exec "$@"