# AutoIt3
## first
~~~
#include <MsgBoxConstants.au3>
MsgBox($MB_OK, "Tutorial", "Hello World!")
~~~

## text
~~~
Run("notepad.exe")
WinWaitActive("未命名 - 記事本")
Send("This is some text.")
WinClose("未命名 - 記事本")
WinWaitActive("記事本", "未命名 檔案中的文字已經改變。")
;Send("!n")
~~~

## cmder
~~~
Run("C:\Users\~~~~\cmd\Cmder.exe")
WinWaitActive("cmder")
Send ("git")
Send ("{Enter}")
~~~

## AWS_git
~~~
;Run("C:\Windows\system32\cmd.exe")
;WinWaitActive("C:\Windows\system32\cmd.exe")

;開啟cmder
Run("C:\Users\user\Documents\cmd\Cmder.exe")
WinWaitActive("Cmder")

;連接AWS連接AWS
Send ("ssh -i C:\Users\~~~\Desktop\user.pem ubuntu@IP")
Send ("{Enter}")
WinWaitActive("Cmder")

;進入docker的container內
Send ("docker exec -it ubuntutest bash")
Send ("{Enter}")
WinWaitActive("Cmder")

;進入appache2的資料夾路徑
Send ("cd var/www/html/")
Send ("{Enter}")
WinWaitActive("Cmder")

;git clone 檔案
Send ("git clone https://gitlab.com/iachievedream/codeigniter3.git")
Send ("{Enter}")
WinWaitActive("Cmder")
Sleep(3000);
Send ("user@gmail.com")
Send ("{Enter}")
WinWaitActive("Cmder")
Sleep(3000);
Send ("password")
Send ("{Enter}")

;git更新
;Send ("git fetch")
;Send ("{Enter}")
;Send ("git pull")
;Send ("{Enter}")

;laravel的伺服器啟動
;Send ("cd C:\xampp\htdocs\blog-laravel")
;Send ("{Enter}")
;WinWaitActive("Cmder")
;Send ("php artisan serve --host=0.0.0.0 --port=8000")
;Send ("{Enter}")
;WinWaitActive("Cmder")

;關閉cmder
;WinClose("Cmder")
~~~

## xampp
~~~
Run("C:\xampp\xampp-control.exe")
;WinWaitActive("XAMPP Control Panel v3.2.2   [ Compiled: Nov 12th 2015 ]")
WinWaitActive("XAMPP Control Panel v3.2.4   [ Compiled: Jun 5th 2019 ]")
;WinClose("Untitled - Notepad")

;ControlSend("XAMPP", "Start", "[CLASS:TBitBtn; INSTANCE:30]", "")
;ControlClick("XAMPP", "", "[ID:68520]", "")

ControlClick("XAMPP", "Start", "[CLASS:TBitBtn; INSTANCE:30]", "")
WinClose("XAMPP")
~~~
