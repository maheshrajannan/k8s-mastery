minikube --vm-driver=virtualbox start
minikube stop
# My mac has 8 core 
minikube start --memory 10240 --cpus=4 --vm-driver=virtualbox &
echo '1/20: Is Minikube running ?'