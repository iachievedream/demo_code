<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css.css" rel="stylesheet" type="text/css">
</head>

<body>
    <br>
    <button>
        <a href="index.php">留言版首頁</a>
    </button>
    <button>
        <a href="add.html">新增留言</a>
    </button>
    <?php
    require_once("db.php");
    $id = $_GET["id"];
    $sql = "select * from message_board WHERE id=".$id;
    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_assoc($result);
    // var_dump($row);die;
    ?>
    <p>更新留言</p>
    <form action="deal.php?id=<?php echo $id; ?>" method="post">
        姓名:<input type="test" name="update_name" value="<?php echo $row["name"]; ?>" />
        <br>
        留言:<input type="test" name="update_msg" value="<?php echo $row["msg"]; ?>" /></textarea>
        <br>
        <input type="submit" name="update_submit" value="更新" />
    </form>

</body>

</html>
        <!-- 留言:<textarea type="test" name="update_msg" value="<?php echo $row["msg"]; ?>" cols=" 30" rows="5"></textarea> -->