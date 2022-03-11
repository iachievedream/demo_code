# apache2

## 目錄
[apache2](#apache2)<br>
[apache2](#apache2)<br>

* [appache2](#appache2)<br>
* * [php](#php)<br>
* * [更改appache2的port](#更改appache2的port)<br>
* * [更改appache2的conf](#更改appache2的conf)<br>
* * [開啟站台](#開啟站台)<br>
* * [重新載入Apache設定檔](#重新載入Apache設定檔)<br>
* * [設定hosts](#設定hosts)<br>

### php
> vi /etc/php/7.2/apache2/php.ini
~~~
extension=mysqli
~~~
> sudo service apache2 restart

### 更改appache2的port
> sudo nano /etc/apache2/ports.conf
~~~
Listen 81
Listen 85

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>
~~~

### 建立/開啟虛擬站台 (設定hosts)
> sudo vi etc/host
~~~
添加下列內容
127.0.0.1 laravel.local
~~~
### 更改appache2的conf
> sudo vi /etc/apache2/sites-available/000-default.conf 
> sudo vi /etc/apache2/sites-available/laravel.local.conf
~~~
<VirtualHost laravel.local:80>
    ServerAdmin webmaster@localhost
    DocumentRoot "/var/www/html/laravel/laravel_test/public"
    ServerAdmin abc

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory "/var/www/html/laravel/laravel_test">
        Options All
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
~~~
### 開啟站台
> sudo a2ensite 000-default.conf 
> sudo a2ensite laravel.local.conf
### 重新載入 Apache 設定檔
> sudo systemctl reload apache2
> sudo service apache2 restart

參考資料：[2018 簡潔高效的 PHP & Laravel 工作術](https://medium.com/@shengyou/2018ironman-eos-for-php-developer-day13-124a0903e937)

### Q.AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.4. Set the 'ServerName' directive globally to suppress this message
> sudo vi /etc/apache2/apache2.conf
~~~
> add
ServerName 127.0.0.1
~~~

## iptables
8080改為80 port<br>
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080<br>
<a href="https://blog.roga.tw/2006/10/325">簡單弄一弄 Apache 的 Proxy 功能</a><br>
<a href="https://ithelp.ithome.com.tw/questions/10142841">經由網域指向同IP不同port</a><br>
有VirtualBox的port轉送教學：<br>
<a href="https://ithelp.ithome.com.tw/articles/10210574">在ubuntu18.04安裝laravel環境</a><br>
<a href="https://k2r2bai.com/2015/11/04/linux/ubuntu/apache2-proxy/">簡單設定 Apache2 Proxy 與 VirtualHost</a><br>
<a href=""></a><br>

## composer
如果有載入composer就可以使用下列指令安裝laravel
~~~
安裝套件
composer global require laravel/installer

建立專案
composer create-project --prefer-dist laravel/laravel laravel_test "6.*"
~~~
