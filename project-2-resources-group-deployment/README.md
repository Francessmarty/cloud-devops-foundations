# Project 2: Azure Resource Group Management (Azure CLI)

```bash
#!/bin/bash
# ------------------------------------------------------------
# Project 2: Azure Resource Group Management
# Description:
# This script demonstrates real Azure resource group creation
# using Azure CLI executed via Azure Cloud Shell.
# ------------------------------------------------------------

# Define variables
RG="rg-ops-foundation-weu"
LOCATION="westeurope"

# Log configuration
echo "Using Resource Group: $RG"
echo "Using Location: $LOCATION"

# Create Resource Group
az group create --name $RG --location $LOCATION

# Verify Resource Group
az group list --output table

# Cleanup (executed after networking & storage projects)
# az group delete --name $RG --yes --no-wait
```

## Overview

This project demonstrates real Azure infrastructure execution using Azure CLI via Azure Cloud Shell.  
The focus is on resource group lifecycle management, which serves as the foundation for networking, storage, and automation workflows in cloud environments.

The Bash script above defines reusable variables, provisions a resource group, verifies successful creation, and documents safe cleanup practices.

## Objectives

- Practice Azure CLI usage in a real cloud environment
- Understand Azure resource group concepts
- Apply automation-friendly scripting patterns
- Demonstrate infrastructure lifecycle awareness

## Tools & Technologies

- Microsoft Azure
- Azure Cloud Shell (Bash)
- Azure CLI

## Execution Environment

- Executed directly in Azure Cloud Shell
- Authenticated against an active Azure subscription
- No local Azure CLI installation required

## Verification

Execution was validated through:
- Azure CLI output showing `Succeeded` provisioning state
- Azure Portal confirmation of the resource group

### Azure Execution Screenshots
Real Azure CLI and Portal screenshots validating successful resource
group creation and verification in a live Azure subscription.

## Resource Lifecycle Note

The resource group created in this project is intentionally reused for subsequent networking and storage projects to reflect realistic operational workflows.

Final cleanup is performed after all dependent projects are completed to ensure cost control and proper lifecycle management.

## Key Takeaways

- Cloud automation begins with clean resource organization
- Command-line execution enables repeatability and reliability
- Resource cleanup is a critical part of cloud engineering discipline

## Status

- Executed successfully in Azure
- Verified via CLI and Azure Portal
- Ready for networking and storage extensions
