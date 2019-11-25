#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaLogicDocker ***
***************
'
    echo "An error occurred InstallSaLogicDocker . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
#InstallSaLogicLocally.sh
#Kill the process
unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_TLS_PATH
echo "InstallSaLogic with Docker:"+ `date`
#sh StopSaLogicLocally.sh
#sh StopSaLogicDocker.sh
echo "Building sentiment-analysis-logic"
docker build -f Dockerfile -t maheshrajannan/sentiment-analysis-logic .
echo "Pushing sentiment-analysis-logic"
docker push maheshrajannan/sentiment-analysis-logic
echo "Running sentiment-analysis-logic"
docker run -d -p 5050:5000 maheshrajannan/sentiment-analysis-logic &
sleep 5
echo "List of containers running now"
docker container ls -a

trap : 0

echo >&2 '
************
*** DONE InstallSaLogicDocker ***
************'
