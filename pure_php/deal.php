<?php
require_once('db.php');
//使用$_POST接住表單傳送過來的資料，確認新增留言有點選，後續執行sql指令，並判斷是否新增成功
$name = $_POST['name'];
$msg = $_POST['msg'];
if ($_POST['submit']) {
    $sql = "insert into message_board(name,msg,update_time) values ('$name','$msg',now())";
    if (mysqli_query($db, $sql)) {
        echo "留言新增成功";
    } else {
        echo "留言新增失敗";
    }
}
//確認參數id是否有抓取，後續執行刪除sql指令，並判斷是否刪除成功
$id = $_GET['id'];
if ($_GET['id']) { //null or number
    $delete = "delete from message_board where id=" . $id;
    if (mysqli_query($db, $delete)) {
        echo "刪除成功";
    } else {
        echo "刪除失敗";
    }
}
?>
<br>
<button>
    <a href="index.php">留言版首頁</a>
</button>
<button>
    <a href="add.html">新增留言</a>
</button>
