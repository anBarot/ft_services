openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/mysite.pem -keyout /etc/ssl/private/mysite.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
tar xf phpMyAdmin-4.9.4-all-languages.tar.gz
rm phpMyAdmin-4.9.4-all-languages.tar.gz
mv phpMyAdmin-4.9.4-all-languages phpmyadmin
chown -R nginx phpmyadmin
chmod 755 -R phpmyadmin
mv phpmyadmin /var/www/.

php-fpm7
nginx

rm phpmyadmin_init.sh