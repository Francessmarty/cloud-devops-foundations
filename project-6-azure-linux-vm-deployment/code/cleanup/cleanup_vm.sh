#!/bin/bash
set -e

RG="rg-ops-foundation-neu"

echo "Deleting resource group: $RG"
az group delete --name "$RG" --yes --no-wait

echo "Cleanup initiated."