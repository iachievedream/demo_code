# ubuntu 20.04

## apache2的安裝
~~~bash
#!/bin/bash
sudo apt-get update -y
sudo apt install apache2 -y
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y

sudo apt install composer -y
~~~

## mssql的安裝
~~~bash
# Step 1: Update Ubuntu System
sudo apt-get update
sudo apt-get -y upgrade
sudo reboot

# Step 2: Import the public repository GPG keys:(有錯誤，但不影響)
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Step 3: Add Microsoft SQL Server 2019 Ubuntu repository:
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"

# Step 4: Install MS SQL Server 2019 on Ubuntu 20.04/18.04/16.04 LTS
sudo apt update
sudo apt install mssql-server -y

# Step 5: Initialize MS SQL Server 2019 on Ubuntu 20.04/18.04/16.04
sudo /opt/mssql/bin/mssql-conf setup

# 3
systemctl status mssql-server.service 
~~~


## sqlsrc
~~~bash
# SqlSrv on PHP 7.4 and Ubuntu 20.04
sudo apt update
sudo apt install php-pear php-dev -y
# 錯誤不理會
# curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo bash -c "curl -s https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list"
sudo apt update
sudo ACCEPT_EULA=Y apt -y install msodbcsql17 mssql-tools
sudo apt -y install unixodbc-dev
sudo apt -y install gcc g++ make autoconf libc-dev pkg-config
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo bash -c "echo extension=sqlsrv.so > /etc/php7.4/conf.d/sqlsrv.ini"
sudo bash -c "echo extension=pdo_sqlsrv.so > /etc/php7.4/conf.d/pdo_sqlsrv.ini"
sudo service php7.4-fpm restart

# # 確認方式
# sudo pecl install sqlsrv
# sudo pecl install pdo_sqlsrv

# 步驟 3： 安裝適用於 Microsoft SQL Server 的 PHP 驅動程式
# https://docs.microsoft.com/zh-tw/sql/connect/php/installation-tutorial-linux-mac?view=sql-server-2017

sudo pecl config-set php_ini /etc/php/7.4/fpm/php.ini
sudo pecl install sqlsrv
sudo pecl install pdo_sqlsrv
sudo su
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/7.4/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/7.4/mods-available/pdo_sqlsrv.ini
exit
sudo phpenmod -v 7.4 sqlsrv pdo_sqlsrv
~~~


## laravel設定
~~~
DB_CONNECTION=sqlsrv
DB_HOST=127.0.0.1
DB_PORT=1433
DB_DATABASE=laravel
DB_USERNAME=sa
DB_PASSWORD=
~~~


## filezilla
sudo apt-get install vsftpd
sudo /etc/init.d/vsftpd start
sudo /etc/init.d/vsftpd status

參考:[详解---filezilla连接不上Ubuntu解决办法](https://blog.csdn.net/xiaobai_IT_learn/article/details/89211359)