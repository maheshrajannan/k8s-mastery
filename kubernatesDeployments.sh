#kubernatesDeployments.sh
CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
kubectl get deployments
kubectl delete deployment sa-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app
kubectl get deployments

kubectl get services
kubectl delete service sa-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb
kubectl get services

kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get deployments
kubectl get pods

kubectl apply -f resource-manifests/service-sa-logic.yaml --record
kubectl get services
kubectl get pods

kubectl apply -f resource-manifests/sa-web-app-deployment.yaml --record
kubectl get deployments
kubectl get pods

kubectl apply -f resource-manifests/service-sa-web-app-lb.yaml
kubectl get services
kubectl get pods

minikube service list

new_values=`minikube service sa-web-app-lb --url| cut -d "/" -f 3-`

old_values=`cat oldValues.txt`
echo $new_values > oldValues.txt

cd sa-frontend
echo "Replacing time"
sed -ie 's/mode/kubernatesDeployments/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
cat public/index.html
echo "Running build"

echo "Replacing-"$old_values"-with-"$new_values"-src/App.js"
sed -ie 's/'$old_values'/'$new_values'/g' src/App.js
cat src/App.js

rm -fr node_modules

npm install

npm run build

docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend:minikube .
docker push $DOCKER_USER_ID/sentiment-analysis-frontend:minikube

sed -ie 's/kubernatesDeployments/mode/g' public/index.html
echo "Replacing :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html

cd ../
kubectl apply -f resource-manifests/sa-frontend-deployment.yaml
kubectl get pods
kubectl get svc

kubectl get pods
kubectl create -f resource-manifests/service-sa-frontend-lb.yaml
kubectl get svc

minikube service sa-frontend-lb