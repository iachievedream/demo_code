## Laravel_base

# 目錄
[環境與安裝](#環境與安裝)<br>
[修改目錄權限](#修改目錄權限)<br>
[建立/開啟虛擬站台](#建立/開啟虛擬站台)<br>
[Q&A](#Q&A)<br>
* [Laravel_installation_Permission_denied](#Laravel_installation_Permission_denied)<br>
* [laravel程序报错SQLSTATE42000](#laravel程序报错SQLSTATE42000)<br>
* [前端跨域訪問](#前端跨域訪問)<br>

[反向代理設定_Reverse_Proxy&A](#反向代理設定_Reverse_Proxy)<br>
[其他資料](#其他資料)<br>


## 環境與安裝
環境：ubuntu 18.04<br>
如果有載入composer就可以使用下列指令安裝laravel

~~~
//此資料夾才可使用下列指令
composer global require laravel/installer
laravel new laravel_test 

//直接安裝則是下列指令：
composer create-project --prefer-dist laravel/laravel laravel_test "6.*"
~~~
[回目錄](#目錄)

## 修改目錄權限

~~~
sudo chown -R www-data:root /var/www/laravel_test
//更改的目標用戶組和用戶，更改的目標文件夾
sudo chmod -R 755 laravel_test
sudo chmod -R 777 laravel_test/storage
~~~

我個人方式是建立新資料夾，
及使用chmod把權限開至777，
再進去執行laravel的安裝指令。

~~~
sudo mkdir laravel
sudo chmod 777 laravel
sudo chmod 777 laravel/storage
~~~ 
[回目錄](#目錄)

## 建立/開啟虛擬站台
sudo nano etc/host
~~~
127.0.0.1 abc.xyz
~~~
sudo nano /etc/apache2/sites-available/laravel.local.conf
sudo nano /etc/apache2/sites-available/
~~~
<VirtualHost laravel.local:80>
    DocumentRoot "/var/www/html/laravel/laravel_test/public"
    ServerAdmin abc

    <Directory "/var/www/html/laravel/laravel_test">
        Options All
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

# 開啟站台
sudo a2ensite laravel.local.conf
# 重新載入 Apache 設定檔
sudo systemctl reload apache2
# 設定 hosts
sudo nano /etc/hosts

127.0.0.1 laravel.local

//測試是不需要重啟apache2
sudo service apache2 restart

其他指令
sudo nano /etc/apache2/sites-available/000-default.conf 
sudo a2ensite 000-default.conf 
~~~
參考資料：
<a href="https://medium.com/@shengyou/2018ironman-eos-for-php-developer-day13-124a0903e937">[2018 鐵人賽] 簡潔高效的 PHP & Laravel 工作術：從 elementary OS 下手的聰明改造提案 #13</a><br>

[回目錄](#目錄)

## Q&A
### Laravel_installation_Permission_denied
mkdir(): Permission denied<br>
解決方法如下:

~~~
cd /var/www
sudo chown -Rv root:$USER .
//chown -R更改所有檔案的權限擁有者 -v顯示更改結果 -f則是不顯示
//root的群組$USER的使用者
//ls -l可以看擁有者

sudo chmod -Rv g+rw .
cd html
composer create-project --prefer-dist laravel/laravel blog
~~~
[回目錄](#目錄)

### laravel程序报错SQLSTATE42000

[laravel程序报错SQLSTATE[42000]: Syntax error or access violation: 1231 Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'如何解决](https://www.cnblogs.com/yaoliuyang/p/12395769.html)

~~~
找到config\database.php中的mysql配置  'strict' => true,把它改为false
~~~
[回目錄](#目錄)

### 前端跨域訪問
[Laravel 使用 Middleware 解決 ‘Access-Control-Allow-Origin’ 的問題](https://medium.com/%E4%B8%80%E5%80%8B%E5%B0%8F%E5%B0%8F%E5%B7%A5%E7%A8%8B%E5%B8%AB%E7%9A%84%E9%9A%A8%E6%89%8B%E7%AD%86%E8%A8%98/laravel-%E4%BD%BF%E7%94%A8-middleware-%E8%A7%A3%E6%B1%BA-access-control-allow-origin-%E7%9A%84%E5%95%8F%E9%A1%8C-18237e4f77d4)

[使用 laravel-cors 实现 Laravel 的跨域配置](http://www.ptbird.cn/laravel-cors-to-cors-laravel-app.html)

[关于Laravel下Cors跨域POST请求的一种实现方法](https://segmentfault.com/a/1190000008736168)

[回目錄](#目錄)


## 反向代理設定_Reverse_Proxy

~~~
sudo nano httpd.conf 之中開啟兩個mod，分別是

#LoadModule proxy_module modules/mod_proxy.so
#LoadModule proxy_http_module modules/mod_proxy_http.so

請將這兩行前面的井號去掉。

2. 在 vhosts之中增加要轉換的網域
<VirtualHost *:80>
ServerName yourdomain.com
ProxyRequests off
<Proxy *>
Order allow,deny
Allow from all
</Proxy>
~~~

8080改為80 port<br>
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080<br>
<a href="https://blog.roga.tw/2006/10/325">簡單弄一弄 Apache 的 Proxy 功能</a><br>
<a href="https://ithelp.ithome.com.tw/questions/10142841">經由網域指向同IP不同port</a><br>
有VirtualBox的port轉送教學：<br>
<a href="https://ithelp.ithome.com.tw/articles/10210574">在ubuntu18.04安裝laravel環境</a><br>
<a href="https://k2r2bai.com/2015/11/04/linux/ubuntu/apache2-proxy/">簡單設定 Apache2 Proxy 與 VirtualHost</a><br>
<a href=""></a><br>


## 其他資料

方法來源：從零開始的Laravel RESTful api：<br>
<a href="https://ithelp.ithome.com.tw/articles/10217379">Day 04 : 環境架設 part III -- Composer & Laravel</a><br>
<br>
有權限的開放以及新增一個專屬apache2.conf的教學方式：<br>
<a href="https://medium.com/@rommelhong/%E5%9C%A8ubuntu-18-04-lts%E4%B8%AD%E5%AE%89%E8%A3%9Dphpmyadmin-composer-laravel-6-c65a0c63fa58">在Ubuntu 18.04 LTS中安裝phpMyAdmin + Composer + Laravel 6</a><br>
<br>
chown的教學：<br>
<a href="https://blog.gtwang.org/linux/linux-chown-command-tutorial/">Linux 更改檔案擁有者與群組，chown 指令使用教學與範例</a><br>
<br>


