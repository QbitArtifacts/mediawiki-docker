from debian:buster
env DEBIAN_FRONTEND noninteractive
run apt update && apt install -y mediawiki php-apcu php-gd git gettext-base php-sqlite3 --no-install-recommends
run a2enmod rewrite

run mkdir -p /wiki/db /wikiconf
run chown -R www-data:www-data /wiki

run ln -s /var/lib/mediawiki /var/www/html/wiki
run echo "RedirectMatch ^/$ /wiki/" > /var/www/html/.htaccess 
copy ./vhost.conf /etc/apache2/sites-available/000-default.conf

copy ./LocalSettings.php.dist /wikiconf
copy ./docker-entrypoint.sh /

run chmod +x /docker-entrypoint.sh

cmd ["./docker-entrypoint.sh"]
