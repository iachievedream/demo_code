<?php

// $data = json_decode(file_get_contents('db.php'), true);

// //IN controller
// public function recieveJson(Request $request)
// {
//     $request->json()->all();
// //返回值是一個陣列
// //針對前面的請求例子，json方法返回的是陣列 ["foo" => "bar"]
// //$request->json()返回的是ParamBage
// }


// $myObj->name = "John";
// $myObj->age = 30;
// $myObj->city = "New York";

// $myJSON = json_encode($myObj);
// echo $myJSON;


header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');
    $response = array(
        'id' => '1',
        'value1'=> 'value1',
        'value2'=> 'value2'
    );
echo json_encode($response); 


$response = array();
$response[0] = array(
    'id' => '1',
    'value1'=> 'value1',
    'value2'=> 'value2'
);
$myJSON = json_encode($response[0]);
echo $myJSON;
?>