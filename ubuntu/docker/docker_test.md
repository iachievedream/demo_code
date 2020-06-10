## docker 實際範例

### 簡單類型

#### docker 安裝php(pull php)

~~~
還需做嘗試以及新的內容更新
sudo docker pull php
sudo docker run --name phptest -d php
sudo docker run --name phptest -v ~/nginx/www:/www  -d php  //-v掛載
sudo docker exec -it phptest bash
~~~

#### docker 安裝apache(pull httpd)

~~~
# 安裝apach2，但這個httpd沒有php的程式功能
sudo docker pull httpd
# 確認images
sudo docker images
# 執行httpd，名稱為apachetest，容易重複產生錯誤
sudo docker run --name apachetest -d -p 8000:80 httpd
# 進入容器中(進入容器後sh就會停止)
sudo docker exec -it apachetest bash
# 顯示程式內容
cd htdocs/
cat index.html 
# 修改檔名為index1.html
sudo mv index.html index1.html

# 新增程式內容
echo "<?php phpinfo(); ?>" > index.php
echo "<html><body><h1>My name is fu</h1></body></html>" > index2.html
cat index.php
# 顯示內容會像後面這串文字，<?php phpinfo(); ?>
exit

# http://127.0.0.1:8000/

還需嘗試下列指令：
sudo docker run --name apache7 -d --link apachetest:php -p 8001:80 php

sudo docker run -d -p 8000:80 -v `pwd`:/var/www/html test
~~~

參考資料：<br>
<a href="https://hackmd.io/@titangene/docker-lamp">利用 Dockfile、Docker Compose 建立 LAMP 環境 (PHP、Apache、MySQL)</a><br>
<br>
#### docke 安裝node(pull node)

~~~
sudo docker pull node
sudo docker run -itd --name node-test node    //運行容器
sudo docker exec -it node-test /bin/bash      //進入容器
root@6c5d265c68a6:/# node -v
~~~

### 複雜類型

#### docker 安裝nginx(pull nginx)

~~~
sudo docker run --name nginx-test -p 8080:80 -d nginx
------------------------------------------------------
-d：此容器在後台持續運行
--name：nginx-test容器名稱
-p 8080:80：是主機的port綁至Container的port指令
__[8080容器外部端口：80容器內的端口]
nginx：IMAGE

使用此hostname -I指令知道電腦的IP位置，或是直接使用127.0.0.1也可以，後面添加:8080即可看見瀏覽器出現nginx的畫面

php掛載到nginx還需要確認
docker run --name runoob-php-nginx -p 8083:80 -d \
    -v ~/nginx/www:/usr/share/nginx/html:ro \
    -v ~/nginx/conf/conf.d:/etc/nginx/conf.d:ro \
    --link myphp-fpm:php \
    nginx
~~~

#### docke 安裝MySQL(pull mysql)
~~~
sudo docker pull mysql
sudo docker run -itd --name mysqltest -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
------------------------------------------------------
-d：背景執行
--name：mysqltest容器名稱
-p 3306:3306：接本機的3306，及容器的3306
-e：
MYSQL_ROOT_PASSWORD：密碼123456
images：mysql

sudo docker ps  //確認是否運行

//進入MySQL
sudo docker exec -t mysqltest bash
sudo docker exec -it mysqltest mysql -u root -p

去瀏覽器查看127.0.0.1:3306網址，雖是錯誤訊息
~~~

#### docke 安裝phpmyadmin(pull phpmyadmin/phpmyadmin)承上列MySQL

~~~
sudo docker pull phpmyadmin/phpmyadmin
//連接phpmyadmin的資料
sudo docker run --name myadmin -d --link mysqltest:db -p 9100:80 phpmyadmin/phpmyadmin
------------------------------------------------------
--name myadmin
-d：背景執行
--link mysqltest:db：連接，前面是容器名稱，後面則是新增別名(一個大坑需要補坑)
-p 9100:80：接本機的9100，及容器的80port
images：phpmyadmin/phpmyadmin

就可以使用127.0.0.1:9100開啟phpmyadmin的功能

要了解差異：
docker run --name phpmyadmin -d --link mysql -e PMA_HOST="mysql" -p 8080:80 phpmyadmin/phpmyadmin
另外一個mysql指令：
sudo docker run --name mysqltest -e MYSQL_ROOT_PASSWORD=123456 -p 127.0.0.1:3308:3306 -d mysql/mysql-server:5.7

//待嘗試
SHOW DATABASES;
USE user;
UPDATE user SET host = '%' WHERE user = 'root';
FLUSH PRIVILEGES;
~~~

<a href="https://ithelp.ithome.com.tw/articles/10200754">利用 Docker 架起 phpMyAdmin + MySQL (MAC)</a><br>
<a href="http://www.andrewchen.tw/2017/05/05/20170505_NOTE_DOCKER_MYSQL/">Docker 安裝 Mysql + Phpmyadmin</a><br>
<a href="https://legacy.gitbook.com/book/philipzheng/docker_practice/details">《Docker —— 從入門到實踐­》</a><br>

待看：<br>
<a href="https://www.twle.cn/l/yufei/docker/docker-basic-install-apache.html">Docker 安装 Apache</a><br>
<a href="http://arder-note.blogspot.com/2018/05/docker-container-link-network.html">Docker container 互相連接 (link, network)</a><br>
<a href="https://ithelp.ithome.com.tw/articles/10193291">Day20：介紹 Docker 的 Network (一)</a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>

#### Docker 安装 Apache(pull httpd)

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
//建立檔案
sudo nano Dockerfile
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
//建立 web:v1 [REPOSITORY：TAG]
sudo docker build -t web:v1 .  
sudo docker images
sudo docker run -itd -p 8888:80 web:v1
~~~

<br>

#### Docker 安装 jenkins(pull jenkins)

~~~
下載jenkins
sudo docker pull jenkins/jenkins
運行myjenkins容器
sudo docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 jenkins/jenkins
sudo docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 -v `pwd`:/var/jenkins_home/workspace jenkins/jenkins

進入容器
sudo docker exec -it myjenkins bash
查看密碼
cat /var/jenkins_home/secrets/initialAdminPassword

另外指令(待了解)
sudo docker run -d -u 0 --privileged  --name jenkins_node1 -p 49003:8081 -v `pwd`:/var/jenkins_home/workspace jenkins/jenkins
~~~

原文網址：<a href="https://kknews.cc/code/jlrxe66.html">如何使用 Docker 安裝 Jenkins</a><br>
未有詳細介紹指令。

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
<br>
還不了解，測試不出來為何原因：<br>
建立自己的 Docker image：<a href="https://skychang.github.io/2015/07/30/%E5%BB%BA%E7%AB%8B%E8%87%AA%E5%B7%B1%E7%9A%84-Docker-image/">Dockerfile </a><br>

<a href="https://vincent.fishboneapps.com/2019/05/31/Docker-%E5%BF%AB%E9%80%9F%E5%AD%B8%E7%BF%92%E8%87%AA%E6%88%91%E6%8C%91%E6%88%B0-II-Day3/">Docker 快速學習自我挑戰 II Day3
</a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
