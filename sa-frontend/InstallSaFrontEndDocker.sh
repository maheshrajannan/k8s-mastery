unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "CURRENT_DATE:"+$CURRENT_DATE
sh StopSaFrontEndLocalNginx.sh
sh clearNode.sh
#sudo brew services stop nginx
#TODO replace time with date and mode with docker
sed -ie 's/mode/docker/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
npm run build
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
sed -ie 's/docker/mode/g' public/index.html
echo "Replacing :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
docker run -d -p 80:80 $DOCKER_USER_ID/sentiment-analysis-frontend
docker container ls -a
echo "Opening the sa-frontend"

open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
