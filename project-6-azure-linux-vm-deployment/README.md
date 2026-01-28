## Project 6: Azure Linux VM Deployment (CLI-driven)

## Project Overview

This project demonstrates the deployment and lifecycle management of a Linux Virtual Machine in Microsoft Azure using the Azure CLI and Bash scripting. The focus is on infrastructure automation, repeatability, and clean teardown of cloud resources.

## Objectives
	•	Azure resource group creation
	•	Networking components (VNet, subnet, NSG, public IP)
	•	Linux VM deployment
	•	SSH access validation
	•	Automated cleanup using scripts

All operations were executed via CLI to reflect real-world DevOps workflows.

## Folder Structure 

project-6-azure-linux-vm-deployment/
├── code/
│   ├── deployment/
│   │   └── deploy_vm.sh
│   └── cleanup/
│       └── cleanup_vm.sh
├── logs/
├── notes/
├── README.md/
└── screenshots 

## Deployment Steps
	1.	Authenticated to Azure using Azure CLI
	2.	Selected the correct Azure subscription
	3.	Executed deployment script:  ./deployment/deploy_vm.sh
	4.	Verified creation of:
		•	Resource group
		•	Virtual network & subnet
		•	Network security group (SSH enabled)
		•	Public IP
		•	Linux VM
	5.	Tested SSH access to the VM
	6.	Executed cleanup script to delete all resources

## Cleanup

All resources were removed using the cleanup script: ./cleanup/cleanup_vm.sh

Deletion was verified using: az group list -o table


## Tools & Technologies
	•	Azure CLI
	•	Bash scripting
	•	Linux VM (Ubuntu)
	•	Git & GitHub
	•	VS Code


## Key Learning Outcomes
	•	CLI first cloud resource management
	•	Scripted infrastructure deployment
	•	Resource lifecycle management
	•	Clean teardown to avoid unnecessary cloud costs
	•	Real world DevOps workflow simulation



## Evidence

Screenshots in the screenshots/ folder document:
	•	Script execution
	•	Resource creation
	•	VM visibility
	•	Cleanup confirmation

## Challenges Faced
	•	VM provisioning intermittently failed due to subscription limitations.
	•	SSH access required proper key placement and permission handling.



## Improvements for Future Iterations
	•	Add error handling and retries to deployment script
	•	Parameterize region and VM size
	•	Integrate CI/CD workflow for automated validation


## Professional Takeaway

This project reflects a productionstyle cloud workflow, prioritizing automation, verification, and cleanup core principles in DevOps and Cloud Engineering roles.## Project 6: Azure Linux VM Deployment (CLI-driven)

## Project Overview

This project demonstrates the deployment and lifecycle management of a Linux Virtual Machine in Microsoft Azure using the Azure CLI and Bash scripting. The focus is on infrastructure automation, repeatability, and clean teardown of cloud resources.

## Objectives
	•	Azure resource group creation
	•	Networking components (VNet, subnet, NSG, public IP)
	•	Linux VM deployment
	•	SSH access validation
	•	Automated cleanup using scripts

All operations were executed via CLI to reflect real-world DevOps workflows.

## Folder Structure 

project-6-azure-linux-vm-deployment/
├── code/
│   ├── deployment/
│   │   └── deploy_vm.sh
│   └── cleanup/
│       └── cleanup_vm.sh
├── logs/
├── notes/
├── README.md/
└── screenshots 

## Deployment Steps
	1.	Authenticated to Azure using Azure CLI
	2.	Selected the correct Azure subscription
	3.	Executed deployment script:  ./deployment/deploy_vm.sh
        4.      Verified creation of:
	          Resource group
	          Virtual network & subnet
		  Network security group (SSH enabled)
		  Public IP
		  Linux VM
	5.	Tested SSH access to the VM
	6.	Executed cleanup script to delete all resources

## Cleanup

All resources were removed using the cleanup script: ./cleanup/cleanup_vm.sh

Deletion was verified using: az group list -o table


## Tools & Technologies
	•	Azure CLI
	•	Bash scripting
	•	Linux VM (Ubuntu)
	•	Git & GitHub
	•	VS Code


## Key Learning Outcomes
	•	CLI first cloud resource management
	•	Scripted infrastructure deployment
	•	Resource lifecycle management
	•	Clean teardown to avoid unnecessary cloud costs
	•	Real world DevOps workflow simulation



## Evidence

Screenshots in the screenshots/ folder document:
	•	Script execution
	•	Resource creation
	•	VM visibility
	•	Cleanup confirmation

## Challenges Faced
	•	VM provisioning intermittently failed due to subscription limitations.
	•	SSH access required proper key placement and permission handling.



## Improvements for Future Iterations
	•	Add error handling and retries to deployment script
	•	Parameterize region and VM size
	•	Integrate CI/CD workflow for automated validation


## Professional Takeaway

This project reflects a productionstyle cloud workflow, prioritizing automation, verification, and cleanup core principles in DevOps and Cloud Engineering roles.

