# README
基本技巧筆記：<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_base.md">Laravel_base</a><br>
laravel程式撰寫過程：<a href="https://github.com/iachievedream/demo_code/blob/master/laravellaravel_code.md">Laravel_code</a><br>
JWT 套用過程:<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_JWT.md">Laravel_JWT</a><br>
JWT 套用後，使用RESTful的過程:<a href="https://github.com/iachievedream/demo_code/blob/master/laravel/laravel_JWT_RESTful.md">Laravel_JWT_RESTful</a><br>


# 目錄
[Laravel的基本介紹](#Laravel的基本介紹)<br>
[laravel框架的基本認識](#laravel框架的基本認識)<br>
[laravel的檔案規劃順序](#laravel的檔案規劃順序)<br>
[laravel指定port與IP](#laravel指定port與IP)<br>
[clone下來的安裝指令](#clone下來的安裝指令)<br>
[推薦網頁](#推薦網頁)<br>

## Laravel的基本介紹
部落格練習，<br>
<br>
先想架構，<br>
先有新增文章，<br>
再有文章列表，<br>
更新文章<br>
最後則是刪除文章。<br>
<br>
後面加入會員權限，<br>
先由註冊，<br>
再有登入，<br>
後續是對於文章的權限，<br>
對於文章作者以及部落格管理員，<br>
才有權限做文章的修改以及刪除。<br>
<br>
後續在做API的JWT版本。<br>

### laravel框架的基本認識

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
