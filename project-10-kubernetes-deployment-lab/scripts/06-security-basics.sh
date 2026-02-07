#!/bin/bash
set -e

kubectl apply -f k8s/network-policy.yaml
kubectl get networkpolicy -n support