#creation of my_site directories
mkdir /var/www/my_site.com
mv index.html /var/www/my_site.com/.

#configuration of nginx
mv nginx.conf /etc/nginx/.
mv my_site.com.conf /etc/nginx/sites-available/.
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/my_site.com.conf /etc/nginx/sites-enabled/.

#ssl key and self-signed certificate creation
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

#creating database
service mysql start
echo "CREATE DATABASE wp_database;" | mysql -u root --skip-password --default-character-set=utf8
echo "CREATE USER \"wp_user\"@\"localhost\" IDENTIFIED BY 'psw';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_user'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#starting nginx and php-fpm service
service nginx start
service php7.3-fpm start

#cleaning root
rm latest.tar.gz
rm phpMyAdmin-4.9.4-all-languages.tar.gz
rm ft_server.sh

bash