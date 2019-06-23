#StopAllContainers.sh
# To stop all running containers use the docker container stop command 
# followed by a list of all containers IDs.
echo "Listing All Containers:"
docker container ls -a
docker container stop $(docker container ls -aq)
echo "After Stopping All Containers:"
docker container ls -a
# Once all containers are stopped you can remove them using the 
# docker container stop command followed by the containers ID list.
docker container rm $(docker container ls -aq)
echo "After Removing All Containers:"
docker container ls -a
docker container prune
echo "After Pruning All Containers:"
docker container ls -a