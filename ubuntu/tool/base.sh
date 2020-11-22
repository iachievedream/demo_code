#!/bin/bash
sudo apt install vim -y
sudo apt-get update -y

# 中新增新酷音輸入法
sudo apt install ibus-chewing

# install yum，npm，nodejs，curl,composer,git
sudo apt install yum -y
sudo apt-get install npm -y
sudo apt-get install nodejs -y
sudo apt-get install curl -y
sudo apt install composer -y

# VScode install:
sudo apt-get install snapd -y
sudo snap install code --classic
# code //run VScode

# install docker
sudo apt-get update -y
sudo apt install docker.io -y

# apache2 install 6/73/73
sudo apt install apache2 -y
cd /var/www/html
sudo mv index.html index1.html
#apache2 -version

# # apache2改port的方法
# sudo nano /etc/apache2/ports.conf 
# # 改port及資料夾位置
# sudo nano /etc/apache2/sites-available/000-default.conf 
# # 重新啟動
# sudo service apache2 restart

# php install:
sudo apt install php7.2-cli -y
sudo apt install hhvm -y
# 新增
sudo apt-get install php7.2-xml -y
sudo apt-get install php-mbstring -y
sudo apt install libapache2-mod-php7.2 libapache2-mod-php -y
sudo service apache2 restart

# ubuntu安装MySQL
sudo apt-get install mysql-server -y
sudo apt install mysql-client -y
sudo apt install libmysqlclient-dev -y
# sudo mysql -u root -p
# # 建立賦予權限的帳戶 root_sql=ab,yourpasswd=12345678
# CREATE USER 'ab'@'localhost' IDENTIFIED BY '12345678';
# GRANT ALL PRIVILEGES ON *.* TO 'ab'@'localhost' WITH GRANT OPTION;
# # GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' IDENTIFIED BY 'yourpasswd';//賦予所有權限
# FLUSH PRIVILEGES;


# install phpmyadmin
sudo apt-get install phpmyadmin -y
# sudo nano /etc/apache2/apache2.conf

# and add the following line at the bottom of the file (you can add it anywhere in the file, I just choose the bottom here so that you can easily access it for modification):
# # Include /etc/phpmyadmin/apache.conf
# sudo service apache2 restart

# #see phpMyAdmin config
# sudo nano /etc/dbconfig-common/phpmyadmin.conf
# dbc_dbuser='root_sql'
# dbc_dbpass='yourpasswd'

# http://127.0.0.1/phpmyadmin/


# install ssh
sudo apt-get install ssh -y
# 查看SSH有無被開啟
# netstat -a | grep ssh
# 成功會顯示：tcp 0 0 *:ssh *:* LISTEN
# 連線方式:ssh username@hostname

# sudo service ssh start
# sudo service ssh stop
# sudo service ssh restart


# tool
# 還原點設立
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo -i
apt update
apt install timeshift
