mysql_install_db --user=mysql --datadir=/var/lib/mysql

mysqladmin -u root password $MYSQL_ROOT_PASSWORD

echo "CREATE DATABASE wp_database;" | mysql -u root --default-character-set=utf8
echo "CREATE USER $WP_USER@$WORDPRESS_DB_HOST IDENTIFIED BY $WORDPRESS_DB_PASSWORD;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_user'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

rm mysql_init.sh