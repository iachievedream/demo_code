# docker

[sudo_su](#sudo_su)<br>
[login_docker_hub](#login_docker_hub)<br>
[push_docker_hub](#push_docker_hub)<br>
[基本指令](#基本指令)<br>
* [啟動容器](#啟動容器)<br>
* [進入容器](#進入容器)<br>
* [數據捲(volume)](#數據捲(volume))<br>
* [Dockerfile](#Dockerfile)<br>

[QA](#QA)<br>
* [QA_sudo_su](#QA_sudo_su)<br>
* [QA_apache2](#QA_apache2)<br>
* [QA_php](#QA_php)<br>
* [QA_could_not_find_driver](#QA_could_not_find_driver)<br>

死坑專用工具：[ubuntu18.04_Mysql_卸除](#ubuntu18.04_Mysql_卸除)<br>

待測試：
* [安裝mysql](#安裝mysql)<br>
* [MySQL](#MySQL)<br>
* [phpmyadmin](#phpmyadmin)<br>
* [phpmyadmin的資料](#phpmyadmin的資料)<br>

未了解完全
[Dockerfile](#Dockerfile)<br>
[文件](#文件)<br>

# 程式整理docker
docker_apache實際操作：[dome](https://youtu.be/wqK81mVUsaM)<br>
apache2實際操作：[dome](https://youtu.be/wl4CWcZC6so)

## sudo_su
[啟動 docker-compose 發生 ERROR: Couldn’t connect to Docker daemon at http+docker://localunixsocket - is it running? 錯誤](https://oranwind.org/-solution-qi-dong-docker-compose-fa-sheng-error-couldnt-connect-to-docker-daemon-at-httpdockerlocalunixsocket-is-it-running-cuo-wu/)

將當前用戶加入 docker 群組
~~~
sudo gpasswd -a ${USER} docker
sudo su
su ubuntu (使用者)
docker-compose up -d
~~~

## login_docker_hub
~~~
docker login
~~~

## push_docker_hub
~~~
docker pull ubuntu:18.04
docker run --name ubuntutest -itd -p 8000:80 -p 80:8000 -p 8001:81 -p 8002:82 ubuntu:18.04 bash
docker exec -it ubuntutest bash

docker tag 123456789012 iachievedeam1/test:1.0.0
docker push [username]    /[REPOSITORY]:[TAG]
docker push iachievedeam1/test:1.0.0
~~~
[回目錄](#docker)

## 基本指令
以ubuntu為例
~~~
//搜尋
docker search ubuntu  
//獲取
docker pull ubuntu    
//查看目前 images
docker images         
//查看運行的容器:
docker ps             
//查看全部運行的容器:
docker ps -a          
//停止
docker stop <container_id>     
//刪除容器
docker rm -f <container_id>     
//刪除images
docker rmi  <image_id>

//查詢容器
docker inspect <container_id>
//查詢容器內IP
docker inspect <container_id> | grep '"IPAddress"' | head -n 1

//將所有container停止及刪除，執行以下指令:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images)

docker的images及contain儲存方式 基本指令

images 先來做 Save 動作
docker save -o ubuntu_save.tar ubuntu
docker save ubuntu > ubuntu_save.tar

載入 ubuntu_save.tar
docker load --input ubuntu_save.tar
docker load < ubuntu_save.tar

Container 打包匯出的話可以用 export 指令，例如要將 ubuntutest 的 Container 匯出 :
docker export ubuntutest > ubuntu_export.tar

接著我們使用剛剛 Export 輸出的檔案來還原，
cat ubuntu_export.tar | docker import - ubuntutest
~~~
<a href="https://www.opencli.com/linux/docker-delete-images-containers">Docker中刪除Images鏡像及Containers</a>

[比較 save, export 對於映象檔操作差異](https://blog.hinablue.me/docker-bi-jiao-save-export-dui-yu-ying-xiang-dang-cao-zuo-chai-yi/)

[Day 6 關於 Save 與 Export 對 Image 之間的差異](https://ithelp.ithome.com.tw/articles/10193804)

[回目錄](#docker)

### 啟動容器
~~~
基本用ubuntu跑終端機字串
docker run ubuntu /bin/echo 'Hello world'
docker run -itd --name test -p 8080:80 ubuntu /bin/bash
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
[回目錄](#docker)

### 進入容器
~~~
docker exec -it <NAMES> bash   //-t進入終端機--進入容器(開新console)	
docker attach <NAMES>    //容易故障--進入容器(退出停止容器)	
~~~
[回目錄](#docker)

### 數據捲(volume)
-v掛載[本機位置：容器位置]
~~~
docker run --name project1  -v ~/project_1:/root/project_1 -p 22:22 -ti ubuntu bash

docker run -d -P --name web --link db:db training/webapp python app.py
------------------------------------------------------
--link name:alias，其中 name 是要連接的容器名稱，alias 是這個連接的別名。

創建一個 volume
docker volume create <volume_name>
docker volume create --name test  

查看所有 volumes
docker volume ls

查看特定 volume 的詳情
docker volume inspect <volume_name>

刪除
docker volume rm <volume_name>

清理無主的Volume
docker volume prune
~~~
[回目錄](#docker)

###  Dockerfile
~~~
1.基礎映像檔資訊
2.維護者資訊
3.映像檔操作指令
4.容器啟動時需執行指令

mkdir ~/Desktop/docker_test
cd ~/Desktop/docker_test
sudo nano Dockerfile
------------------------------
## FROM : 基底image
FROM ubuntu

## 維護者的資訊
MAINTAINER Docker Starter <starter@docker.com>

## 在container建立時執行的動作
RUN apt-get update

ENV LANG en_US.utf8

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
--------------------------------------

docker build .
docker build -t httpd:v1 .
//myDockerfile檔名
docker build -f myDockerfile
docker images
docker run -itd -p 8888:80 httpd:v1
docker build -t="ubuntu:v3" .
-t 是指定image的tag；. 則是當前目錄
~~~

## QA
### QA_sudo_su
新錯誤內容以及處理方式
~~~
docker run hello-world
ARNING: Error loading config file:/home/user/.docker/config.json - stat /home/user/.docker/config.json: permission denied
後續繼續執行

解決方式
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
<!-- sudo chmod g+rwx "/home/$USER/.docker" -R -->

延伸學習
sudo chown $(whoami):docker /home/$(whoami)/.docker/config.json
whoami是使用指令查詢此使用者的名稱
~~~
參考資料：[码头工人警告config.json权限被拒绝](https://qastack.cn/ubuntu/747778/docker-warning-config-json-permission-denied)

[回目錄](#docker)

### QA_apache2
Restarting Apache httpd web server apache2 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message

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
參考資料：<a href="https://www.itread01.com/content/1550156775.html">解決httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0</a>

vi apache2.conf 
~~~
ServerName  localhost:80
~~~

[解決httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0](https://www.itread01.com/content/1550156775.html)

### QA_php
測試php的環境是否正常
~~~
echo "<?php echo 'Hello world';ls ?>" > index2.php
~~~
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
[回目錄](#docker)

### QA_could_not_find_driver
<a href="https://stackoverflow.com/questions/2852748/pdoexception-could-not-find-driver">PDOException “could not find driver”</a>

For newer versions of Ubuntu that have PHP 7.0 you can get the php-mysql package:

Then restart your server:

sudo service apache2 restart
~~~
sudo apt-get install php-mysql
~~~

## ubuntu18.04_Mysql_卸除
~~~
首先在系统终端中查看MySQL的依赖项，运行命令：
dpkg --list|grep mysql

卸载命令：
sudo apt-get remove mysql-common

卸载命令：
sudo apt-get autoremove --purge mysql-server-5.7

清除残留数据，运行命令：
dpkg -l|grep ^rc|awk '{print$2}'|sudo xargs dpkg -P

再次查看MySQL的剩余依赖项，运行命令：
dpkg --list|grep mysql

继续删除剩余依赖项，如：
sudo apt-get autoremove --purge mysql-apt-config
~~~

參考資料:[在Ubuntu18.04系统下彻底删除MySQL的方法](https://ywnz.com/linuxysjk/3141.html)

[回目錄](#docker)

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

[回目錄](#docker)

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

[回目錄](#docker)




You don't have permission to access this resource. docker

QA:[Apache 403 Forbidden You don't have permission to access / on this server](https://stackoverflow.com/questions/52282432/apache-403-forbidden-you-dont-have-permission-to-access-on-this-server)

複製檔案到docker內

docker cp index1.html a4e1d4cc573c:/var/www/html/index.php