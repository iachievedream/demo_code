<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>msg</title>
    <link href="css.css" rel="stylesheet" type="text/css">
</head>

<body>
    <button>
        <a href="add.html">add msg</a>
    </button>
    <br>
    <?php
	require_once 'db.php';
	$sql = 'select * from message_board order by id asc';//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
	$result = mysqli_query($db, $sql);//執行指令
	if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
	?>
        <table border="0" width=400>
            <tr align="center">
                <td>id</td>
                <td>name</td>
                <td>msg</td>
                <td>update time</td>
                <td width=100>note</td>
            </tr>
        <?php
		while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
		?>
        <tr>
            <td width=5%>
                <?php echo $row['id']; ?>
            </td>
            <td width=15%>
                <?php echo $row['name']; ?>
            </td>
            <td width=20%>
                <?php echo $row['msg']; ?>
            </td>
            <td width=130>
                <?php echo $row['update_time']; ?>
            </td>
            <td width=100>
                <button>
                    <a href="updata.php?id=<?php echo $row['id']; ?>">edit</a>
                </button>
                &nbsp
                <button>
                    <a href="deal.php?delete=1&id=<?php echo $row['id']; ?>">delete</a>
                </button>
            </td>
        </tr>
    <?php
		}
	} else {
		echo 'no msg massage.';
	}
	?>
    </table>
</body>

</html>