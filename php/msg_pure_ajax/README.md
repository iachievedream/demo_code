

#  ajax
ajax參數介紹
~~~
$.post("deal.php",{msg:  $("#idname").val()},function(data)  {alert(data);});
________伺服端檔案__帶入參數_________________________________回傳參數
~~~
範例
~~~php
<script  type="text/javascript">
    $(document).ready(function(){
        $("#add").click(function(){
            var  name  =  $("#idname").val();
            var  msg  =  $("#idmsg").val();   
            $.post("deal.php",{
                name:  name,
                msg:  msg
            },function(data)  {
                alert(data);
            });
        });
    );
</script>
~~~

~~~php
    $.ajax({
        url: "deal.php",
        type: "POST",
        dataType: "json",
        data: {
         //  name:$("input:text").val
            name:  name,
            msg:  msg},
        success:  function(data)  {
            alert("success");},
        error:  function(data)  {
            alert("error");},
        complete:  function(data)  {
            alert("complete");
        }
    });
~~~

錯誤方式
~~~php
    $.post("deal.php",{
        name: nameVal,
        msg: msgVal  },
        success: function(data) {
            alert(data);},
        error: function(data) {
            alert(data);
        });
~~~

## 開發過程
### 07 24 form
$.get({})上面沒有執行正確以及錯誤的判斷功能。
了解mysql的關聯式外鍵的功能以及設定(主鍵有的資訊，外鍵再添加資料的時候才可順利加入)，

### 07 25 form

### 07 26 ajax
#add上面的$.ajax({})顯示是兩個object
在
.ajax_delete上面的$.get({})則是正確的字串內容

table欄位設計重新做縮排的處理。

在另外一個資料架內則是建立ajaz_mysql_test做ajax的即時刷新測試，了解ajax更詳細的功能，
在json的部分也是做相同的測試。