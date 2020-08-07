set -e
# TODO: Check gCloud has the cluster. If present then delete.
yes | gcloud container clusters delete translator3
echo "Successfully deleted gCloud Cluster"
