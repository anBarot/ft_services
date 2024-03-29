minikube start --extra-config=apiserver.service-node-port-range=20-40000

## Building containers
eval $(minikube docker-env)

docker build -t nginx-img srcs/nginx/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t mysql-img srcs/mysql/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
docker build -t grafana-img srcs/grafana/.
docker build -t influxdb-img srcs/influxdb/.
docker build -t ftps-img srcs/ftps/.

## Creating deployments and services
minikube addons enable ingress

kubectl apply -k srcs/.

## Monitoring services
minikube dashboard &

#connection ssh :
# ssh ssh_user@172.17.0.2 -p 2222
# password : psw

#connection ftp :
# ftp 172.17.0.2 21
# id : ftp_user 
# password : psw
# passive mode : pass