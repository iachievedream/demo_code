<?php
require_once("password.php");
try{
    $connection = new PDO("mysql:host=$servername;port=3306;dbname=$dbname;charset=utf8", $username, $password);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);//主動丟擲 exceptions 異常
    // echo "連線成功";
} catch (PDOException $e) {
    echo $e->getMessage();
}