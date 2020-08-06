### Laravel_login

<a href="https://medium.com/yulinchou/%E5%88%A9%E7%94%A8-laravel-%E5%AF%A6%E4%BD%9C-line-%E7%99%BB%E5%85%A5-%E4%B8%A6%E5%8F%96%E5%BE%97%E4%BD%BF%E7%94%A8%E8%80%85%E7%9A%84-id-%E5%8F%8A-%E8%B3%87%E6%96%99-f95784ca9595">利用 Laravel 實作 Line 登入，並取得使用者的 ID 及 資料</a><br>
安裝laravel

~~~
composer create-project --prefer-dist laravel/laravel line_login "6.*"
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

建立路由
打開我們的 routes/web.php
貼上以下路由程式碼

~~~
Route::get('/line', 'LoginController@pageLine');
Route::get('/callback/login', 'LoginController@lineLoginCallBack');
~~~

建立 View
在 resources/views 底下建立一個 line.blade.php

~~~
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Line Login Demo</title>

    <!-- Bootstrap core CSS -->
    <link href="https://bootstrap.hexschool.com/docs/4.2/dist/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://bootstrap.hexschool.com/docs/4.2/examples/floating-labels/floating-labels.css" rel="stylesheet">
</head>
<body>
<form class="form-signin">
    <div class="text-center mb-4">
        <a href="{{ $url }}"><img class="mb-4" src="/images/line/2x/32dp/btn_login_base.png"></a>
    </div>
    <p class="mt-5 mb-3 text-muted text-center">Yulin &copy; 2019</p>
</form>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
~~~

創建一個 Controller ，可依照下面指令
php artisan make:controller LoginController

~~~
<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Services\LineService;

class LoginController extends Controller
{
    protected $lineService;

    public function __construct(LineService $lineService)
    {
        $this->lineService = $lineService;
    }

    public function pageLine()
    {
        $url = $this->lineService->getLoginBaseUrl();
        return view('line')->with('url', $url);
    }

    public function lineLoginCallBack(Request $request)
    {
        try {
            $error = $request->input('error', false);
            if ($error) {
                throw new Exception($request->all());
            }
            $code = $request->input('code', '');
            $response = $this->lineService->getLineToken($code);
            $user_profile = $this->lineService->getUserProfile($response['access_token']);
            echo "<pre>"; print_r($user_profile); echo "</pre>";
        } catch (Exception $ex) {
            Log::error($ex);
        }
    }
}
~~~

5. 在 Services 資料夾底下建立一個 LineService.php，並貼上下方程式碼

~~~

<?php

namespace App\Services;

use GuzzleHttp\Client;

class LineService
{
    public function getLoginBaseUrl()
    {
        // 組成 Line Login Url
        $url = config('line.authorize_base_url') . '?';
        $url .= 'response_type=code';
        $url .= '&client_id=' . config('line.channel_id');
        $url .= '&redirect_uri=' . config('app.url') . '/callback/login';
        $url .= '&state=test'; // 暫時固定方便測試
        $url .= '&scope=openid%20profile';

        return $url;
    }

    public function getLineToken($code)
    {
        $client = new Client();
        $response = $client->request('POST', config('line.get_token_url'), [
            'form_params' => [
                'grant_type' => 'authorization_code',
                'code' => $code,
                'redirect_uri' => config('app.url') . '/callback/login',
                'client_id' => config('line.channel_id'),
                'client_secret' => config('line.secret')
            ]
        ]);
        return json_decode($response->getBody()->getContents(), true);
    }

    public function getUserProfile($token)
    {
        $client = new Client();
        $headers = [
            'Authorization' => 'Bearer ' . $token,
            'Accept'        => 'application/json',
        ];
        $response = $client->request('GET', config('line.get_user_profile_url'), [
            'headers' => $headers
        ]);
        return json_decode($response->getBody()->getContents(), true);
    }
}

~~~


大坑

Callback URL 
http://127.0.0.1:8000/callback/login
http://127.0.0.1:8000/line
http://127.0.0.1:81/secret/line_login/Line_Login.html
http://localhost/callback/login
http://localhost/line


localhost
127.0.0.1:8000
有差異

redirect_uri