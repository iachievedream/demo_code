#!/bin/bash
sudo apt-get update -y
sudo apt-get install npm -y
sudo apt-get install nodejs -y
sudo apt-get install curl -y
sudo apt install composer -y

# apache2 install  6/73/73
sudo apt install apache2
cd /var/www/html
sudo mv index.html index1.html
# apache2 -version

# php install:
sudo apt install php7.2-cli -y
sudo apt install hhvm -y
# 新增
sudo apt-get install php7.2-xml -y
sudo apt-get install php-mbstring -y
sudo apt install libapache2-mod-php7.2 libapache2-mod-php -y
sudo service apache2 restart