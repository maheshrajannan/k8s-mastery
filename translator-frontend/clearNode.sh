#!/bin/sh
abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred in clearNode.sh locally . Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e
echo "clearNode:"+ `date`
node --version
npm --version
echo "Deleting node modules:"+ `date`
rm -fr ./node-modules
echo "Installing node modules:"+ `date`
npm install
echo "INSTALLED node modules:"+ `date`

trap : 0

echo >&2 '
************
*** DONE clearNode ***
************'
