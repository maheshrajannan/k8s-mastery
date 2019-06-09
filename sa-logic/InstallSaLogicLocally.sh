#InstallSaLogicLocally.sh

which python3
python3 -m pip install -r sa/requirements.txt
python3 -m textblob.download_corpora
ps -ef | grep sentiment_analysis.py
python3 sa/sentiment_analysis.py
#open http://localhost:5000