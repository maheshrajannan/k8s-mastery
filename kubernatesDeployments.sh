#kubernatesDeployments.sh

kubectl delete deployment sa-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app

kubectl delete service sa-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb

kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get pods

kubectl apply -f resource-manifests/service-sa-logic.yaml
kubectl get pods

kubectl apply -f resource-manifests/sa-web-app-deployment.yaml --record
kubectl get pods

kubectl apply -f resource-manifests/service-sa-web-app-lb.yaml
kubectl get svc
kubectl get pods

minikube service list

read -p "After updating sa-frontend/src/App.js . Press any key..."

cd sa-frontend

rm -fr node_modules

npm install

npm run build

docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend:minikube .
docker push $DOCKER_USER_ID/sentiment-analysis-frontend:minikube

cd ../
kubectl apply -f resource-manifests/sa-frontend-deployment.yaml
kubectl get pods
kubectl get svc

kubectl get pods
kubectl create -f resource-manifests/service-sa-frontend-lb.yaml
kubectl get svc

minikube service sa-frontend-lb