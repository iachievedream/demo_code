#!/bin/bash
apt-get update && apt-get -y install sudo && apt-get install vim && apt-get install -y yum

sudo apt-get update -y
sudo apt-get install npm -y # 6/73/73
sudo apt-get install nodejs -y
sudo apt-get install curl -y
sudo apt install composer -y


# # install ssh
# sudo apt-get install ssh -y
# # 查看SSH有無被開啟
# # netstat -a | grep ssh
# # 成功會顯示：tcp 0 0 *:ssh *:* LISTEN
# # 連線方式:ssh username@hostname

# # sudo service ssh start
# # sudo service ssh stop
# # sudo service ssh restart

## node
# 參考來源:https://oranwind.org/post-post-11/
sudo apt-get update -y
sudo apt-get install curl -y
curl --version
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs -y
node -v

# apache2 install  6/73/73
sudo apt install apache2 -y
sudo apt install php php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath -y
sudo apt install composer -y

cd /var/www/html
sudo mv index.html index1.html
echo "<?php phpinfo(); ?>" >> /var/www/html/phpinfo.php;
# apache2 -version

# php install:
sudo apt install php7.4-cli -y
sudo apt install hhvm -y
# 新增
sudo apt-get install php7.4-xml -y
sudo apt-get install php-mbstring -y
sudo apt-get install php7.4-curl -y
sudo apt-get install php7.4-mysql -y
sudo apt install libapache2-mod-php7.4 libapache2-mod-php -y
sudo service apache2 restart

# sqlsrv
sudo apt update -y
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

# 專案檔案下載
#cd /var/www/html/
#sudo git clone https://github.com/iachievedream/CodeIgniter3.git
#sudo git clone https://github.com/iachievedream/demo_code
#sudo git clone https://github.com/iachievedream/blog-laravel-jwt.git
#sudo git clone https://github.com/iachievedream/blog-laravel.git