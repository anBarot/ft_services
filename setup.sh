minikube start

eval $(minikube docker-env)

docker build -t nginx-img srcs/nginx/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t mysql-img srcs/mysql/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
docker build -t grafana-img srcs/grafana/.
docker build -t influxdb-img srcs/influxdb/.
# docker build -t ftps-img srcs/FTPS/.

minikube addons enable ingress

kubectl apply -k srcs/.

minikube dashboard &
# ssh (user-id)@(minikube_ip) -p (port-numer)