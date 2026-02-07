#!/bin/bash
set -e
kubectl apply -f k8s/namespace.yaml
kubectl get namespaces