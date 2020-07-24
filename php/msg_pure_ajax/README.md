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