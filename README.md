# README
[Project_thinking_architecture](#Project_thinking_architecture)<br>
[php](#php)<br>
[Laravel](#Laravel)<br>
[Postman](#Postman)<br>
[ubuntu](#ubuntu)<br>
* [base_sh](#base_sh)<br>
* [apache2](#apache2)<br>
* [apache2_ssl](#apache2_ssl)<br>
* [docker](#docker)<br>

* * [docker_apache2](#docker_apache2)<br>
* * [docker_test](#docker_test)<br>
[vue](#vue)<br>

## Project_thinking_architecture

### 先思考會使用怎樣的元素：
活動或是線上商城的建構為主題。
圖片，產品資料以及價格。
會員註冊以及登入所需資料內容。

### 知道整體的架構有哪些的內容
<img src="https://github.com/iachievedream/demo_code/blob/master/picture/project_thinking_architecture.png" width="50%" height="50%" />

### 思考這些元素該怎樣的搭配
資料庫的設計：
會員資料：
~~~
id,name,password,name_content

CRETE TABLE ''(
    id int(5) not null,
    name varchar(10) not null,
    user varchar(15) not null,
    password varchar(20) not null
);
~~~

產品資料：
id,product,money,product_content

### 思考前端的架構

前端的內容：
註冊頁面，登入頁面，
產品展售頁面，結帳頁面，
留言頁面

排版：

### 思考後端的架構


## php
內有file_upload<br>
php_array_sord：陣列排列練習，<br>
留言板：<br>
__msg_php：使用mysqli。<br>
__msg_PDO：使用PDO。

[回目錄](#README)

## Laravel
<a href="https://github.com/iachievedream/demo_code/tree/master/laravel">laravel</a>


[回目錄](#README)

## Postman
<a href="https://github.com/iachievedream/demo_code/tree/master/Postman">Postman</a>


## ubuntu

<a href="https://github.com/iachievedream/demo_code/tree/master/ubuntu">ubuntu</a>

ubuntu的使用版本為18.04.4，<br>
基本VirtualBox安裝完後，<br>
使用此資料夾中的base.sh安裝基本軟體執行操作，<br>
<br>

[回目錄](#README)

### base_sh
基本ubuntu程式軟體的安裝以及更新，apache2的安裝以及設定，MySQL設定好之後，phpMyAdmin部分則須手動設定。

[回目錄](#README)

### apache2
ubuntu的apache2的vhost設定(default-ssl.conf)。<br>

[回目錄](#README)

### apache2_ssl
幫apache裝https的憑證。<br>
openssl的安裝已經了解如何使用，<br>
ssl的線上憑證後續會嘗試該如何使用<br>

[回目錄](#README)

### docker
基本docker指令介紹，

現在只了解該如何使用，像是VirtualBox一樣的操作ubuntu一般，<br>
雖然我是了解docker是操作軟體，但我還不懂如何操作以及對接port(ex.8000,或是80port等等)<br>

[回目錄](#README)

### docker_apache2
docker的apache2的設定，並使用Dockerfile安裝。
後續執行docker-compose.yml做後續設定。<br>

[回目錄](#README)

### docker_test
docker安裝images，並執行的小範例。

[回目錄](#README)

## vue
<a href="https://github.com/iachievedream/demo_code/tree/master/vue">vue</a>

<a href=""></a><br>
