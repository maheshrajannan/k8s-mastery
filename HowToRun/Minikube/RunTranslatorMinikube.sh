#kubernatesDeployments.sh
# NOTE:INFO:
# you would have to delete minikube if you face an error.
# install java again by downloading from oracle. if system extension are blocked.
# After that restart the system.
# minikube --vm-driver=virtualbox start
# minikube stop
# My mac has 8 core 
# Switch to root folder and run.

LEVEL=NONDEBUG
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG"
	read levelIsDebug	
else
	echo "Level is NOT DEBUG. There will be no wait"	
fi

cd ../../
minikube start --memory 10240 --cpus=4 --vm-driver=virtualbox
echo '1/16: Is Minikube running ?'
minikube status
echo '2/16: Reset Docker to prevent connection error'
source ~/.bash_profile
# TODO: Do i neeed the below 3 lines ?
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
docker ps
echo '3/16: Set node environment early so that it fails quickly'
#Set node environment early so that it fails quickly.
which nvm
nvm use 12.13.0

CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "Starting At "$CURRENT_DATE

echo "4/16 Deleting previous deployments."
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

echo "5/16 Deploying sa-logic previous deployments."
kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get deployments
kubectl get pods


echo "6/16 Deploying service-sa-logic services."
kubectl apply -f resource-manifests/service-sa-logic.yaml --record
kubectl get services
kubectl get pods

echo "7/16 Deploying service-sa-web-app services."
kubectl apply -f resource-manifests/sa-web-app-deployment.yaml --record
kubectl get deployments
kubectl get pods

echo "8/16 Deploying service-sa-web-app-lb services."
kubectl apply -f resource-manifests/service-sa-web-app-lb.yaml
kubectl get services
kubectl get pods

minikube service list

echo "9/16 Computing url and time values"
new_values=`minikube service sa-web-app-lb --url| cut -d "/" -f 3-`

old_values=`cat oldValues.txt`
echo "Old Values Are "$old_values
echo "New Values Are "$new_values

if [ "$LEVEL" == "DEBUG" ]; then
	echo "Note the old and new values:";read consent;echo "you said $consent"
fi

echo $new_values > oldValues.txt
echo $old_values > newValues.txt

cd translator-frontend
echo "10/16 Replacing Time"
echo "Replacing time"
sed -ie 's/mode/kubernatesDeployments/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
cat public/index.html
echo "Running build"

echo "11/16 Replacing Urls"
echo "Replacing-"$old_values"-with-"$new_values"-src/App.js"
grep $old_values src/App.js

if [ "$LEVEL" == "DEBUG" ]; then
	echo "Are old values found";
	read oldValuesFound;	
fi

echo "hello $oldValuesFound"
sed -ie 's/'$old_values'/'$new_values'/g' src/App.js
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Now the values of app.js are:";read xyz;echo "hello $xyz"
fi

cat src/App.js

if [ "$LEVEL" == "DEBUG" ]; then
	echo "Verified app.js what webapp host:port it talks to ? does it math lb ?:";read xyz;echo "hello $xyz"
fi

echo "12/16 Installing.."
rm -fr node_modules

npm install

npm run build

docker build -f CompleteDockerfile -t $DOCKER_USER_ID/translator-frontend:Minikube .
docker push $DOCKER_USER_ID/translator-frontend:Minikube

echo "13/16 new image with tag Minikube is pushed"
if [ "$LEVEL" == "DEBUG" ]; then
	# If debug then add wait for input.
	echo "13/16 VERIFY new image tag Minikube"
	read xyz;
fi

echo "14/16 Replace mode"
sed -ie 's/kubernatesDeployments/mode/g' public/index.html
echo "Restoring :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html

echo "15/16 Deploying Frontend"
cd ../
kubectl apply -f resource-manifests/translator-frontend-deployment.yaml
kubectl get pods
kubectl get svc

echo "16/16 Deploying Frontend lb"
kubectl get pods
kubectl create -f resource-manifests/service-translator-frontend-lb.yaml
kubectl get svc

minikube service translator-frontend-lb