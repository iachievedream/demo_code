#!/bin/bash
sudo apt install vim
sudo apt-get update 
# install yum，npm，nodejs，curl,composer,git
sudo apt install yum
sudo apt-get install npm
sudo apt-get install nodejs
sudo apt-get install curl
sudo apt install composer

# VScode install:
sudo apt-get install snapd
sudo snap install code --classic
# code //run VScode

# install docker
sudo apt-get update
sudo apt install docker.io

# php install:
sudo apt install php7.2-cli
sudo apt install hhvm      

# apache2 install
sudo apt install apache2
cd /var/www/html
sudo mv index.html index1.html
#apache2 -version

# ubuntu安装MySQL
sudo apt-get install mysql-server
sudo apt install mysql-client
sudo apt install libmysqlclient-dev
# sudo mysql -u root -p
# # 建立賦予權限的帳戶 root_sql=ab,yourpasswd=12345678
# CREATE USER 'ab''@'localhost' IDENTIFIED BY '12345678';
# GRANT ALL PRIVILEGES ON *.* TO 'ab'@'localhost' WITH GRANT OPTION;
# # GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' IDENTIFIED BY 'yourpasswd';//賦予所有權限
# FLUSH PRIVILEGES;

# install phpmyadmin
sudo apt-get install phpmyadmin
# sudo nano /etc/apache2/apache2.conf

# and add the following line at the bottom of the file (you can add it anywhere in the file, I just choose the bottom here so that you can easily access it for modification):
# # Include /etc/phpmyadmin/apache.conf
# sudo service apache2 restart

# #see phpMyAdmin config
# sudo nano /etc/dbconfig-common/phpmyadmin.conf
# dbc_dbuser='root_sql'
# dbc_dbpass='yourpasswd'

# http://127.0.0.1/phpmyadmin/