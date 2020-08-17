# I referred the guestbook application and microservices
# to find out how those are initialized.
# curl https://sdk.cloud.google.com | bash
# gcloud auth login
# gcloud config set project [PROJECT_ID]
# Maheshs-MBP-2:Translator-k8s maheshrajannan$ gcloud config get-value project
# redis-251601
# gcloud config set compute/zone [COMPUTE_ENGINE_ZONE]
# https://cloud.google.com/kubernetes-engine/docs/tutorials/guestbook
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG. Press enter to continue"
	read levelIsDebug	
else
	echo "Level is NOT DEBUG. There will be no wait"	
fi
if [ "$LEVEL" == "DEBUG" ]; then
	echo '1/25: Deleting gCloud Cluster'
	sh deleteGCloudCluster.sh
else
	echo '1/25: Skip deleting gCloud Cluster'	
fi
cd ../../
echo '2/25: Is glcoud initialized'
# Set node environment early so that it fails quickly.
source ~/.bash_profile
echo '3/25: Reset Docker to prevent connection error'
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
echo '4/25: Checking Docker'
echo "$DOCKER_PASSWORD" | docker login --username $DOCKER_USER_ID --password-stdin
docker login
docker ps
which nvm
nvm use 12.13.0
# INFO: 
# If you create more than 1 node and you exceed the limit,
# you have to wait 2 days for increasing or decreasing the limit..
# oh poor DEVOPS engineer..!
# You will get a silent insufficient CPU error if num-nodes is 3.
# I say silent because the pod will go to pending state
# when you do kubectl describe you will get WARNING insufficient CPU
# Details below,
# Warning  FailedScheduling  43s (x2 over 43s)  
# default-scheduler  0/1 nodes are available: 1 Insufficient cpu.
# https://stackoverflow.com/
# questions/38869673/pod-in-pending-state-due-to-insufficient-cpu
if [ "$LEVEL" == "DEBUG" ]; then
	echo '5/25: Create the cluster from scratch if necessary.[OPTIONAL]'
	gcloud container clusters create translator3 --num-nodes=2
else
	echo '6/25 SKIP creating cluster from scratch'	
fi

echo "7/25 Building sa-logic component in no hup mode"
cd sa-logic
# TODO: add readness probe. 
# INFO: SA logic is pre-requisite to webapp so no hup.
sh BuildSaLogicDocker.sh
cd ../

# INFO: SA Web App is pre-requisite to front end so no hup.
echo "8/25 Building sa-webapp component in no hup mode"
cd sa-webapp
sh BuildSaWebAppDocker.sh
cd ../


CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "Starting At "$CURRENT_DATE
echo "9/25 Deleting Deployments"
kubectl get deployments
#INFO: there may not be a need to delete.
kubectl delete deployment translator-frontend
kubectl delete deployment sa-logic
kubectl delete deployment sa-web-app
kubectl get deployments

kubectl get services
kubectl delete service translator-frontend-lb
kubectl delete service sa-logic
kubectl delete service sa-web-app-lb
kubectl get services

if [ "$LEVEL" == "DEBUG" ]; then
	echo "10/25 Press Enter if sa-logic is pushed to docker hub."
	read saLogicIsPushed
else
	echo '10/25 SA logic pushed.'	
fi

echo '11/25 SA logic deployment.'	
kubectl apply -f resource-manifests/sa-logic-deployment.yaml --record
kubectl get deployments
kubectl get pods

echo '12/25 SA logic service.'	
kubectl apply -f resource-manifests/service-sa-logic.yaml --record
kubectl get services
kubectl get pods

if [ "$LEVEL" == "DEBUG" ]; then
	echo "13/25 Press Enter if sa-webapp is pushed to docker hub."
	read saWebappIsPushed
else
	echo '13/25 SA webapp pushed.'	
fi

echo '14/25 SA webapp deployment.'	
kubectl apply -f resource-manifests/sa-web-app-deployment.yaml --record
kubectl get deployments
kubectl get pods

echo '15/25 SA service deployment.'	
kubectl apply -f resource-manifests/service-sa-web-app-lb.yaml
kubectl get services
kubectl get pods

echo '16/25 Check rollout status.'	
# INFO: This is to prevent silent Errors.
kubectl rollout status deployment sa-logic
kubectl rollout status deployment sa-web-app

# TODO: This loop may not be necessary.
echo '17/25 ip and port values for translator-frontend.'	
newIp=""
newPort=""
while [ -z $newIp ]; do
    sleep 5
    newIp=`kubectl get service sa-web-app-lb --output=jsonpath='{.status.loadBalancer.ingress[0].ip}'`
	newPort=`kubectl get service sa-web-app-lb --output=jsonpath='{.spec.ports[0].port}'`
done

echo "newIp "$newIp
echo "newPort "$newPort
new_values="$newIp:$newPort"
old_values=`cat oldValues.txt`
echo "Old Values Are "$old_values
echo "New Values Are "$new_values
echo $new_values > oldValues.txt

echo '18/25 inserting time values for translator-frontend.'	
cd translator-frontend
echo "Replacing time"
sed -ie 's/mode/gCloudK8s/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
cat public/index.html
echo "Running build"

echo '19/25 inserting ip/port values for translator-frontend.'	
echo "Replacing-"$old_values"-with-"$new_values"-src/App.js"
sed -ie 's/'$old_values'/'$new_values'/g' src/App.js
cat src/App.js

echo '20/25 building translator-frontend.'	
# TODO:
rm -fr node_modules

npm install

npm run build

docker build -f CompleteDockerfile -t $DOCKER_USER_ID/translator-frontend:Minikube .
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Is build successful ?"
	read levelIsDebug	
fi

docker push $DOCKER_USER_ID/translator-frontend:Minikube

if [ "$LEVEL" == "DEBUG" ]; then
	echo "Is push successful ?"
	read levelIsDebug	
fi

echo "21/25 Restoring mode"
sed -ie 's/gCloudK8s/mode/g' public/index.html
echo "22/25 Restoring :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html

echo "23/25 translator-frontend deployment."
cd ../
kubectl apply -f resource-manifests/translator-frontend-deployment.yaml
kubectl get pods
kubectl get svc

echo "23/25 translator-frontend service."
kubectl get pods
kubectl create -f resource-manifests/service-translator-frontend-lb.yaml
kubectl get svc
kubectl rollout status deployment translator-frontend

echo "24/25 translator-frontend service."
translatorIp=""
translatorPort=""
while [ -z $translatorIp ]; do
    sleep 5
    kubectl get svc
    translatorIp=`kubectl get service translator-frontend-lb --output=jsonpath='{.status.loadBalancer.ingress[0].ip}'`
	translatorPort=`kubectl get service translator-frontend-lb --output=jsonpath='{.spec.ports[0].port}'`
done

echo "25/25 launch "$translatorIp":"$translatorPort