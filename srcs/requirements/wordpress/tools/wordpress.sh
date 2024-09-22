#!/bin/bash

#install the WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

#Wordpress download 
cd /var/www/html


wp core download --allow-root

# Check if wp-config.php does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
    echo hello
    # Configure WordPress using WP-CLI
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
		--dbhost=mariadb:3306
	#install wordpress
    wp core install --allow-root \
        --url=$DOMAIN_NAME \
        --title=$WORDPRESS_TITLE \
        --admin_user=$WORDPRESS_ADMIN_USER \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL
    # Create a second user
    wp user create --allow-root \
        $SECOND_USER_LOGIN \
        $SECOND_USER_EMAIL \
        --user_pass=$SECOND_USER_PASSWORD \
        --role=editor
fi

chown -R www-data:www-data /var/www/html/

exec "$@"