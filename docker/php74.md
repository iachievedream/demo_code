# apache2_php74_sqlsrc
## php74_sqlsrc的運行
開啟container
> docker start php74

進入容器
> docker exec -it php74 bash

啟動apache2
> sudo service apache2 restart

查看容器的相關訊息(ex.ip)
> docker inspect php74

### Volume (數據卷)

v的路徑注意

windws：
> docker run --name php74 -itd -p 22:22 -p 85:80 -p 90:81 -p 8005:8000 -p 8010:8001 -v C:\Users\{user}\Desktop\docker\:/var/www iachievedeam1/apache2_php74_sqlsrc:1.0.1 bash

mac：
> docker run --name php74 -itd -p 22:22 -p 85:80 -p 90:81 -p 8005:8000 -p 8010:8001 -v /Users/{user}/Documents/docker/:/var/www iachievedeam1/apache2_php74_sqlsrc:1.0.1 bash

{user}:為自己電腦的使用者名稱。
測試機的port多一個5

## ssh
### 安裝的 shell 指令
~~~
apt-get update
apt-get upgrade
# apt-get install vim
apt-get install openssh-server
~~~

### ssh的設定
> vim /etc/ssh/sshd_config
~~~
注释这一行PermitRootLogin prohibit-password
添加一行PermitRootLogin yes

#PermitRootLogin prohibit-password
PermitRootLogin yes
~~~

### jenkins 需安裝的附屬套件
> sudo apt update && sudo apt install openjdk-8-jre -y

## 啟動容器需要的指令
### 設定 ubuntu 的密碼
> passwd

### 重新啟動docker的container需要再重新啟動ssh的設定
> /etc/init.d/ssh restart


## 連接 ssh 方式(connect ssh)
~~~
> ubuntu
ssh root@0.0.0.0 -p 22
ssh root@172.17.0.3 -p 22

> windows10
ssh root@127.0.0.1 -p 22

ssh-keygen -R 127.0.0.1
來源:
[SSH連現時出現「WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!」解決辦法](https://cometlc.pixnet.net/blog/post/5453854)

~~~

## laravel
chown 權限設定
~~~
sudo chown -R www-data:www-data /var/www/html/
sudo chown -R www-data:www-data *.*
sudo chown -R www-data:www-data *
~~~

### 暫存清除
> vi composer.sh
~~~
#!/bin/bash
composer i
composer dump-autoload
php artisan cache:clear
php artisan route:cache
php artisan config:cache
php artisan optimize
php artisan view:clear

php artisan serve --host=0.0.0.0 --port=8000
~~~
