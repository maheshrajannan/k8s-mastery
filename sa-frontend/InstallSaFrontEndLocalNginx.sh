#deployToLocalNginx.sh
#Run it as sh deployToLocal.sh > deployToLocal.log &
#echo <password> | sudo -S <command>
echo "SaFrontEndLocalNginx:"+ `date`
sh StopSaFrontEndLocalNginx.sh
sh clearNode.sh
#sudo brew services stop nginx
npm run build
TESTDATE=`date +%b-%d-%y_%I_%M_%S_%p`
NGINX_HOME="/usr/local/opt/nginx"
CURRENT=`pwd`
echo $TESTDATE 
echo $NGINX_HOME

#Backup what's there.
#tar -cvf $NGINX_HOME/html html.tar
#mv html.tar 

#Copy to /usr/local/opt/nginx/html

cd $NGINX_HOME
#zip ../ReportingProject_$TESTDATE ReportingProject -r . -x "*/node_modules/*"

zip $CURRENT/../Backups/NGINX-HTML_$TESTDATE html -r
#TODO: upload backups to nexus ?

ls -lrt $CURRENT/../Backups/NGINX-HTML_$TESTDATE.zip

cd $CURRENT

cp -vr build/* $NGINX_HOME/html
echo $my_pass | sudo -S sudo brew services start nginx
#sudo brew services start nginx

echo "Started nginx"

ps -ef | grep nginx

echo "Opening the sa-frontend"

open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10
open -a "Google Chrome" --args --incognito "http://localhost:80"
sleep 10