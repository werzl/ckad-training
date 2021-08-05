1. Create folder on your local system

Mac/Linux: /tmp/data/db
Windows: c:/temp/data/db

2. Start up the Pod (make sure you're in the correct dir)
	`kubectl create -f mongo.deployment.yml`

3. Run `kubectl get pods` to see the pod

4. Run `kubectl exec [mongo-pod-name] -id sh` to shell into the container. Run the `mongo` command to make sure the database is working. Type `exit` to exit the shell.  
Note: If you have a tool that can hit MongoDB externally, you can `kubectl port-forward` to the pod to expose 27017.
  
You should see some files in the c:/temp/data/db folder.

5. Delete the mongo pod: `kubectl delete pod [mongo-pod-name]`.

6. Once the pod is deleted, run `kubectl get pv` and note the reclaim policy that's shown.

7. Delete everything else: `kubectl delete -f mongo.deployment.yml`.