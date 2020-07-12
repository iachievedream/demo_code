# docker_mysql
[Dockerfile](#Dockerfile)<br>


[回目錄](#docker_ubuntu)

## 安裝與運行mysql
下載mysql的images
~~~
docker pull mysql:8.0
~~~
運作container
~~~
docker run --name=mysql-8.0 -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=123456 -p 6606:6606 -d mysql:8.0
~~~
logs 命令可查看容器是否正常运行
~~~
docker logs mysql-8.0
~~~
直接進入container裡面
~~~
docker exec -it mysql-8.0 mysql -u root -p
~~~
進入容器後再登入mysql
~~~
docker exec -it mysql-8.0 /bin/bash 
mysql -u root -p
~~~
參考資料:[docker 快速搭建 mysql](https://juejin.im/post/5ebbc1666fb9a043410a18cb)

## 設定遠端連線

其他資料:[使用Docker安装mysql5和mysql8](https://www.jianshu.com/p/d297b0be4157)
其他資料:[Docker系列之《Dockerfile构建MySQL镜像》](https://nicksors.cc/2018/06/19/Docker%E7%B3%BB%E5%88%97%E4%B9%8B%E3%80%8ADockerfile%E6%9E%84%E5%BB%BAMySQL%E9%95%9C%E5%83%8F%E3%80%8B.html)
