# Laravel_code
###### tags:`code`

文件介紹
<img src="https://github.com/iachievedream/demo_code/blob/master/picture/Laravel/laravel_process.png" width="50%" height="50%" />

hackmd版本說明：[程式介紹](https://hackmd.io/@JvzyHmrLSNCa2tYaMCOzxQ/By9oCCU7L)

[純domo影片](https://www.youtube.com/watch?v=PgSaVoqxjTo&feature=emb_logo)

demo程式碼部分
<iframe width="560" height="315" src="https://www.youtube.com/embed/PgSaVoqxjTo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# 目錄
[domo的程式下載與安裝](#domo的程式下載與安裝)<br>
[安裝Laravel](#安裝Laravel)<br>
[修改.env成自己MySQL的帳密](#修改.env成自己MySQL的帳密)<br>
[執行自動登入的程式指令(ui vue)](#執行自動登入的程式指令)<br>
[建立新的資料庫，使用Migration建立(須按照下方格式)](#建立新的資料庫，使用Migration建立(須按照下方格式))<br>
[在MySQL建立Laravel存取的資料庫，以laravel資料庫為例](#在MySQL建立Laravel存取的資料庫，以laravel資料庫為例)<br>
[在Seeder建立資料表內的假資料](#在Seeder建立資料表內的假資料)<br>
[進階factory](#進階factory)<br>
[修改routes/web.php](#修改routes/web.php)<br>
[新增Model(Article)](#新增Model(Article))<br>
[Middleware](#Middleware)<br>
* [設定Middleware](#設定Middleware)<br>
* [新增Middleware檔案](#新增Middleware檔案)<br>
[新增controller](#新增controller)<br>
* [CRUD](#CRUD)<br>
* * [新增資料](#新增資料)<br>
* * [列出全部資料](#列出全部資料)<br>
* * [顯示單一筆資料](#顯示單一筆資料)<br>
* * [更新資料](#更新資料)<br>
* * [刪除資料](#刪除資料)<br>
*  [進階：建構式以及資料分層(待補)](#進階：建構式以及資料分層(待補))<br>
* [Validator](#Validator)<br>
[新增View](#新增View)<br>

## domo的程式下載與安裝
~~~
git clone https://github.com/iachievedream/blog-laravel.git
cd blog-laravel
composer install 
copy .env.example .env
**set up MySQL of root and password
php artisan key:generate
php artisan migrate:refresh
php artisan db:seed
php artisan serve
~~~

## 安裝Laravel
~~~
composer create-project --prefer-dist laravel/laravel laravel_test "6.*"
~~~

[回目錄](#目錄)

## 修改.env成自己MySQL的帳密
~~~
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
~~~
嘗試laravel是否順利安裝

使用Cmder軟體進入此資料夾執行下列指令
~~~
php artisan serve
~~~
如果出現127.0.0.1:8000，

查看是否此網址進入有無看見laravel畫面

[回目錄](#目錄)

## 執行自動登入的程式指令
~~~
composer require laravel/ui --dev
npm install && npm run dev

php artisan ui vue --auth
php artisan migrate
~~~

[回目錄](#目錄)

## 建立新的資料庫，使用Migration建立(須按照下方格式)
php artisan make:migration create_articlese_table

新增這隻檔案程式，名稱為下：

2020_02_25_025914_create_articles_table.php
~~~
CreateArticlesTable

    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('author');
            $table->string('content');
            $table->timestamps();
        });
    }
~~~

修改這隻檔案符合你登入的專案資訊
~~~
2014_10_12_000000_create_users_table.php
~~~

[回目錄](#目錄)

## 在MySQL建立Laravel存取的資料庫，以laravel資料庫為例

執行Migration匯入mySQL，
~~~
php artisan migrate
~~~
如果之前有執行過則執行此指令
~~~
php artisan migrate:refresh
~~~
清除所有版本的 Migration 並重新執行

[回目錄](#目錄)

## 在Seeder建立資料表內的假資料

修改此檔案資料以填充資料表內資料

database/seeds/DatabaseSeeder.php
~~~

    public function run()
    {
        // $this->call(UsersTableSeeder::class);

        DB::table('users')->insert([
            'name' => Str::random(10),
            'email' => Str::random(10).'@gmail.com',
            'password' => bcrypt('secret'),
            'role' => bcrypt('root'),
        ]);
    }
    
Str::random是現在更新完使令(S需要大寫，否則會有錯誤)

str_random則為舊關鍵字，須使用需執行下列指令
composer require laravel/helpers
以新指令為主較好。
~~~

Q&A:<br>
[After upgrading Laravel from 5.6 to 6.0, Call to undefined str_random() function not working](https://stackoverflow.com/questions/58163406/after-upgrading-laravel-from-5-6-to-6-0-call-to-undefined-str-random-function)

修改完則執行此指令
~~~
php artisan db:seed
~~~

建立root管理員：[實際程式碼](https://github.com/iachievedream/blog-laravel/blob/master/database/seeds/DatabaseSeeder.php)。

[回目錄](#目錄)

## 進階factory
database/factories/UserFactory.php
~~~
$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => '$2y$10$92IXUNpkjO0rOQ',
        'role' => 'root',
    ];
});
~~~
DatabaseSeeder
~~~
    public function run()
    {
        factory(App\User::class,10)->create();    
    }
~~~
建立多個資訊內容：[實際程式碼](https://github.com/iachievedream/blog-laravel/blob/master/database/factories/UserFactory.php)。<br>
需取消20行的註解，前方14~19也需做註解處理，<br>
DatabaseSeeder的程式需使用此行程式內容，新增十個資料內容。
~~~
factory(App\User::class,10)->create();    
~~~

[回目錄](#目錄)

## 修改routes/web.php
新增下方程式
~~~
Auth::routes();
Route::get('/','ArticleController@index');
Route::group(['middleware'=>'auth'],function(){
	Route::get('/create','ArticleController@create');
    Route::post('/store','ArticleController@store');
	Route::group(['middleware'=>'authority'],function(){
		Route::get('/show/edit/{id}/','ArticleController@edit');
		Route::post('/show/edit/update/{id}','ArticleController@update');
		Route::post('/show/delete/{id}/','ArticleController@destroy');
	});
});
~~~

Auth::routes()是Laravel底層的內容，註冊以及登入的功能。
~~~
Route::get('/show/{id}','ArticleController@show');
~~~
前面是使用方法(以get為例)，<br>
第一個'/show/{id}'是網址的進入方式，<br>
第二個'ArticleController@show'<br>
則是Controller的檔案以及後方需執行或進入的函數。<br>
group則是整理route，把相同的歸在一起。<br>
middleware則是中間進入Controller需要進行的驗證機制。<br>

[回目錄](#目錄)

## 新增Model(Article)
~~~
php artisan make:model Article
~~~
會增加此檔案
~~~
<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
class Article extends Model
{
    protected $fillable = [
    	'title', 'author', 'content',
    ];
}
~~~
程式fillable的含意是可以對此欄資料進行變更，

[回目錄](#目錄)

## Middleware
### 設定Middleware
修改此路徑程式碼App\Http\Kernel
~~~
protected $routeMiddleware = [

    'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
    'authority' => \App\http\Middleware\Authority::class,
    //添加地方
];
~~~

[回目錄](#目錄)

### 新增Middleware檔案
下指令新增Middleware檔案
~~~
php artisan make:middleware CheckAge
~~~
撰寫程式驗證機制，引入那些資料做對照，<br>
及在哪個時候要跳至哪個route的controller,<br>
多數狀況為認證成功以及失敗。
~~~
    public function handle($request, Closure $next)
    {
        //網址回傳ID(使用指令，把route上面的id傳至此middleware)
        $id = $request->route('id');
        //文章作者
        $article = Article::find($id);
        $author = $article->author;
        //登入使用者
        $user = Auth::user()->name;
        //管理員判斷
        $role = Auth::user()->role;
        if ($author == $user || $role == "admin") {
            return $next($request);    
            //驗證成功，進入下一個controller內
        }
        return redirect('/');          
        //驗證失敗，跳回/去(須查看route跳至哪一controller)
    }
~~~

[回目錄](#目錄)

## 新增controller
下指令新增controller檔案
~~~
php artisan make:controller ArticleController
~~~
這個檔案是最多內容的部分<br>
簡要介紹當中內容，<br>
詳細的則在[此路徑中](https://github.com/iachievedream/blog-laravel/blob/master/app/Http/Controllers/ArticleController.php)

### CRUD
#### 新增資料
~~~
Article::create([
    'title' => $data['title'],
    'content' => $data['content'],
    'author' => Auth::user()->name,
]);
~~~

[回目錄](#目錄)

#### 列出全部資料
~~~
public function index()
{
    Article::all();
    return view('article.index')->with('articles', $article);
}
~~~
with的解釋為

[回目錄](#目錄)

#### 顯示單一筆資料
~~~
Article::find($id);
~~~

[回目錄](#目錄)

#### 更新資料
~~~
Article::find($id)->update([
	'title' => $data['title'],
	'content' => $data['content'],
]);
~~~

[回目錄](#目錄)

#### 刪除資料
~~~
Article::find($id)->delete();
~~~

[回目錄](#目錄)

### 進階：建構式以及資料分層(待補)
~~~
protected $articleService;

public function __construct(ArticleService $articleService)
{
    $this->articleService = $articleService;
}
~~~
__construct為建構式，也就是在進入程式碼後立即執行的程式內容，<br>
後方括號的部分是將第一行程式碼進行宣告且放入$articleService變數當中。<br>
<br>
$this則是這一整個class當中指什麼函數，也就是進入哪一個函數，
上方的程式範例為此支class當中的articleService這個函數，

[回目錄](#目錄)

### Validator
~~~
$article = Validator::make($request->all(), [
    'title' => 'required|max:25',
    'content' => 'required|max:255',
]);
~~~

[回目錄](#目錄)

## 新增View
新增主頁面：index.blade.php<br>
新增新增頁：create.blade.php<br>
新增顯示頁：show.blade.php.<br>
新增編輯頁：edit.blade.php<br>
詳細程式則在[此路徑中](https://github.com/iachievedream/blog-laravel/tree/master/resources/views/article)



