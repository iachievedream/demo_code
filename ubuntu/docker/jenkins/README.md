# Docker 安装 jenkins(pull jenkins)
~~~
下載jenkins
docker pull jenkins/jenkins

運行myjenkins容器
docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 jenkins/jenkins
docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 -v /mydata/jenkins:/var/jenkins_home jenkins/jenkins

進入容器
docker exec -it myjenkins bash

查看密碼
cat /var/jenkins_home/secrets/initialAdminPassword
~~~

## 執行bash檔
~~~
sh myjenkins.sh
~~~

## 另外指令(待了解)
~~~
sudo docker run -d -u 0 --privileged  --name jenkins_node1 -p 49003:8081 -v `pwd`:/var/jenkins_home/workspace jenkins/jenkins

sudo docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 -v `mydata`/jenkins:/var/jenkins_home/workspace jenkins/jenkins

--privileged
使用该参数，container内的root拥有真正的root权限。
~~~

原文網址：<a href="https://kknews.cc/code/jlrxe66.html">如何使用 Docker 安裝 Jenkins</a><br>
未有詳細介紹指令。
