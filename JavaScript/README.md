# README

# 目錄
[JavaScript](#JavaScript)
[jQuery](#jQuery)
[Ajax](#Ajax)
[json](#json)

# JavaScript

alert()跳出訊息

console.log(fruits):印出訊息

字串部分需要加""

新增：javaScript list push
~~~javascript
var fruits = ["Banana", "Orange"];

console.log(fruits)
>["Banana", "Orange"]

fruits.push("Kiwi");
3

console.log(fruits)
>["Banana", "Orange", "Kiwi"]
~~~
打印指定的list
~~~javascript
fruits[0]
>Banana
~~~javascript
更新指定的list
~~~javascript
fruits[0]="abc"
>"abc"

console.log(fruits)
>["abc", "Orange", "Kiwi"]
~~~

移除：javaScript remove array element
~~~javascript
var myFish = ['angel', 'clown', 'drum', 'mandarin'];

var removed = myFish.splice(1, 2);

console.log(myFish)
>['angel', 'mandarin']

>mandarin被刪除一個(第二個list，連續刪除兩個list字串內容)
~~~javascript
https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/splice

~~~
JavaScript Function Parameters




[目錄](#目錄)

# jQuery 

文檔的就緒事件，保證全部載入後執行
~~~javascript
$(document).ready(function(){
--- jQuery functions go here ----
});
~~~

按鈕：隱藏，顯示
~~~javascript
$("#hide").click(function(){
  $("p").hide();
});

$("#show").click(function(){
  $("p").show();
});

$(selector).hide(speed,callback);

slow，fast，
function

$("button").click(function(){
  $("p").hide(1000);
});


$(selector).toggle(speed,callback);


$("button").click(function(){
  $("p").toggle();
});

下滑元素
$(selector).slideDown(speed,callback);

$("#flip").click(function(){
  $("#panel").slideDown();
});

上滑元素
$(selector).slideUp(speed,callback);

$("#flip").click(function(){
  $("#panel").slideUp();
});

滑動元素(上面兩者皆可)

$(selector).slideToggle(speed,callback);

$("#flip").click(function(){
  $("#panel").slideToggle();
});


定義動畫
$(selector).animate({params},speed,callback);

$("button").click(function(){
  $("div").animate({left:'250px'});
}); 

$("button").click(function(){
  $("div").animate({
    left:'250px',
    opacity:'0.5',
    height:'150px',
    width:'150px'
  });
}); 

$("button").click(function(){
  var div=$("div");
  div.animate({left:'100px'},"slow");
  div.animate({fontSize:'3em'},"slow");
});


$(selector).stop(stopAll,goToEnd);

$("#stop").click(function(){
  $("#panel").stop();
});

~~~



[目錄](#目錄)

# Ajax

~~~javascript
$.get(URL,callback);

$("button").click(function(){
  $.get("demo_test.asp",function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});


$.post(URL,data,callback);

$("button").click(function(){
  $.post("demo_test_post.asp",
  {
    name:"Donald Duck",
    city:"Duckburg"
  },
  function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});


jQuery ajax - ajax() 方法

$(document).ready(function(){
  $("#b01").click(function(){
  htmlobj=$.ajax({url:"/jquery/test1.txt",async:false});
  $("#myDiv").html(htmlobj.responseText);
  });
});


<div id="myDiv"><h2>Let AJAX change this text</h2></div>
<button id="b01" type="button">Change Content</button>

~~~


[目錄](#目錄)

## json


~~~

~~~

[目錄](#目錄)
