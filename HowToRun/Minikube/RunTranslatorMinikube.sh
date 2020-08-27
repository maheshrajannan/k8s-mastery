#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED RunTranslatorMinikube.sh ***
***************
'
    echo "An error occurred in RunTranslatorMinikube.sh . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e

LEVEL=NONDEBUG
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG.Press Enter"
else
	echo "Level is NOT DEBUG. There will be no wait"	
fi

#kubernatesDeployments.sh
# NOTE:INFO:
# you would have to delete minikube if you face an error.
# install java again by downloading from oracle. if system extension are blocked.
# After that restart the system.
# minikube --vm-driver=virtualbox start
# minikube stop
# My mac has 8 core 
# Switch to root folder and run.

cd ../../
minikube start --memory 10240 --cpus=4 --vm-driver=virtualbox
echo '1/20: Is Minikube running ?'
minikube status
echo '2/20: Reset Docker to prevent connection error'
# TODO: Bad source of bug...sourcing bash profile here.
source ~/.bash_profile
# TODO: Do i need the below 3 lines ?
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
docker ps
echo '3/20: Set node environment early so that it fails quickly'
#Set node environment early so that it fails quickly.
# which nvm
nvm use 12.13.0

CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "Starting At "$CURRENT_DATE

echo "4/20 Deleting previous deployments."
#TODO: invoke delete.
kubectl get deployments
kubectl delete deployments --all
kubectl get deployments

kubectl get services
kubectl delete services --all
kubectl get services

echo "5/20 Building sa-logic component."
cd sa-logic
sh BuildSaLogicDocker.sh
cd ../

echo "6/20 Deploying sa-logic deployments."
kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get deployments
kubectl get pods


echo "7/20 Deploying service-sa-logic services."
kubectl apply -f resource-manifests/service-sa-logic.yaml --record
kubectl get services
kubectl get pods

echo "8/20 Deploying service-sa-web-app services."
kubectl apply -f resource-manifests/sa-web-app-deployment.yaml --record
kubectl get deployments
kubectl get pods

echo "9/20 Deploying service-sa-web-app-lb services."
kubectl apply -f resource-manifests/service-sa-web-app-lb.yaml
kubectl get services
kubectl get pods

minikube service list

echo "10/20 Computing url and time values"
new_values=`minikube service sa-web-app-lb --url| cut -d "/" -f 3-`

old_values=`cat oldValues.txt`
echo "Old Values Are "$old_values
echo "New Values Are "$new_values

if [ "$LEVEL" == "DEBUG" ]; then
	echo "Note the old and new values:";read consent;echo "you said $consent"
fi

echo $new_values > oldValues.txt
echo $old_values > newValues.txt

# TODO: This should go inside translator-frontend folder.
cd translator-frontend
echo "11/20 Replacing Time"
echo "Replacing time"
sed -ie 's/mode/kubernatesDeployments/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
cat public/index.html
echo "Running build"

echo "12/20 Replacing Urls"
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

echo "13/20 Installing.."
rm -fr node_modules

npm install

npm run build

docker build -f CompleteDockerfile -t $DOCKER_USER_ID/translator-frontend:Minikube .
echo "13/20 Pushing.."
docker push $DOCKER_USER_ID/translator-frontend:Minikube

echo "14/20 new image with tag Minikube is pushed"
if [ "$LEVEL" == "DEBUG" ]; then
	# If debug then add wait for input.
	echo "15/20 VERIFY new image tag Minikube"
	read xyz;
fi

echo "16/20 Replace mode"
sed -ie 's/kubernatesDeployments/mode/g' public/index.html
echo "Restoring :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html

echo "17/20 Deploying Frontend"
cd ../
kubectl apply -f resource-manifests/translator-frontend-deployment.yaml
kubectl get pods
kubectl get svc

echo "18/20 Deploying Frontend lb"
kubectl get pods
kubectl create -f resource-manifests/service-translator-frontend-lb.yaml
kubectl get svc

echo "19/20 Opening Frontend lb"
minikube service translator-frontend-lb
echo "20/20 DONE"

trap : 0

echo >&2 '
************
*** DONE RunTranslatorMinikube ***
************'