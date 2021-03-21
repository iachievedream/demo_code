# mssql
###### tags:`docker`
## 下載且在運行mssql [mssql](https://docs.microsoft.com/zh-tw/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)

~~~
docker pull mcr.microsoft.com/mssql/server:2019-latest

運行
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" -p 1433:1433 --name sql1 -h fu_db -d mcr.microsoft.com/mssql/server:2019-latest
example:<YourStrong@Passw0rd>=12345678Aa

查詢docker容器的ip位置
docker inspect sql1 | grep '"IPAddress"' | head -n 1

可以使用localhost連線，但不能使用IP連線
port:1433
sa
A1234567a

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
