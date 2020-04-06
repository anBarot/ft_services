minikube start

eval $(minikube docker-env)

MYSQL_USER=mysql_user_1
MYSQL_PASSWORD=wp_psw

docker build -t nginx-img srcs/nginx/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t mysql-img srcs/mysql/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
docker build -t ftps-img srcs/FTPS/.
docker build -t grafana-img srcs/grafana/.
docker build -t influxDB-img srcs/influxDB/.

minikube addons enable ingress

kubectl apply -k srcs/.