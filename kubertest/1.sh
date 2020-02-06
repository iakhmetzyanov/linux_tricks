#!/bin/bash
kubectl run kubia --image=kubia --port=8080 --generator=run/v1
kubectl cluster-info
kubectl get pods
echo " sleep 10"
sleep 10
kubectl get pods


