<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>deal</title>
    <link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
    <?php
    require_once('db.php');

    //使用$_POST接住表單傳送過來的資料，確認新增留言有點選，後續執行sql指令，並判斷是否新增成功
    if ($_POST['add_submit']) {
        $name = $_POST['name'];
        $msg = $_POST['msg'];   
        $sql = "insert into message_board(name,msg,update_time) values ('$name','$msg',now())";
        if (mysqli_query($db, $sql)) {
            echo "msg add successfully";
        } else {
            echo "msg add failed";
        }
    }

    //確認參數delete是否為1，後續抓取id以及執行刪除sql指令，並判斷是否刪除成功
    if ($_GET['delete']) { //null or number
        $id = $_GET['id'];
        $delete = "delete from message_board where id=" . $id;
        if (mysqli_query($db, $delete)) {
            echo "delete successfully";
        } else {
            echo "delete failed";
        }
    }

    if ($_POST['update_submit']) {
        $id = $_GET['id'];
        $name = $_POST['update_name'];
        $msg = $_POST['update_msg'];
        $sql = "update message_board set name='".$name."',msg='".$msg."' where message_board.id=".$id;
        // var_dump($sql);die;
        if (mysqli_query($db, $sql)) {
            echo "msg update successfully";
        } else {
            echo "msg update failed";
        }
    }
    ?>
    <br>
    <button>
        <a href="index.php">msg index</a>
    </button>
    <button>
        <a href="add.html">add msg</a>
    </button>
</body>
</html>
