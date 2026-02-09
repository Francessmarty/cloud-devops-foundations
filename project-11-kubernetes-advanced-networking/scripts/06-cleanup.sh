#!/bin/bash
set -e

kubectl delete -f k8s/06-ingress.yaml --ignore-not-found
kubectl delete -f k8s/05-service.yaml --ignore-not-found
kubectl delete -f k8s/04-deployment.yaml --ignore-not-found
kubectl delete -f k8s/02-configmap.yaml --ignore-not-found
kubectl delete -f k8s/03-secret.yaml --ignore-not-found
kubectl delete -f k8s/01-namespace.yaml --ignore-not-found