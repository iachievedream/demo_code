### Laravel_login

<a href="https://medium.com/yulinchou/%E5%88%A9%E7%94%A8-laravel-%E5%AF%A6%E4%BD%9C-line-%E7%99%BB%E5%85%A5-%E4%B8%A6%E5%8F%96%E5%BE%97%E4%BD%BF%E7%94%A8%E8%80%85%E7%9A%84-id-%E5%8F%8A-%E8%B3%87%E6%96%99-f95784ca9595">利用 Laravel 實作 Line 登入，並取得使用者的 ID 及 資料</a><br>
安裝laravel

~~~
composer create-project --prefer-dist laravel/laravel login-demo "6.*"
~~~

第一步：編輯我們的 .env 檔案

~~~
LINE_CHANNEL_ID=這邊填寫你的 Channel ID
LINE_SECRET=這邊填寫你的 Channel Secret
~~~

第二步：來在 config 資料夾底下新增一個 line.php，內容如下

~~~
<?php

return [
    'channel_id' => env('LINE_CHANNEL_ID'),
    'secret' => env('LINE_SECRET'),
    'authorize_base_url' => 'https://access.line.me/oauth2/v2.1/authorize',
    'get_token_url' => 'https://api.line.me/oauth2/v2.1/token',
    'get_user_profile_url' => 'https://api.line.me/v2/profile',
];
~~~

第三步：安裝 Guzzle 套件

~~~
composer require guzzlehttp/guzzle:~6.0
~~~






