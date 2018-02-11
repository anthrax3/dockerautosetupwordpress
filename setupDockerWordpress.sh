#!/bin/bash
# setup docker 
# get mysql & wordpress images
# test & run with firefox
# for lazy developers :)
# author Bosz Mand
# facebook: https://www.facebook.com/yalim.kankaya


echo Sitename?
read sitename

echo "sitename : " $sitename


echo Password?
read password

echo "nice password : " $password

echo Port?
read port

echo "port : " $port

echo "mysql Name ?"
read mysqlname

echo "mysql name : " $mysqlname

sudo apt-get install docker.io -y
wait & sudo docker pull mysql
wait & sudo docker pull wordpress 
wait & sudo docker run -d --name $mysqlname -e MYSQL_ROOT_PASSWORD=$password mysql
wait & sudo docker run -d --name $sitename --link $mysqlname:mysql -p $port:80 wordpress
wait & sleep 5s 
wait & sudo gnome-open "http://localhost:$port" 
