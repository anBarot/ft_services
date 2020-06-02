echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql 
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql 
echo "FLUSH PRIVILEGES;" | mysql 

echo "CREATE DATABASE wp_database;" | mysql 
echo "CREATE USER wp_user@'%' IDENTIFIED BY 'psw';" | mysql 
echo "GRANT ALL PRIVILEGES ON wp_database.* TO wp_user;" | mysql 
echo "FLUSH PRIVILEGES;" | mysql 