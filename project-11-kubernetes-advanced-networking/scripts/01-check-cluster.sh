#!/bin/bash
set -e

kubectl version --client
kubectl config current-context
kubectl get nodes -o wide
kubectl get ns