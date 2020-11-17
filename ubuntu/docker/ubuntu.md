# 執行ubuntu
## 下載到進入容器
~~~
下載
docker pull ubuntu:18.04

運行contain
docker run -t -i ubuntu /bin/bash
docker run --name ubuntutest -itd -p 8000:80 -p 80:8000 -p 8001:81 -p 8002:82 ubuntu:18.04 bash

進入contain
docker exec -it ubuntutest bash
~~~
[回目錄](#docker)

## 運行sudo到安裝apache2
執行sell指令前的載入(否則沒有指令可以執行shell)
~~~
apt-get update && apt-get -y install sudo && apt-get install vim && apt-get install -y yum
~~~
[回目錄](#docker)

## 執行下方指令在contain內
vi base.sh
~~~
#!/bin/bash
sudo apt-get update
sudo apt-get install npm
sudo apt-get install nodejs
sudo apt-get install curl
sudo apt install composer

# apache2 install  6/73/73
sudo apt install apache2
cd /var/www/html
sudo mv index.html index1.html
# apache2 -version

# php install:
sudo apt install php7.2-cli
sudo apt install hhvm
# 新增
sudo apt-get install php7.2-xml
sudo apt-get install php-mbstring
sudo apt install libapache2-mod-php7.2 libapache2-mod-php
sudo service apache2 restart

#測試中
## ubuntu安装MySQL
#sudo apt-get install mysql-server
#sudo apt install mysql-client
#sudo apt install libmysqlclient-dev
## sudo mysql -u root -p
~~~
執行
~~~
sh base.sh
~~~
[回目錄](#docker)

## ubuntu的儲存方式實務練習
~~~
images-Save
docker save -o ubuntu_save.tar ubuntu
載入 ubuntu_save.tar
docker load < ubuntu_save.tar

Container-export
docker export ubuntutest > ubuntu_export.tar
還原 Export Container
cat ubuntu_export.tar | docker import - ubuntutest


運行容器(用原先的images)
docker run --name ubuntutest -itd -p 8000:80 -p 8001:81 -p 8002:8000 -p 8003:8001 -p 8004:8002 -p 8005:8003 -p 22:22 ubuntu:18.04 /bin/bash
docker exec -it ubuntutest bash

載入容器(images_ubuntutest)
cat ubuntu_export.tar | docker import - ubuntutest
docker run --name ubuntutest -itd -p 8000:80 -p 8001:81 -p 8002:8000 -p 8003:8001 -p 8004:8002 -p 8005:8003 -p 22:22 ubuntutest /bin/bash
docker exec -it ubuntutest bash
~~~

[回目錄](#docker)

###  Dockerfile
sudo mkdir docker_ubuntu
sudo chmod 777 docker_ubuntu
cd docker_ubuntu
sudo vi Dockerfile
~~~
FROM ubuntu:18.04

MAINTAINER iachievedream iachievedream@gmail.com

RUN apt-get update \
    && apt-get -y install sudo \
    && apt-get install vim\
    && apt-get install npm\
    && apt-get install nodejs\
    && apt-get install curl\
    && apt install composer\
    &&apt install php7.4-cli\
    && apt install hhvm\
    && apt-get install php7.4-xml\
    && apt-get install php-mbstring\
    && apt install apache2

EXPOSE 80
EXPOSE 3306
EXPOSE 8000
EXPOSE 8001
CMD ["/bin/bash"]
~~~

~~~
FROM ubuntu:18.04

MAINTAINER iachievedream iachievedream@gmail.com

RUN apt-get update -y\
    && apt install vim -y\
    && apt-get update -y\
    && apt install yum -y\
    && apt-get install npm -y\
    && apt-get install nodejs -y\
    && apt-get install curl -y\
    && apt install composer -y\
    && apt install apache2 -y\
    && cd /var/www/html\
    && mv index.html index1.html\
    && apt install php7.2-cli -y\
    && apt install hhvm -y\
    && apt-get install php7.2-xml -y\
    && apt-get install php-mbstring -y\
    && apt install libapache2-mod-php7.2 libapache2-mod-php -y\
    && service apache2 restart\
    && apt-get install mysql-server -y\
    && apt install mysql-client -y\
    && apt install libmysqlclient-dev -y\
    && apt-get install phpmyadmin -y\
    && apt-get install ssh  -y
EXPOSE 80
EXPOSE 3306
EXPOSE 8000
EXPOSE 8001
CMD ["/bin/bash"]
~~~
docker build .
docker build -t docker_ubuntu:v1 .
docker build -t docker_ubuntu .
docker run -t -i 395860ec0aa8 /bin/bash
docker run -t -i -p 81:80 7513cc650b6f /bin/bash

docker run --name ubuntutest -itd -p 8000:80 ubuntu:18.04 bash


## iachievedeam1_ubuntutest
~~~
pull images
docker pull iachievedeam1/ubuntutest:1.0

執行容器
docker run --name ubuntutest -itd -p 80:80 -p 8000:8000 -p 8080:8080 iachievedeam1/ubuntutest:1.0 /bin/bash

進入容器
docker exec -it ubuntutest bash
~~~
[運行sudo到安裝apache2](###運行sudo到安裝apache2)

[回目錄](#docker)