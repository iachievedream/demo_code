#!/bin/bash
## Dockerfile
# mkdir apache_php71
# cd apache_php71
# sudo nano Dockerfile
# ~~~
FROM php:7.1-apache
COPY src /var/www/html/
EXPOSE 80
# ~~~

//test嘗試名稱
sudo docker build -t php:v1 .
sudo docker images
sudo docker run --name apachetest -d -p 8000:80 php:7.1-apache
# --name my-php-apache：設定 container 名稱為 my-php-apache
# -d：container 在背景執行
# -p 8000:80：指定一個 port，host 對外開 8000 port，container 對內開 80 port
# php:7.1-apache：使用 PHP 官方在 Docker Hub 上提供的 7.1-apache tag 的 image

#進入容器中
sudo docker exec -it apachetest bash

echo "<?php echo "Hello world";ls ?>" > index2.php

cat index.php
ls
# 顯示內容會像後面這串文字，<?php phpinfo(); ?>
exit
# http://127.0.0.1:8000/


# volume
# -v `pwd`:/var/www/html：將 Host 端的目前目錄 ( pwd ) 掛載到 container 的 /var/www/html 目錄
sudo docker run --name apachephp -d -p 8001:80 -v `pwd`:/var/www/html php:7.1-apache
sudo docker exec -it apachephp bash

# 測試方式，修改 index.php
sudo nano index.html
# <?php
# echo '<h1>Hello World</h1>';
# phpinfo();
# ?>

# 127.0.0.1:8000