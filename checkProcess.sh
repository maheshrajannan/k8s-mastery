#!/bin/bash

# https://stackoverflow.com/questions/7708715/check-if-program-is-running-with-bash-shell-script
#
check_process() {
  echo "$ts: checking $1"
  [ "$1" = "" ]  && return 0
  PROCESS_NUM=$(ps ax | grep $1 | grep -v "grep" | cut -f2 -d" ")
  if [[ -z $PROCESS_NUM && $PROCESS_NUM -gt 0 ]]; then
    echo "$1 is running as $PROCESS_NUM :) "
    return 1
  else
    echo "$1 is NOT running. :("
    return 0
  fi
}

#!/bin/sh
for i in 1 2 3
do
  echo "Checking #$i"
  # timestamp
  ts=`date +%T`
  echo "$ts: Began checking..."
  check_process "sentiment_analysis"
  if [ $? -eq 0 ]; then
    echo "Done Checking, NOT Running. :( .Sleeping Now."
    sleep 5
  else
    echo "Running Successfully. :) . No Action needed. "
    break
  fi
  echo "Done Checking.EXITING !!."
done
