from debian:buster
env DEBIAN_FRONTEND noninteractive
run apt update && apt install -y mediawiki php-apcu php-gd git gettext-base php-sqlite3 --no-install-recommends

run mkdir -p /wiki/db
run chown -R www-data:www-data /wiki

run rm -rf /var/www/html && ln -s /var/lib/mediawiki /var/www/html
run sed 's/^Alias.*$//g' -i /etc/apache2/conf-available/mediawiki.conf

copy ./docker-entrypoint.sh /

run chmod +x /docker-entrypoint.sh

cmd ["./docker-entrypoint.sh"]
