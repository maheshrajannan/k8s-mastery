#RunSentimentAnalyzer.sh
CURRENT_DIR=`pwd`
CURRENT_DATE=`date +%b-%d-%y_%I_%M_%S_%p`
mkdir logs/$CURRENT_DATE
mv logs/*.log logs/$CURRENT_DATE/
echo "Starting sa-logic"
cd sa-logic
sh InstallSaLogicLocally.sh > ../logs/sa-logic.log &
echo "Started sa-logic. Do tail -f logs/sa-logic.log from "+$CURRENT_DIR
open -a Terminal $CURRENT_DIR/logs
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