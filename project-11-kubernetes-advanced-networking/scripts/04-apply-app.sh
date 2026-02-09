#!/bin/bash
set -e

kubectl apply -f k8s/04-deployment.yaml
kubectl apply -f k8s/05-service.yaml
kubectl apply -f k8s/06-ingress.yaml

kubectl get deploy -n edge
kubectl get pods -n edge -o wide
kubectl get svc -n edge
kubectl get ingress -n edge