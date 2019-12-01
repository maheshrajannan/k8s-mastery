#!/bin/sh

abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred in tripleCheckProcess. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e

# https://stackoverflow.com/questions/7708715/check-if-program-is-running-with-bash-shell-script
# The reason this is important is because if deployment of the pre-requisite component fails, Then
# Propagate the error and stop deployment.
# There is no point in re-trying. It should have started the first time. If it fails, then check to sleep
# Why it fails, so that it restarts from scratch , after a fresh clean build.
# TODO: what are the different forms of shell, bash shell and so on..
check_process() {
  ts=`date +%T`
  echo "$ts: checking $1"
  [ "$1" = "" ]  && return 0
  # PROCESS_NUM= pgrep -f $1
  # echo "$1 is running as $PROCESS_NUM :) " <-- use this for troubleshooting.
  # $(ps aux | grep $1 | grep -v grep | awk '{print $2}')
  #ps aux | grep "sentiment_analysis" | grep -v "grep" | awk '{print $2}'
  #if [[ -z $PROCESS_NUM && $PROCESS_NUM -gt 0 ]]; then <-- worked before.
  #if [ -n $PROCESS_NUM ] <-- ok, but process id is not printing below.
  if pgrep -f $1 > /dev/null
  then
    #TODO: bug, why is this NOT printing process number...REMOVE hack.
    echo "$1 is running as $(pgrep -f $1) :) "
    return 1
  else
    echo "$1 is NOT running. :("
    return 0
  fi
}

triple_check_process() {
  for i in 1 2 3
  do
    echo "Checking #$i"
    # timestamp
    ts=`date +%T`
    echo "$ts: Began checking..."
    check_process $1
    if [ $? -eq 0 ]; then
      echo "Done Checking, NOT Running. :( .Sleeping Now."
      sleep $2
    else
      echo "Running Successfully. :) . No Action needed. "
      return 1
    fi
  done
  echo "Done Checking.EXITING !!."
  return 0
}

trap : 0

echo >&2 '
************
*** DONE tripleCheckProcess ***
************
'
