#StopSaFrontEndLocalNginx.sh
echo "Stopping nginx locally"+ `date`
echo "Killing Chrome browsers (For clearing cache)"+ `date`
echo $my_pass | sudo -S sudo killall Google\ Chrome
sleep 10
echo "KILLED Chrome browsers (For clearing cache)"+ `date`
echo "Stopping nginx"+ `date`
echo $my_pass | sudo -S sudo brew services stop nginx
ps ax | grep nginx