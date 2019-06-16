CURRENT_DATE=`date +%b-%d-%y_%I_%M_%S_%p`
sed -ie 's/mode/docker/g' public/index.html
sed -ie 's/current_time/'$CURRENT_DATE'/g' public/index.html
sed -ie 's/docker/mode/g' public/index.html
sed -ie 's/'$CURRENT_DATE'/current_time/g' public/index.html