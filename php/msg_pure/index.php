<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言板</title>
    <link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
    <button>
        <a href="add.html">新增留言</a>
    </button>
    <br>
    <?php
    require_once("db.php");
    $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
    $result = mysqli_query($db, $sql);//執行指令
    if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
        while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
            echo "<br>" . $row["id"] . " -- " .$row["name"] . " -- " .$row["msg"] . " -- " . $row["update_time"];
             ?>
             <button>
                 <a href="deal.php?id=<?php echo $row["id"]; ?>">刪除</a>
            </button>
             <?php
        }
    } else {
        echo "沒有留言資訊";
    }
?>
</body>
</html>