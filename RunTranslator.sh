#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred in RunTranslator.sh locally . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
#RunSentimentAnalyzer.sh
CURRENT_DIR=`pwd`
CURRENT_DATE=`date +%b-%d-%y_%I_%M_%S_%p`
mkdir logs/$CURRENT_DATE
mv logs/*.log logs/$CURRENT_DATE/
echo "Starting sa-logic"
cd sa-logic
sh InstallSaLogicLocally.sh > ../logs/sa-logic.log &
echo "Started sa-logic. Do tail -f logs/sa-logic.log from "+$CURRENT_DIR
#open -a Terminal $CURRENT_DIR/logs
sleep 45
if pgrep -f "sentiment_analysis" > /dev/null
then
  #TODO: bug, why is this NOT printing process number...REMOVE hack.
  echo "sentiment_analysis is running as $(pgrep -f 'sentiment_analysis') :) "
else
  echo "ERROR: sentiment_analysis is NOT running. :(  . Please Check logs/sa-logic.log"
  exit 1
fi

echo "Starting sa-webapp"
cd ../sa-webapp
sh InstallSaWebAppLocally.sh > ../logs/sa-webapp.log &
#open -a Terminal $CURRENT_DIR/logs
echo "Started sa-webapp. Do tail -f logs/sa-webapp.log from "+$CURRENT_DIR
sleep 45
if pgrep -f "sentiment-analysis-web" > /dev/null
then
  #TODO: bug, why is this NOT printing process number...REMOVE hack.
  echo "sentiment-analysis-web is running as $(pgrep -f 'sentiment-analysis-web') :) "
else
  echo "ERROR: sentiment-analysis-web is NOT running. :(  . Please Check logs/sa-webapp.log"
  exit 1
fi

#nginx
echo "Starting translator-frontend"
cd ../translator-frontend
sh InstallTranslatorFrontendLocalNginx.sh > ../logs/translator-frontend.log &
echo "Started translator-frontend. Do tail -f logs/translator-frontend.log from "+$CURRENT_DIR
#open -a Terminal $CURRENT_DIR/logs
sleep 45
if pgrep -f "nginx" > /dev/null
then
  #TODO: bug, why is this NOT printing process number...REMOVE hack.
  echo "nginx is running as $(pgrep -f 'nginx') :) "
else
  echo "ERROR: nginx is NOT running. :(  . Please Check logs/translator-frontend.log"
  exit 1
fi

cd ../
pwd

trap : 0

echo >&2 '
************
*** RunTranslator.sh locally DONE ***
************'
