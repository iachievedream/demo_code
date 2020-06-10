# README
[apache1](#apache1)
* [docker-compose.yml](#docker-compose.yml)
  
* [Dockerfile](#Dockerfile)
[apache_mysql](#apache_mysql)
[other](#other)

## apache1
sudo apt install docker-compose

建立專屬資料夾
~~~
sudo mkdir docker
sudo chmod 777 docker
cd docker
~~~
### docker-compose.yml
sudo nano docker-compose.yml
~~~
version: '3.3'
services:
  web:
    image: php:7.3-apache
    container_name: php73
    volumes:
      - ./php:/var/www/html/
    ports: 
      - 8000:80
~~~
### Dockerfile
sudo nano Dockerfile
~~~
FROM php:7.3.3-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli
EXPOSE 80
~~~
建立docker images
~~~
sudo docker-compose up
~~~
確認images
~~~
sudo docker images
~~~
[回目錄](#README)

## apache_mysql
sudo nano docker-compose.yml
~~~
version: '3.3'
services:
  web:
    build:
      context: ./php
      dockerfile: Dockerfile
    container_name: php73
    depends_on:
      - db
    volumes:
      - ./php:/var/www/html/
    ports: 
      - 8000:80
  db:
    container_name: mysql8
    image: mysql:8.0
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rode
      MYSQL_DATABASW: test_db
      MYSQL_USER: FU
      MYSQL_PASSWORD: a1234567

    ports:
      - 6033:3306
~~~
進入php資料夾中
~~~
cd php
~~~
sudo nano Dockerfile
~~~
FROM php:7.3.3-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli
EXPOSE 80
~~~
sudo docker-compose up

sudo docker images

[回目錄](#README)

## other
php_apache.md
<a href="https://www.youtube.com/watch?v=_mwWxgfZ7Zc&list=PLfBT9P5LG1z8VcPMIfI1UI12uhCJXHOQP&index=117&t=0s">Apache, PHP & MySql on Docker on Ubuntu 19.04</a><br>
~~~
sudo apt  install docker-compose
sudo nano docker-compose.yml
sudo docker-compose up
sudo docker run --name apachetest -d -p 8000:80 php:7.3-apache
~~~