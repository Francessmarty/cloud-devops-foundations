#!/bin/bash
set -e

# Ensure helm exists
command -v helm >/dev/null 2>&1 || { echo "helm not found. Install Helm first."; exit 1; }

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx --create-namespace

kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx