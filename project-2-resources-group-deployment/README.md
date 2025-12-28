# Project 2: Resource Group Deployment Simulation

## Overview
This project demonstrates basic infrastructure automation using Azure CLI commands to create and manage resource groups.  
The focus is on scripting, variable usage, logging, and safe cleanup patterns commonly used in real-world DevOps workflows.

## Simulation Note
Azure account registration was not available at the time of this project.  
As a result, execution is documented via CLI scripting and screenshots rather than live resource creation.  
All commands shown reflect valid Azure CLI syntax and real-world usage.

## Script Description
The script performs the following actions:
- Defines variables for resource group name and region
- Logs execution steps for clarity
- Creates an Azure resource group
- Includes a safe, commented deletion command for cleanup

This mirrors how infrastructure scripts are written, reviewed, and executed in production environments.

## Script Location
The automation script is located in
scripts/create-resource-group.sh

## Files
- `scripts/create-resource-group.sh` – Bash script for Azure resource group creation (simulation)
- `screenshots/` – CLI execution screenshot evidence

## Outcome
This project demonstrates how basic cloud infrastructure automation is planned, documented, and validated using scripting best practices, even when live cloud access is unavailable.
