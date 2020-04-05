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
    try{
        $sql = "select * from message_board order by id asc"; //sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
        $statement = $connection->query($sql);
        foreach($statement as $row){
            echo "<br>" . $row["id"] . " -- " .$row["name"] . " -- " .$row["msg"] . " -- " . $row["update_time"];
            ?>
            <button>
                <a href="deal.php?id=<?php echo $row["id"]; ?>">刪除</a>
            </button>
            <?php
        }
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
?>
</body>
</html>