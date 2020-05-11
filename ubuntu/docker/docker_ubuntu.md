# docker_ubuntu

[Dockerfile](#Dockerfile)<br>
[pull_ubuntu](#pull_ubuntu)<br>
[mysql_root](#mysql_root)<br>
[laravel]](#laravel)<br>
[後續步驟](#後續步驟)<br>

[Q&A](#Q&A)<br>
* [sudo_command_not_found](#sudo_command_not_found)<br>
* [vim_command_not_found](#vim_command_not_found)<br>
* [unable_to_locate_package_yum](#unable_to_locate_package_yum)<br>
* [extensions](#extensions)<br>
* [composer_update](#composer_update)<br>

* [laravel_Artisan_migrate_could_not_find_driver](#laravel_Artisan_migrate_could_not_find_driver)<br>


## Dockerfile

~~~
sudo mkdir docker_ubuntu
sudo chmod 777 docker_ubuntu
cd docker_ubuntu

sudo nano Dockerfile
====
docker hub複製過來，但無法build。
====
sudo docker build -t docker_ubuntu:v1 .

sudo docker build -t docker_ubuntu .
~~~
[回目錄](#docker_ubuntu)

# pull_ubuntu
下載
~~~
docker pull ubuntu
~~~
檢查images
~~~
sudo docker images
~~~
運行contain
~~~
sudo docker run -t -i ubuntu /bin/bash
~~~
進入contain
~~~
sudo docker exec -it ubuntutest bash
~~~
執行下方指令在contain內
* [sudo_command_not_found](#sudo_command_not_found)<br>
~~~
apt-get update && apt-get -y install sudo
~~~
* [vim_command_not_found](#vim_command_not_found)<br>
~~~
apt-get update
apt-get install vim
~~~
* [unable_to_locate_package_yum](#unable_to_locate_package_yum)<br>
~~~
apt-get update && apt-get install -y git
~~~

* [extensions](#extensions)<br>

vim base.sh
~~~
#!/bin/bash
sudo apt-get install npm
sudo apt-get install nodejs
sudo apt-get install curl
sudo apt install composer

# php install:
sudo apt install php7.2-cli
sudo apt install hhvm      
sudo apt-get install php7.2-xml
sudo apt-get install php-mbstring

# apache2 install
sudo apt install apache2
cd /var/www/html
sudo mv index.html index1.html

# ubuntu安装MySQL
sudo apt-get install mysql-server
sudo apt install mysql-client
sudo apt install libmysqlclient-dev
# sudo mysql -u root -p
~~~

## mysql_root

~~~
//安裝mysql
sudo docker pull mysql
sudo docker run -itd --name mysqltest -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql

//進入MySQL
sudo docker exec -t mysqltest bash
sudo docker exec -it mysqltest mysql -u root -p

//安裝phpmyadmin
sudo docker search phpmyadmin
sudo docker pull phpmyadmin/phpmyadmin

//連接phpmyadmin的資料
sudo docker run --name myadmin -d --link mysqltest:db -p 9100:80 phpmyadmin/phpmyadmin
~~~

<a href="https://newtoypia.blogspot.com/2019/03/mysql-password.html">ubuntu 18.04 之 mysql 忘記 root 密碼</a>

vi /etc/mysql/mysql.conf.d/mysqld.cnf

Q&A

System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down


docker run -t -i ubuntu /bin/bash


sudo docker run -tid --name ubuntu --privileged=true ubuntu /sbin/init
docker exec -it test_2 /bin/bash


https://mlog.club/article/2247728

下载MySQL时出现奇怪的错误
Cannot stat file /proc/2846/fd/7: Permission denied


sudo apt-get install aptitude


yum-config-manager —add-repo https://download.docker.com/linux/centos/docker-ce.repo

# laravel

~~~
sudo git clone https://github.com/iachievedream/blog-laravel.git

sudo chown -R www-data:root /var/www/html/blog-laravel
//更改的目標用戶組和用戶，更改的目標文件夾
sudo chmod -R 755 blog-laravel
sudo chmod -R 777 blog-laravel/storage

cd blog-laravel
composer install 
sudo cp .env.example .env
**set up MySQL of root and password
sudo nano .env
php artisan key:generate
php artisan migrate:refresh
php artisan db:seed
php artisan serve
~~~


# 後續步驟
~~~
確認container
docker ps
sudo docker ps -a          

停止container
docker stop container_id

刪除container
docker rm container_id

確認image
docker images

刪除image
docker rmi image_id
~~~

## Q&A

### sudo_command_not_found
<a href="https://stackoverflow.com/questions/39985480/unable-to-use-sudo-commands-within-docker-bash-sudo-command-not-found-is-di">Unable to use sudo commands within Docker, “bash: sudo: command not found” is displayed</a>
~~~
apt-get update && apt-get -y install sudo
~~~
在Dockerfile中加入：
~~~
RUN apt-get update && apt-get install sudo
~~~

測試
https://www.cnblogs.com/6324/p/11652122.html
https://www.twblogs.net/a/5d7e5698bd9eee541c3469fc

### vim_command_not_found
<a href="https://stackoverflow.com/questions/30853247/how-do-i-edit-a-file-after-i-shell-to-a-docker-container">How do I edit a file after I shell to a Docker container?</a><br>

And run:
~~~
apt-get update
apt-get install vim
Or use the following Dockerfile:
~~~
FROM  confluent/postgres-bw:0.1
~~~
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
~~~


### unable_to_locate_package_yum
~~~
apt-get update && apt-get install -y git
~~~
<a href="https://stackoverflow.com/questions/29929534/docker-error-unable-to-locate-package-git/29929714"><//a>

### extensions
~~~
sudo apt-get install php-mbstring
~~~

### composer_update
In PackageManifest.php line 131: Undefined index: name

~~~
composer self-update
~~~

### laravel_Artisan_migrate_could_not_find_driver
laravel:php artisan migrate:refresh

<a href="https://stackoverflow.com/questions/46745365/artisan-migrate-could-not-find-driver">Artisan migrate could not find driver</a><br>



   Illuminate\Database\QueryException  : could not find driver (SQL: select * fr
om information_schema.tables where table_schema = dev_oms and table_name = migra
tions)


sudo nano /etc/php/7.2/cli/php.ini

原因是php.ini 擴充套件"php_pdo_mysql.dll"沒開啟

extension=php_pdo_mysql.dll

906
;extension=pdo_mysql

;extension=pdo_sqlite

#### mysql
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)


<a href="https://stackoverflow.com/questions/19658891/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run">Artisan migrate could not find driver</a><br>
