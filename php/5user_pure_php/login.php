<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
</head>
<body>

<div align="center">
    <p>login</p>
     <form action="session.php" id = form1 method="post">
    <table border="1" wedth=200 align="center">
        <tr align="center" >
            <td>name</td>
            <td ><input id="idname" type="text" name="name"/></td>
        </tr>
        <tr align="center">
            <td >password</td>
            <td ><input id="idpassword" type="password" name="password"/></td>
        </tr>
        <tr >
            <td colspan="2" align="center"><button id="login">送出</button></td>
        </tr>
    </form>
</div>

<?php
session_start();
if(isset($_POST['name']) && ($_POST['password'])){
    $_SESSION['wd'] ="name";
}
if(isset($_SESSION['wd'])){
    echo "成功";
?>
<button id="login">logout</button>
<?php
    echo "abc";
    unset($_SESSION['wd']);
}
?>
</body>
</html>

