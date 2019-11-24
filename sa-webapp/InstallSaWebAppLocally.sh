#!/bin/sh

abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaWebAppLocally.sh ***
***************
'
    echo "An error occurred InstallSaWebAppLocally . Exiting..." >&2
    exit 1
}
#InstallSaWebAppLocally.sh
# find and kill it.
# INFO: It also greps itself and says cannot kill, so that can be ignored.
echo "InstallSaWebAppLocally"+ `date`
#sh StopSaWebAppLocally.sh
which mvn
mvn --version
mvn clean install
java -jar target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar --sa.logic.api.url=http://localhost:5000

echo >&2 '
************
*** DONE InstallSaWebAppLocally.sh ***
************'
