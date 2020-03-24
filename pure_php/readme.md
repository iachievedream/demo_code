簡易留言板:
原先使用mysqli，後續功能做出後改由PDO的方式。

檔案內容:
add.html:新增文章的表單。
db.php:資料庫連接的php檔。
deal.php:新增及刪除的sql程式瑪執行處。
index.php：文章列表處，可以顯示所有文章。
password.php:MySQL的相關資料，不上傳的資料內容。
以下為此檔案範例：
~~~
<?php
$host = 'host';
$dbname = 'dbname';
$user = 'user';
$pass = 'pass';
~~~

massage_board.sql：建立在MySQL的資料庫內容，須先建立資料庫，後會經由下面建立新的資料表內容。

~~~
CREATE TABLE `message_board` (
  `id` int(1) NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `update_time` timestamp NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `message_board` (`id`, `name`, `msg`, `update_time`) VALUES
(1, 'ab', 'hell',now());
~~~

參考資料:
https://ianchen.thisistap.com/php-message/
https://ianchen.thisistap.com/php-login/