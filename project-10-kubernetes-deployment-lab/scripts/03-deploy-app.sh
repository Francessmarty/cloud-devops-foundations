#!/bin/bash
set -e

KUBECTL=$(which kubectl)


$KUBECTL apply -f k8s/deployment.yaml
$KUBECTL get pods -n support
$KUBECTL get deployments -n support