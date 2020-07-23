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
    <div id="addadd"></div>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#add").click(function(){
                var nameVal = $("#idname").val();
                var msgVal = $("#idmsg").val();
                $.ajax({
                    url: "deal.php",
                    type: "POST",
                    dataType: "json",
                    data: {
                        // name:$("input:text").val
                        name: nameVal,
                        msg: msgVal },
                    success: function(data) {
                        alert("success");
                    },
                    error: function(data) {
                        // $("#add").html("add error")
                        // $("#addadd").val(data)
                        alert("error");
                    }
                    // complete: function(data) {
                    //     alert("complete");
                    // }
                })
            });
            $("#ajax_delete").click(function(){    
                var nameVal = $("#idname").val();
                $.post("deal.php?delete=1&id=<?php echo $row["id"]; ?>",{
                    name: name,
                    msg: msg
                },function(data) {
                    alert(data);
                });
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
                <button  id="delete">
                    <a href="deal.php?delete=1&id=<?php echo $row["id"]; ?>">delete</a>
                </button>

                <button  id="ajax_delete">
                    <a >ajax_delete</a>
                </button>
                <input id="ajax_delete" type="submit" name="add_submit" value="ajax_delete"/>

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