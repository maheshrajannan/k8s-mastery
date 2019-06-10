#StopSentimentAnalyzer.sh

CURRENT_DIR=`pwd`
echo "Stopping sa-logic"
cd sa-logic
sh StopSaLogicLocally.sh > ../logs/sa-logic.log &
echo "Stopped sa-logic. Do tail -f logs/sa-logic.log from "+$CURRENT_DIR
echo "Starting sa-webapp"
cd ../sa-webapp
sh InstallSaWebAppLocally.sh > ../logs/sa-webapp.log &
open -a Terminal $CURRENT_DIR/logs
echo "Started sa-webapp. Do tail -f logs/sa-webapp.log from "+$CURRENT_DIR
echo "Starting sa-frontend"
cd ../sa-frontend
sh InstallSaFrontEndLocalNginx.sh > ../logs/sa-frontend.log &
echo "Started sa-frontend. Do tail -f logs/sa-frontend.log from "+$CURRENT_DIR
open -a Terminal $CURRENT_DIR/logs
cd ../
pwd

pkill -a Terminal