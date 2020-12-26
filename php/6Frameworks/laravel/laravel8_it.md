# Laravel8
###### tags:`code`


## Laravel 實戰經驗分享 - Day6 初探 Laravel - Migration

~~~
php artisan make:migration create_animals_table --create=animals

php artisan make:migration add_species_column_to_table --table=animals

# 或是
php artisan make:migration alter_sex_column_of_table --table=animals

============================
CreateAnimalsTable
    public function up()
    {
        Schema::create('animals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sex');
            $table->integer('number');
            $table->timestamps();
        });
    }
    public function down()
    {
        Schema::dropIfExists('animals');
    }
============================
AddSpeciesColumnToTable
    public function up()
    {
        Schema::table('animals', function (Blueprint $table) {
            $table->string('species')->nullable();
        });
    }
    public function down()
    {
        Schema::table('animals', function (Blueprint $table) {
            $table->dropColumn('species');
        });
    }
============================
AlterSexColumnOfTable
    public function up()
    {
        Schema::table('animals', function (Blueprint $table) {
            $table->string('sex')->nullable()->change();
        });
    }

    public function down()
    {
        Schema::table('animals', function (Blueprint $table) {
            $table->string('sex')->nullable(false)->change();
        });
    }
=======================
資料表的 create (建立)以及 rollback (回滾)

php artisan migrate
php artisan migrate:rollback
~~~


## Laravel 實戰經驗分享 - Day8 初探 Laravel - Route 路由設定

~~~
Route::get('/', function () {
    return view('welcome');
});

Route::get('/welcome', function () {
    return view('welcome');
});

Route::get('/product', 'ProductController@list');
Route::get('product', [ProductController::class, 'list'])
Route::get('product', [ProductController::class, 'list'])->name('product');

// 取得 URLs
$url = route('product');

// 導向
return redirect()->route('product');
~~~

## Laravel 實戰經驗分享 - Day9 初探 Laravel - Controller 控制器
~~~
php artisan make:controller UserController --resource --model=User

UserController
    public function show($id)
    {
        return view('user.profile', ['user' => User::findOrFail($id)]);
    }

routes/web.php

Route::get('user/{id}', [UserController::class, 'show']);
Route::get('user/{id}', 'UserController@show');

加上 Middleware
Route::get('profile', [UserController::class, 'show'])->middleware('auth');
======================================================
class UserController extends Controller
{
    /**
     * Instantiate a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('log')->only('index');
        $this->middleware('subscribed')->except('store');
    }
}

~~~
## Laravel 實戰經驗分享 - Day10 初探 Laravel - Model 模型以及 Eloquent ORM (上)

~~~
php artisan make:model User

php artisan make:model User --migration
# or
php artisan make:model User -m
======================================================

app/Models/User.php

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $fillable = ['name'];
}

************

$fillable 若是你要在 Controller 內操作的欄位，就放到這個變數內。
$hidden 有時候一些比較需要隱藏的欄位例如密碼，就會放在這個變數內。
$timestamps Laravel 的 Migration 預設幫你建好 created_at、updated_at 兩個欄位，在你進行資料的新增以及修改時也會自動寫進這兩個欄位，如果你不需要的話，就可以將這個變數改為 false。


ORM 常用語法

$users = User::all();

foreach ($users as $user){
    echo $user->name;
}

$user = User::find(1);
// 取得特定欄位資料
echo $user->name;

資料庫查詢

// where('欄位','查詢')
$user = User::where('name', 'Leo')->first();
// or
$user = User::firstWhere('name', 'Leo');
// 需要錯誤處理的狀況
$user = User::where('name', 'Leo')->firstOrFail();


~~~

## Laravel 實戰經驗分享 - Day15 在 Laravel 上實現 RESTful API 設計

php artisan make:model Article -m


~~~
Schema::create('articles', function (Blueprint $table) {
    $table->increments('id');
    $table->string('title',100);
    $table->text('body');
    $table->timestamps();
});
~~~

/App/Models/Article.php
~~~
protected $fillable = ['title','body'];
~~~
php artisan migrate

####  透過 Database Seeder 建立假資料
php artisan make:seeder ArticlesTableSeeder
~~~
public function run(){
    factory(\App\Article::class, 30)->create();
}
~~~

php artisan make:resource ArticleResource

~~~
Route::get('articles', [ArticleController::class, 'index']);
Route::get('articles/{id}', [ArticleController::class, 'show']);
Route::post('articles', [ArticleController::class, 'store']);
Route::put('articles/{id}', [ArticleController::class, 'update']);
Route::delete('articles/{id}', [ArticleController::class, 'destroy']);
~~~

php artisan make:controller ArticleController --resource
