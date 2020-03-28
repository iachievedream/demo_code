#!/bin/bash
# 安裝apach2，但這個httpd沒有php的程式功能
sudo docker pull httpd
# 確認images
sudo docker images
# 執行httpd，名稱為apachetest，容易重複產生錯誤
sudo docker run --name apachetest -d -p 8000:80 httpd
# 進入容器中(進入容器後sh就會停止)
sudo docker exec -it apachetest bash
# 顯示程式內容
cd htdocs/
cat index.html 
# 修改檔名為index1.html
sudo mv index.html index1.html
# 新增php程式內容
echo "<?php phpinfo(); ?>" > index.php
cat index.php
# 顯示內容會像後面這串文字，<?php phpinfo(); ?>
exit

# 使用Dockerfile
# volume
# sudo docker run -d -p 8000:80 -v `pwd`:/var/www/html test
