<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>msg</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.3.1.min.js"></script>
</head>

<body>
<!-- 如何即時讀取mysql的資料 -->
    <input id="add" class="ajax_mysql" type="submit" name="ajax_mysql_name" value="Send out"/><br>
<!-- ajax_mysql -->
    <script type="text/javascript">
        $(document).ready(function(){
            $(".ajax_mysql").click(function(){    
                // var idVal = $(this).attr('id');
                $.get("deal.php",{
                    mysql_ajax:"1"
                },function(row) {
                    responce(row);
                });
            });
        });
    </script>

<?php
    require_once('db.php');
    $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大

// if ($_POST['mysql_ajax']) {
    $result = mysqli_query($db, $sql);//執行指令
    if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
        while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
            echo $row["id"]." ";
            echo $row["name"];
            echo $row["msg"];
            echo $row["update_time"]."<br>";
        }
    } else {
        echo "erro";
    }


?>
    <div id="mysql_content">
        <table border="1" width=650 align="center">
            <tr align="center">
                <td>id</td>
                <td>name</td>
                <td>msg</td>
                <td>update time</td>
                <td width="100" >note</td>
            </tr>
            <?php
                // while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
            ?>
            <tr height="100" align="center">
                <td width="15" >
                    <?php 
                    // echo $row["id"]; 
                    ?>
                </td>
                <td width="50" >
                    <?php
                    //  echo $row["name"]; 
                     ?>
                </td>
                <td width="100" >
                    <?php 
                    // echo $row["msg"]; 
                    ?>
                </td>
                <td width="100" >
                    <?php 
                    // echo $row["update_time"]; 
                    ?>
                </td>
                <td width= >
                    <button>
                        <a href="update.php?id=<?php 
                        // echo $row["id"]; 
                        ?>">edit</a>
                    </button>
                    &nbsp
                    <button>
                        <a href="deal.php?ajax_delete=1&id=<?php 
                        // echo $row["id"]; 
                        ?>">delete</a>
                    </button>
                    <br><br>
                    <button class="ajax_update_button" id="<?php
                    // echo $row["id"]; 
                    ?>">ajax_update</button>
                    &nbsp
                    <button class="ajax_delete" id="<?php
                    // echo $row["id"]; 
                    ?>">ajax_delete</button>
                </td>
            </tr>
        </table>
    </div>
<?php
//                 }
// } else {
//     echo "erro";
// }
// // }
?>
</body>

</html>