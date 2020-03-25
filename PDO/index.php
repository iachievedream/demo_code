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
    try{
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);//不懂含意，錯誤訊息提醒
        $sql = "select * from message_board order by id asc"; //sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
        $statement = $connection->query('select * from message_board');
        foreach($statement as $row){
            echo "<br>" . $row["id"] . " -- " .$row["name"] . " -- " .$row["msg"] . " -- " . $row["update_time"];
            ?>
            <a href="deal.php?id=<?php echo $row["id"]; ?>">刪除</a>
            <?php
        }
    } catch (PDOException $e) {
        echo $sql . $e->getMessage();
    }
        //不懂，以及不懂預處理
        // while($row = $statement->fetch(PDO::FETCH_ASSOC)) {
        //     echo $row['user'] . ' ' . $row['pwd']."<br>";
        // }
?>
</body>
</html>