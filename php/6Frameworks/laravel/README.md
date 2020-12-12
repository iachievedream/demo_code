# laravel 

## 目錄
[Laravel的基本介紹](#Laravel的基本介紹)<br>
[laravel框架的基本認識](#laravel框架的基本認識)<br>

~~~
基本技巧筆記：
laravel程式撰寫過程：
留言板的laravel程式碼
JWT的介紹及實際的操作：
套用後，使用RESTful的過程：
domo影片(youtube)
~~~

## Laravel的基本介紹

~~~
部落格練習，

先想架構，
先有新增文章，
再有文章列表，
更新文章
最後則是刪除文章。

後面加入會員權限，
先由註冊，
再有登入，
後續是設計文章的權限內容，
對於文章作者以及部落格管理員，
才有權限做文章的修改以及刪除。

後續在做API的JWT版本，
進階則是做Ajax的JWT版本。
~~~

## laravel框架的基本認識
檔案規劃順序
~~~
.env設定檔(MySQL的帳密等)
->[route]
->[Middleware]
->[Controller]
->[Service]
->[Repository]
->[Model]

檔案位置
routes/web.php[route]-->
app/http/Kernel[Middleware的設定檔]-->
app/http/Middleware/[Middleware]-->
app/http/Controllers/[Controller]-->[Model] or [view]

檔案分類：把[Model]與[Controller]多分出兩層出來管理，以減少Controller的程式複雜度

檔案位置
App/Http/Controllers/[Controller]-->app/http/Services/[Service]-->app/http/Repositories/[Repository]-->app/[Model]

resources/views/[view]

MySQL建立與管理
建立資料表：darrbase/migrations/[migration]
建立假資料內容：darrbase/seeds/[seeds]
~~~

## ubuntu

vi laravel.sh
~~~
//git clone https://~~
sudo git clone https://github.com/iachievedream/blog-laravel.git

//修改目錄權限
sudo chmod -R www-data:www-data /var/www/html/blog-laravel
//sudo chown -R www-data:root /var/www/laravel_test
//更改的目標用戶組和用戶，更改的目標文件夾
sudo chmod -R 777 blog-laravel
sudo chmod -R 777 blog-laravel/storage
//sudo chmod 777 laravel
//sudo chmod 777 laravel/storage

cd blog-laravel
composer install 

//有安裝問題用這個
//composer install --ignore-platform-reqs

sudo cp .env.example .env
//copy .env.example .env

# set up MySQL of root and password
sudo vi .env
php artisan key:generate
//如果有JWT(須執行下行指令)
php artisan jwt:secret

php artisan migrate:refresh
//php artisan db:seed
php artisan serves
//php artisan serve --host=127.0.0.1 --port=80

80 port 轉成其他 port(host需要換成外網ID),再使用
php artisan serve --host=0.0.0.0 --port=8000
~~~
[回目錄](#docker)

# 推薦網頁

<a href="https://blog.tonycube.com/">tonycube</a><br>
<a href="http://blog.tonycube.com/2015/01/laravel-11-route.html">Laravel 學習筆記(11) - Route 進階</a><br>

### 待整理
~~~
資源控制器(Resource controllers)
php artisan routes
Route::resource('post', 'HomeController');
Route::get('post', array('uses' => 'HomeController@index', 'as' => 'post.home'));
~~~


=====================================

## 反向代理設定_Reverse_Proxy

~~~
sudo nano httpd.conf 之中開啟兩個mod，分別是

#LoadModule proxy_module modules/mod_proxy.so
#LoadModule proxy_http_module modules/mod_proxy_http.so

請將這兩行前面的井號去掉。

在 vhosts之中增加要轉換的網域
<VirtualHost *:80>
ServerName yourdomain.com
ProxyRequests off
<Proxy *>
Order allow,deny
Allow from all
</Proxy>
~~~

=====================================

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


方法來源：從零開始的Laravel RESTful api：<br>
<a href="https://ithelp.ithome.com.tw/articles/10217379">Day 04 : 環境架設 part III -- Composer & Laravel</a><br>
<br>
有權限的開放以及新增一個專屬apache2.conf的教學方式：<br>
<a href="https://medium.com/@rommelhong/%E5%9C%A8ubuntu-18-04-lts%E4%B8%AD%E5%AE%89%E8%A3%9Dphpmyadmin-composer-laravel-6-c65a0c63fa58">在Ubuntu 18.04 LTS中安裝phpMyAdmin + Composer + Laravel 6</a><br>
<br>
chown的教學：<br>
<a href="https://blog.gtwang.org/linux/linux-chown-command-tutorial/">Linux 更改檔案擁有者與群組，chown 指令使用教學與範例</a><br>
<br>


