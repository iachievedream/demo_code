<?php
if ($_FILES["fileUpload"]["error"] == 0) {
    if (move_uploaded_file($_FILES["fileUpload"]["tmp_name"], "./upload/" . $_FILES["fileUpload"]["name"])) {
        echo "上傳成功<br>";
    } else {
        echo "上傳錯誤";
        echo "錯誤原因:" . $_FILES["fileUpload"]["error"];
    }
}
?>

<!-- "./upload/"
：前後都需要有/

index.php的input當中的name，fileUpload

$_FILES關鍵 -->