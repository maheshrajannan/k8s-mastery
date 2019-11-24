#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED StopTranslator.sh ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
#StopSentimentAnalyzer.sh
#If you want to stop and log off for the day.
# TODO: StopTranslator.sh is un-necessary
sh Stop3Components.sh
#pkill -a Terminal

trap : 0

echo >&2 '
************
*** DONE StopTranslator.sh ***
************'
