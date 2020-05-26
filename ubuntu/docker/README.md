# docker
[install_docker](#install_docker)<br>
[sudo_su](#sudo_su)<br>
[登入docker_hub](#登入docker_hub)<br>
[上傳至_docker_hub](#上傳至_docker_hub)<br>
[基本指令](#基本指令)<br>
* [啟動容器](#啟動容器)<br>
* [進入容器](#進入容器)<br>
* [查看容器](#查看容器)<br>
* [volume](#volume)<br>
* [建立一個數據捲](#建立一個數據捲)<br>
[Docker_delete_Images_and_Containers](#Docker_delete_Images_and_Containers)<br>
* [將所有container停止及刪除](#將所有container停止及刪除)<br>
* [vin_docker.sh](#vin_docker.sh)<br>
[自己執行ubuntu](#自己執行ubuntu)<br>
* [下載到進入容器](#下載到進入容器)<br>
* [運行sudo到安裝apache2](#運行sudo到安裝apache2)<br>
* [執行下方指令在contain內](#執行下方指令在contain內)<br>
* [QA_apache2](#QA_apache2)<br>
* [QA_php](#QA_php)<br>
[docker容器存檔](#docker容器存檔)<br>

測試專案:[laravel](#laravel)<br>
死坑專用工具:[ubuntu18.04_Mysql_卸除](#ubuntu18.04_Mysql_卸除)<br>

待測試:
* [安裝mysql](#安裝mysql)<br>
* [MySQL](#MySQL)<br>
* [phpmyadmin](#phpmyadmin)<br>
* [phpmyadmin的資料](#phpmyadmin的資料)<br>
[自己執行iachievedeam1/test](#自己執行iachievedeam1/test)<br>
未了解完全
[Dockerfile](#Dockerfile)<br>
[文件](#文件)<br>

# 程式整理docker

docker_apache實際操作：<a href="https://youtu.be/wqK81mVUsaM">dome</a>

apache2實際操作：<a href="https://youtu.be/wl4CWcZC6so">dome</a>

## install_docker
~~~
sudo apt update
sudo apt install docker.io
~~~

## sudo_su
[啟動 docker-compose 發生 ERROR: Couldn’t connect to Docker daemon at http+docker://localunixsocket - is it running? 錯誤](https://oranwind.org/-solution-qi-dong-docker-compose-fa-sheng-error-couldnt-connect-to-docker-daemon-at-httpdockerlocalunixsocket-is-it-running-cuo-wu/)

~~~
將當前用戶加入 docker 群組
sudo gpasswd -a ${USER} docker
sudo su
su ubuntu (使用者)
docker-compose up -d
~~~

## 登入docker_hub
~~~
docker login
~~~
## 上傳至_docker_hub
~~~
docker pull ubuntu:18.04
docker run --name ubuntutest -itd -p 8000:80 -p 8001:81 -p 8002:3306 ubuntu:18.04 bash
docker exec -it ubuntutest bash

docker tag 123456789012 iachievedeam1/docker-demo:1.0.0
docker tag 123456789012 iachievedeam1/test

docker push [username]    /[REPOSITORY]:[TAG]
docker push iachievedeam1/test
~~~
## 基本指令
以ubuntu為例
~~~
//搜尋
sudo docker search ubuntu  
//獲取
sudo docker pull ubuntu    
//查看目前 images
sudo docker images         
//查看運行的容器:
sudo docker ps             
//查看全部運行的容器:
sudo docker ps -a          
//停止
sudo docker stop <id>     
//刪除容器
sudo docker rm -f <id>     
//刪除images
sudo docker rmi  <id>
//查詢容器內IP
 sudo docker inspect <id> | grep '"IPAddress"' | head -n 1

~~~
### 啟動容器
~~~
基本用ubuntu跑終端機字串
sudo docker run ubuntu /bin/echo 'Hello world'
sudo docker run -itd --name test -p 8080:80 ubuntu /bin/bash
------------------------------------------------------
-i：interactive交互是操作，讓容器的標準輸入(STDIN)保持開啟狀態。
-t：tty是一個虛擬終端(pseudo-tty)，並綁定到容器的標準輸入上。
-d：detach容器在後台持續運行
--name：test是容器名稱
-p 8080:80：是主機的port綁至Container的port指令
____________[8080容器外部端口：80容器內的端口]
____________[宿機端口：虛擬機端口]
ubuntu：IMAGE
/bin/bash：則是命令的交互式shell或執行ubuntu中的應用程式
~~~

### 進入容器

~~~
docker exec -it <NAMES> bash   //-t進入終端機--進入容器(開新console)	
docker attach <NAMES>    //容易故障--進入容器(退出停止容器)	
~~~
[回目錄](#docker)

### 查看容器
~~~
docker inspect [id]
~~~
[回目錄](#docker)

### volume
-v掛載[本機位置：容器位置]

~~~
sudo docker run --name project1  -v ~/project_1:/root/project_1 -p 22:22 -ti ubuntu bash
sudo docker run -d -P --name web --link db:db training/webapp python app.py
------------------------------------------------------
--link name:alias，其中 name 是要連接的容器名稱，alias 是這個連接的別名。
~~~
[回目錄](#docker)

### 建立一個數據捲
~~~
sudo docker volume create --name test  
~~~
[回目錄](#docker)

## Docker_delete_Images_and_Containers

<a href="https://www.opencli.com/linux/docker-delete-images-containers">Docker 中刪除 Images 鏡像 及 Containers</a>

~~~
確認container
docker ps -a

停止container
docker stop container_id

刪除container
docker rm container_id

確認image
docker images

刪除image
docker rmi image_id
~~~
### 將所有container停止及刪除
執行以下指令:
~~~
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
~~~
### vin_docker.sh
~~~
#!/bin/besh
docker stop container_id
docker rm container_id
docker rmi image_id
~~~

## 自己執行ubuntu
### 下載到進入容器
下載
~~~
sudo docker pull ubuntu:18.04
~~~
檢查images
~~~
sudo docker images
~~~
運行contain
~~~
sudo docker run -t -i ubuntu /bin/bash
//mysql測試(未完成)
sudo docker run --name test -itd -p 8000:80 -p 8001:81 -p 8002:3306 -p 8003:8000 -p 8004:8001 -p 8005:8002 ubuntu:18.04 /bin/bash

sudo docker run --name test -itd -p 8000:80 -p 8001:81 -p 8002:8000 -p 8003:8001 -p 8004:8002 -p 8005:8003 ubuntu:18.04 /bin/bash
~~~
進入contain
~~~
sudo docker exec -it test bash
~~~
### 運行sudo到安裝apache2
執行sell指令前的載入(否則沒有指令可以執行shell)
~~~
apt-get update && apt-get -y install sudo && apt-get install vim && apt-get install -y yum
~~~

### 執行下方指令在contain內
vi base.sh
~~~bash
#!/bin/bash
sudo apt-get update
sudo apt-get install npm
sudo apt-get install nodejs
sudo apt-get install curl
sudo apt install composer

# apache2 install
sudo apt install apache2
cd /var/www/html
sudo mv index.html index1.html
#apache2 -version

# php install:
sudo apt install php7.2-cli
sudo apt install hhvm
# 新增
sudo apt-get install php7.2-xml
sudo apt-get install php-mbstring
sudo apt install libapache2-mod-php7.2 libapache2-mod-php
sudo service apache2 restart

# ubuntu安装MySQL
sudo apt-get install mysql-server
sudo apt install mysql-client
sudo apt install libmysqlclient-dev
# sudo mysql -u root -p
~~~
執行
~~~
sh base.sh
~~~
### QA_apache2
* Restarting Apache httpd web server apache2 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message

測試port有無被使用或是查看apache狀態
~~~
sudo apt install net-tools
sudo netstat -lpn |grep 80 
~~~
編輯此檔案
~~~
vi /etc/apache2/apache2.conf 
~~~
加上下列程式碼
~~~
ServerName  localhost:80
~~~
重新啟動apache2
~~~
service apache2 restart
~~~
參考資料：
<a href="https://www.itread01.com/content/1550156775.html">解決httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0</a>

### QA_php
碰見問題及參考資料：
<a href="https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=360670">更新至18.04後開啟PHP網頁顯示原始碼 [論壇 - 伺服器架設]</a>
<a href="https://askubuntu.com/questions/912638/error-module-php7-0-does-not-exist">ERROR: Module php7.0 does not exist!</a>

檢查「/etc/apache2/mods-enabled/php7.2.load」這個檔案是否存在
~~~
ls /etc/apache2/mods-enabled/php7.2.load

若不存在，會顯示如下
ls: cannot access '/etc/apache2/mods-enabled/php7.2.load': No such file or directory
~~~
執行下方指令
~~~
>>>ERROR: Module php7.2 does not exist!
sudo apt install libapache2-mod-php7.2 libapache2-mod-php

sudo a2enmod php7.2

systemctl restart apache2
or
sudo service apache2 restart
~~~

# docker容器存檔
images 先來做 Save 動作
~~~
docker save -o ubuntu_save.tar ubuntu
docker save ubuntu > ubuntu_save.tar
~~~
載入 ubuntu_save.tar
~~~
docker load --input ubuntu_save.tar
docker load < ubuntu_save.tar
~~~
Container 打包匯出的話可以用 export 指令，例如要將 ubuntutest 的 Container 匯出 :
~~~
docker export ubuntutest > ubuntu_export.tar
~~~
接著我們使用剛剛 Export 輸出的檔案來還原，
~~~
cat ubuntu_export.tar | docker import - ubuntutest
~~~

[比較 save, export 對於映象檔操作差異](https://blog.hinablue.me/docker-bi-jiao-save-export-dui-yu-ying-xiang-dang-cao-zuo-chai-yi/)

[Day 6 關於 Save 與 Export 對 Image 之間的差異](https://ithelp.ithome.com.tw/articles/10193804)

## laravel
vi laravel.sh
~~~
sudo git clone https://github.com/iachievedream/blog-laravel.git
sudo chmod -R www-data:www-data /var/www/html/blog-laravel
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
php artisan serve --host=127.0.0.1 --port=81
~~~
[回目錄](#docker_ubuntu)


## ubuntu18.04_Mysql_卸除

首先在系统终端中查看MySQL的依赖项，运行命令：
~~~
dpkg --list|grep mysql
~~~
卸载命令：
~~~
sudo apt-get remove mysql-common
~~~
卸载命令：
~~~
sudo apt-get autoremove --purge mysql-server-5.7
~~~
清除残留数据，运行命令：
~~~
dpkg -l|grep ^rc|awk '{print$2}'|sudo xargs dpkg -P
~~~
再次查看MySQL的剩余依赖项，运行命令：
~~~
dpkg --list|grep mysql
~~~
继续删除剩余依赖项，如：
~~~
sudo apt-get autoremove --purge mysql-apt-config
~~~

參考資料:[在Ubuntu18.04系统下彻底删除MySQL的方法](https://ywnz.com/linuxysjk/3141.html)

******************************************************************************************************************

## MySQL
https://www.twblogs.net/a/5baa9f262b7177781a0e54cb

## 待嘗試
<a href="https://www.twle.cn/l/yufei/docker/docker-basic-install-apache.html">Docker 安装 Apache</a><br>
<a href="https://www.twle.cn/l/yufei/docker/docker-basic-image-create.html">Docker Dockerfile 创建镜像
</a><br>

<a href="https://www.puritys.me/docs-blog/article-362-%E5%A6%82%E4%BD%95%E7%94%A8-Dockerfile-%E8%87%AA%E8%A3%BD%E4%B8%80%E5%80%8B-Docker-image-Container.html">如何用 Dockerfile 自製一個 Docker image / Container</a><br>
<a href="https://hackmd.io/@titangene/docker-lamp">利用 Dockfile、Docker Compose 建立 LAMP 環境 (PHP、Apache、MySQL)</a><br>

<a href="https://larrylu.blog/using-volumn-to-persist-data-in-container-a3640cc92ce4">Docker 實戰系列（三）：使用 Volume 保存容器內的數據</a>
~~~
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker image ls 
~~~

## 未看
<a href="https://dev.to/veevidify/docker-compose-up-your-entire-laravel-apache-mysql-development-environment-45ea">docker-compose up your entire Laravel + Apache + MySQL development environment.</a><br>
<a href="https://ithelp.ithome.com.tw/users/20102562/ironman/987">CI 從入門到入坑</a><br>
<a href=""></a><br>


### MySQL

sudo mysql_secure_installation

sudo mysql

SELECT user,authentication_string,plugin,host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

mysql -u root –p

[ubuntu18.04安裝mysql沒有密碼提示解決辦法](https://www.itread01.com/content/1543970658.html)

~~~
查看系統密碼
sudo vi /etc/mysql/debian.cnf
登入MySQL資料庫(貼密碼)
mysql -u debian-sys-maint -p
~~~

### mysql遠端連線


~~~
GRANT ALL PRIVILEGES ON *.* TO root@192.168.56.1 IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO fu@'%' IDENTIFIED BY '1234';
FLUSH PRIVILEGES;
~~~

待消化
[在Ubuntu 18.04 下安装mysql，没有初始密码，重设root密码](https://www.cnblogs.com/williamjie/p/11126486.html)

[Linux MySQL](https://ithelp.ithome.com.tw/articles/10207765?sc=iThelpR)



## 未解
Cannot stat file /proc/12426/fd/15: Permission denied 
sudo apt-get install mysql-server

[Getting strange errors while downloading mysql
](https://askubuntu.com/questions/1129029/getting-strange-errors-while-downloading-mysql)

~~~

invoke-rc.d: policy-rc.d denied execution of stop.
update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Renaming removed key_buffer and myisam-recover options (if present)
Cannot stat file /proc/12425/fd/0: Permission denied
Cannot stat file /proc/12425/fd/1: Permission denied
Cannot stat file /proc/12425/fd/2: Permission denied
Cannot stat file /proc/12425/fd/3: Permission denied

===============================

Cannot stat file /proc/12426/fd/23: Permission denied
Cannot stat file /proc/12426/fd/24: Permission denied
Cannot stat file /proc/12426/fd/25: Permission denied
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
Setting up mysql-server (5.7.30-0ubuntu0.18.04.1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
root@8bdc61d2b295:/home# Cannot stat file /proc/12426/fd/15: Permission denied
bash: Cannot: command not found


~~~

* 另外需要的指令
~~~
sudo apt-get install aptitude
~~~
[弱弱的問:這個指令裡的sudo aptitude 可以用 sudo apt-get替換嗎](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=153790)

====================
bash: wget: command not found
~~~
sudo apt install wget
cd /tmp/ && wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
~~~
[How to install wget on a Debian or Ubuntu Linux](https://www.cyberciti.biz/faq/how-to-install-wget-togetrid-of-error-bash-wget-command-not-found/)

### 
[Docker 玩轉 MySQL](https://myapollo.com.tw/zh-tw/docker-mysql/)

~~~
docker exec -it mysql8 mysql -u root -p
create database laravel;

CREATE USER 'fu'@'%' IDENTIFIED BY 'password';
GRANT ALL ON laravel.* TO 'fu'@'%';

docker exec -it mysql8 mysql -u fu -p

~~~

### 安裝mysql***********
~~~
sudo docker pull mysql
sudo docker run -itd --name mysqltest -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
~~~
### MySQL
~~~
sudo docker exec -t mysqltest bash
sudo docker exec -it mysqltest mysql -u root -p
~~~
### phpmyadmin
~~~
sudo docker search phpmyadmin
sudo docker pull phpmyadmin/phpmyadmin
~~~
### phpmyadmin的資料
~~~
sudo docker run --name myadmin -d --link mysqltest:db -p 9100:80 phpmyadmin/phpmyadmin
~~~



## 自己執行iachievedeam1/test
pull檔案
docker pull iachievedeam1/test
執行容器
docker run --name ubuntutest -itd -p 8000:80 -p 8001:81 -p 8002:3306 -p 8003:8000 -p 8004:8001 -p 8005:8002 iachievedeam1/test /bin/bash
進入容器
docker exec -it ubuntutest bash

[運行sudo到安裝apache2](###運行sudo到安裝apache2)

## 自己製作dockerfile

vi Dockerfile
~~~
FROM ubuntu:18.04

MAINTAINER iachievedream
ADD file:c3e6bb316dfa6b81dd4478aaa310df532883b1c0a14edeec3f63d641980c1789 in / 

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

EXPOSE 80
EXPOSE 3306
EXPOSE 8000
EXPOSE 8001
EXPOSE 8002
EXPOSE 8003

CMD ["/bin/bash"]
~~~

sudo docker build -t docker_ubuntu .
sudo docker build -t docker_ubuntu:v1 .

****************************************


##  Dockerfile 
mkdir ~/Desktop/docker_test
cd ~/Desktop/docker_test
sudo nano Dockerfile
~~~
## FROM : 基底image
FROM ubuntu
## 維護者的資訊
MAINTAINER Docker Starter <starter@docker.com>
## 在container建立時執行的動作
RUN apt-get update
RUN apt-get install zip -y
~~~

~~~
# FROM ubuntu

MAINTAINER iachievedream iachievedream@gmail.com

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# 更新映像檔的指令
RUN apt-get update
RUN apt install php7.2-cli 
RUN apt install hhvm 
RUN apt install apache2

# 創建專案資料夾
RUN mkdir -p ~/Desktop/docker_test
RUN mkdir -p ~/Desktop/docker_test/src

# 指定工作目錄在專案資料夾
WORKDIR ~/Desktop/docker_test

# 預先要安裝的requirements複製到Docker裡面
# ADD requirements.txt ~/Desktop/docker_test

# 複製當前目錄的所有檔案到容器內的，資料放在/usr/src/app
# COPY . ~/Desktop/docker_test

#掛載資料卷
VOLUME ~/Desktop/docker_test/src

# 開啟Port號
EXPOSE 80

## 建立新容器時要執行的指令
CMD ["/bin/bash"]
~~~
sudo docker build -t httpd:v1 .
sudo docker images
sudo docker run -itd -p 8888:80 httpd:v1
docker build -t="ubuntu:v3" .
-t 是指定image的tag；. 則是當前目錄

## 建立文件

~~~
cd php
echo "<?php echo "Hello world";ls ?>" > index.php

sudo nano index.php
>>>>>>>>>
<?php 
echo "Hello world";
?>
>>>>>>>>>
cat index.php

sudo chmod 777 index.php  //待測試
cd ..

docker-compose up
~~~
index.php
~~~
<?php
$servername = 'db';
$dbname = 'test_db';
$username = 'FU';
$password = 'a1234567';
$db = mysqli_connect($servername,$username,$password,$dbname);
if ($db->connect_error) {
    echo 'fail';
} 
echo 'suceddfully';

?>
~~~
docker-compose up
