
sh有些像是widows的批次檔，也就是一個程式碼的資訊全部打在一起，一起執行。<br>

~~~
sudo nano base.sh
copy base.sh
sudo sh base.sh
~~~

在安裝phpmyadmin要注意，<br>
base.sh上面的註解，<br>
需要手動的輸入才能使用。<br>
<br>

### Q&A
Q&A：mkdir(): Permission denied<br>
建立新資料夾並使用下列指令開權限。<br>
<br>
常見的是以apache2為例，建立laravel資料夾。

~~~
cd /var/www/html/
sudo mkdir laravel
sudo chmod -R 666 your_dir

修改linux權限命令：chmod
用法：chmod XXX filename

×××（user所有者,group組用戶,others其他用戶）
×=4 讀取的權限 r
×=2 寫入的權限 w
×=1 執行的權限 x

所以一定要有r權限才能開檔案，如果只有x或w是不能開檔案的
普通的文字檔只要有r權限就可以開檔案，不需要有x權限
~~~

