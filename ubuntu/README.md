# ubuntu

[基本指令](#基本指令)<br>
* [Terminal](##Terminal)<br>
* [編輯文字檔案](##編輯文字檔案)<br>
* [查詢自己電腦IP位置](##查詢自己電腦IP位置)<br>
* [shell](##shell)<br>
* [操作SSH](##操作SSH)<br>
* * [清除系統上被佔用的Port](#清除系統上被佔用的Port)<br>
[防火牆](#防火牆)<br>
[Q&A](#Q&A)<br>
* [mkdir Permission denied](#mkdir_Permission_denied)<br>
* * [chmod](#chmod)<br>

[other_tool](#other_tool)
* [filezilla](##filezilla)


## 基本指令
### Terminal
開啟Terminal，sudo 管理者執行，sudo -i<br>
(終端機:ctrl+alt+T)，sudo passwd
~~~
cd ~    //移動到家目錄
cd ..   //移動到上一層目錄
cd /    //移動到根目錄
pwd     //print work directory，印出目前工作目錄
cd test //examples 移動到目前資料夾下的 examples 資料夾：
cd /etc //直接切換該目录
==================
ls      //列出基本資料夾資料：
ls -la  // -l 列出詳細資料 -a 列出隱藏資料
ls *.js // 列出為 .js 的檔案
==================
創建新資料夾，刪除空的資料夾，刪除內有資料的資料夾
mkdir test   //make directory
rmdir test
rm -r newdirectory
rm examples   //remove file，刪除檔案
==================
touch test.txt //创建一个文件名為test
cp test test2 //把test複製一份成test2
cat index.php //顯示index.php資料
mv index.html test.html//把index.html 更名成test.html
====================================
操作範例:
nano README.md
>>>hello
>Ctrl + X >>enter

mv index.html index1.html//把index.html 更名成index1.html
cp /media/sf_linux/test_sh/appach.sh test.sh

先將字串 TEST 存入 README.md 文件中
echo "TEST" > README.md
cp README.md
~~~
[回目錄](#ubuntu)

### 編輯文字檔案 
nano：在終端機編輯或是新增文字檔：<br>
~~~
nano README.md
~~~
啟動編輯完後可以使用 Ctrl + X 離開，<br>
Ctrl + V 移動到上一頁，<br>
Ctrl + Y 移動到下一頁，<br>
Ctrl + W 搜尋文字內容<br>
<br>
vim需要先安裝<br>
~~~
sudo apt install vim
~~~
vim、vi：在終端機編輯文字檔案，建立(開啟)
~~~
vim a123.c
vi a123.c
~~~
使用 a，i，o 進入編輯，esc 離開編輯模式，

~~~
h: 向左一個字元
l: 向右一個字元
k: 向上一行
j: 向下一行

h_j_k_l
左下上右

dw為編輯刪除鍵
:q 不儲存離開，
:wq 儲存離開，
:q! 強制離開

:(shift+;)
~~~
[回目錄](#ubuntu)

### 操作範例：
輸入文件為a123.c
~~~
vim test.c
~~~
使用 a，i，o 進入編輯，
~~~
#include <stdio.h>
int main()
{
   printf("Hello, World!");
   return 0;
}
~~~
esc 離開編輯模式，<br><br>
儲存為test.c<br>
~~~
:w test.c
~~~
離開<br>
~~~
:q
~~~
編譯:<br>
~~~
gcc test.c
gcc -o hello test.c
~~~
執行:<br>
~~~
./a.out
~~~
[回目錄](#ubuntu)

### 查詢自己電腦IP位置
ubuntu:ip address 或 hostname -I<br>
windows:ipconfig<br>
### shell
sh有些像是widows的批次檔，<br>
也就是一個程式碼的資訊全部打在一起，<br>
一起執行，執行下列程式即可安裝基本的軟體功能。

~~~
sudo nano base.sh
copy base.sh
sudo sh base.sh
~~~

apache2改port方法有在註解裡面<br>
在安裝phpmyadmin要注意，<br>
base.sh上面的註解，<br>
需要手動的輸入才能使用。<br>
[回目錄](#ubuntu)

### 操作SSH

<a href="https://magiclen.org/linux-ssh/">安裝SSH 讓Linux系統可以被遠端操作</a><br>
windows使用putty.exe軟體<br>
IP輸入即可，如：127.0.0.1<br>
<br>
ubuntu則是需 ssh username@hostname<br>

<a href="https://sites.google.com/site/linuxcooltea/home/ubuntu-she-dingssh-yuan-duan-lian-xian-gong-neng">Ubuntu - SSH 的安裝與設定 和 設定SSH遠端連線功能</a>
<br>
[回目錄](#ubuntu)

#### 清除系統上被佔用的Port
~~~
安裝
sudo apt install net-tools
// 查詢 Port:3000 狀態 
sudo netstat -lpn |grep 3000 
在終端機輸入此指令後應該會出現下列格式資訊，其中 14230 為你的 PID。
tcp6  0  0 :::3000 :::* LISTEN 14320/.node.bin
清除 PID，使用 kill + PID 就能將此排程從背景釋放，就能解決 Port 被佔用的問題了！
kill 14230

備註:windows
netstat -ano | findstr 0.0:80

taskkill /PID <PID> /F
taskkill /PID 8572 /F
~~~
[回目錄](#ubuntu)

## 防火牆
關閉防火牆
~~~
sudo ufw edisable
~~~
開啟防火牆
~~~
sudo ufw enable
~~~
增加防火牆的規則，ip以及port的規則
Open incoming TCP port 80 to any source IP address:
~~~
sudo ufw allow from any to any port 80 proto tcp
sudo ufw allow from 127.0.0.1 to any port 443 proto tcp
sudo ufw allow from 127.0.0.1/8 to any port 53 proto udp
sudo ufw allow from any to any port 20,21 proto tcp
~~~
確認防火牆狀態
~~~
sudo ufw status
~~~
刪除防火牆規則
~~~
sudo ufw delete  5
~~~
參考資料:[How to Open/Allow incoming firewall port on Ubuntu 18.04 Bionic Beaver Linux](https://linuxconfig.org/how-to-open-allow-incoming-firewall-port-on-ubuntu-18-04-bionic-beaver-linux)
[回目錄](#ubuntu)

## Q&A
### mkdir_Permission_denied
mkdir(): Permission denied<br>
建立新資料夾並使用下列指令開權限。<br>
<br>
常見的是以apache2為例，建立laravel新資料夾。

~~~
cd /var/www/html/
sudo mkdir laravel
sudo chmod -R 666 laravel
~~~
#### chmod
修改linux權限命令：chmod
用法：chmod XXX filename
~~~
×××（user所有者,group組用戶,others其他用戶）
×=4 讀取的權限 r
×=2 寫入的權限 w
×=1 執行的權限 x
~~~
所以一定要有r權限才能開檔案，如果只有x或w是不能開檔案的
普通的文字檔只要有r權限就可以開檔案，不需要有x權限

## 備註

[回目錄](#ubuntu)


## other_tool

### googl<br>

~~~
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install -y -f ./google-chrome-stable_current_amd64.deb
~~~
[google](https://learningsky.io/ubuntu-install-google-chrome/)

### 截圖工具<br>
ubuntu自帶截圖工具,可以在terminator中呼叫。<br>
~~~
gnome-screenshot -a
~~~

### timeshift-還原點設立

~~~
sudo apt-add-repository -y ppa:teejee2008/ppa

sudo -i
apt update
apt install timeshift

*timeshift
~~~

### [在 Ubuntu 18.04 中新增新酷音輸入法](https://medium.com/@racktar7743/ubuntu-%E5%9C%A8-ubuntu-18-04-%E4%B8%AD%E6%96%B0%E5%A2%9E%E6%96%B0%E9%85%B7%E9%9F%B3%E8%BC%B8%E5%85%A5%E6%B3%95-4aa85782f656)

~~~
sudo apt install ibus-chewing
~~~



### filezilla
~~~
sudo apt-get install vsftpd
sudo /etc/init.d/vsftpd start
sudo /etc/init.d/vsftpd status
~~~
參考:[详解---filezilla连接不上Ubuntu解决办法](https://blog.csdn.net/xiaobai_IT_learn/article/details/89211359)