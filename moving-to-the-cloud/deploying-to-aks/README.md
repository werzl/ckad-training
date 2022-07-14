# Deploying to AKS (Azure Kubernetes Services)
azure.microsoft.com

# Azure CLI
## First step is to login
- `az login`

<br/>


## Prepare/Register some Namespaces
- az provider register --namespace [provider-name]
- A few of the required namespaces include:
- Microsoft.Network
- Microsoft.Compute
- Microsoft.OperationsManagement

<br/>


## Choose a location
- To see a list of locations use: `az list locations`
- I would use `uksouth` as geographically it's the closest

<br/>


## Create a Resource Group
- command to create a resource group: `az group create --name [name] --location uksouth`

<br/>


## Create a Container Registry
- `az acr create --resource-group [rg] --location uksouth --name [registry-name] --sku [service-tier]`
  - Note: the registry name has to be globally unique

<br/>

- From here, docker images that are pushed to the registry will be accessed via the following format:
  - `<registry-name>.azurecr.io/<namespace>/<image-name>:<tag>`

<br/>

- Before pushing an image to the registry (with `docker push`), you need to login:
  - `az acr login --name [registry-name]`

<br/>


## Create a Cluster
- `az aks create --resource-group [rg] --name [cluster-name] --node-vm-size [node-size]`

<br/>

- This will create Kube master, the infrastructure and a node pool

<br/>

- To allow the cluster to pull images from the ACR we created:
  - `az aks show` gives us the id of the cluster
  - `az acr show` gives us the id of the acr
  - `az role assignment create --assignee [cluster-id] --role acrpull --scope [acr-id]`

<br/>


## Connecting to the Cluster with KubeCTL
- Credentials are needed in order to connect to the cluster
  - `az aks get-credentials --resource-group [rg] --name [cluster-name]`

<br/>


## Create a Kubernetes Deployment and Service
- Deployment:
  - `kubectl create deployment [deployment-name] --image [acr.azurecr.io/namespace/image:tag]`

<br/>

- Create a load-balancer to allow us to connect to the app externally:
  - `kubectl expose deployment [deployment-name] --port [load-balancer-port] --target-port [container-port]`

<br/>


## Try out the App
- run `kubectl get service` and locate the loadbalancer service, there should be an `EXTERNAL-IP` field. Following that IP in a browser window (or curl) will allow us to hit the load-balancer which will forward us to the app running in the cluster.