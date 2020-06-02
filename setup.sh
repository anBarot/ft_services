minikube start

eval $(minikube docker-env)

docker build -t nginx-img srcs/nginx/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t mysql-img srcs/mysql/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
# docker build -t ftps-img srcs/FTPS/.
# docker build -t grafana-img srcs/grafana/.
# docker build -t influxDB-img srcs/influxDB/.

minikube addons enable ingress

kubectl apply -k srcs/.

# ssh (user-id)@(minikube_ip) -p (port-numer)
# mysql -u wp_user -p -h mysql-svc