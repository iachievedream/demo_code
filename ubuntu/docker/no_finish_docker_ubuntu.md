# docker_ubuntu

[Dockerfile](#Dockerfile)<br>
[pull_ubuntu](#pull_ubuntu)<br>

[Q&A](#Q&A)<br>
* [extensions](#extensions)<br>
* [composer_update](#composer_update)<br>

* [laravel_Artisan_migrate_could_not_find_driver](#laravel_Artisan_migrate_could_not_find_driver)<br>


## Dockerfile
新增專屬料夾以及開權限且進入資料夾內
~~~
sudo mkdir docker_ubuntu
sudo chmod 777 docker_ubuntu
cd docker_ubuntu
~~~

sudo vi Dockerfile
~~~Dockerfile
FROM ubuntu:18.04

MAINTAINER iachievedream

RUN apt-get update && apt-get -y install sudo && apt-get install vim
# RUN apt-get update
RUN apt-get install npm
RUN apt-get install nodejs
RUN apt-get install curl
RUN apt install composer
# php install:
RUN apt install php7.4-cli
RUN apt install hhvm
RUN apt-get install php7.4-xml
RUN apt-get install php-mbstring
# apache2 install
RUN apt install apache2

# ubuntu安装MySQL
RUN apt-get install mysql-server
RUN apt install mysql-client
RUN apt install libmysqlclient-dev
# RUN apt-get update -y \
# &&  apt-get install nginx -y

EXPOSE 8080
EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
CMD ["appache2;"]
~~~

sudo docker build -t docker_ubuntu:v1 .
sudo docker build -t docker_ubuntu .



<a href="https://newtoypia.blogspot.com/2019/03/mysql-password.html">ubuntu 18.04 之 mysql 忘記 root 密碼</a>


## Q&A

### laravel_Artisan_migrate_could_not_find_driver
laravel:php artisan migrate:refresh

<a href="https://stackoverflow.com/questions/46745365/artisan-migrate-could-not-find-driver">Artisan migrate could not find driver</a>

~~~
Illuminate\Database\QueryException  : could not find driver (SQL: select * fr
om information_schema.tables where table_schema = dev_oms and table_name = migra
tions)

sudo nano /etc/php/7.2/cli/php.ini
原因是php.ini 擴充套件"php_pdo_mysql.dll"沒開啟
extension=php_pdo_mysql.dll
906
;extension=pdo_mysql
;extension=pdo_sqlite
~~~



### mysql
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

<a href="https://stackoverflow.com/questions/19658891/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run">Artisan migrate could not find driver</a><br>



### 下载MySQL时出现奇怪的错误
<a href="https://mlog.club/article/2247728">下载MySQL时出现奇怪的错误</a><br>
~~~
Renaming removed key_buffer and myisam-recover options (if present)
Cannot stat file /proc/2801/fd/1023: Permission denied
Cannot stat file /proc/2812/fd/1023: Permission denied
Cannot stat file /proc/2816/fd/1023: Permission denied
~~~

<a href="https://mlog.club/article/2247728">Ubuntu安装自选版本mysql</a>
