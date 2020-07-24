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
    <div align="center">
        <button>
            <a href="index.php">留言版首頁</a>
        </button>
        &nbsp
        <button>
            <a href="add.html">新增留言</a>
        </button>
        <br><br>
    </div>

    <?php
    require_once("db.php");
    $id = $_GET["id"];
    $sql = "select * from message_board WHERE id=".$id;
    $result = mysqli_query($db,$sql);
    $row = mysqli_fetch_assoc($result);
    // var_dump($row);die;
    ?>
    <form action="deal.php?id=<?php echo $id; ?>" method="post">
        <table border="1" width=200 align="center">
            <tr align="center">
                <td colspan="2">update msg</td>
            </tr align="center">
            <tr align="center">
                <td>name：</td>
                <td ><input type="text" name="update_name" value="<?php echo $row["name"]; ?>" /></td>
            </tr>
            <tr align="center">
                <td>msg：</td>
                <td><input type="text" name="update_msg" value="<?php echo $row["msg"]; ?>" /></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <input type="submit" name="update_submit" value="update" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>