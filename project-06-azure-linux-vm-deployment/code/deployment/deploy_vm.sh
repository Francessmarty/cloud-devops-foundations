#!/bin/bash
set -e


# Define Variables
LOCATION="northeurope"            
RG="rg-ops-foundation-neu"

VM_NAME="linux-vm-ops-neu"
ADMIN_USER="azureuser"

VNET_NAME="vnet-ops-neu"
SUBNET_NAME="subnet-ops-neu"
VNET_PREFIX="10.10.0.0/16"
SUBNET_PREFIX="10.10.1.0/24"

NSG_NAME="nsg-ops-neu"
PIP_NAME="pip-ops-neu"

VM_SIZE="Standard_DS1_V2"           

# SSH access control:
SSH_SOURCE_MODE="open"


# Reduce noisy output + avoid formatting triggers
AZ_OUT="none"
AZ_ERR="--only-show-errors"

# Ensure logs folder exists
mkdir -p ../logs

echo "==> Using subscription:"
az account show $AZ_ERR -o table || true

echo "==> Creating/ensuring resource group: $RG ($LOCATION)"
az group create --name "$RG" --location "$LOCATION" $AZ_ERR -o "$AZ_OUT"

echo "==> Creating/ensuring VNet + Subnet: $VNET_NAME / $SUBNET_NAME"

# If vnet exists, update is harmless; if not, create it.
if az network vnet show -g "$RG" -n "$VNET_NAME" $AZ_ERR -o "$AZ_OUT" 2>/dev/null; then
  echo "    VNet exists, ensuring subnet exists..."
  if ! az network vnet subnet show -g "$RG" --vnet-name "$VNET_NAME" -n "$SUBNET_NAME" $AZ_ERR -o "$AZ_OUT" 2>/dev/null; then
    az network vnet subnet create -g "$RG" --vnet-name "$VNET_NAME" -n "$SUBNET_NAME" \
      --address-prefixes "$SUBNET_PREFIX" $AZ_ERR -o "$AZ_OUT"
  fi
else
  az network vnet create -g "$RG" -n "$VNET_NAME" \
    --address-prefixes "$VNET_PREFIX" \
    --subnet-name "$SUBNET_NAME" \
    --subnet-prefixes "$SUBNET_PREFIX" \
    $AZ_ERR -o "$AZ_OUT"
fi

echo "==> Creating/ensuring NSG: $NSG_NAME"
if ! az network nsg show -g "$RG" -n "$NSG_NAME" $AZ_ERR -o "$AZ_OUT" 2>/dev/null; then
  az network nsg create -g "$RG" -n "$NSG_NAME" $AZ_ERR -o "$AZ_OUT"
fi

# Decide SSH source
SSH_SOURCE="0.0.0.0/0"
if [[ "$SSH_SOURCE_MODE" == "auto" ]]; then
  echo "==> Detecting your public IP for SSH allow-list..."
  
  MY_IP="$(curl -fsS https://api.ipify.org 2>/dev/null || true)"
  if [[ -z "${MY_IP}" ]]; then
    MY_IP="$(curl -fsS https://ifconfig.me 2>/dev/null || true)"
  fi
  if [[ -z "${MY_IP}" ]]; then
    echo "!! Could not detect your public IP automatically."
    echo "   Set SSH_SOURCE_MODE='open' or run from a network that allows curl to ipify/ifconfig.me."
    exit 1
  fi
  SSH_SOURCE="${MY_IP}/32"
  echo "    Your public IP: $MY_IP (SSH_SOURCE=$SSH_SOURCE)"
else
  echo "==> SSH_SOURCE_MODE=open (SSH allowed from 0.0.0.0/0)"
fi

echo "==> Creating/ensuring NSG SSH rule (Allow-SSH)"

# Create or update rule
if az network nsg rule show -g "$RG" --nsg-name "$NSG_NAME" -n "Allow-SSH" $AZ_ERR -o "$AZ_OUT" 2>/dev/null; then
  az network nsg rule update -g "$RG" --nsg-name "$NSG_NAME" -n "Allow-SSH" \
    --priority 1000 --access Allow --protocol Tcp --direction Inbound \
    --source-address-prefixes "$SSH_SOURCE" --source-port-ranges "*" \
    --destination-address-prefixes "*" --destination-port-ranges 22 \
    $AZ_ERR -o "$AZ_OUT"
else
  az network nsg rule create -g "$RG" --nsg-name "$NSG_NAME" -n "Allow-SSH" \
    --priority 1000 --access Allow --protocol Tcp --direction Inbound \
    --source-address-prefixes "$SSH_SOURCE" --source-port-ranges "*" \
    --destination-address-prefixes "*" --destination-port-ranges 22 \
    $AZ_ERR -o "$AZ_OUT"
fi

echo "==> Creating/ensuring Public IP (Standard/Static): $PIP_NAME"
if ! az network public-ip show -g "$RG" -n "$PIP_NAME" $AZ_ERR -o "$AZ_OUT" 2>/dev/null; then
  az network public-ip create -g "$RG" -n "$PIP_NAME" \
    --sku Standard --allocation-method Static \
    $AZ_ERR -o "$AZ_OUT"
fi



