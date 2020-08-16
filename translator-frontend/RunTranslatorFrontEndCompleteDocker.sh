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
#TODO: add check to ensure the user is logged in.
echo "Please ensure you are logged in to docker / docker desktop"
source ~/.bash_profile

# TODO make this as bash variable.
# TODO Make this on every file ?
LEVEL=NONDEBUG
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG.Press Enter to continue."
	read levelIsDebug	
else
	echo "Level is NOT DEBUG. There will be no wait."	
fi

unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH

echo "Trying to login. If you are NOT logged in, there will be a prompt"
docker login
docker ps

CURRENT_DATE=`date +%b-%d-%y_%I_%M_%p`
echo "CURRENT_DATE:"+$CURRENT_DATE

# This is the running part.

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

# End of running.

trap : 0

echo >&2 '
************
*** DONE InstallTranslatorFrontendDocker ***
************'