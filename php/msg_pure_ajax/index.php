<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>msg</title>
    <link href="css.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
    <p>add msg</p>
    <form id = form1>
        name:<input id="idname" type="text" name="name" />
        <br>
        msg:<textarea id="idmsg" name="msg" cols="30" rows="5"></textarea>
        <br>
        <input id="add" type="submit" name="add_submit" value="送出"/>
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#add").click(function(){
                var name = $("#idname").val();
                var msg = $("#idmsg").val();                
                $.post("deal.php",{
                    name: name,
                    msg: msg
                },function(data) {
                    alert(data);
                });
                // //以下失敗
                // success: function(data){
                //     alert(data);
                // },
                // error: function(data) {
                //     alert(data);
                // });

                // //以下另一種成功方式
                // $.ajax({
                //     url: "deal.php",
                //     type: "POST",
                //     dataType: "json",
                //     data: {
                //         // name:$("input:text").val
                //         name: name,
                //         msg: msg
                //     },
                //     success: function(data) {
                //         alert("success");
                //     },
                //     error: function(data) {
                //         // alert(data);
                //         alert("error");
                //     }
                // });
            });
        });
    </script>

    <br>
    <?php
    require_once("db.php");
    $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
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
                <?php echo $row["id"]; ?>
            </td>
            <td width=15%>
                <?php echo $row["name"]; ?>
            </td>
            <td width=20%>
                <?php echo $row["msg"]; ?>
            </td>
            <td width=130>
                <?php echo $row["update_time"]; ?>
            </td>
            <td width=100>
                <button>
                    <a href="updata.php?id=<?php echo $row["id"]; ?>">edit</a>
                </button>
                &nbsp
                <button>
                    <a href="deal.php?delete=1&id=<?php echo $row["id"]; ?>">delete</a>
                </button>
            </td>
        </tr>
    <?php
        }
    } else {
        echo "no msg massage.";
    }
    ?>
    </table>
</body>

</html>