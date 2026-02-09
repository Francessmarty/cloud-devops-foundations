# Cloudflare DNS

Goal: Route demo.francesehinor.com to the Kubernetes ingress endpoint.

Planned record:
- Type: A
- Name: demo
- Target: <INGRESS_IP_OR_LOCAL_TUNNEL>
- Proxy status: Proxied (orange cloud)
- TTL: Auto