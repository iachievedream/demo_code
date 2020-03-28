安裝apach2，確認images

~~~
sudo docker pull httpd
sudo docker pull php

sudo docker images
~~~

執行httpd，名稱為apachetest

~~~
sudo docker run --name apachetest -d -p 8000:80 httpd
~~~

進入容器中

~~~
sudo docker exec -it apachetest bash
root@c2702c672520:/usr/local/apache2#ls
bin  build  cgi-bin  conf  error  htdocs  icons  include  logs	modules
root@c2702c672520:/usr/local/apache2# cd htdocs/
root@c2702c672520:/usr/local/apache2/htdocs# ls
index.html
root@c2702c672520:/usr/local/apache2/htdocs# cat index.html 
<html><body><h1>It works!</h1></body></html>
~~~

新增文件以及離開(httpd沒有php)，後續待補銜接內容

~~~
$ echo "<?php phpinfo(); ?>" > index.php
$ cat index.php
<?php phpinfo(); ?>
$ exit
~~~

### Dockerfile

sudo nano Dockerfile

~~~
FROM php:7.1-apache
COPY src /var/www/html/
EXPOSE 80
~~~

建立images與查看,後續執行與確認是否執行成功

~~~
sudo docker build -t test .
sudo docker images
sudo docker run --name apachetest -d -p 8000:80 test
sudo docker ps
~~~

進入容器中

~~~
sudo docker exec -it apachetest bash
~~~

volume
-v `pwd`:/var/www/html：將 Host 端的目前目錄 ( pwd ) 掛載到 container 的 /var/www/html 目錄

~~~
sudo docker run -d -p 8000:80 -v `pwd`:/var/www/html test
~~~

測試方式，修改 index.php

~~~
sudo nano index.html
<?php
echo '<h1>Hello World</h1>';
phpinfo();
?>
~~~

開啟127.0.0.1:8000網址，就可看見修改的訊息內容。


===========================
使用基本 Docker 指令建立 PHP + Apache 環境
建立並執行 container
接著使用 docker run 指令來建立並執行 container，下面是參數說明：

~~~
sudo docker run --name my-php-apache -d -p 8000:80 php:7.1-apache
~~~

--name my-php-apache：設定 container 名稱為 my-php-apache
-d：container 在背景執行
-p 8000:80：指定一個 port，host 對外開 8000 port，container 對內開 80 port
php:7.1-apache：使用 PHP 官方在 Docker Hub 上提供的 7.1-apache tag 的 image

使用 docker ps 指令來確定 container 是否成功執行 (查看正在執行的 container 狀態)

查詢主機的 IP 位址
接著是查詢主機的 IP 位址，如果是 Linux 或 masOS 可使用 ifconfig 指令，如果是 Windows 則是使用 ipconfig 指令


進入 container 新增 index.html
所以接著要使用 docker exec 指令進入 container
來新增 index.php

~~~
$ docker exec -it my-php-apache bash
root@08e5975c8a27:/var/www/html#
~~~

接著就在 Apache web server 的根目錄 /var/www/html 下新增 index.php

~~~
$ echo "<?php phpinfo(); ?>" > index.php
$ cat index.php
<?php phpinfo(); ?>
接著輸入 exit 指令離開 container
$ exit
~~~



<a href="https://hackmd.io/@titangene/docker-lamp">利用 Dockfile、Docker Compose 建立 LAMP 環境 (PHP、Apache、MySQL)</a><br>
