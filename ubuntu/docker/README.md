### 基本指令
以ubuntu為例

~~~
sudo docker search ubuntu  //搜尋
sudo docker pull ubuntu    //獲取
sudo docker images         //查看目前 images
sudo docker ps             //查看運行的容器:
sudo docker ps -a             //查看全部運行的容器:
sudo docker stop <id>      //停止
sudo docker rm -f <id>     //刪除容器
sudo docker rmi  <id>     //刪除images

//基本用ubuntu跑終端機字串
sudo docker run ubuntu /bin/echo 'Hello world'

//啟動容器
sudo docker run -id --name test ubuntu /bin/bash
sudo docker run -it --name test -p 8080:80 nginx

-i：interactive交互是操作，讓容器的標準輸入(STDIN)保持開啟狀態。
-t：tty是一個虛擬終端(pseudo-tty)，並綁定到容器的標準輸入上。
-d：detach容器在後台持續運行
--name：test是容器名稱
-p 8080:80：是主機的port綁至Container的port指令
____________[8080容器外部端口：80容器內的端口]
____________[宿機端口：虛擬機端口]
ubuntu：IMAGE
/bin/bash：則是命令的交互式shell或執行ubuntu中的應用程式

//進入容器
docker exec -it <NAMES> bash   //-t進入終端機
docker attach <NAMES>    //容易故障

//查看容器內容
docker inspect [id]

docker run --name project1  -v ~/project_1:/root/project_1 -p 22:22 -ti ubuntu bash
-v掛載[本機位置：容器位置]

$ sudo docker run -d -P --name web --link db:db training/webapp python app.py
--link name:alias，
其中 name 是要連接的容器名稱，alias 是這個連接的別名。

sudo docker export <id> > utuntu.tar  // 導出容器

//建立一個數據捲
sudo docker volume create --name test  

~~~
