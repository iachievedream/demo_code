# 已解

## laravel_Artisan_migrate_could_not_find_driver
laravel:php artisan migrate:refresh

<a href="https://stackoverflow.com/questions/46745365/artisan-migrate-could-not-find-driver">Artisan migrate could not find driver</a>

~~~
Illuminate\Database\QueryException  : could not find driver (SQL: select * fr
om information_schema.tables where table_schema = dev_oms and table_name = migra
tions)

sudo nano /etc/php/7.2/cli/php.ini
原因是php.ini 擴充套件"php_pdo_mysql.dll"沒開啟
extension=php_pdo_mysql.dll
906
;extension=pdo_mysql
;extension=pdo_sqlite
~~~



### mysql
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

<a href="https://stackoverflow.com/questions/19658891/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run">Artisan migrate could not find driver</a><br>



## 未解
Cannot stat file /proc/12426/fd/15: Permission denied 
sudo apt-get install mysql-server

[Getting strange errors while downloading mysql
](https://askubuntu.com/questions/1129029/getting-strange-errors-while-downloading-mysql)

~~~
invoke-rc.d: policy-rc.d denied execution of stop.
update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Renaming removed key_buffer and myisam-recover options (if present)
Cannot stat file /proc/12425/fd/0: Permission denied
Cannot stat file /proc/12425/fd/1: Permission denied
Cannot stat file /proc/12425/fd/2: Permission denied
Cannot stat file /proc/12425/fd/3: Permission denied
===============================
Cannot stat file /proc/12426/fd/23: Permission denied
Cannot stat file /proc/12426/fd/24: Permission denied
Cannot stat file /proc/12426/fd/25: Permission denied
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
Setting up mysql-server (5.7.30-0ubuntu0.18.04.1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
root@8bdc61d2b295:/home# Cannot stat file /proc/12426/fd/15: Permission denied
bash: Cannot: command not found
~~~

* 另外需要的指令
~~~
sudo apt-get install aptitude
~~~
[弱弱的問:這個指令裡的sudo aptitude 可以用 sudo apt-get替換嗎](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=153790)

====================
bash: wget: command not found
~~~
sudo apt install wget
cd /tmp/ && wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
~~~
[How to install wget on a Debian or Ubuntu Linux](https://www.cyberciti.biz/faq/how-to-install-wget-togetrid-of-error-bash-wget-command-not-found/)


### 安裝mysql
~~~
docker pull mysql
docker run -itd --name mysqltest -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
~~~
### MySQL
~~~
docker exec -it mysqltest bash
docker exec -it mysqltest mysql -u root -p
~~~
### phpmyadmin
~~~
docker search phpmyadmin
docker pull phpmyadmin/phpmyadmin
~~~
### phpmyadmin的資料
~~~
docker run --name myadmin -d --link mysqltest:db -p 9100:80 phpmyadmin/phpmyadmin
~~~

[回目錄](#docker)