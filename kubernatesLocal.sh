echo '1/20: Is Minikube running ?'
minikube status

#Minikube does not check, if it is already running.
#That's why minishift(open shift) is there.
#minikube start

echo '2/20: kubectl nodes ?'
kubectl get nodes
echo '3/20: kubectl pods ?'
kubectl get pods

echo '4/20: kubectl get deployments ?'
kubectl get deployments

echo '5/20: deleting deployment sa-frontend'
kubectl delete deployment sa-frontend
echo '6/20: kubectl remaining deployments after deleting sa-frontend deployment'
kubectl get deployments
echo '7/20: kubectl apply -f resource-manifests/sa-frontend-deployment.yaml'
kubectl apply -f resource-manifests/sa-frontend-deployment.yaml
echo '8/20: kubectl remaining deployments after creating sa-frontend deployment'
kubectl get deployments

echo '9/20: deleting deployment sa-web-app'
kubectl delete deployment sa-web-app
echo '9/20: kubectl remaining deployments after deleting sa-web-app deployment'
kubectl get deployments
echo '10/20: kubectl remaining deployments after creating sa-web-app deployment'
kubectl apply -f resource-manifests/sa-web-app-deployment.yaml
kubectl get deployments

echo 'deleting deployment sa-logic'
kubectl delete deployment sa-logic
echo 'kubectl remaining deployments after deleting sa-logic deployment'
kubectl get deployments
echo 'kubectl remaining deployments after creating sa-logic deployment'
kubectl apply -f resource-manifests/sa-logic-deployment.yaml
kubectl get deployments

