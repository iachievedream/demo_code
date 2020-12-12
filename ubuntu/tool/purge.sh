#!/bin/bash
測試中

# yum，npm，nodejs，curl,composer,git
sudo apt-get --purge yum 
sudo apt-get --purge npm 
sudo apt-get --purge nodejs 
sudo apt-get --purge curl 
sudo apt-get --purge composer

# php
sudo apt-get –purge remove php7.2-cli php7.2-xml php-mbstring libapache2-mod-php7.2 libapache2-mod-php -y
sudo apt-get autoremove php7.2

# 解除安裝刪除php
sudo apt-get –purge remove libapache2-mod-php5 php5 php5-gd php5-mysql
sudo apt-get autoremove php5

# 刪除關聯，
sudo find /etc -name "*php*" |xargs rm -rf 

# 清楚殘留資訊
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P


# 檢查
dpkg -l | grep php
dpkg -l | grep php5

# MySQL
sudo apt-get --purge mysql-server
sudo apt-get --purge mysql-client
sudo apt-get --purge libmysqlclient-dev

# phpmyadmin
sudo apt-get --purge phpmyadmin -y


# Ubuntu 完全解除安裝 Apache2
# 刪除apache
sudo apt-get --purge remove apache-common
sudo apt-get --purge remove apache

# 找到沒有刪除掉的配置檔案,一併刪除
sudo find /etc -name "*apache*" |xargs  rm -rf
sudo rm -rf /var/www
sudo rm -rf /etc/libapache2-mod-jk
sudo rm -rf /etc/init.d/apache2
sudo rm -rf /etc/apache2
dpkg -l |grep apache2|awk '{print $2}'|xargs dpkg -P

# 參考:https://www.itread01.com/p/1390963.html



1. 移除套件例如 php7.2
sudo apt remove php7.2

移除所有包含 php7.2開頭的套件
sudo apt remove php7.2*

2. 移除用不到的相依套件
sudo apt-get autoremove

*移除套件包含可能遺留下來的檔案 
sudo apt-get purge  php7.2-fpm