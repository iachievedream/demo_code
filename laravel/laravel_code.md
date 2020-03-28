## Laravel_code

環境：ubuntu 18.04<br>
如果有載入composer就可以使用下列指令安裝laravel

~~~
composer global require laravel/installer //此資料夾才可使用下列指令
laravel new blog

直接安裝則是下列指令：
composer create-project --prefer-dist laravel/laravel laravel_test "6.*"
~~~

修改目錄權限

~~~
sudo chown -R www-data:root /var/www/laravel_test
sudo chmod 755 /var/www/laravel_test/storage

$ chmod -R 755 laravel_test
$ chmod -R 777 laravel_test/storage
~~~ 

### Q&A：Laravel installation:
mkdir(): Permission denied  
解決方法如下:

~~~
$ cd /var/www
$ sudo chown -Rv root:$USER .
$ sudo chmod -Rv g+rw .
$ cd html
$ composer create-project --prefer-dist laravel/laravel blog
上列指令尚未了解
~~~

方法來源：從零開始的Laravel RESTful api：<a href="https://ithelp.ithome.com.tw/articles/10217379"></a>Day 04 : 環境架設 part III -- Composer & Laravel<br>
<br>
我個人方式是建立新資料夾，<br>
及使用chmod把權限開至777，<br>
再進去執行laravel的安裝指令。

~~~
sudo mkdir laravel
sudo chmod 777 laravel
cd laravel
~~~

<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href="https://medium.com/@rommelhong/%E5%9C%A8ubuntu-18-04-lts%E4%B8%AD%E5%AE%89%E8%A3%9Dphpmyadmin-composer-laravel-6-c65a0c63fa58">在Ubuntu 18.04 LTS中安裝phpMyAdmin + Composer + Laravel 6</a>：有權限的開放以及新增一個專屬apache2.conf的教學方式。<br>
<a href="https://ithelp.ithome.com.tw/articles/10210574">在ubuntu18.04安裝laravel環境</a>：有VirtualBox的port轉送教學<br>
