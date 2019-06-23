#InstallSaWebAppDocker.sh
echo "InstallSaWebAppDocker at" `date`
SA_LOGIC_CONTAINER_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-logic -aq)`
echo "SA_LOGIC_CONTAINER_IP:" $SA_LOGIC_CONTAINER_IP
SA_LOGIC_API_URL='http://'$SA_LOGIC_CONTAINER_IP":5000"
echo "SA_LOGIC_API_URL:"$SA_LOGIC_API_URL
sh StopSaWebAppLocally.sh
sh StopSaWebAppDocker.sh
echo "Building sentiment-analysis-web-app:"
docker build -f Dockerfile -t maheshrajannan/sentiment-analysis-web-app .
echo "Running sentiment-analysis-web-app:"
docker run -d -p 8080:8080 -e SA_LOGIC_API_URL=$SA_LOGIC_API_URL maheshrajannan/sentiment-analysis-web-app
echo "List of containers running now"
docker container ls -a