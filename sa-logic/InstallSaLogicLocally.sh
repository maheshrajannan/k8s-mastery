#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaLogicLocally ***
***************
'
    echo "An error occurred InstallSaLogicLocally . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
#InstallSaLogicLocally.sh
#Kill the process
# If you get an error on pip package. run xcode-select --install
# https://ma.ttias.be/mac-os-xcrun-error-invalid-active-developer-path-missing-xcrun/

echo "InstallSaLogicLocally:"+ `date`
#sh StopSaLogicLocally.sh
which python3
pip3 install --user -r sa/requirements.txt
#python3 -m textblob.download_corpora
ps -ef | grep sentiment_analysis.py
#INFO: When you have issues run it directly to troubleshoot.
python3 sa/sentiment_analysis.py
#open http://localhost:5000

trap : 0

echo >&2 '
************
*** DONE InstallSaLogicLocally ***
************'
