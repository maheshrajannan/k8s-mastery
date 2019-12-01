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

# INFO: This check is added because sentiment-analysis-logic could be started twice, 
# as it has no port conflicts.
saLogicPreviousId="$(docker container ls -f ancestor="maheshrajannan/sentiment-analysis-logic" -f status=running -aq)"
if [ -n "$saLogicPreviousId" ]; then
  echo "sentiment_analysis container is ALREADY running $saLogicPreviousId :(  shutdown before starting.EXITING.. "
  exit 1
else
  echo "sentiment_analysis is NOT running. :) "
fi

#sh StopSaLogicLocally.sh
#sh StopSaLogicDocker.sh
echo "Building sentiment-analysis-logic"
docker build -f Dockerfile -t maheshrajannan/sentiment-analysis-logic .
echo "Pushing sentiment-analysis-logic"
docker push maheshrajannan/sentiment-analysis-logic
# The calling thread need NOT have parallelism
echo "Running sentiment-analysis-logic"
docker run -d -p 5050:5000 maheshrajannan/sentiment-analysis-logic &
sleep 5
echo "List of containers running now"
docker container ls -a
saLogicId="$(docker container ls -f ancestor="maheshrajannan/sentiment-analysis-logic" -f status=running -aq)"
echo " The one we just started is : $saLogicId"

if [ -n "$saLogicId" ]; then
  echo "sentiment_analysis container is running $(docker container ls -f ancestor=maheshrajannan/sentiment-analysis-logic -f status=running -aq) :) "
else
  echo "ERROR: sentiment_analysis is NOT running. :(  . Please Check logs/sa-logic.log"
  exit 1
fi


trap : 0

echo >&2 '
************
*** DONE InstallSaLogicDocker ***
************'
