<?php
//載入必要的資料庫資料password.php
require_once("password.php");
class db {
    public function index() {
        $db = mysqli_connect($servername, $username, $password, $dbname);
        return $db;
        // //確認資料庫是否連線成功，成功後註解掉即不會顯示多餘的連線文字
        // if($db) {
        //     echo "data connection successfully<br>";
        // } else {
        //     die("data connection failed<br>");
        // }
    }
}