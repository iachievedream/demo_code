# 
## Codeigniter提示 Undefined property MContacts db的解決方法
問題顯示:
~~~
A PHP Error was encountered
Severity: Notice
Message: Undefined property: Login::$db
~~~
網路解決方法:
~~~
 【轉】Codeigniter提示:Undefined property: MContacts::$db的解決方法
問題提示:
Undefined property: MContacts::$db
解決方法:
到application\config\autoload.php中修改$autoload['libraries']的值
~~~
把 
$autoload['libraries'] = array();
修改為
$autoload['libraries'] = array('database');
~~~


配置了資料庫，寫好了，model 在控制器裡也呼叫了。還要在這裡配置上。才可以。
~~~
參考:[Codeigniter提示 Undefined property MContacts db的解決方法](https://www.itread01.com/content/1542396126.html)


## An uncaught Exception was encountered
Type: Error

Message: Call to undefined function mysqli_init()

vi /etc/php/7.2/apache2/php.ini
~~~
extension=mysqli
~~~
sudo service apache2 restart


### 其他狀況
10/23
解決方式
~~~
running updates is usually recommended

sudo apt-get update
then install needed version

sudo apt-get install php5-mysql
sudo apt-get install php7.0-mysql
sudo apt-get install php7.1-mysql
sudo apt-get install php7.2-mysql
restart apache

sudo service apache2 restart
~~~

~~~
A PHP Error was encountered
Severity: Core Warning

Message: PHP Startup: Unable to load dynamic library 'mysqli' (tried: /usr/lib/php/20170718/mysqli (/usr/lib/php/20170718/mysqli: cannot open shared object file: No such file or directory), /usr/lib/php/20170718/mysqli.so (/usr/lib/php/20170718/mysqli.so: undefined symbol: mysqlnd_global_stats))

Filename: Unknown

Line Number: 0

Backtrace:
~~~

~~~
cd /usr/lib/php/20151012
cp mysqli.so   php_mysqli.so
~~~



## 刪除CodeIgniter index.php

根目錄新增.htaccess
~~~
<IfModule mod_rewrite.c>
#DirectoryIndex index.php
RewriteEngine on
RewriteBase /
RewriteCond $1 !^(index\.php|images|css|js|robots\.txt|favicon\.ico)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php?/$1 [L,QSA]
</IfModule>
~~~
參考資料:[快快樂樂刪除CodeIgniter index.php](https://blog.caesarchi.com/2010/08/codeigniter-urlindexphp.html)

### 2020/11/3 ubuntu

~~~
Step 1: enable mod_rewrite
Apache 安裝完成後，預設不會將 mod_rewrite 啟動，因此我們需要手動啟動，開啟覆寫功能。

sudo a2enmod rewrite
sudo service apache2 restart

Step 2: config site.conf
sudo vi /etc/apache2/sites-available/000-default.conf

<Directory "/var/www/html">
    AllowOverride All
</Directory>

sudo service apache2 restart

Step 2: config .htaccess
接著只需要在 root 下，新增 .htaccess 設定檔，並加入覆寫的條件( 這部分要注意權限問題 )

vi /var/www/html/.htaccess
在檔案內新增以下內容

RewriteEngine on
RewriteBase /
RewriteCond $1 !^(index\.php|images|static|robots\.txt|$)
RewriteRule ^(.*)$ index.php/$1 [L,QSA]
~~~
參考資料:[CodeIginiter - 移除 index.php](http://blog.cwfan.cc/zh-TW/2019-04-20-codeIgniter-remove-index-dot-php-from-url.html)


### 2020/11/3 ubuntu 其他處理方式
~~~
sudo apt-get install php7.*-mysqli
或

sudo phpenmod mysqli
sudo service apache2 restart
~~~
參考資料:[Codeigniter：对未定义函数的致命错误调用mysqli_init（）](https://www.thinbug.com/q/33612956)


## An uncaught Exception was encountered
Message: Call to undefined function redirect()

ci3报错 Message: Call to undefined function redirect()

分析原因：是因为没有引入url     

解决办法：$this->load->helper('url');

autoload.php
~~~
// $autoload['helper'] = [];
$autoload['helper'] = ['url'];
~~~

## Message: Undefined property: Login::$session

10/23

A PHP Error was encountered
Severity: Notice

Message: Undefined property: Login::$session

Filename: core/Model.php

~~~
$this->load->library('session')
~~~
參考資料:[Login::$session](https://stackoverflow.com/questions/23978239/undefined-property-cisession/23978282)