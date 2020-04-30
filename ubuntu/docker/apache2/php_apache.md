<a href="https://www.youtube.com/watch?v=_mwWxgfZ7Zc&list=PLfBT9P5LG1z8VcPMIfI1UI12uhCJXHOQP&index=117&t=0s">Apache, PHP & MySql on Docker on Ubuntu 19.04</a><br>

~~~
sudo apt  install docker-compose
sudo nano docker-compose.yml
docker-compose up
~~~

<a href="https://oranwind.org/-solution-qi-dong-docker-compose-fa-sheng-error-couldnt-connect-to-docker-daemon-at-httpdockerlocalunixsocket-is-it-running-cuo-wu/">[ Solution ] 啟動 docker-compose 發生 ERROR: Couldn’t connect to Docker daemon at http+docker://localunixsocket - is it running? 錯誤</a><br>

~~~
Step 1. 將當前用戶加入 docker 群組
❖ 在 【 Terminal 】中輸入下方指令
  sudo gpasswd -a ${USER} docker

Step 2. 退出當前用戶
❖ 在 【 Terminal 】中輸入下方指令
  sudo su

Step 3. 再次切换到 ubuntu 用戶
❖ 在 【 Terminal 】中輸入下方指令
  su ubuntu

Step 4. 啟動 docker-compose
❖ 在 【 Terminal 】中輸入下方指令
  docker-compose up -d

http://127.0.0.1:8000/
~~~

建立文件

~~~
cd php
echo "<?php echo "Hello world";ls ?>" > index.php

sudo nano index.php
>>>>>>>>>
<?php 
echo "Hello world";
?>
>>>>>>>>>
cat index.php

sudo chmod 777 index.php  //待測試
cd ..

docker-compose up
~~~


nano Dockerfile

index.php

~~~
<?php
$servername = 'db';
$dbname = 'test_db';
$username = 'FU';
$password = 'a1234567';
$db = mysqli_connect($servername,$username,$password,$dbname);
if ($db->connect_error) {
    echo 'fail';
} 
echo 'suceddfully';

?>
~~~

docker-compose up
