# Q&A

## php-zip
Failed to download symfony/polyfill-iconv from dist: The zip extension and unzip command are both missing, skipping.

[https://stackoverflow.com/questions/41274829/php-error-the-zip-extension-and-unzip-command-are-both-missing-skipping](https://stackoverflow.com/questions/41274829/php-error-the-zip-extension-and-unzip-command-are-both-missing-skipping)

解決方法

apt install zip unzip php-zip

## extension=fileinfo
Problem 1
- league/flysystem 1.1.3 requires ext-fileinfo * -> it is missing from your system. Install or enable PHP's fileinfo extension.
- laravel/framework v6.20.8 requires league/flysystem ^1.1 -> satisfiable by league/flysystem[1.1.3].
- laravel/framework is locked to version v6.20.8 and an update of this package was not requested.

To enable extensions, verify that they are enabled in your .ini files:
- C:\AppServ\php7\php.ini
You can also run `php --ini` inside terminal to see which files are used by PHP in CLI mode.

打開php.int的註解;
extension=fileinfo


## node
更新

~~~
sudo apt-get update
sudo apt-get install curl
curl --version
curl -sL [https://deb.nodesource.com/setup_10.x](https://deb.nodesource.com/setup_10.x) | sudo -E bash -
sudo apt-get install -y nodejs
node -v
~~~

[https://oranwind.org/post-post-11/](https://oranwind.org/post-post-11/)


## line login

🧨 Allowed memory size of 134217728 bytes exhausted (tried to allocate 60821504 bytes)

要修正這個問題可以調整 php.ini 裡的 memory_limit


memory_limit = 258M

appserv
406行:memory_limit = 258M