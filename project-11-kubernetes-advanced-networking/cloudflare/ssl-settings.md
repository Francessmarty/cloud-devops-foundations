# Cloudflare SSL/TLS Configuration

Domain: francesehinor.com  
Plan: Free  

## SSL/TLS Mode
- Mode: Full
- Reason: Ensures encryption between clients and Cloudflare, and between Cloudflare and the Kubernetes ingress.

## Notes
- Automatic SSL mode disabled
- Cloudflare edge certificates enabled
- TLS termination handled at Cloudflare edge

## Evidence
See screenshots:
- screenshots/project-11-kubernetes-advanced-02-cloudflare-ssl-full.png