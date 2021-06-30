# mssql
###### tags:`docker`
## 下載且在運行mssql [mssql](https://docs.microsoft.com/zh-tw/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)

~~~
docker pull mcr.microsoft.com/mssql/server:2019-latest

運行
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password" -p 1433:1433 --name sql1 -h fu_db -d mcr.microsoft.com/mssql/server:2019-latest
example:Password=123456789

查詢docker容器的ip位置
docker inspect sql1 | grep '"IPAddress"' | head -n 1

hint:php連接mssql的IP位置進mssql的容器直接下
docker exec -it mssql bash
hostname -I 

可以使用localhost連線，但不能使用IP連線
port:1433
user:sa
Password:123456789

丟入bak檔之前的設定
~~~
sudo chmod -R 777 text.bak
chown mssql text.bak
docker cp bash.sh  06f:/home/
~~~

2021 03 21_mssql

## 中文化db資料
中文化設立的DB指令
~~~
ALTER DATABASE [demo] SET SINGLE_USER;
ALTER DATABASE [demo] COLLATE Chinese_Taiwan_Stroke_CS_AS
ALTER DATABASE [demo] SET MULTI_USER;
~~~
範例
![](https://i.imgur.com/o9gyvsE.png)
![](https://i.imgur.com/0F8oFAp.png)
