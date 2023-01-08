# VScode的基本教學
## ubuntu 開啟root權限
sudo code --user-data-dir="~/.vscode-root"

## 快捷鍵
Visual Studio Code同时选中多行输入，Alt + Shift + 鼠标左键选取多行，如果搭配搜尋以及enter鍵可以重複地方快速取代。

Alt + Z 自動換行

快速排版：Shift + Alt + F<br>
git：<br>
我們以剛剛的同一個專案為例，<br>
如要觀看整個 git log，請先按下 ctrl + shift + P 叫出命令選擇區，<br>
可以把它視為 VS Code 的 command line，許多擴充套件也須經由這個地方下指令。<br>
Git: View History (git log)<br>
<a href="https://blog.tonycube.com/2018/11/visual-studio-code.html">Visual Studio Code 極速上手指南</a><br>
<a href=""></a><br>

<img src="https://github.com/iachievedream/demo_code/blob/master/picture/VScode_Mouse__Wheel_Zoom.png" width="50%" height="50%" />

## VScode 套件
~~~
### 顯示:使縮排增加顏色，比較美觀
indent-rainbow

### html 標籤上寫上class所能提供的樣式
HTML CSS Support

### Tailwind的輔助套件
Tailwind CSS IntelliSensePreview

### 快速開發:可以編輯常用的程式碼做快速的貼上以及修改(須上網查詢如何設定的內容)
HTML Snippets

### 格式整理
Format HTML in PHP

## 測試
### 自動搜尋你的專案，並提供錯誤報告，看你的專案是否有錯誤，若PHP程式語法有錯，會有紅色底線的錯誤提示。
PHP IntelliSense

### 其他類似的測試套件:
XDebug:搭配 XDebug 使用，可以在 VS Code 中除錯、下中斷點。
PHP Debug:
PHPUnit:寫測試的好用工具


### 即時預覽程式碼(預覽網頁，a/t + B)
open in browser
以下兩項相同(不須裝)
Live Server，Preview on Web Server

### 可以直接看到 commit 紀錄
Git History

## 附加功能

### 一應俱全的 Markdown 工具，無論是 highlight、快速鍵、自動補完、預覽，通通給你！
Markdown All in One

### 
PHP Intelephense
~~~
"php.validate.executablePath": "//usr//local//bin//php",
"php.executablePath": "//usr//local//bin//php",
~~~

Prettier - Code formatter
可以透過按 shift + alt + F 的方式，讓整個程式碼重新排版

Code Spell Checker
主動進行英文偵測，避免拼錯。

favorites
特定的檔案或資料夾新增到我的最愛

[Deprecated] Bracket Pair Colorizer 2
大、中、小括弧 ( { }、[ ]、( ) ) 加上各自獨立的顏色

~~~

參考：[小克的 Visual Studio Code 必裝擴充套件（Extensions）私藏推薦](https://blog.goodjack.tw/2018/03/visual-studio-code-extensions.html)

## vscode設置讓鼠標滾動改變字體大小
~~~
改變Visual Studio Code的編輯區的字型大小
(Editor font size設定)
1：打開"文件->首選項->設置。選File/Pref/User Settings
2：打開settings.json文件
改成
{
    "editor.codeActionsOnSave": null,
    "editor.mouseWheelZoom": true,   //讓鼠標滾動改變字體大小
    "editor.fontSize": 12,
    "window.zoomLevel": 1.3,         //儀表字體
    "editor.tabSize": 4,   //spaces空格設定

    "intelephense.files.associations": [
        "*.php",
        "*.phtml"
    ], //spaces空格設定
    
    "php.validate.executablePath": "//usr//local//bin//php",
    "php.executablePath": "//usr//local//bin//php",
    "php-cs-fixer.onsave": true,
    "php-cs-fixer.executablePath": "${extensionPath}/php-cs-fixer.phar",
    "php-cs-fixer.lastDownload": 1665164381120,
    "php-cs-fixer.exclude": [
    
    ],
}
~~~
## php cs fixer 設定
搭配 PHP CS Fixer 使用，自動在儲存時將程式碼修正成符合 PSR-2 的規範格式。重視 Coding Style 者必裝！

~~~
windows
安裝composer
composer -V
安裝php-cs-fixer
composer global require friendsofphp/php-cs-fixer

mac
brew install php-cs-fixer
~~~
### vs code(前方空白鍵要注意,要下載php-cs-fixer.phar)
~~~
Config:(重要,注意後面的附檔名)
C:\Users\{你的使用者名稱}\AppData\Roaming\Composer\vendor\bin\config.php_cs

Executable Path：
${extensionPath}\php-cs-fixer.phar

Executable Path Windows：
C:\Users\{你的使用者名稱}\AppData\Roaming\Composer\vendor\bin\php-cs-fixer.bat

勾選:Onsave
~~~


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


## snippet-generator

VSCode Snippet

程式碼快捷鍵的設定

Command ⌘ + Shift ⇧ + P 開啟命令列
ctrl+shift+p 開啟命令列
就可以編輯快捷鍵。

[snippet](https://snippet-generator.app/)

<img src="https://github.com/iachievedream/demo_code/blob/master/picture/vscode_snippets.png" width="50%" height="50%" />


[2018 VS Code 設定大補帖與小技巧](https://medium.com/@mvpdw06/2018-vs-code-%E8%A8%AD%E5%AE%9A%E5%A4%A7%E8%A3%9C%E5%B8%96%E8%88%87%E5%B0%8F%E6%8A%80%E5%B7%A7-24c6269b0cc1)

[VS Code (Visual Studio Code) 編輯工具-相關設定-snippets](https://ssorc.tw/7174/vs-code-visual-studio-code-%E7%B7%A8%E8%BC%AF%E5%B7%A5%E5%85%B7-%E7%9B%B8%E9%97%9C%E8%A8%AD%E5%AE%9A-snippets/)

[VS Code 中自訂程式碼片段的功能（snippet）](https://pjchender.blogspot.com/2017/04/vs-code-snippet.html)
