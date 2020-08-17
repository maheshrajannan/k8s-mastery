#!/bin/sh

abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaWebAppDockerNew.sh ***
***************
'
    echo "An error occurred InstallSaWebAppDocker . Exiting..." >&2
    exit 1
}
#InstallSaWebAppDocker.sh
LEVEL=NONDEBUG
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG.Press Enter to continue."
	read levelIsDebug	
else
	echo "Level is NOT DEBUG. There will be no wait."	
fi

echo "Invoking script for Building BuildSaWebAppDocker"
sh BuildSaWebAppDocker.sh

echo "Invoking script for Running RunSaWebAppDocker"
sh RunSaWebAppDocker.sh

echo >&2 '
************
*** DONE InstallSaWebAppDockerNew.sh ***
************'