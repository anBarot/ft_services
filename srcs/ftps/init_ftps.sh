openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/ftps.pem -keyout /etc/ssl/private/ftps.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=ftp_user/CN=ftp_server"

addgroup ftpgroup
adduser ftp_user -G ftpgroup -h /home/ftp_user -D
echo -e "psw\npsw" | passwd ftp_user
chown -R ftp_user /home/ftp_user