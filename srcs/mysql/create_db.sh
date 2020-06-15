echo "CREATE DATABASE wp_database;" | mysql 

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql 
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql 

echo "CREATE USER admin@'%' IDENTIFIED BY 'admin';" | mysql 
echo "GRANT ALL PRIVILEGES ON wp_database.* TO admin;" | mysql 

echo "CREATE USER pierre@'%' IDENTIFIED BY 'psw_1';" | mysql 
echo "GRANT CREATE, SELECT, DROP ON wp_database.* TO pierre;" | mysql 

echo "CREATE USER paul@'%' IDENTIFIED BY 'psw_2';" | mysql 
echo "GRANT CREATE, SELECT, DROP ON wp_database.* TO paul;" | mysql 

echo "CREATE USER jacques@'%' IDENTIFIED BY 'psw_3';" | mysql 
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON wp_database.* TO jacques;" | mysql 