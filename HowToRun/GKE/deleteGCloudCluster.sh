set -e
# TODO: this script is broken.
# TODO: Check gCloud has the cluster. If present then delete.
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
# INFO: https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device
echo "INFO: Docker system pruning to save space:"
docker system prune -f

TRANSLATOR=`kubectl config get-contexts -o name | grep translator`
echo "To Delete-" $TRANSLATOR
if [ -z $TRANSLATOR ]; then
	echo "No clusters to delete"
else
	# gke_translator-258700_us-central1-f_translator3
	echo "SOME clusters to delete"
	# kubectl config delete-cluster $TRANSLATOR
	# kubectl config delete-context $TRANSLATOR
fi

# kubectl config delete-cluster gke_translator-258700_us-central1-f_translator3
# deleted cluster gke_translator-258700_us-central1-f_translator3 from /Users/maheshrajannan/.kube/config
gcloud container clusters delete translator3 -q --async
echo "deletion of gcloud cluster is in progress...in background."