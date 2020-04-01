### 基本指令
查詢自己電腦IP位置：<br>
ip address 或 hostname -I<br>
<br>
sh有些像是widows的批次檔，<br>
也就是一個程式碼的資訊全部打在一起，一起執行，
執行下列程式即可安裝基本的軟體功能。

~~~
sudo nano base.sh
copy base.sh
sudo sh base.sh
~~~

在安裝phpmyadmin要注意，<br>
base.sh上面的註解，<br>
需要手動的輸入才能使用。<br>
<br>

### 安裝SSH

~~~
sudo apt-get install ssh

//查看SSH有無被開啟
netstat -a | grep ssh
成功會顯示：tcp 0 0 *:ssh *:* LISTEN

sudo service ssh start
sudo service ssh stop
sudo service ssh restart

//用SSH連線到別台裝置
ssh username@hostname
ex. ssh ubuntu@127.0.0.1

//登出
logout
~~~

<a href="https://magiclen.org/linux-ssh/">安裝SSH 讓Linux系統可以被遠端操作</a><br>
windows使用putty.exe軟體
IP輸入即可，如：127.0.0.1

<a href="https://sites.google.com/site/linuxcooltea/home/ubuntu-she-dingssh-yuan-duan-lian-xian-gong-neng">Ubuntu - SSH 的安裝與設定 和 設定SSH遠端連線功能</a><br>

### Q&A
Q&A：mkdir(): Permission denied<br>
建立新資料夾並使用下列指令開權限。<br>
<br>
常見的是以apache2為例，建立laravel新資料夾。

~~~
cd /var/www/html/
sudo mkdir laravel
sudo chmod -R 666 laravel

修改linux權限命令：chmod
用法：chmod XXX filename

×××（user所有者,group組用戶,others其他用戶）
×=4 讀取的權限 r
×=2 寫入的權限 w
×=1 執行的權限 x

所以一定要有r權限才能開檔案，如果只有x或w是不能開檔案的
普通的文字檔只要有r權限就可以開檔案，不需要有x權限
~~~

<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
<a href=""></a><br>
