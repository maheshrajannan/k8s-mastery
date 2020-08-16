#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED InstallSaLogicDocker ***
***************
'
    echo "An error occurred InstallSaLogicDocker . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
# TODO make this as bash variable.
# TODO Make this on every file ?
LEVEL=NONDEBUG
if [ "$LEVEL" == "DEBUG" ]; then
	echo "Level is DEBUG.Press Enter to continue."
	read levelIsDebug	
else
	echo "Level is NOT DEBUG. There will be no wait."	
fi

echo "Invoking script for building BuildSaLogicDocker."
sh BuildSaLogicDocker.sh

echo "Invoking script for running RunSaLogicDocker."
sh RunSaLogicDocker.sh

trap : 0

echo >&2 '
************
*** DONE InstallSaLogicDocker ***
************'