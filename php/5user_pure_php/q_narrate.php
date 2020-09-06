<!-- 註冊以及登入系統 
註冊的頁面
插入的資訊內容
傳送到sql
建立成功

登入的頁面
登入的資訊
取出sql的帳密資訊
對照帳密是否正確
正確則是取得session

順利進入登入頁面

-->

<form action="session.php" method="post">
    <input type="text" name="nusername" value="123">
    <input type="password" name="npassword" value="123">
    <input type="submit" name="nlogin" value="login">
</form>

<?php
session_start();
$user = $_POST['username'];
$password = $_POST['password'];

if ($username != "" && $password != "")  {
    $sql = "select * from message_board where user=".$username." and password=".$password;
    $result = mysqli_query($db, $sql);//執行指令
    if (mysqli_fetch_row($result) != false ) {
        $_SESSION['login_session'] ="true";
        $_SESSION['username'] = $username;
        echo "登入成功";
?>

<form action="session.php" method="post">
<button id="login" name="nlogout" value="logout">logout</button>
</form>

<?php
        if($_POST['nlogout']) {
            unset($_SESSION['login_session'],$_SESSION['username']);
            echo "登出成功";        
            // header ("Location:index.php")
        } else {
            echo "帳密錯誤";
        }
    }
}
?>

