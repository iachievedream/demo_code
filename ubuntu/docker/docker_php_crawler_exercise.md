# php_crawler
資料參考:[寫給PHP開發者的30堂網路爬蟲開發](https://ithelp.ithome.com.tw/users/20103975/ironman/2903)

## 執行的docker環境
~~~
mkdir ithome-lab
cd ithom-lab

vim Dockerfile
***************************************
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y unzip curl apt-transport-https apt-utils curl git-core php7.2-cli php7.2-curl
RUN apt-get install -y php7.2-xml php7.2-dom php7.2-xsl php7.2-json php7.2-mbstring php7.2-zip
RUN apt-get install -y libcurl3-openssl-dev

RUN apt-get clean

WORKDIR /root/

RUN curl -sS https://getcomposer.org/installer | php

RUN php ~/composer.phar require guzzlehttp/guzzle:^6.2
RUN php ~/composer.phar require symfony/dom-crawler:^4.3
RUN php ~/composer.phar require symfony/css-selector:^4.3
***************************************
~~~
docker build -t php_crawler .

## 實作
~~~
docker run -it php_crawler bash

使用ls確認文件內容
以及使用參php -v 確認php版本

*在本機內的終端機使用：
使用下方使令可以把本機的程式碼丟入container當中
docker cp lab1-1.php  06f:/root/
注:06f是container的ID編號。


vim lab1-1.php
***************************************
<?php

require_once __DIR__ . '/vendor/autoload.php';

use GuzzleHttp\Client;

$latestNews = 'https://www.nttu.edu.tw/p/503-1000-1009.php';
$client = new Client();
$response = $client->request('GET', $latestNews);

echo (string) $response->getBody();
***************************************

*在container的指令下操作
先確認剛剛的程式是否順利丟入，
在執行下方的指令
php lab1-1.php 
即可成功執行
~~~

## 實作2
~~~
vim lab1-1.php
***************************************
<?php

require_once __DIR__ . '/vendor/autoload.php';

use GuzzleHttp\Client;

$latestNews = 'https://www.nttu.edu.tw/p/503-1000-1009.php';
$client = new Client();
$response = $client->request('GET', $latestNews);

echo (string) $response->getBody();
***************************************
修改為下方程式碼
***************************************
<?php

require_once __DIR__ . '/vendor/autoload.php';

use GuzzleHttp\Client;
use Symfony\Component\DomCrawler\Crawler;

$latestNews = 'https://www.nttu.edu.tw/p/503-1000-1009.php';
$client = new Client();
$response = $client->request('GET', $latestNews);

$latestNewsString = (string)$response->getBody();

$crawler = new Crawler($latestNewsString);

$crawler = $crawler
    ->filter('title')
    ->reduce(function (Crawler $node, $i) {
        echo $node->text();
    });
***************************************
# 丟入container
docker cp lab1-1.php  63e:/root/
# 進入container執行程式碼
php lab1-1.php 
~~~



## 自己製作的images

~~~
docker pull iachievedeam1/php_crawler_test:1.0.0
docker run -it iachievedeam1/php_crawler_test:1.0.0 bash
~~~
