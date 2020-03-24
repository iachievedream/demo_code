<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言板</title>
</head>
<body>
    <a href="add.html">新增留言</a><br>
    <?php
    require_once("db.php");
    $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
    // $result = mysqli_query($db, $sql);//執行指令
    // if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
    //     while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
    //         echo "<br>" . $row["id"] . " -- " .$row["name"] . " -- " .$row["msg"] . " -- " . $row["update_time"];
             ?>
             <!-- <a href="deal.php?id=<?php echo $row["id"]; ?>">刪除</a> -->
             <?php
    //     }
    // } else {
    //     echo "沒有留言資訊";
    // }

    //PDO
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