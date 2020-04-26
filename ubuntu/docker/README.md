# docker
[基本指令](#基本指令)

* [啟動容器](#啟動容器)

* [進入容器](#進入容器)

* [查看容器](#查看容器)

[volume](#volume)

* [導出容器](#導出容器)

[建立一個數據捲](#建立一個數據捲)

* [輸出以及載入檔案](#輸出以及載入檔案)

[Dockerfile](#Dockerfile)

[待嘗試](#待嘗試)

[Docker中刪除Images鏡像及Containers](Docker中刪除Images鏡像及Containers)

[未看](#未看)
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
~~~
[回目錄](#docker)

### 啟動容器

~~~
基本用ubuntu跑終端機字串
sudo docker run ubuntu /bin/echo 'Hello world'
sudo docker run -id --name test ubuntu /bin/bash
sudo docker run -it --name test -p 8080:80 nginx 
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

### 查看容器

~~~
docker inspect [id]
~~~
[回目錄](#docker)

## volume
-v掛載[本機位置：容器位置]

~~~
sudo docker run --name project1  -v ~/project_1:/root/project_1 -p 22:22 -ti ubuntu bash

sudo docker run -d -P --name web --link db:db training/webapp python app.py
------------------------------------------------------
--link name:alias，其中 name 是要連接的容器名稱，alias 是這個連接的別名。
~~~
[回目錄](#docker)

### 導出容器

~~~
sudo docker export <id> > utuntu.tar
~~~
[回目錄](#docker)

## 建立一個數據捲

~~~
sudo docker volume create --name test  
~~~
[回目錄](#docker)

### 輸出以及載入檔案

~~~
sudo docker save -o httpd.tar httpd
-o: 輸出檔案
httpd 是 Docker Image 的名稱

sudo docker load -i httpd.tar
參數說明如下：
-i: 放要 import 的檔案名稱

sudo docker run --name apachetesttar -d -p 8000:80 httpd
~~~
[回目錄](#docker)

##  Dockerfile 
~~~
## FROM : 基底image
FROM ubuntu
## 維護者的資訊
MAINTAINER Docker Starter <starter@docker.com>
## 在container建立時執行的動作
RUN apt-get update
RUN apt-get install zip -y
~~~
[回目錄](#docker)

## 待嘗試
<a href="https://www.twle.cn/l/yufei/docker/docker-basic-install-apache.html">Docker 安装 Apache</a><br>
<a href="https://www.twle.cn/l/yufei/docker/docker-basic-image-create.html">Docker Dockerfile 创建镜像
</a><br>

mkdir ~/Desktop/docker_test<br>
cd ~/Desktop/docker_test<br>
sudo nano Dockerfile

~~~
# This dockerfile uses the ubuntu image
# VERSION 2 - EDITION 1
# Author: iachievedream
# Command format: Instruction [arguments / command] ..//待了解

## 基本映像檔，必須是第一個指令 映像檔來源	
# FROM ubuntu

## 維護者訊息
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
# CMD /usr/sbin/nginx
~~~

sudo docker build -t httpd:v1 .<br>
sudo docker images<br>
sudo docker run -itd -p 8888:80 httpd:v1<br>
<br>
docker build -t="ubuntu:v3" .<br>
-t 是指定image的tag；. 則是當前目錄

[回目錄](#docker)

## Docker中刪除Images鏡像及Containers

<a href="https://www.opencli.com/linux/docker-delete-images-containers">Docker 中刪除 Images 鏡像 及 Containers</a>

~~~
刪除 Docker Image
# docker images
# docker rmi image_id

刪除 Docker Containers
# docker ps -a

# docker stop container_id
# docker rm container_id
如果想一次過將所有 container 停止及刪除, 執行以下指令:

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
~~~
[回目錄](#docker)


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
