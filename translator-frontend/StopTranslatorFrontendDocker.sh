#StopSaFrontendDocker.sh
echo "List of containers running now"
docker container ls -a
echo "translator-frontend container info"
docker container ls -f ancestor=maheshrajannan/translator-frontend
echo "Stopping translator-frontend container"
docker container stop $(docker container ls -f ancestor=maheshrajannan/translator-frontend -aq)
# Once all containers are stopped you can remove them using the 
# docker container stop command followed by the containers ID list.
echo "Removing translator-logic container"
docker container rm $(docker container ls -f ancestor=maheshrajannan/translator-frontend -aq)
echo "List of containers running now"
docker container ls -a