<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body>

<div align="center">
    <form action="session.php" id = form1 method="post">
    <p>register</p>
    <table border="1" wedth=200 align="center">
        <tr align="center" >
            <td>name</td>
            <td ><input id="idname" type="text" name="name"/></td>
        </tr>
        <tr align="center" >
            <td>Email</td>
            <td ><input id="idname" type="text" name="name"/></td>
        </tr>
        <tr align="center">
            <td >password</td>
            <td ><input id="idpassword" type="password" name="password"/></td>
        </tr>
        <tr align="center">
            <td >confirm password</td>
            <td ><input id="idconfirm_password"" type="password" name="confirm_password"/></td>
        </tr>
        <tr >
            <td colspan="2" align="center"><button id="login">送出</button></td>
        </tr>
    </form>
</div>
</body>
</html>

