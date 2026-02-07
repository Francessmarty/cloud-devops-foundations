### Project 10: Kubernetes Deployment & Scaling Lab (Local Cluster)

## Overview

This project demonstrates core Kubernetes fundamentals by deploying, managing, scaling, and securing a containerized application on a local Kubernetes cluster using Docker Desktop.

The focus of this project is handson Kubernetes operations using **kubectl, YAML manifests, and bash scripts only**, without modifying or relying on application level code. The goal is to understand Kubernetes architecture, workload orchestration, and basic security concepts through practical execution.


## Objectives

The objectives of this project are to:

- Understand Kubernetes architecture and core components
- Deploy an application on a Kubernetes cluster
- Configure Pods, Deployments, and Services using YAML
- Scale workloads horizontally
- Apply basic workload security concepts
- Operate Kubernetes using CLI-based workflows only



## Technologies Used

- Kubernetes (Docker Desktop local cluster)
- kubectl
- Bash
- YAML
- Docker (container image source)


## Architecture Overview

The Kubernetes cluster runs locally on Docker Desktop as a single-node cluster.

A dedicated namespace is created to isolate application resources.  
The application is deployed using a Deployment controller, which manages Pods and ensures the desired replica count is maintained.  
A Service provides stable internal access to the application.  
A NetworkPolicy is applied to demonstrate basic workload security and traffic control.

A visual architecture diagram is available in: diagram/kubernetes-architecture.png


### Project Structure

project-10-kubernetes-deployment-lab/
├── diagram/
|   └── kubernetes-architecture.png
├── scripts/
│   ├── 01-check-cluster.sh
│   ├── 02-create-namespace.sh
│   ├── 03-deploy-app.sh
│   ├── 04-expose-service.sh
│   ├── 05-scale-deployment.sh
│   ├── 06-security-basics.sh
│   └── cleanup.sh
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   └── network-policy.yaml
├── screenshots/
│   ├── 01-cluster-info.png
│   ├── 02-nodes.png
│   ├── 03-deployment-running.png
│   ├── 04-service-exposed.png
│   ├── 05-scaled-replicas.png
│   └── 06-security-policy.png
├── notes.md
└── README.md



## Kubernetes Concepts Demonstrated

### D1: Understanding Kubernetes Architecture

- Kubernetes cluster and node verification
- Namespace isolation
- Core system components
- Relationship between Pods, Deployments, and Services

### D2: Deploying and Managing Applications

- Declarative application deployment using YAML
- Service configuration for internal networking
- Horizontal scaling of workloads
- Basic workload security using NetworkPolicy


## How to Run the Project

All actions are executed using bash scripts from the project directory.

### Step 1: Verify Cluster

./scripts/01-check-cluster.sh


Step 2: Create Namespace

./scripts/02-create-namespace.sh

Step 3: Deploy Application

./scripts/03-deploy-app.sh

Step 4: Expose Service
./scripts/04-expose-service.sh


Step 5: Scale Deployment

./scripts/05-scale-deployment.sh


Step 6: Apply Basic Security

./scripts/06-security-basics.sh



##### Validation

The following validations were performed:
	•	Kubernetes cluster is accessible via kubectl
	•	Application Pods are running successfully
	•	Service is created and configured correctly
	•	Deployment scales from one to three replicas
	•	NetworkPolicy is applied successfully
	•	All resources are isolated within a dedicated namespace

Execution evidence is captured in the screenshots/ directory.


### Cleanup

To remove all resources created by this project:./scripts/cleanup.sh

This deletes the namespace and all associated Kubernetes resources.


### Project Status

This project is complete and successfully demonstrates the Kubernetes fundamentals

It provides a solid foundation for progressing to advanced Kubernetes topics such as Ingress controllers, ConfigMaps, Secrets, and external traffic management.
