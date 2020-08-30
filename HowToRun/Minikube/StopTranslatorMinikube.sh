#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED StopTranslatorMinikube.sh ***
***************
'
    echo "An error occurred in StopTranslatorMinikube.sh . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
# Switch to root folder and run.
cd ../../
echo '1/4: Reset Docker to prevent connection error'
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH

echo '2/4: Deleting Deployments'
kubectl get deployments
kubectl delete deployment translator-frontend --ignore-not-found
kubectl delete deployment sa-logic --ignore-not-found
kubectl delete deployment sa-web-app --ignore-not-found
kubectl get deployments

echo '3/4: Deleting Services'
kubectl delete service translator-frontend-lb --ignore-not-found
kubectl delete service sa-logic --ignore-not-found
kubectl delete service sa-web-app-lb --ignore-not-found
minikube service list

echo '3/4: Stopping Minikube'
minikube stop
echo '4/4: Minikube Status'
# INFO: bug fixed in https://github.com/kubernetes/minikube/issues/6814
# minikube status
# After stopping when you do status, it returns non-zero.
echo "DONE"

trap : 0

echo >&2 '
************
*** DONE StopTranslatorMinikube ***
************'