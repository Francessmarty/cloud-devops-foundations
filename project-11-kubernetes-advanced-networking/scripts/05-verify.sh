#!/bin/bash
set -e

echo "=== Ingress Address (may be localhost on Docker Desktop) ==="
kubectl get ingress -n edge

echo "=== Quick curl test (works if you map host to localhost) ==="
echo "Try: curl -H 'Host: demo.francesehinor.com' http://localhost/"