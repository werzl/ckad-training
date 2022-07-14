# Updating an Application
In order to update an application running in a cluster, you'll need to build a new version of the image that the app is running on, and push it to the ACR.

<br/>


## Building and Pushing the Image
- to build the image: `docker build --tag [acr.azurecr.io/namespace/image-name:tag] ./path-to-dockerfile`
- to push the image: `docker push [acr.azurecr.io/namespace/image-name:tag]`

<br/>


## Updating the Image in the Cluster
- `kubectl set image deployment/[deployment-name] [image-name]=[acr.azurecr.io/namespace/image-name:tag]`
  - This will automatically spin up new pods with the new image


