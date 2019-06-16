unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
sh StopSaFrontEndLocalNginx.sh
# To stop all running containers use the docker container stop command 
# followed by a list of all containers IDs.
docker container stop $(docker container ls -aq)
# Once all containers are stopped you can remove them using the 
# docker container stop command followed by the containers ID list.
docker container rm $(docker container ls -aq)
docker container ls -a
docker container prune
docker container ls -a
docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend .
docker container ls -a
#https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/
docker push $DOCKER_USER_ID/sentiment-analysis-frontend
docker pull $DOCKER_USER_ID/sentiment-analysis-frontend
docker run -d -p 80:80 $DOCKER_USER_ID/sentiment-analysis-frontend
docker container ls -a
echo "Opening the sa-frontend"

open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10