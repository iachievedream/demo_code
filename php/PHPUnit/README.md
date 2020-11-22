# phpunit

## phpunit.phar
下載 https://phar.phpunit.de/phpunit.phar ，並將檔案保存到 C:\PHP\phpunit.phar 。
~~~
C:\PHP> echo @php "%~dp0phpunit.phar" %* > phpunit.cmd
C:\> phpunit --version
PHPUnit 4.2.5 by Sebastian Bergmann.
~~~

## install
~~~
composer require phpunit/phpunit
composer require --dev phpunit/phpunit ^7
~~~
來源:[phpunit](https://phpunit.de/getting-started/phpunit-7.html)

## 程式內容
~~~html
<?php
class CartTest extends \PHPUnit_Framework_TestCase
====================下方才可以=====================
class CartTest extends \PHPUnit\Framework\TestCase
~~~
成功:參考範例[PHP 單元測試 第一次進行測試](https://wadehuanglearning.blogspot.com/2018/03/php.html)
[PHPUnit](https://blog.johnsonlu.org/phpunit/)

## 執行
注意執行目錄
~~~
..\vendor\bin\phpunit ExampleTest.php
vendor\bin\phpunit ExampleTest.php

..\vendor\bin\phpunit IndexTest.php
vendor\bin\phpunit IndexTest\test\IndexTest.php

..\vendor\bin\phpunit CartTest.php
vendor\bin\phpunit CartTest\test\CartTest.php

..\vendor\bin\phpunit MathTest.php
vendor\bin\phpunit MathTest\test\MathTest.php

..\vendor\bin\phpunit ProductTest.php
vendor\bin\phpunit ProductTest\test\ProductTest.php
~~~
cmder備註
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

待測試:

http://justericgg.logdown.com/posts/572967