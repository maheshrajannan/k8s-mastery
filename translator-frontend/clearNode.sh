echo "clearNode:"+ `date`
node --version
npm --version
echo "Deleting node modules:"+ `date`
rm -fr ./node-modules
echo "Installing node modules:"+ `date`
npm install
echo "INSTALLED node modules:"+ `date`
