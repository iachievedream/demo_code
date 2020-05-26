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

[回目錄](#docker_ubuntu)


[回目錄](#docker_ubuntu)


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
[回目錄](#docker_ubuntu)


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

#### mysql
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

<a href="https://stackoverflow.com/questions/19658891/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run">Artisan migrate could not find driver</a><br>

<a href="https://www.cnblogs.com/bymo/p/9046586.html">在用apt-get安装软件包的时候遇到E: Sub-process /usr/bin/dpkg returned an error code (1)问题，解决方法如下：</a><br>
~~~
cd /var/lib/dpkg/
sudo mv info/ info_bak          # 现将info文件夹更名
sudo mkdir info                 # 再新建一个新的info文件夹
sudo apt-get update             # 更新
sudo apt-get -f install         # 修复
sudo mv info/* info_bak/        # 执行完上一步操作后会在新的info文件夹下生成一些文件，现将这些文件全部移到info_bak文件夹下
sudo rm -rf info                # 把自己新建的info文件夹删掉
sudo mv info_bak info           # 把以前的info文件夹重新改回名
~~~
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

<a href="https://mlog.club/article/2247728">下载MySQL时出现奇怪的错误</a><br>
~~~
Renaming removed key_buffer and myisam-recover options (if present)
Cannot stat file /proc/2801/fd/1023: Permission denied
Cannot stat file /proc/2812/fd/1023: Permission denied
Cannot stat file /proc/2816/fd/1023: Permission denied
~~~

<a href="https://mlog.club/article/2247728">Ubuntu安装自选版本mysql</a>

有移除指令
~~~

1、首先你要保证你的服务器上没有安装过，或者已经彻底卸载了mysql其他版本。卸 载流程：

sudo apt-get autoremove --purge mysql-server-*
sudo apt-get remove mysql-server
sudo apt-get autoremove mysql-server
sudo apt-get remove mysql-common 
(非常重要)

⑤ 清理残留数据： 
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
sudo find /etc -name "*mysql*" |xargs  rm -rf

⑥ 最后用 dpkg -l | grep mysql 检查，如无返回即干净卸载

2、add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty main universe'

3、apt-get update（这一步花时间较长）

4、apt-cache search mysql | grep mysql-server

5、从返回的结果查看有哪些版本可以安装，用下边的命令安装相应的版本。

如果没有5.6版本（一般是有的），尝试如下操作：

编辑/etc/apt/sources.list和/etc/apt/sources.list.save, 搜索deb http://archive.ubuntu.com/ubuntu trusty main，如果这一行的结尾没有universe，手动加上，变成deb http://archive.ubuntu.com/ubuntu trusty main universe。然后执行apt update或者apt-get update。

6、apt install mysql-server-5.6 安装5.6版本 (这里没用apt-get，而是apt)或者apt install mysql-server-5.5安装5.5版本 (这里没用apt-get，而是apt)。

安装完毕，成功。
~~~
<a href="https://codertw.com/%E4%BC%BA%E6%9C%8D%E5%99%A8/376899/">Ubuntu徹底解除安裝MySQL、Apache2和Php的方法教程</a><br>




<a href="https://blog.csdn.net/Ersan_Yi/article/details/82114791">卸载PHP7.2</a><br>

~~~
一、删除php的相关包及配置
sudo apt-get autoremove php7*
二、删除关联
sudo find /etc -name "*php*" |xargs  rm -rf 
三、清除dept列表
sudo apt purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
四、检查是否卸载干净（无返回就是卸载完成）
 dpkg -l | grep php7.2
~~~

<a href="https://blog.csdn.net/Ersan_Yi/article/details/82114791">安装&卸载 composer</a><br>

~~~
composer config -l -g | grep "home|dir" -E
rm $(which composer)
~~~