<?php
global $con;
$con = mysqli_connect('localhost','root','12345678','product','3306');
if(!$con){
    echo 'unable to connect with db';die;
}
