#deployToLocal.sh
#Run it as sh deployToLocal.sh > deployToLocal.log &

node --version
npm --version
rm -fr ./node-modules
npm install
npm start

# now test the app at http://localhost:8080
# The text you enter will not be analzed.
# Just the text screen Analyzer by Mahesh and send button that's all.
# Output after you run this.
# Maheshs-MBP-2:sa-frontend maheshrajannan$ sh deployToLocal.sh 
# v10.14.2
# 6.4.1
# ⸨ ░░░░░░░░░░░░░░░░░⸩ ⠴ loadIdealTree:loadAllDepsIntoIdealTree: sill install loadIdealTree
# At localhost:3000
#Compiled successfully!

#You can now view salogic-front in the browser.

#  Local:            http://localhost:3000/
#  On Your Network:  http://192.168.1.64:3000/

# Note that the development build is not optimized.
# To create a production build, use yarn build.

open -a "Google Chrome" --args --incognito "http://localhost:3000"