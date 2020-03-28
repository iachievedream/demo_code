### 基本指令
搜尋:(以ubuntu為例)

~~~
sudo docker search ubuntu<br>
~~~

<br>
獲取:

~~~
sudo docker pull ubuntu<br>
~~~

<br>
查看目前 images

~~~
sudo docker images<br>
~~~

進入容器:

~~~
docker exec -it <NAMES> bash
docker attach <NAMES>
~~~

<br>
查看運行的容器:

~~~
sudo docker ps
~~~

<br>
停止:

~~~
sudo docker stop <id>
~~~

<br>
刪除容器:

~~~
sudo docker rm -f <id>
~~~

<br>
建立一個數據捲：

~~~
docker volume create --name test
~~~

<br>
啟動容器:<br>

~~~
sudo docker run -it --name jack ubuntu /bin/bash<br>
~~~

-i：交互是操作，讓容器的標準輸入(STDIN)保持開啟狀態。<br>
-t：是一個虛擬終端(pseudo-tty)，並綁定到容器的標準輸入上。，<br>
-d：容器在後台持續運行，<br>
--name jack：是容器名稱<br>
ubuntu：IMAGE，
/bin/bash：則是命令的交互式shell或執行ubuntu中的應用程式，<br>
-p 8080:80：是綁至Container的Port<br>

### docker 安裝iginx(pull nginx)

運行容器:<br>

~~~
sudo docker run --name nginx-test -p 8080:80 -d nginx<br>
~~~

--name nginx-test：容器名稱，<br>
-p 8080:80：是綁至Container的Port<br>
nginx：IMAGE<br>
<br>
使用此hostname -I指令知道電腦的IP位置，或是直接使用127.0.0.1也可以，後面添加:8080即可看見瀏覽器出現nginx的畫面<br>

### docker 安裝php(pull php)

~~~
sudo docker run --name nginx -v ~/nginx/www:/www  -d php
~~~

php掛載到iginx還需要確認<br>

### docke 安裝node(pull node)

~~~
sudo docker run -itd --name node-test node
sudo docker exec -it node-test /bin/bash
root@6c5d265c68a6:/# node -v
~~~

### docke 安裝MySQL(pull mysql)

運行容器

~~~
sudo docker run -itd --name mysqltest -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql<br>
~~~

-p 3306:3306：映射至此port<br>
MYSQL_ROOT_PASSWORD=123456：MySQL的帳密資訊<br>
<br>

### Docker 安装 Apache(pull httpd)

運行容器:

~~~
docker run -p 80:80 -v $PWD/www/:/usr/local/apache2/htdocs/ -v $PWD/conf/httpd.conf:/usr/local/apache2/conf/httpd.conf -v $PWD/logs/:/usr/local/apache2/logs/ -d httpd<br>
~~~

<br>
實際操作後的網路資源:<br>
<a href="http://blog.maxkit.com.tw/2017/03/docker-compose.html">Docker 基本教學與指令</a><br>

~~~
mkdir myweb
cd myweb
sudo nano Dockerfile  //建立檔案
------------------------------------------------------------
FROM centos:latest
MAINTAINER CENTOS WEB APP

RUN yum -y update && \
    yum -y install httpd && \
    yum clean all && \
    echo "hello new world" > /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/apachectl","-DFOREGROUND"]
------------------------------------------------------------
sudo docker build -t web:v1 .  //建立
sudo docker images
sudo docker run -itd -p 8888:80 web:v1
~~~

<br>
<br>
<br>

### Docker 安装 jenkins(pull jenkins)

~~~
sudo docker pull jenkins
sudo docker run -d -u 0 --privileged  --name jenkins_node1 -p 49003:8081 -v /root/jenkins_node1:/var/jenkins_home jenkins:latest

docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 jenkins
原文網址：https://kknews.cc/code/jlrxe66.html
~~~

<br>
<br>
實測一半:
https://ithelp.ithome.com.tw/articles/10194183?sc=rss.iron

1. 安裝 Docker-Compose，指令如下
~~~
# cd /usr/bin
# wget https://github.com/docker/compose/releases/download/1.18.0/docker-compose-Linux-x86_64
# mv docker-compose-Linux-x86_64 docker-compose
# chmod 755 docker-compose
~~~
2. 撰寫 docker-compose.yml 檔案如下
~~~
version: '2'
services:
  db:
     image: mysql
     environment:
        MYSQL_ROOT_PASSWORD: 123456
  admin:
     image: adminer
     ports:
       - 8080:8080
~~~
3. 啟動所有的 Docker Container 指令如下
~~~
$ docker-compose up -d
~~~
4. 使用 Docker-Compose 提供的指令查看 Docker Container 的執行狀態
~~~
$ docker-compose ps
~~~

尚未吸收:<br>
<a href="https://ithelp.ithome.com.tw/users/20072603/ironman/2088">從Docker到Kubernetes-新手入門筆記</a><br>
<a href="https://pickmanblog.wordpress.com/2017/09/10/%E7%94%A8docker%E5%BF%AB%E9%80%9F%E5%BB%BA%E7%AB%8B%E9%96%8B%E7%99%BC%E7%92%B0%E5%A2%83-php7-1-mysql-apache/">用DOCKER快速建立開發環境 (PHP7.1 + MYSQL + APACHE)</a><br>
<a href="https://medium.com/@VisonLi/docker-%E5%85%A5%E9%96%80-%E7%AD%86%E8%A8%98-part-2-91e4dfa2b365">從Docker 筆記 Part 2 ｜指令操作</a><br>
test<br>

~~~
# Dockerfile 
## FROM : 基底image
FROM ubuntu
## 維護者的資訊
MAINTAINER Docker Starter <starter@docker.com>
## 在container建立時執行的動作
RUN apt-get update
RUN apt-get install zip -y
~~~

建立image：<br>
docker build -t="ubuntu:v3" .<br>
-t 是指定image的tag；. 則是當前目錄<br>

<br>
<br>
還不了解，測試不出來為何原因：<br>
<a href="https://skychang.github.io/2015/07/30/%E5%BB%BA%E7%AB%8B%E8%87%AA%E5%B7%B1%E7%9A%84-Docker-image/">建立自己的 Docker image</a><br>

