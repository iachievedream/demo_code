# Composer 

使用 Composer 管理 PHP 套件




http://blog.tonycube.com/2016/12/composer-php.html


Ubuntu環境下，如何手動安裝Composer

http://foreachsam.github.io/blog-lang-php/article/read/composer/install/

~~~
$ sudo apt-get install php5-cli

$ curl -sS https://getcomposer.org/installer | php

~~~




Q&A

- Installation request for laravel/framework v6.16.0 -> satisfiable by laravel/framework[v6.16.0]. - laravel/framework v6.16.0 requires ext-mbstring * -> the requested PHP extension mbstring is missing from your system.


A

https://askubuntu.com/questions/1064634/unable-to-install-php-mbstring



sudo apt-get install php-gd php-xml php7.2-mbstring


來源:
https://stackoverflow.com/questions/36979019/getting-error-while-updating-composer

composer install --ignore-platform-reqs

