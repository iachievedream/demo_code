# README
基本技巧筆記：
<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_base.md">laravel_base</a><br>
laravel程式撰寫過程：
<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_code.md">laravel_code</a>
* 留言板的laravel程式碼，有詳細介紹內容：
* <a href="https://github.com/iachievedream/blog-laravel">blog-laravel</a>
* <a href="https://www.youtube.com/watch?time_continue=13&v=PgSaVoqxjTo&feature=emb_logo">domo影片(youtube)</a>

JWT的介紹以及實際的操作：
<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_JWT.md">laravel_JWT</a><br>
JWT 套用後，使用RESTful的過程：
<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_JWT_RESTful.md">laravel_JWT_RESTful</a>
* 使用JWT的留言板程式碼：
* <a href="https://github.com/iachievedream/blog-laravel-jwt">blog-laravel-jwt</a>
* <a href="https://www.youtube.com/watch?v=yn9q4NXd7BM&list=PLfBT9P5LG1z8n61SkoeK5nxIdS83LwZi3&index=2&t=156s">domo影片(youtube)</a>

Postman範例資料以及ajax串表單：
<a href="https://github.com/iachievedream/demo_code/tree/master/Postman">Postman</a><br>


本機的網址內容(AWS的免費額度已滿，所以使用本機serve)：<br>
<a href="http://virtualboxubuntu1.fuwork.xyz:81/">http://virtualboxubuntu1.fuwork.xyz:81/</a><br>
<a href="https://virtualboxubuntu1.fuwork.xyz/">https://virtualboxubuntu1.fuwork.xyz/</a><br>


# 目錄
[Laravel的基本介紹](#Laravel的基本介紹)<br>
[laravel框架的基本認識](#laravel框架的基本認識)<br>
[laravel的檔案規劃順序](#laravel的檔案規劃順序)<br>
[laravel指定port與IP](#laravel指定port與IP)<br>
[clone下來的安裝指令](#clone下來的安裝指令)<br>
[推薦網頁](#推薦網頁)<br>

[待歸納整理內容](#待歸納整理內容)<br>


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

[回目錄](#目錄)

## laravel框架的基本認識

~~~
.env設定檔(MySQL的帳密等)
[route]-->[Middleware]-->[Controller]-->[Service]-->[Repository]-->[Model]

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

### laravel的檔案規劃順序


### laravel指定port與IP

~~~
php artisan serve --host=127.0.0.1 --port=8001

80port轉成其他port(host需要換成外網ID),再使用
sudo php artisan serve --host=127.0.0.1 --port=80
~~~

<a href="https://blog.gtwang.org/linux/ubuntu-linux-laravel-nginx-mariadb-installation-tutorial/">Ubuntu Linux 安裝 Laravel + Nginx + MariaDB 開發環境教學</a><br>
<a href="https://www.howtoing.com/install-laravel-php-framework-on-ubuntu">如何在Ubuntu上安装Laravel PHP Framework</a>：有VirtualHost 的設定<br>

# clone下來的安裝指令
~~~
git clone https://~~
composer install 
copy .env.example .env
**set up MySQL of root and password
php artisan key:generate
//如果有JWT(須執行下行指令)
php artisan jwt:secret
php artisan migrate:refresh
php artisan serve
~~~

# 推薦網頁
<a href="https://blog.tonycube.com/">tonycube</a><br>

# 待歸納整理內容
<a href="http://blog.tonycube.com/2015/01/laravel-11-route.html">Laravel 學習筆記(11) - Route 進階</a><br>

資源控制器(Resource controllers)

php artisan routes

Route::resource('post', 'HomeController');

Route::get('post', array('uses' => 'HomeController@index', 'as' => 'post.home'));


[回目錄](#目錄)
