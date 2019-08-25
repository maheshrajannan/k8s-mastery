echo '1/5: Rest Docker to prevent connection error'
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH

echo '2/5: Deleting Deployments'
kubectl get deployments
kubectl delete deployment translator-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app
kubectl get deployments

echo '3/5: Deleting Services'
kubectl delete service translator-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb
minikube service list