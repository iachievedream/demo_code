<?php
require_once("db.php");
// $con = new db();
// $abc = $con->abc;
// echo $abc;

class Php_mysql
{
    //使用$_POST接住表單傳送過來的資料，確認新增留言有點選，後續執行sql指令，並判斷是否新增成功
    public function select($id)
    {
        // echo "123";
        $con = new db();
        $sql = "SELECT name,msg FROM message_board where id='$id'";
        $result = mysqli_query($con->index(), $sql);//執行指令
        if (mysqli_num_rows($result) > 0) {//共取得幾筆記錄
            while ($row = mysqli_fetch_assoc($result)) {//取一筆個別列出
                echo $row["id"].$row["msg"];
            }
        }
    }
}
$mysql = new Php_mysql();
$abc = $mysql->select("2");
echo $abc;

    // // 防SQL注入攻擊(Injection)
    // public function select2($id){
    //     // 預處理及綁定
    //     $sql = $conn->prepare("SELECT name,msg FROM table AND id=?");
    //     $sql->bind_param("s", $id);
    //     // 設置參數並執行
    //     $id = "2";
    //     $sql->execute();
    // }

    // // CodeIgniter 框架 防SQL注入攻擊
    // class function php_mysql{
    //     public function FunctionName($id) {
    //         $sql = "SELECT * FROM table AND id=?";
    //         // echo $sql;
    //         $q = $this->db->query($sql,$id);
    //         if($q->num_rows()>0) {
    //             $r[] = $q->result_array();
    //         }
    //         // echo "<pre>";print_r($r);echo "</pre>";
    //         return $r;
    //     }
    // }

?>