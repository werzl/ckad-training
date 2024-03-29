#!/bin/sh
CRT="/var/run/secrets/kubernetes.io/serviceaccount/ca.crt" # cert will have been created by the Kubernetes service account controller, or when creating a specified service account
REMOTE_API="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT"
TOKEN="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
/usr/local/bin/kubectl proxy --server="$REMOTE_API" --certificate-authority="$CRT" --token="$TOKEN" --accept-paths='^.*'