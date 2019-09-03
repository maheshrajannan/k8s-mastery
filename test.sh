newIp=""
newPort=""
while [ -z $newIp ]; do
    sleep 1
    newIp=`kubectl get service sa-web-app-lb --output=jsonpath='{.status.loadBalancer.ingress[0].ip}'`
	newPort=`kubectl get service sa-web-app-lb --output=jsonpath='{.spec.ports[0].port}'`
done

echo "newIp "$newIp
echo "newPort "$newPort
new_values="$newIp:$newPort"
old_values=`cat oldValues.txt`
echo "Old Values Are "$old_values
echo "New Values Are "$new_values