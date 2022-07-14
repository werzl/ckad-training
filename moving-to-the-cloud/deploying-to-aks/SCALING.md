# Scaling and Updating an AKS Cluster

## Scale Pods and Nodes
- Pods:
	- With the context set to your cluster, run `kubectl scale deployment [deployment-name] --replicas=[number]`

<br/>

- Nodes:
  - `az aks scale --resource-group [rg] --name [cluster-name] --node-count [number]`
    - The node pool will then scale up / down to match the number of nodes specified