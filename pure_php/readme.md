簡易留言板:<br>
使用mysqli，後續功能則是改由PDO的方式。<br>
<br>
檔案內容:<br>
add.html:新增文章的表單。<br>
db.php:資料庫連接的php檔。<br>
deal.php:新增及刪除的sql程式瑪執行處。<br>
index.php：文章列表處，可以顯示所有文章。<br>
password.php:MySQL的相關資料，不上傳的資料內容。<br>
以下為此檔案範例：<br>
~~~
<?php
$servername = 'host';
$dbname = 'dbname';
$username = 'user';
$password = 'pass';
~~~
<br>
massage_board.sql：建立在MySQL的資料庫內容，須先建立資料庫，後會經由下面建立新的資料表內容。<br>

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
<br>
參考資料:<br>
https://ianchen.thisistap.com/php-message/<br>
https://ianchen.thisistap.com/php-login/