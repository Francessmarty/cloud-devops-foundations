### Project 11: Kubernetes Advanced Networking (Cloudflare + Ingress)

This project demonstrates advanced Kubernetes networking concepts by integrating **Cloudflare** as the external edge and **NGINX Ingress Controller** inside a Kubernetes cluster running on **Docker Desktop**.

The goal is to show how real-world traffic flows from the internet into a Kubernetes application using DNS, TLS, Ingress, Services, and Pods — with clear scripts, manifests, screenshots, and an architecture diagram.



## Architecture Overview

Traffic flow:

User → Cloudflare (DNS + SSL/TLS) → NGINX Ingress Controller → Kubernetes Service → Application Pods

Cloudflare acts as the public-facing edge, while Kubernetes handles internal routing and workload management.

An architecture diagram is included in the `diagram/` folder.



## Project Structure

- `cloudflare/`
  - `dns-record.md` — DNS configuration used for the demo domain
  - `ssl-settings.md` — Cloudflare SSL/TLS and security settings
- `k8s/`
  - `01-namespace.yaml`
  - `02-configmap.yaml`
  - `03-secret.yaml`
  - `04-deployment.yaml`
  - `05-service.yaml`
  - `06-ingress.yaml`
- `scripts/`
  - `01-check-cluster.sh`
  - `02-apply-foundation.sh`
  - `03-install-ingress-nginx.sh`
  - `04-apply-app.sh`
  - `05-verify.sh`
  - `06-cleanup.sh`
- `diagram/`
  - `Kubernetes-advanced-networking-architecture.drawio.png`
- `screenshots/`
  - Step-by-step execution and verification screenshots



## Prerequisites

- Docker Desktop with Kubernetes enabled
- kubectl configured to Docker Desktop
- Helm installed
- A domain managed in Cloudflare (used for documentation and screenshots)


## How to Run

From the project directory:

bash
./scripts/01-check-cluster.sh
./scripts/02-apply-foundation.sh
./scripts/03-install-ingress-nginx.sh
./scripts/04-apply-app.sh
./scripts/05-verify.sh

### Cleanup:
./scripts/06-cleanup.sh

### Verification

To verify ingress and application routing:

kubectl get ingress -n edge
kubectl get svc -n edge
kubectl get pods -n edge


On Docker Desktop, the ingress address typically appears as localhost. This is expected for a local cluster.



### Learning Outcomes
	•	Understanding Kubernetes ingress-based traffic flow
	•	Installing and validating NGINX Ingress Controller with Helm
	•	Integrating Cloudflare DNS and SSL concepts with Kubernetes
	•	Organizing Kubernetes resources using namespaces
	•	Documenting infrastructure with diagrams, scripts, and screenshots