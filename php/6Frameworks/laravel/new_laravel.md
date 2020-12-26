# new_laravel8

## Installation Via Composer
~~~
composer create-project laravel/laravel laravel8
sudo chmod -R 777 laravel8
sudo chmod -R 777 laravel8/storage

cd laravel8
sudo cp .env.example .env

composer install 
php artisan key:generate
php artisan migrate:refresh


~~~

# new_laravel6
~~~
composer create-project --prefer-dist laravel/laravel blog "5.8.*"

composer create-project --prefer-dist laravel/laravel blog "6.*"

cp .env.example .env

php artisan serve


測試
vendor/phpunit/phpunit/phpunit

php artisan make:test HelloWorldTest

=============
    public function testExample()
    {
        $response = $this->get('/hello-world');

        // 如果連線 `hello-world/`，HTTP Status 應該要顯示 200（成功連線）
        $response->assertStatus(200);
        
        //連線到網頁內，應該要可以看到「Hello world!」這些字
        $response->assertSee('Hello World!');
    }

~~~

