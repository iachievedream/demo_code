#!/bin/bash
sudo apt install git -y

# # Install PHP 7.4 on Ubuntu 20.04
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt install php7.4 php7.4-common php7.4-cli -y
sudo apt install php7.4-curl php7.4-mbstring php7.4-bz2 php7.4-readline php7.4-intl -y
sudo apt install php7.4-bcmath php7.4-bz2 php7.4-curl php7.4-intl php7.4-mbstring php7.4-mysql php7.4-readline php7.4-xml php7.4-zip -y
# https://computingforgeeks.com/how-to-install-php-on-ubuntu/


#下載xampp-linux-x64-7.4.13-0-installer.run
#安裝7.4.13 / PHP 7.4.13
php -r "copy('https://www.apachefriends.org/xampp-files/7.4.13/xampp-linux-x64-7.4.13-0-installer.run', 'xampp-linux-x64-7.4.13-0-installer.run');"
chmod 755 xampp-linux-x64-7.4.13-0-installer.run
sudo ./xampp-linux-x64-7.4.13-0-installer.run
# 備註8.0.0 / PHP 8.0.0	無法安裝

# composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# laravel8
cd /opt/lampp/htdocs
composer create-project laravel/laravel laravel8 --prefer-dist
cd laravel8
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap/cache

# composer install


# sudo nano /opt/lampp/etc/httpd.conf
# 把其中 Include etc/extra/httpd-vhosts.conf 這行取消註解

## sudo nano /opt/lampp/etc/extra/httpd-vhosts.conf
# <VirtualHost 192.168.0.31:80>
#     ServerAdmin webmaster@dummy-host2.example.com
#     DocumentRoot "/opt/lampp/htdocs/laravel/public"
#     ServerName laravel.local          
#     <Directory "/opt/lampp/htdocs/laravel">
#         Options All
#         AllowOverride All
#         Require all granted
#     </Directory>
# </VirtualHost>

# sudo nano /etc/hosts
# 新增一行
# 127.0.0.1 laravel.local

sudo /opt/lampp/lampp start
