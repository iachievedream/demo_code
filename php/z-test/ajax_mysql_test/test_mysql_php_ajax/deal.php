<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>deal</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
    <?php
    require_once('db.php');
    // if ($_POST['mysql_ajax']) {
        $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
        $result = mysqli_query($db, $sql);//執行指令
        $mysql_all = mysqli_num_rows($result);
        $row = mysqli_fetch_assoc($result);
        return $row;
    // }
    ?>
</body>
</html>
