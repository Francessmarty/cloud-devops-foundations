#!/bin/bash
set -e

kubectl scale deployment support-api --replicas=3 -n support
kubectl get pods -n support