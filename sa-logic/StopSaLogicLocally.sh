#StopSaLogicLocally.sh
echo "Stop Sa Logic Locally"+ `date`
ps ax | grep sentiment_analysis | cut -f1 -d" " - | xargs kill -9
ps ax | grep sentiment_analysis