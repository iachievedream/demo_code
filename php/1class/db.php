<?php
class db {
    // require_once("password.php");
    private $servername = 'localhost';
    private $dbname = 'pure_php';
    private $username = 'root';
    private $password = '12345678';
    public $abc ="12345";

    public function index(){
        $db = mysqli_connect($this->servername,$this->username,$this->password,$this->dbname);
        return $db;
    }
}
// $con = new db();
// echo $con->index();
// echo "123";