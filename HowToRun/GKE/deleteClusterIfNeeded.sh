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
docker system prune -f

TRANSLATOR_EXIST=$(kubectl config get-contexts -o name | grep translator3 | wc -c)
echo "Do clusters exist?-" $TRANSLATOR_EXIST
if [[ TRANSLATOR_EXIST -ne 0 ]]; then
	TRANSLATOR=`kubectl config get-contexts -o name | grep translator`
	# gke_translator-258700_us-central1-f_translator3
	echo "The cluster to be deleted is :"$TRANSLATOR
	kubectl config delete-cluster $TRANSLATOR
	echo "Deleted the cluster :"$TRANSLATOR
	kubectl config delete-context $TRANSLATOR
	echo "Deleted the cluster context:"$TRANSLATOR
	gcloud container clusters delete translator3 -q --async
	echo "deletion of gcloud cluster is in progress...in background."
else
	echo "No clusters to delete"
fi

trap : 0

echo >&2 '
************
*** DONE deleteClusterIfNeeded ***
************'