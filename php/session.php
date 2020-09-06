<br><br>

<form action="session.php" method="post">
<input type="text" name="inlogin" value="input_username">
<button id="login" name="login">login</button>
</form>

<?php
session_start();
$username = $_POST['inlogin'];
if(!empty( $username)) {
    $_SESSION['username'] = $username;
}

if(isset($_SESSION['username'])) {
    echo "登入成功";
?>

<form action="session.php" method="post">
<input type="text" name="inlogout" value="input_username">
<button id="login" name="logout">logout</button>
</form>

<?php
}
if($_POST['inlogout']) {
    unset($_SESSION['username']);
}
?>

