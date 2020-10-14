# README

funtion
php_array_sord
class_object

session
sql
time

[array](#array)
[array](#array)
[array](#array)
[array](#array)


## file_upload<br>
<br>

## PDO_msg<br>
原先使用mysqli，此篇功能是改寫成PDO的方式。<br>
<br>

## pure_msg<br>
這個資料夾是練習純PHP的留言板，後面則是有改寫PDO的方式來做MySQL的資料處理。<br>
<br>

## php_array_sord<br>
<br>

## json

~~~
json_encode	对变量进行 JSON 编码
json_decode	对 JSON 格式的字符串进行解码，转换为 PHP 变量
~~~


## base

### bind_param()

~~~
bind_param("sss", firstname,lastname, $email);

該函式繫結了 SQL 的引數，且告訴資料庫引數的值。 “sss” 引數列處理其餘引數的資料型別。s 字元告訴資料庫該引數為字串。

引數有以下四種型別:
i – integer（整型）
d – double（雙精度浮點型）
s – string（字串）
b – BLOB（布林值）

每個引數都需要指定型別。
~~~

