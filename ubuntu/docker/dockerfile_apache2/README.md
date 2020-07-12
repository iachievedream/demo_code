# README
# Dockerfile
建立之資料夾以及Dockerfile檔案
~~~
sudo mkdir apache
sudo chmod 777 apache
cd apache
sudo nano Dockerfile
################
FROM php:7.3-apache
COPY src /var/www/html/
EXPOSE 80
################
~~~
## 使用Dockerfile建立docker images
~~~
//test嘗試名稱  copy有些沒有
sudo docker build -t php:v1 .
//有時沒有v1的名稱

sudo docker build -t test .
//名稱有些不同，test無法成為name

sudo docker images
~~~
運行容器
~~~
sudo docker run --name apachetest -d -p 8000:80 php:7.3-apache
sudo docker run --name apachetest -d -p 8000:80 test
~~~
進入容器中
~~~
sudo docker exec -it apachetest bash
~~~

~~~
echo "<?php echo 'Hello world';ls ?>" > index.php
cat index.php
ls
//顯示內容會像後面這串文字，<?php phpinfo(); ?>
exit
~~~
進入此網址：http://127.0.0.1:8000/


# volume
# -v `pwd`:/var/www/html：將 Host 端的目前目錄 ( pwd ) 掛載到 container 的 /var/www/html 目錄
~~~
sudo docker run --name apachephp -d -p 8001:80 -v `pwd`:/var/www/html apachetest
sudo docker exec -it apachephp bash
~~~
測試方式，修改 index.php
~~~
sudo nano index.html

<?php
echo '<h1>Hello World</h1>';
phpinfo();
?>
~~~
