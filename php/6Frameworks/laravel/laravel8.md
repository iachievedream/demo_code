# Laravel8

## Article

~~~
php artisan make:migration add_article_table --table=animals

php artisan make:model Article -mf 
( -f : 建立該 Model 的 "factory", -m : 建立該 Model 的 "migration file" )

php artisan make:model User --migration
(建立migration file)

php artisan make:controller ArticleController --resource --model=Article
(restapi model)
==================================================================
Auth::routes();
Route::get('/',[App\Http\Controllers\ArticleController::class, 'index']);
Route::group(['middleware'=>'auth'],Articlenction(){
    Route::get('/create',[App\Http\Controllers\ArticleController::class, 'create']);
    Route::post('/store',[App\Http\Controllers\ArticleController::class, 'store']);
    Route::group(['middleware'=>'authority'],Articlenction(){
        Route::get('/show/edit/{id}/',[App\Http\Controllers\ArticleController::class, 'edit']);
        Route::post('/show/edit/update/{id}',[App\Http\Controllers\ArticleController::class, 'update']);
        Route::post('/show/delete/{id}/',[App\Http\Controllers\ArticleController::class, 'destroy']);
    });
});
~~~

## Database

### Migration

~~~
php artisan make:migration create_articlese_table
==================================================================
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

### Seeding

### factory

## routes

~~~
Auth::routes();
Route::get('/',[App\Http\Controllers\ArticleController::class, 'index']);
Route::group(['middleware'=>'auth'],function(){
    Route::get('/create',[App\Http\Controllers\ArticleController::class, 'create']);
    Route::post('/store',[App\Http\Controllers\ArticleController::class, 'store']);
    Route::group(['middleware'=>'authority'],function(){
        Route::get('/show/edit/{id}/',[App\Http\Controllers\ArticleController::class, 'edit']);
        Route::post('/show/edit/update/{id}',[App\Http\Controllers\ArticleController::class, 'update']);
        Route::post('/show/delete/{id}/',[App\Http\Controllers\ArticleController::class, 'destroy']);
    });
});

Route::get('/customer/shopping_mall', function () {
    return view('customer/shopping_mall');
})->name('customer');
~~~

## Middleware

~~~
php artisan make:middleware Authority
==================================================================
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

修改此路徑程式碼App\Http\Kernel

protected $routeMiddleware = [

    'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
    'authority' => \App\http\Middleware\Authority::class,
    //添加地方
];
~~~

## Model

~~~
php artisan make:model Article
==================================================================
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

## Controllers

~~~
php artisan make:controller ArticleController

php artisan make:controller ArticleController --resource --model=User
~~~


## View

~~~

~~~


## Api/v1/ArticleController

~~~
php artisan make:controller Api/v1/ArticleController --resource --model=Article
==================================================================
routes/api.php
=================================
Auth::routes();
Route::get('/',[App\Http\Controllers\Api\v1\ArticleController::class, 'index']);
Route::group(['middleware'=>'auth'],function(){
    Route::get('/create',[App\Http\Controllers\Api\v1\ArticleController::class, 'create']);
    Route::post('/store',[App\Http\Controllers\Api\v1\ArticleController::class, 'store']);
    Route::group(['middleware'=>'authority'],function(){
        Route::get('/show/edit/{id}/',[App\Http\Controllers\Api\v1\ArticleController::class, 'edit']);
        Route::post('/show/edit/update/{id}',[App\Http\Controllers\Api\v1\ArticleController::class, 'update']);
        Route::post('/show/delete/{id}/',[App\Http\Controllers\Api\v1\ArticleController::class, 'destroy']);
    });
});
~~~

## admin

~~~
php artisan make:controller AdminController --resource --model=Article
==================================================================
routes/web.php
=================================
Route::get('/',[App\Http\Controllers\AdminController::class, 'index']);
Route::group(['middleware'=>'auth'],function(){
    Route::get('/create',[App\Http\Controllers\AdminController::class, 'create']);
    Route::post('/store',[App\Http\Controllers\AdminController::class, 'store']);
    Route::group(['middleware'=>'authority'],function(){
        Route::get('/show/edit/{id}/',[App\Http\Controllers\AdminController::class, 'edit']);
        Route::post('/show/edit/update/{id}',[App\Http\Controllers\AdminController::class, 'update']);
        Route::post('/show/delete/{id}/',[App\Http\Controllers\AdminController::class, 'destroy']);
    });
});
~~~

## Product

~~~
php artisan make:migration create_product_table
==================================================================
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('description');
            $table->float('price');
            $table->string('imageurl');
            $table->string('file_id');
            $table->string('author');
            $table->timestamps();
        });
    }


routes/web.php
==================================================================
Route::get('/admin/product/new', function () {
    $user = auth()->user();
    if ($user->admin ==true){
        return redirect()->action('ProductController@newProduct');
    }else{
        return redirect('customer/shopping_mall');
    }
});

Route::get('/admin/product/new/test', 'ProductController@newproduct');
==================================================================

php artisan make:controller ProductController --resource --model=Product
==================================================================

    protected $fillable = [
        'id', 'name', 'description','price','imageurl','file_id','author',
    ];



~~~