#!/bin/bash

# https://stackoverflow.com/questions/7708715/check-if-program-is-running-with-bash-shell-script
# The reason this is important is because if deployment of the pre-requisite component fails, Then
# Propagate the error and stop deployment.
# There is no point in re-trying. It should have started the first time. If it fails, then check to sleep
# Why it fails, so that it restarts from scratch , after a fresh clean build.
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


triple_check_process "sentiment_analysis" 10
