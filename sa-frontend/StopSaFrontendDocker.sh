#StopSaFrontendDocker.sh
echo "List of containers running now"
docker container ls -a
echo "sentiment-analysis-frontend container info"
docker container ls -f ancestor=maheshrajannan/sentiment-analysis-frontend
echo "Stopping sentiment-analysis-frontend container"
docker container stop $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-frontend -aq)
# Once all containers are stopped you can remove them using the 
# docker container stop command followed by the containers ID list.
echo "Removing sentiment-analysis-logic container"
docker container rm $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-frontend -aq)
echo "List of containers running now"
docker container ls -a