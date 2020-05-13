minikube start

eval $(minikube docker-env)

#install nginx ingress controller

git clone https://github.com/nginxinc/kubernetes-ingress/
cd kubernetes-ingress/deployments
kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f rbac/rbac.yaml
kubectl apply -f common/default-server-secret.yaml
kubectl apply -f common/nginx-config.yaml
kubectl apply -f common/vs-definition.yaml
kubectl apply -f common/vsr-definition.yaml
kubectl apply -f common/ts-definition.yaml
kubectl apply -f common/gc-definition.yaml
kubectl apply -f common/global-configuration.yaml
kubectl apply -f deployment/nginx-ingress.yaml
kubectl apply -f daemon-set/nginx-ingress.yaml
kubectl create -f service/nodeport.yaml

docker build -t nginx-img srcs/nginx/.
# docker build -t wordpress-img srcs/wordpress/.
# docker build -t mysql-img srcs/mysql/.
# docker build -t phpmyadmin-img srcs/phpmyadmin/.
# docker build -t ftps-img srcs/FTPS/.
# docker build -t grafana-img srcs/grafana/.
# docker build -t influxDB-img srcs/influxDB/.

minikube addons enable ingress

kubectl apply -k srcs/.




#eval $(minikube docker-env -u)