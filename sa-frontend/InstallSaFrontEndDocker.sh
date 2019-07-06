unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "CURRENT_DATE:"+$CURRENT_DATE
sh StopSaFrontendDocker.sh
sh StopSaFrontEndLocalNginx.sh
sh clearNode.sh
#sudo brew services stop nginx
#DONE replace time with date and mode with docker
echo "Replacing time"
sed -ie 's/mode/docker/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html

new_values="localhost:8080"
old_values=`cat ../oldValues.txt`
echo $new_values > ../oldValues.txt

echo "Replacing-"$old_values"-with-"$new_values"-src/App.js"
sed -ie 's/'$old_values'/'$new_values'/g' src/App.js
cat src/App.js

cat public/index.html
echo "Running build"
npm run build
#https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/
echo "building docker image"
docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend .
docker push $DOCKER_USER_ID/sentiment-analysis-frontend
docker pull $DOCKER_USER_ID/sentiment-analysis-frontend
sed -ie 's/docker/mode/g' public/index.html
echo "Replacing :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html
docker run -d -p 80:80 $DOCKER_USER_ID/sentiment-analysis-frontend
echo "List of containers running now"
docker container ls -a
echo "Opening the sa-frontend"

open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10