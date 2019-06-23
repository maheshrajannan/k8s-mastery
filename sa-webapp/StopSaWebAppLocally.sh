#StopSaWebAppLocally.sh
echo "Stop Sa Web App Locally"+ `date`
ps ax | grep sentiment-analysis-web | cut -f2 -d" " - | xargs kill -9
ps ax | grep sentiment-analysis-web | cut -f1 -d" " - | xargs kill -9
ps ax | grep sentiment-analysis-web | cut -f2 -d" " - | xargs kill -9
ps ax | grep sentiment-analysis-web | cut -f1 -d" " - | xargs kill -9
ps ax | grep sentiment-analysis-web