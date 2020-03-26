<button>
    <a href="index.php">留言版首頁</a>
</button>
<button>
    <a href="add.html">新增留言</a>
</button>
<br>
<br>

<?php
require_once('db.php');

$name = $_POST['name'];
$msg = $_POST['msg'];
if ($_POST['submit']) {
    try{
        $sql = "insert into message_board(name,msg,update_time) values ('$name','$msg',now())";
        $connection->exec($sql);
        echo "新增成功";
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
    $connection = null;
}

$id = $_GET['id'];
if ($_GET['id']) { //null or number
    try{
        $delete = "delete from message_board where id=" . $id;
        $connection->exec($delete);
        echo "刪除成功";
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
    $connection = null;
}
?>