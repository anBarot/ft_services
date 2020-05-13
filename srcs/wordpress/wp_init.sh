# !/bin/sh

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/mysite.pem -keyout /etc/ssl/private/mysite.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
rm latest.tar.gz
chown -R nginx wordpress
chmod 755 -R wordpress
mv wordpress /var/www/.

php-fpm7
nginx 

rm -f wp_init.sh