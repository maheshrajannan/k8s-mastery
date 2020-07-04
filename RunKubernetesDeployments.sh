#kubernatesDeployments.sh
# NOTE:INFO:
# you would have to delete minikube if you face an error.
# install java again by downloading from oracle. if system extension are blocked.
# After that restart the system.
# minikube --vm-driver=virtualbox start
echo '1/20: Is Minikube running ?'
minikube status
echo '2/20: Reset Docker to prevent connection error'
source ~/.bash_profile
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
docker ps
echo '3/20: Set node environment early so that it fails quickly'
#Set node environment early so that it fails quickly.
which nvm
nvm use 12.13.0

CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "Starting At "$CURRENT_DATE

echo "4/20 Deleting previous deployments "
#TODO: invoke delete.
kubectl get deployments
kubectl delete deployment translator-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app
kubectl get deployments

kubectl get services
kubectl delete service translator-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb
kubectl get services

echo "5/20 Deploying sa-logic previous deployments"
kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get deployments
kubectl get pods


echo "6/20 Deploying service-sa-logic services"
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
echo "Old Values Are "$old_values
echo "New Values Are "$new_values
echo "Note the old and new values:";read consent;echo "you said $consent"

echo $new_values > oldValues.txt
echo $old_values > newValues.txt

cd translator-frontend
echo "Replacing time"
sed -ie 's/mode/kubernatesDeployments/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
cat public/index.html
echo "Running build"

# TODO: the bug is somewhere here.
echo "Replacing-"$old_values"-with-"$new_values"-src/App.js"
grep $old_values src/App.js
echo "Are old values found";read oldValuesFound;echo "hello $oldValuesFound"
sed -ie 's/'$old_values'/'$new_values'/g' src/App.js
echo "Now the values of app.js are:";read xyz;echo "hello $xyz"

cat src/App.js

echo "Verified app.js what webapp host:port it talks to ? does it math lb ?:";read xyz;echo "hello $xyz"

rm -fr node_modules

npm install

npm run build

docker build -f CompleteDockerfile -t $DOCKER_USER_ID/translator-frontend:Minikube .
docker push $DOCKER_USER_ID/translator-frontend:Minikube

echo "Verified new image with tag Minikube is pushed ?:";read xyz;echo "hello $xyz"


sed -ie 's/kubernatesDeployments/mode/g' public/index.html
echo "Restoring :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html

cd ../
kubectl apply -f resource-manifests/translator-frontend-deployment.yaml
kubectl get pods
kubectl get svc

kubectl get pods
kubectl create -f resource-manifests/service-translator-frontend-lb.yaml
kubectl get svc

minikube service translator-frontend-lb