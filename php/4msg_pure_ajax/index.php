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
    <script type="text/javascript">
        $(document).ready(function(){
            $("#add_hide").hide();
            $("#add_button_show").click(function(){
                $("#add_hide").show();
                $("#add_show").hide();
            });
            $("#add_button_hide").click(function(){
                $("#add_hide").hide();
                $("#add_show").show();
            });
        });
    </script>

    <div id="add_show" align="center">
        <button id="add_button_show">add msg show</button>
    </div>
    <div id="add_hide" align="center">
        <button id="add_button_hide">add msg hide</button>
        <br><br>
        <!-- <form id="add_form"> -->
            <table border="1" width=200 align="center">
                <tr align="center">
                    <td colspan="2">add msg</td>
                </tr>
                <tr align="center">
                    <td>name：</td>
                    <td ><input id="idname" type="text" name="name" /></td>
                </tr>
                <tr align="center">
                    <td>msg：</td>
                    <td><input id="idmsg" type="text" name="msg" ></input></td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <!-- <input id="add" class="add_submit" type="submit" name="add_submit_name" value="Send out"/> -->
                        <button id="add" >Send</button>
                    </td>
                </tr>
            </table>
        <!-- </form> -->
    </div><br>
    <div id="state"></div>
<!-- ajax_add -->
    <script type="text/javascript">
        $(document).ready(function(){
            $("#add").one("click",function(){
                var nameVal = $('#idname').val();
                var msgVal = $('#idmsg').val();
                $.ajax({
                    url: "deal.php",
                    type: "POST",
                    dataType: "json",
                    data: {
                        add_data: "1",//觸發指令
                        name: nameVal,
                        msg: msgVal },
                    success: function(data) {
                        // alert("successfully");
                        document.getElementById("state").innerHTML = data;
                    },
                    error: function(data) {
                        // alert("failed");
                        document.getElementById("state").innerHTML = data;
                    }
                })
            });
        });
    </script>
<!-- 如何即時讀取mysql的資料 -->
    <button class="ajax_mysql" >ajax_mysql</button>
    <?php
    require_once('db.php');
    $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
    $result = mysqli_query($db, $sql);//執行指令
    if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
    ?>

<!-- ajax_mysql -->
<script type="text/javascript">
        $(document).ready(function(){
            $(".ajax_mysql").one("click",function(){
                $.ajax({
                    url: "deal.php",
                    type: "POST",
                    dataType: "json",
                    data: {
                        ajax_mysql: "1",//觸發指令
                    },
                    success: function(data) {
                        alert("successfully");
                        // document.getElementById("state").innerHTML = data;
                    },
                    error: function(data) {
                        ("failed");
                        // document.getElementById("state").innerHTML = data;
                    }
                })
            });
        });
    </script>


    <div id="mysql_content">
        <table border="1" width=550 align="center">
            <tr align="center">
                <td>id</td>
                <td>name</td>
                <td>msg</td>
                <td>update time</td>
                <td width="100" >note</td>
            </tr>
            <?php
                while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
            ?>
            <tr height="50" align="center">
                <td width="20" >
                    <?php echo $row["id"]; ?>
                </td>
                <td width="50" >
                    <?php echo $row["name"]; ?>
                </td>
                <td width="100" >
                    <?php echo $row["msg"]; ?>
                </td>
                <td width="100" >
                    <?php echo $row["update_time"]; ?>
                </td>
                <td width=160 >
                    <button style="margin: 3px;">
                        <a href="update.php?id=<?php echo $row["id"]; ?>">edit</a>
                    </button>
                    &nbsp
                    <button style="margin: 3px;">
                        <a href="deal.php?ajax_delete=1&id=<?php echo $row["id"]; ?>">delete</a>
                    </button>
                    <br>
                    <button class="ajax_edit_button" id="<?php echo $row["id"]; ?>">ajax_edit</button>
                    &nbsp
                    <button class="ajax_delete" id="<?php echo $row["id"]; ?>">ajax_delete</button>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "no msg massage.";
            }
            ?>
        </table>
    </div>

<!-- ajax_update -->
    <script type="text/javascript">
        $(document).ready(function(){
            $(".ajax_edit_button").click(function(){    
                var idVal = $(this).attr('id');
                $.get("deal.php",{
                    ajax_edit:"1",
                    id: idVal
                // },function(data) {
                },function(text) {
                    // myObj = decode(text);
                    alert(text);
                    alert(text[name]);
                    var myObjmyObj = JSON.parse(this.myObj);
                    alert(myObj.name." ".myObj.msg);
                    document.getElementById("edit_name").innerHTML = response.name;
                    document.getElementById("edit_msg").innerHTML = response.msg;
                    response(data);
                });
            });
        });
    </script>

<!-- ajax_update -->
    <p>update msg</p>
    <form action="deal.php?id=<?php echo $id; ?>" method="post">
        姓名:<input id="edit_name" type="test" name="update_name" value="<?php echo $row["name"]; ?>" />
        <br>
        留言:<input id="edit_msg" type="test" name="update_msg" value="<?php echo $row["msg"]; ?>" /></textarea>
        <br>
        <input id="update" type="submit" name="update_submit" value="更新" />
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#update").click(function(){
                var nameVal = $("#idname").val();
                $.ajax({
                    url: "deal.php",
                    type: "POST",
                    dataType: "json",
                    data: {
                        update_data: 1,
                        name: nameVal,
                        msg: msgVal },
                    success: function(data) {
                        alert("success");
                    },
                    error: function(data) {
                        alert("error");
                    }
                })
            });
        });
    </script>

<!-- ajax_delete -->
    <script type="text/javascript">
        $(document).ready(function(){
            $(".ajax_delete").click(function(){    
                var idVal = $(this).attr('id');
                $.get("deal.php",{
                    ajax_delete:"1",
                    id: idVal
                },function(data) {
                    // alert("success");
                    document.getElementById("state").innerHTML = data;
                });
            });
        });
    </script>
</body>

</html>

