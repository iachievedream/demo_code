#!/bin/bash
# Dockerfile
# # sudo nano Dockerfile
FROM php:7.1-apache
COPY src /var/www/html/
EXPOSE 80

sudo docker build -t test .
sudo docker images
sudo docker run --name apachetest -d -p 8000:80 test
sudo docker ps
sudo docker exec -it apachetest bash

# volume
sudo docker run -d -p 8000:80 -v `pwd`:/var/www/html test

# 測試方式，修改 index.php
sudo nano index.html
# <?php
# echo '<h1>Hello World</h1>';
# phpinfo();
# ?>

# 127.0.0.1:8000