
### Notes Project 11: Kubernetes Advanced Networking

## Environment

- Kubernetes cluster: Docker Desktop (local)
- Ingress Controller: NGINX (installed via Helm)
- External edge: Cloudflare (DNS + SSL/TLS)
- Application namespace: `edge`
- Ingress controller namespace: `ingress-nginx`



## Why a Domain Was Used

Even though the cluster is local, a real domain was used to demonstrate:

- DNS resolution via Cloudflare
- SSL/TLS configuration and modes
- How production traffic would flow in a real environment

On local clusters, the ingress address often resolves to `localhost`. This is normal and expected.



## DNS and SSL Scope

This project documents Cloudflare configuration but does not rely on live production routing.

After completing the lab:
- DNS records may be deleted to avoid reuse
- Documentation and screenshots remain as proof of configuration



## Screenshot Safety

Safe to keep visible:
- ClusterIP addresses
- localhost ingress addresses
- Resource names (pods, services, namespaces)

Must be hidden or removed:
- API tokens
- Passwords
- Secret values



## Common Commands Used

```bash
kubectl get ns
kubectl get pods -n edge
kubectl get svc -n edge
kubectl get ingress -n edge
kubectl get pods -n ingress-nginx


Key Takeaways
	•	Cloudflare operates outside the cluster as an edge service
	•	Ingress controllers manage HTTP routing inside Kubernetes
	•	Services abstract pod networking
	•	Namespaces provide clean separation of concerns
	•	Scripts + screenshots make infrastructure work reproducible and reviewable