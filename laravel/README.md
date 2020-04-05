## Laravel的基本介紹
<br>
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
routes/web.php[route]-->
app/http/Kernel[Middeware的管理檔案]-->
app/http/Middeware/[Middeware]-->
app/http/Controllers/[Controller]-->[Model] or [view]

//檔案分類：把[Model]多分出兩層出來管理
//[Controller]-->[Service]-->[Repository]-->[Model]
app/http/Repositories/[Repository]-->[Model]
app/http/Services/[Service]-->[Repository]

app/[Model]

resources/views/[view]

//MySQL建立與管理
darrbase/migrations/[migration]
darrbase/seeds/[seeds]

~~~

### laravel的檔案規劃順序

<br>
<br>

#### 若要將 Laravel 內建的伺服器開在其他的網路介面上，可以以使用 --host 與 --port 自行指定傾聽之 IP 位址與連接埠：

##### 指定傾聽之 IP 位址與連接埠

~~~
php artisan serve --host=192.168.122.202 --port=8001
~~~

<a href="https://blog.gtwang.org/linux/ubuntu-linux-laravel-nginx-mariadb-installation-tutorial/">Ubuntu Linux 安裝 Laravel + Nginx + MariaDB 開發環境教學</a><br>
<a href="https://www.howtoing.com/install-laravel-php-framework-on-ubuntu">如何在Ubuntu上安装Laravel PHP Framework</a>：有VirtualHost 的設定<br>
<br>
推薦網頁：<a href="https://blog.tonycube.com/">tonycube</a><br>
<a href=""></a><br>
<a href=""></a><br>


