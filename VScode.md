## VScode的基本教學
open in browser:預覽網頁，a/t + B<br>
<br>
快速排版：Shift + Alt + F<br>
<br>
git：<br>
我們以剛剛的同一個專案為例，<br>
如要觀看整個 git log，請先按下 ctrl + shift + P 叫出命令選擇區，<br>
可以把它視為 VS Code 的 command line，許多擴充套件也須經由這個地方下指令。<br>
<br>
Git: View History (git log)<br>
<a href="https://blog.tonycube.com/2018/11/visual-studio-code.html">Visual Studio Code 極速上手指南</a><br>
<a href=""></a><br>

sudo code --user-data-dir="~/.vscode-root"

Visual Studio Code多行同时输入
Visual Studio Code同时选中多行输入，Alt + Shift + 鼠标左键选取多行

<img src="https://github.com/iachievedream/demo_code/blob/master/picture/VScode_Mouse__Wheel_Zoom.png" width="50%" height="50%" />

## xdebug vscode linux
~~~
sudo /etc/init.d/apache2 restart
[ ok ] Restarting apache2 (via systemctl): apache2.service.

<?php phpinfo() ?>

https://blog.csdn.net/weixin_33670713/article/details/91439725

which php

在vsCode 的文件-》首选项-》设置中，打开 setting.json 文件，添加以下语句
"php.validate.executablePath": "/usr/bin/php"
~~~

## VScode 套件
~~~
Format HTML in PHP
Git History
HTML CSS Support
HTML Snippets
Markdown All in One
Markdown PDF
open in browser
open in browser
PHPUnit
Prettier - Code formatter
Preview on Web Server
~~~

## vscode設置讓鼠標滾動改變字體大小
改變Visual Studio Code的編輯區的字型大小 (Editor font size設定)
1：打開"文件->首選項->設置。選File/Pref/User Settings
2：打開settings.json文件
改成

~~~
{
    "editor.codeActionsOnSave": null,
    "editor.mouseWheelZoom": true,   //讓鼠標滾動改變字體大小
    "editor.fontSize": 12,
    "window.zoomLevel": 1.3,         //儀表字體
    "editor.tabSize": 4,   //spaces空格設定
}
~~~

