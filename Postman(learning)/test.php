<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test_ajax</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="test.js"></script>
</head>

<body>

    <form enctype="application/x-www-form-urlencoded" action="http://127.0.0.1:8000/api/register" method="POST">
        <input type="text" name="name" value="fu">
        <input type="text" name="email" value="fu@gmail.com">
        <input type="text" name="password" value="1qaz2wsx">
        <input type="text" name="password_confirmation" value="1qaz2wsx">
        <input type="submit" value="submit">
    </form>
    <h1>高雄市電動機車充電站名稱及充電站地址一覽表</h1>
    <ul class="charge-list"></ul>
</body>

</html>