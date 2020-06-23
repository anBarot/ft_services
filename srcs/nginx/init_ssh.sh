adduser ssh_user -D
echo -e "psw\npsw" | passwd ssh_user
/usr/bin/ssh-keygen -A 