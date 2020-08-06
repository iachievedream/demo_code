<?php
$allowedExts = array("jpg","png");
$temp = explode(".",$_FILES["fileUpload"]["name"]);
$extension = end($temp);
if ((($_FILES["fileUpload"]["type"] == "image/jpg")
||($_FILES["fileUpload"]["type"] == "image/png"))
&&in_array($extension,$allowedExts))
{
    if ($_FILES["fileUpload"]["error"] == 0) {
        if (move_uploaded_file($_FILES["fileUpload"]["tmp_name"], "./upload/" . $_FILES["fileUpload"]["name"])) {
            echo "上傳成功<br>";
            // echo $temp;//Arraypng
            // echo $temp[0];//名稱
            // echo $temp[1];//副檔名
            echo $temp[0].".".$temp[1];//完整檔名
            echo $extension;
            // echo $_FILES["fileUpload"]["name"] . "<br>";
            // echo $_FILES["fileUpload"]["tmp_name"] . "<br>";
        } else {
            echo "上傳錯誤";
            echo "錯誤原因:" . $_FILES["fileUpload"]["error"];
        }
    }
}else
{
    echo "非法的文件格式";
}
?>

<!-- "./upload/"
：前後都需要有/

index.php的input當中的name，fileUpload

$_FILES關鍵 -->