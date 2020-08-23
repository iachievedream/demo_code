<?php
// class db{
//     // require_once("password.php");
//     // $servername = "localhost";
//     // $username = "username";
//     // $password = "password";
//     // $dbname = "myDBPDDO";
//     // $db = mysqli_connect($servername,$username,$password,$dbname);
// }
// $conn = new db;

//使用$_POST接住表單傳送過來的資料，確認新增留言有點選，後續執行sql指令，並判斷是否新增成功
public select1($id){
    $sql = "SELECT name,msg FROM table AND id='$id'";
    $result = mysqli_query($conn, $sql);//執行指令
    if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
        while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
            echo $row["id"].$row["msg"];
        }
    }
}

// 防SQL注入攻擊(Injection)
public select2($id){
    // 預處理及綁定
    $sql = $conn->prepare("SELECT name,msg FROM table AND id=?";
    $sql->bind_param("s", $id);
    // 設置參數並執行
    $id = "2";
    $sql->execute();
}

// CodeIgniter 框架 防SQL注入攻擊
class php_mysql{
    public function FunctionName($id) {
        $sql = "SELECT * FROM table AND id=?";
        // echo $sql;
        $q = $this->db->query($sql,$id);
        if($q->num_rows()>0) {
            $r[] = $q->result_array();
        }
        // echo "<pre>";print_r($r);echo "</pre>";
        return $r;
    }
    
}

?>