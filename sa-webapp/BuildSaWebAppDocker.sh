#!/bin/sh

abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaWebAppLocally.sh ***
***************
'
    echo "An error occurred InstallSaWebAppDocker . Exiting..." >&2
    exit 1
}
#InstallSaWebAppDocker.sh
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

echo "InstallSaWebAppDocker at" `date`
docker build -f Dockerfile -t maheshrajannan/sentiment-analysis-web-app .
echo "Pushing sentiment-analysis-web-app:"
#TODO: compare with buildSaLogicDocker.sh and add missing trap commands.
docker push maheshrajannan/sentiment-analysis-web-app

echo >&2 '
************
*** DONE InstallSaWebAppDocker.sh ***
************'