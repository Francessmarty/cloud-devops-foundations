### Notes Project 10: Kubernetes Fundamentals

This project reinforced core Kubernetes concepts by focusing on cluster level operations rather than application code.

## Key takeaways include:

- Kubernetes architecture is built around controllers that continuously reconcile desired state
- Deployments provide resilience and scalability compared to standalone Pods
- Namespaces are essential for logical isolation and safe experimentation
- Services abstract Pod networking and enable stable access points
- Scaling replicas demonstrates Kubernetes self healing and scheduling behavior
- Even simple NetworkPolicies introduce important security boundaries

## Challenges encountered 

Initial kubectl configuration on Windows and ensuring correct API versions in YAML manifests.

This project emphasized that effective Kubernetes usage relies more on understanding resource relationships and lifecycle management than on application complexity.