#!/bin/bash
IP=$(ip a | grep enp3s0| grep inet |awk '{print }' | awk -F "/" '{print }')
docker --insecure-registry $IP:5000 login
minikube start --vm-driver=none
kubectl run kubia --image=$IP:5000/kubia --port=8080 --generator=run/v1

kubectl scale rc kubia --replicas=3
kubectl get pods
kubectl get rc
kubectl get services
#kubectl expose rc kubia --type=LoadBalancer --name kubia-http
minikube service kubia-http
kubectl cluster-info
# gcloud container cluster describe kubia | grep -E "(username|password)"
kubectl get pods -o wide
#kubectl describe pod kubia-csrwr
#minikube dashboard &
watch "curl -v http://192.168.212.50:32162/"


