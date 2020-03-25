<?php
require_once('db.php');
$name = $_POST['name'];
$msg = $_POST['msg'];
if ($_POST['submit']) {
    try{
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);//不懂含意，錯誤訊息提醒
        $sql = "insert into message_board(name,msg,update_time) values ('$name','$msg',now())";
        $connection->exec("$sql");
        echo "新增成功";
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
    $connection = null;
}

$id = $_GET['id'];
if ($_GET['id']) { //null or number
    try{
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);//不懂含意，錯誤訊息提醒
        $delete = "delete from message_board where id=" . $id;
        $connection->exec("$delete");
        echo "刪除成功";
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
    $connection = null;
}
?>
<br>
<button>
    <a href="index.php">留言版首頁</a>
</button>
<button>
    <a href="add.html">新增留言</a>
</button>
