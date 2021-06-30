# ubuntu 20.04

## finish apache2_php74_sqlsrc
~~~
docker pull iachievedeam1/apache2_php74_sqlsrc:1.0.0
docker run --name php74 -itd -p 81:80 -p 8001:8000 iachievedeam1/apache2_php74_sqlsrc:1.0.0 bash
docker exec -it php74 bash
sudo service apache2 restart
~~~

## apache2 install  6/73/73
~~~bash
#!/bin/bash
sudo apt-get update -y
sudo apt install apache2 -y
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y
sudo apt install composer -y
~~~

## sqlsrv
~~~bash
#!/bin/bash
# SqlSrv on PHP 7.4 and Ubuntu 20.04
sudo apt update
sudo apt install php-pear php-dev -y
# 重要須重視
curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

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

## docker enviroment doing
~~~
docker pull ubuntu:20.04
docker run --name test -itd -p 80:80 -p 8000:8000 -p 1433:1433 ubuntu:20.04 bash
docker run --name test -itd -p 3306:3306 ubuntu:20.04 bash

docker exec -it test bash

apt-get update && apt-get -y install sudo && apt-get install vim && apt-get install -y yum
~~~


## mssql的安裝
~~~bash
#!/bin/bash
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
## docker mssql的安裝
~~~
sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" \
   -p 1433:1433 --name mssql -h sql1 \
   -d mcr.microsoft.com/mssql/server:2019-latest
~~~

### 連接非1433port的方法

~~~
server name:127.0.0.1,1434
~~~

參考資料:[SQL Server 透過 TCP/IP 遠端連線時如何使用非 1433 埠號](https://blog.miniasp.com/post/2009/03/29/How-to-connect-to-SQL-Server-using-non-default-1433-port)


## windows的php安裝sqlsrv過程

官網下載SQLSRV58這隻檔案
解壓縮至這個路徑：C:\xampp\php\ext
修改C:\xampp\php\php.ini的檔案，結尾處新增下列兩欄
~~~
extension=php_sqlsrv_74_ts_x64.dll  
extension=php_pdo_sqlsrv_74_ts_x64.dll  
~~~

參考資料：[PHP 使用 SQLSRV 連結 MS SQL Server 教學](https://oranwind.org/php-mssql-sqlsrv/)