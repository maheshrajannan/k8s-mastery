set -e
# TODO: Check gCloud has the cluster. If present then delete.
# Maheshs-MBP-3:GKE maheshrajannan$ kubectl config get-contexts -o name | grep translator
# gke_translator-258700_us-central1-f_translator3
# Maheshs-MBP-3:GKE maheshrajannan$ kubectl config delete-cluster gke_translator-258700_us-central1-f_translator3
# deleted cluster gke_translator-258700_us-central1-f_translator3 from /Users/maheshrajannan/.kube/config
yes | gcloud container clusters delete translator3
echo "Successfully deleted gCloud Cluster"