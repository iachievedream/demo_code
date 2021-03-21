# other skill
###### tags:`laravel`
## laravel連接兩個DB的設定
config/database.php
~~~php
        'sqlsrv2' => [
            'driver' => 'sqlsrv',
            'url' => env('DATABASE_URL'),
            'host' => env('DB_HOST', 'localhost'),
            'port' => env('DB_PORT', '1433'),
            'database' => 'EZdev',
            'username' => env('DB_USERNAME', 'forge'),
            'password' => env('DB_PASSWORD', ''),
            'charset' => 'utf8',
            'prefix' => '',
            'prefix_indexes' => true,
        ],
~~~
controller
~~~php
$db = DB::connection("sqlsrv2");
$db->table('Product')->get();
// dd($db);
~~~

記:2021 03 10
