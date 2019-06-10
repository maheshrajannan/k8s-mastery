#InstallSaLogicLocally.sh
#Kill the process
ps ax | grep sentiment_analysis | cut -f1 -d" " - | xargs kill -9
which python3
python3 -m pip install -r sa/requirements.txt
python3 -m textblob.download_corpora
ps -ef | grep sentiment_analysis.py
#INFO: When you issues run it directly to troubleshoot.
python3 sa/sentiment_analysis.py
#open http://localhost:5000