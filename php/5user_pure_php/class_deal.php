<?php
require_once('db.php');


class Deal {
    function register(){
        // $a = $_POST['name'];
        // $b = $_POST['name'];
        // echo "123";

        // echo $a." - ".$b;
        if ($_POST['name'] && $_POST['password']) {
            $name = $_POST['name'];
            $msg = $_POST['password'];   
            $sql = "insert into message_board(name,msg,update_time) values ('".$name."','".$msg."',now())";
            // mysqli_query($db, $sql);
            if (mysqli_query($db->index(), $sql)) {
                echo "msg add successfully";
            } else {
                echo "msg add failed";
            }
        }else {
            echo "error";
            sleep(3);
            header ("Location:login.php");
        }
    }


    function login(){
        session_start();
        $username = $_POST['username'];
        $password = $_POST['password'];
        if ($username != "" && $password != ""){
            $sql = "select * from user ";
        }

        $sql  =  "SELECT  FROM  WHERE username=?,password=?";
        $q    =  $this->db->query($sql);
        if($q->num_rows() > 0){
        $r = $q->first_row('array');
        }


    }

    function edit(){
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
    }

    function delete(){
        if ($_GET['ajax_delete']) {
            $id = $_GET['id'];
            $delete = "delete from message_board where id=" . $id;
            if (mysqli_query($db, $delete)) {
                echo "delete successfully";
            } else {
                echo "delete failed";
            }
        }
    }

    // //思考中
    // if ($_POST['ajax_mysql']) {
    //     $sql = "select * from message_board order by id asc";//sql指令,order by id照id的順序排列，desc由大至小，asc由小至大
    //     $result = mysqli_query($db, $sql);//執行指令
    //     if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
    //     }
    // }

    // if ($_GET['ajax_edit']) { //null or number
    //     $id = $_GET["id"];
    //     $sql = "select * from message_board WHERE id=".$id;
    //     $result = mysqli_query($db,$sql);
    //     $row = mysqli_fetch_assoc($result);
    //     // echo $row." ".$row["name"]." ".$row["msg"];
    //     $response = array(
    //         'name' => $row["name"],
    //         'msg'=> $row["msg"]
    //     );
    //     // echo json_encode($response); 
    //     echo $response; 
    // }

}

?>