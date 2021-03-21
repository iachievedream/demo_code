# 執行ubuntu
## 下載到進入容器
~~~
下載
docker pull ubuntu:18.04

運行contain
docker run -t -i ubuntu /bin/bash
docker run --name ubuntutest -itd -p 80:80 -p 8000:8000 ubuntu:18.04 bash
docker run --privileged --name ubuntutest -itd -p 81:80 -p 8000:8000 -v /var/www/html:/var/www/html ubuntu:18.04 bash

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
複製 bash.sh的檔案
~~~
使用下方使令可以把本機的程式碼丟入container當中
docker cp bash.sh  06f:/home/
注:06f是container的ID編號。
~~~
執行
~~~
sh base.sh
~~~
[回目錄](#docker)

## apache2_php72
~~~
下載images
docker push iachievedeam1/apache2_php72:1.0.0

執行容器
docker run --name apache2 -itd -p 80:80 -p 8000:8000 iachievedeam1/apache2_php72:1.0.1 /bin/bash

docker run --name apache2 -itd -p 80:80 -p 8000:8000 -v /mydata/code:/var/www/html iachievedeam1/apache2_php72:1.0.0 /bin/bash

進入容器
docker exec -it apache2 bash
~~~

使用base.sh以及原先ubuntu18的images做安裝匯出製作而成

## xampp_php7.4
~~~
下載images
docker push iachievedeam1/xampp_php74:1.0.0

docker run --name xampp_php74 -itd -p 80:80 -p 8000:8000 iachievedeam1/xampp_php74:1.0.0 /bin/bash

docker run --name xampp_php74 -itd -p 80:80 -p 8000:8000 -v /mydata/code:/opt/lampp/htdocs iachievedeam1/xampp_php74:1.0.0 /bin/bash

進入容器
docker exec -it xampp_php74 bash
~~~

使用laravel8.sh以及原先ubuntu18的images做安裝匯出製作而成

## mysql8
~~~
下載images
docker push iachievedeam1/mysql8:1.0.0

docker run --name=mysql8 -d -p 3306:3306 --env MYSQL_ROOT_PASSWORD=password iachievedeam1/mysql8:1.0.0

docker run --name=mysql8 -d -p 3306:3306 --env MYSQL_ROOT_PASSWORD=password iachievedeam1/mysql8:1.0.0

docker run --name xampp_php74 -itd -p 80:80 -p 8000:8000 -v /mydata/code:/opt/lampp/htdocs iachievedeam1/xampp_php74:1.0.0 /bin/bash

進入容器
docker exec -it mysql8 mysql -u root -p
~~~
