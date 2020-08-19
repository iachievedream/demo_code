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

