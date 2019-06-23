#StopSaWebappDocker.sh
echo "List of containers running now"
docker container ls -a
echo "sentiment-analysis-web-app container info"
docker container ls -f ancestor=maheshrajannan/sentiment-analysis-web-app
echo "Stopping sentiment-analysis-web-app container"
docker container stop $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-web-app -aq)
# Once all containers are stopped you can remove them using the 
# docker container stop command followed by the containers ID list.
echo "Removing sentiment-analysis-web-app container"
docker container rm $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-web-app -aq)
echo "List of containers running now"
docker container ls -a