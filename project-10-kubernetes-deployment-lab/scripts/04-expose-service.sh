#!/bin/bash
set -e

kubectl apply -f k8s/service.yaml
kubectl get svc -n support