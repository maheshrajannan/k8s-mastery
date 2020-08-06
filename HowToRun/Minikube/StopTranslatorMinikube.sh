# Switch to root folder and run.
cd ../../
echo '1/4: Rest Docker to prevent connection error'
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH

echo '2/4: Deleting Deployments'
kubectl get deployments
kubectl delete deployment translator-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app
kubectl get deployments

echo '3/4: Deleting Services'
kubectl delete service translator-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb
minikube service list

echo '3/4: Stopping Minikube'
minikube stop
echo '4/4: Minikube Status'
minikube status