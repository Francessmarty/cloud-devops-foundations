#!/bin/bash
set -e

kubectl apply -f k8s/01-namespace.yaml
kubectl apply -f k8s/02-configmap.yaml
kubectl apply -f k8s/03-secret.yaml

kubectl get ns | grep edge || true
kubectl get configmap -n edge
kubectl get secret -n edge