<br><br>

<form action="session.php" method="post">
<input type="submit" name="nlogin" value="login">
</form>

<?php
session_start();
if($_POST['nlogin']) {
    $_SESSION['wd'] ="name";
}

if(isset($_SESSION['wd'])) {
    echo "登入成功";
?>

<form action="session.php" method="post">
<button id="login" name="nlogout" value="logout">logout</button>
</form>

<?php
}
if($_POST['nlogout']) {
    unset($_SESSION['wd']);
}
?>

