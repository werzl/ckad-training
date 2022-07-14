# Deleting the CLuster / Cleanup

## Delete Service
- `kubectl delete service [service-name]`

## Delete Cluster
- `az akd delete --resource-group [rg] --name [cluster-name]`

## Delete Images
- `az acr repository delete --name [acr-name] --image [namespace/image-name:tag]`

## Delete Resource Group
- `az group delete --name [rg]`
