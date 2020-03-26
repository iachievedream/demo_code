### 基本指令
搜尋:(以ubuntu為例)<br>
sudo docker search ubuntu<br>
<br>
獲取:<br>
sudo docker pull ubuntu<br>
<br>
查看目前 images<br>
sudo docker images<br>
<br>
啟動容器:<br>
sudo docker run -it ubuntu /bin/bash<br>
_______________-i交互是操作，-t是終端機，名稱，/bin/bash則是命令的交互式shell<br>
<br>
進入容器:<br>
docker attach <br>
<br>
查看運行的容器:<br>
sudo docker ps<br>
<br>
停止:<br>
sudo docker stop<br>
<br>
刪除容器:<br>
sudo docker rm -f <id><br>

### docker 安裝iginx(pull nginx)

運行容器:<br>
sudo docker run --name nginx-test -p 8080:80 -d nginx<br>
__________________容器名稱_________映射至8080port__-d容器在後台持續運行<br>
<br>
使用此hostname -I指令知道電腦的IP位置，或是直接使用127.0.0.1也可以，後面添加:8080即可看見瀏覽器出現nginx的畫面<br>

### docker 安裝php(pull php)

sudo docker run --name  nginx -v ~/nginx/www:/www  -d php<br>
php掛載到iginx還需要確認<br>

### docke 安裝node(pull node)

sudo docker run -itd --name node-test node<br>
____________________容器名稱<br>

sudo docker exec -it node-test /bin/bash<br>
root@6c5d265c68a6:/# node -v<br>

### docke 安裝MySQL(pull mysql)

運行容器<br>
sudo docker run -itd --name mysql-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql<br>
_______________________________________映射至此port_____MySQL的帳密資訊<br>

### Docker 安装 Apache(pull httpd)

運行容器:<br>
docker run -p 80:80 -v $PWD/www/:/usr/local/apache2/htdocs/ -v $PWD/conf/httpd.conf:/usr/local/apache2/conf/httpd.conf -v $PWD/logs/:/usr/local/apache2/logs/ -d httpd<br>
<br>
<br>
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
https://ithelp.ithome.com.tw/users/20072603/ironman/2088

https://pickmanblog.wordpress.com/2017/09/10/%E7%94%A8docker%E5%BF%AB%E9%80%9F%E5%BB%BA%E7%AB%8B%E9%96%8B%E7%99%BC%E7%92%B0%E5%A2%83-php7-1-mysql-apache/

http://blog.maxkit.com.tw/2017/03/docker-compose.html
