#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED deleteClusterIfNeeded.sh ***
***************
'
    echo "An error occurred in deleteClusterIfNeeded.sh . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
# TODO: this script is broken.
# TODO: Check gCloud has the cluster. If present then delete.
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
# INFO: https://stackoverflow.com/questions/30604846/docker-error-no-space-left-on-device
echo "INFO: Docker system pruning to save space:"
TRANSLATOR_NAME=translator-app
docker system prune -f

TRANSLATOR_EXIST=$(kubectl config get-contexts -o name | grep $TRANSLATOR_NAME | wc -c)
echo "Do clusters exist?-" $TRANSLATOR_EXIST
if [[ TRANSLATOR_EXIST -ne 0 ]]; then
	TRANSLATOR_FOUND=`kubectl config get-contexts -o name | grep $TRANSLATOR_NAME`
	# gke_translator-258700_us-central1-f_translator3
	echo "The cluster to be deleted is :"$TRANSLATOR_FOUND
	kubectl config delete-cluster $TRANSLATOR_FOUND
	echo "Deleted the cluster :"$TRANSLATOR_FOUND
	kubectl config delete-context $TRANSLATOR_FOUND
	echo "Deleted the cluster context:"$TRANSLATOR_FOUND
	echo "gcloud container clusters delete $TRANSLATOR_FOUND -q --async"
	# INFO: when you try to do things parallely, then contexts will be deleted but not the cluster. 
	gcloud container clusters delete $TRANSLATOR_NAME
	echo "deletion of gcloud cluster is in progress...in background."
else
	echo "No clusters to delete"
fi

trap : 0

echo >&2 '
************
*** DONE deleteClusterIfNeeded ***
************'