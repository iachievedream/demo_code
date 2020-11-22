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

## AWS

~~~
;Run("C:\Windows\system32\cmd.exe")
;WinWaitActive("C:\Windows\system32\cmd.exe")

Run("C:\~~~cmd\Cmder.exe")
WinWaitActive("Cmder")
;Send ("cd C:\Users\~~~\Desktop")
Send ("{Enter}")
Send ("ssh -i C:\Users\~~~\Desktop\user.pem ubuntu@IP")
Send ("{Enter}")
;Sleep(1000)
;Send ("git")
;Send ("{Enter}")

WinClose("Cmder")
~~~

## xampp
~~~
Run("C:\xampp\xampp-control.exe")
WinWaitActive("XAMPP Control Panel v3.2.2   [ Compiled: Nov 12th 2015 ]")
;WinClose("Untitled - Notepad")

;ControlSend("XAMPP", "Start", "[CLASS:TBitBtn; INSTANCE:30]", "")
;ControlClick("XAMPP", "", "[ID:68520]", "")

ControlClick("XAMPP", "Start", "[CLASS:TBitBtn; INSTANCE:30]", "")
WinClose("XAMPP")
~~~