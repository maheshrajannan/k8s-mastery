#!/bin/sh

abort()
{
    echo >&2 '
***************
*** ABORTED InstallTranslatorFrontendDocker ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
echo "Please ensure you are logged in to docker / docker desktop"
source ~/.bash_profile
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
docker ps

CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "CURRENT_DATE:"+$CURRENT_DATE
#Set node environment early so that it fails quickly.
#which nvm
nvm use 12.13.0
# sh StopTranslatorFrontEndDocker.sh
# sh StopTranslatorFrontEndLocalNginx.sh
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
docker build -f Dockerfile -t $DOCKER_USER_ID/translator-frontend .
docker push $DOCKER_USER_ID/translator-frontend
docker pull $DOCKER_USER_ID/translator-frontend
sed -ie 's/docker/mode/g' public/index.html
echo "Replacing :"$CURRENT_DATE" With current_time"
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html
cat public/index.html
docker run -d -p 80:80 $DOCKER_USER_ID/translator-frontend
echo "List of containers running now"
docker container ls -a
echo "Opening the translator-frontend"
translatorFrontEndId="$(docker container ls -f ancestor="maheshrajannan/translator-frontend" -f status=running -aq)"
echo " The one we just started is : $translatorFrontEndId"

if [ -n "$translatorFrontEndId" ]; then
  echo "translator-frontend container is running $(docker container ls -f ancestor=maheshrajannan/translator-frontend -f status=running -aq) :) "
else
  echo "ERROR: translator-frontend is NOT running. :(  . Please Check logs/translator-frontend.log"
  exit 1
fi


open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10


trap : 0

echo >&2 '
************
*** DONE InstallTranslatorFrontendDocker ***
************'
