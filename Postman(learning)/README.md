# Postman.md

<a href="https://mlog.club/article/4132111">如何以我的HTML形式实现Postman get方法</a><br>
<a href="https://chenye2017.github.io/2019/02/25/%E6%A1%86%E6%9E%B6%E5%AD%A6%E4%B9%A0-%E8%8E%B7%E5%8F%96%E8%AF%B7%E6%B1%82%E5%8F%82%E6%95%B0/">框架学习-获取请求参数</a><br>

基本表單結構
~~~
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <form enctype="application/x-www-form-urlencoded" action="http://127.0.0.1:8000/api/login" method="POST">
        <input type="text" name="email" value="fu@gmail.com">
        <input type="text" name="email" value="fu@gmail.com">
        <input type="text" name="password" value="1qaz2wsx">
        <input type="submit" value="submit">
    </form>

</body>

</html>
~~~