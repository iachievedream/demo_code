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

