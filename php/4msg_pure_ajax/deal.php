    <?php
    require_once('db.php');

    //使用$_POST接住表單傳送過來的資料，確認新增留言有點選，後續執行sql指令，並判斷是否新增成功
    if ($_POST['add_data']) {
        if ($_POST['name'] && $_POST['msg']) {
            $name = $_POST['name'];
            $msg = $_POST['msg'];   
            $sql = "insert into message_board(name,msg,update_time) values ('".$name."','".$msg."',now())";
            // mysqli_query($db, $sql);
            if (mysqli_query($db, $sql)) {
                echo "msg add successfully";
            } else {
                echo "msg add failed";
            }
        }else {
            echo "error";
        }
    }

    //思考中
    if ($_POST['ajax_mysql']) {
        $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
        $result = mysqli_query($db, $sql);//執行指令
        if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
        }
    }

    if ($_GET['ajax_edit']) { //null or number
        $id = $_GET["id"];
        $sql = "select * from message_board WHERE id=".$id;
        $result = mysqli_query($db,$sql);
        $row = mysqli_fetch_assoc($result);
        // echo $row." ".$row["name"]." ".$row["msg"];
        $response = array(
            'name' => $row["name"],
            'msg'=> $row["msg"]
        );
        // echo json_encode($response); 
        echo $response; 
    }

    //跳至updata頁面後的更新，input按鍵的名稱update_submit去做傳送更新的資訊內容
    if ($_POST['update_data']) {
        $id = $_GET['id'];
        $name = $_POST['update_name'];
        $msg = $_POST['update_msg'];
        $sql = "update message_board set name='".$name."',msg='".$msg."' where message_board.id=".$id;
        if (mysqli_query($db, $sql)) {
            echo "msg update successfully";
        } else {
            echo "msg update failed";
        }
    }

    //確認參數delete是否為1，後續抓取id以及執行刪除sql指令，並判斷是否刪除成功
    if ($_GET['ajax_delete']) { //null or number
        $id = $_GET['id'];
        $delete = "delete from message_board where id=" . $id;
        if (mysqli_query($db, $delete)) {
            echo "delete successfully";
        } else {
            echo "delete failed";
        }
    }
    ?>