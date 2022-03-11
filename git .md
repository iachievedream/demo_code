# git操作
分支：master、dev、test

1.更新專案
~~~
git fetch  //查看與線上檔案差異
git pull   //更新
git pull --rebase  //內容抓下來之後請使用 Rebase 方式合併
~~~
2.新增以及切換分支
~~~
git checkout dev //切換分支
git branch test   //新增分支
git checkout test //切換分支
~~~
3.本機備份
~~~
git init
git add .
git commit -m "註解內容"
~~~
4.上傳至線上
~~~
git add .
git commit -m "註解內容"
git remote add origin http~~~
git push -u origin test

全部分支內容
git push -u origin --all
~~~
5.分支
~~~
git branch          //列出分支
git branch -D test  //刪除分支
~~~
6.移除已經推至github的檔案比如index.html
~~~
git rm -r --cached index.html
git rm -r --cached PDO/password.php
~~~

7.其他：

~~~
git stash save

git stash list

//恢復暫存的操作
git stash pop

git stash drop

git stash clear
~~~

錯誤訊息等

## 下載私密專案
私密專案的下載方式
> cd ~
> rm -r .ssh
> ssh-keygen -t rsa -C iachievedream@gmail.com (你的github邮箱地址)

後敘述入yes以及按enter鍵即可，
注意ssh的憑證位置是否在此處，
有時會在`/root/.ssh/id_rsa`的位置
> cat id_rsa.pub

後續看下列的資料在gtihub上述入憑證
[github配置SSH免密登录](https://blog.csdn.net/qq_38163309/article/details/105335097)

後續下載專案方式請用ssh的方式，
不要選錯到HTTPS會無法下載
下載指令如下
> git@github.com:iachievedream/demo.git

 id_rsa (私钥)——这个不能泄露
 id_rsa.pub（公钥）

## github的程式碼無法pull下來的處理方式
> git remote set-url origin https://<your_token>@github.com/<USERNAME>/<REPO>.git

參考資料：[github開發人員在七夕搞事情：remote: Support for password authentication was removed on August 13, 2021.](https://www.uj5u.com/ruanti/294517.html)

## 更新專案的時候發生的錯誤碼`remote origin already exists`
删除远程分支：
> git remote rm origin
> git remote add origin git@github.com:[your git name]/[your git repertory]

如：
>git remote add origin git@github.com:iachievedream/demo.git

…or push an existing repository from the command line

git branch -M main
git push -u origin main

------
新的遠端更新
git pull <remote> <branch>
git pull main main
git pull prod prod


參考資料：[git---如何解决fatal: remote origin already exists报错window下git报错](https://blog.csdn.net/Wbiokr/article/details/73436695)
