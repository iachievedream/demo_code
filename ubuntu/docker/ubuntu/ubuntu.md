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

## iachievedeam1_ubuntutest
~~~
下載images
docker pull iachievedeam1/ubuntutest:1.0

執行容器
docker run --name ubuntutest -itd -p 81:80 -p 8000:8000 iachievedeam1/ubuntutest:1.0 /bin/bash

進入容器
docker exec -it ubuntutest bash


~~~