# apache2_php74_sqlsrc
## php74_sqlsrc的運行
~~~
docker start php74
docker exec -it php74 bash
sudo service apache2 restart

docker inspect php74
~~~
v的路徑注意
#### mac
~~~
docker run --name php74 -itd -p 80:80 -p 8000:8000 -p 8001:8001 -v /Users/{user}/Documents/docker/:/var/www iachievedeam1/apache2_php74_sqlsrc:1.0.0 bash
~~~

#### windws
測試機的port多一個5
~~~
docker run --name php74 -itd -p 22:22 -p 85:80 -p 90:81 -p 8005:8000 -p 8010:8001 -v C:\Users\{user}\Desktop\:/var/www iachievedeam1/apache2_php74_sqlsrc:1.0.0 bash
~~~

## ssh
### 安裝

~~~
apt-get update
apt-get upgrade
# apt-get install vim
apt-get install openssh-server

# 設定密碼
passwd

vim /etc/ssh/sshd_config
注释这一行PermitRootLogin prohibit-password
添加一行PermitRootLogin yes

#PermitRootLogin prohibit-password
PermitRootLogin yes
~~~

### connect
~~~
ssh root@0.0.0.0 -p 22
ssh root@172.17.0.3 -p 22

==windows10
ssh root@127.0.0.1 -p 22
~~~

### 重新啟動docker的container需要再重新啟動ssh的設定
/etc/init.d/ssh restart


## laravel
權限設定
~~~
sudo chown -R www-data:www-data /var/www/html/
sudo chown -R www-data:www-data *.*
sudo chown -R www-data:www-data *
~~~

暫存清除

vi composer.sh
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
