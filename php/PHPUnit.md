# phpunit

## install
~~~
composer require phpunit/phpunit
~~~

ex.
~~~html
<?php
namespace MyLib;
 
class SayHi {
    public function main()
    {
        return "Hi";
    }
}

~~~

~~~ 
<?php
use MyLib\SayHi;
use PHPUnit\Framework\TestCase;
 
class CaryTest extends TestCase {
    public function testSayHi()
    {
        $sayHi = new SayHi();
        $this->assertEquals($sayHi->main(), "Hi");
    }
}
~~~

cmder
~~~
Windows:
vendor\bin\phpunit tests\CaryTest.php
 
Linux: 
vendor/bin/phpunit tests/CaryTest.php

如果有多筆 test 的話，可以運行到資料夾，會一次跑所有的測試
vendor/bin/phpunit tests/CaryTest.php
~~~

參考:[php – phpUnit 快速教學](https://jsnwork.kiiuo.com/archives/3119/php-phpunit-%E5%BF%AB%E9%80%9F%E6%95%99%E5%AD%B8/)



[phpunit-in-action 實作練習](https://jaceju-books.gitbooks.io/phpunit-in-action/content/chapters/05/2.html)