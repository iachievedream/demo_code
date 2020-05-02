# Laravel_JWT_RESTful

# 目錄
[API](#API)<br>
[RESTful_API](#RESTful_API)<br>
[建立新的Migration](#建立新的Migration)<br>
[新增Model](#新增Model)<br>
[修改_user_Model](#修改_user_Model)<br>
[新增routes](#新增routes)<br>
[建立controller](#建立controller)<br>
[PostController](#PostController)<br>
[手動建立Repositories](#手動建立Repositories)<br>

## API

[回目錄](#目錄)

## RESTful_API


## 建立新的Migration
輸入指令
~~~
php artisan make:migration create_posts_table
~~~
create_posts_table
新增文件為：**2020_04_28_171103_create_posts_table.php**

添加內容
```php
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('user_id');
            $table->string('title');
            $table->string('content');
            $table->timestamps();
        });
    }
```

posts：MySQL建立資料表。<br>
user_id：一對多關聯。<br>
timestamps：新增以及修改日期。

## 新增Model
輸入指令
~~~
php artisan make:model Post
~~~
添加內容
```php
    protected $fillable = [
    	'title','content',
    ];
```

[回目錄](#目錄)

## 修改_user_Model
修改:App\User
```php
    public function posts()
    {
        // return $this->hasMany('App\post');
        return $this->hasOne('App\post');
    }
```

[回目錄](#目錄)


## 新增routes

```php
Route::middleware('auth:api')->group(function () {
    Route::apiResource('post', 'api\PostController');
});
```

[回目錄](#目錄)

## 建立controller
~~~
php artisan make:controller api/PostController --api
~~~

[回目錄](#目錄)

## PostController
App\Http\Controllers\api\PostController

修改此資料的程式碼：<a href="https://github.com/iachievedream/blog-laravel-jwt/blob/master/app/Http/Controllers/api/PostController.php">PostController</a><br>




[回目錄](#目錄)

## 手動建立Repositories
App\Repositories\PostRepository
```php
<?php

namespace App\Repositories;

use App\Post;

class PostRepository
{
    public function index()
    {
        return Post::get();
    }

    public function store(array $data)
    {
        return auth()->user()->posts()->create($data);
    }

    public function find($id)
    {
        return Post::find($id);
    }

    public function update(array $data, $id)
    {
        $post = Post::find($id);
        return $post ? $post->update($data) : false;
    }

    public function delete($id)
    {
        return Post::destroy($id);
    }
}
```


[回目錄](#目錄)

## Q&A
laravel 一對多
Postman
~~~
"message": "Call to undefined method App\\User::posts()",

程式內容 App\Repositories\PostRepository
return auth()->user()->posts()->create($data);
~~~
解決方法為下方連結之內容
[修改_user_Model](#修改_user_Model)

參考資料：<a href="https://blog.csdn.net/li_haijiang/article/details/80523304">模型hasOne、hasMany、belongsTo详解</a><br>




[回目錄](#目錄)


## API參數對照表

[回目錄](#目錄)

<a href=""></a><br>

備註：
資料夾分類(model)：App\Entities\Post;


參考資料：<a href="https://hackmd.io/@8irD0FCGSQqckvMnLpAmzw/Hk8QeMNLz?type=view%EF%BC%89">Laravel 建立 RESTful API</a><br>
