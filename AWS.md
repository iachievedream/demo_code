# AWS
Key pair name：

有內網以及外網IP

連接資料：pem檔

## AWS官網的連線方式：
### ubuntu：需先用chmod的開權限，才能做連線的動作
~~~
chmod 400 fu.pem 
ssh -i "fu.pem" ubuntu@ec2-127-0-0-1.compute-1.amazonaws.com
//ssh -i 檔案的路徑位置 系統名稱@ip位址
exit  
//使用後離開
~~~
### Windows：
putty_generator
<img src="https://github.com/iachievedream/demo_code/blob/master/picture/putty_generator.png" width="50%" height="50%" />

putty
<img src="https://github.com/iachievedream/demo_code/blob/master/picture/putty.png" width="50%" height="50%" />

~~~
(使用puttygen把pem轉至ppk私鑰)
IP：ubuntu@ec2-127-0-0-1.compute-1.amazonaws.com
使用putty.exe連線
putty.exe的SSH內容中Auth加上一個登入的私鑰.ppk檔案
~~~

## public and private
~~~
公開才能做mysql的連線，
私密是虛擬機的操作
~~~

## 權限指令備忘錄
~~~
sudo su  //獲取根用戶
passwd root  //使用根用戶創建密碼
passwd -d root  //刪除根密碼
~~~

## Q&A
### Q1
proc_open(): fork failed-can not allocate memory, error on aws ec2 instance while updating/installing some libraries or packages using composer

https://medium.com/@zrshishir/proc-open-fork-failed-can-not-allocate-memory-error-on-aws-ec2-instance-while-105716058c8c

### Q2
No supported authentication methods available in PuTTY

## 參考資料
<a href="https://officeguide.cc/putty-convert-pem-to-ppk-tutorial/">PuTTYgen 將 .pem 金鑰檔案轉為 .ppk 格式教學</a>

## 延伸內容
<a href="https://t.codebug.vip/questions-272933.htm">ssh:什麼是ppk和pem之間的區別哪裏pem儲存在amazons ec2集群中？</a>


AWS更改root密碼

sudo passwd root


### 設定SSH
在應用程式目錄內開啟終端機，執行以下命令。
$ ssh-keygen

C:\Users\~~~\.ssh
私匙放在這個資料夾內

公匙則是第三方平台


### Q The authenticity of host gitlab com can t be established
~~~
解决方案，重新生成新的ssh并进行认证
在 “Git Bash” 中输入 ssh-keygen.
此时会生成一个 .ssh文件夹.
在该文件夹下跟根据 git账号生成公钥和私钥 id_rsa,id_rsa.pub
打开 id_rsa.pub文件，复制里面的内容
打开https://gitlab.com/profile/keys，验证自己的gitlab身份并添加key，粘贴刚才复制的 公钥.
现在就可以向gitlab继续push代码了
~~~