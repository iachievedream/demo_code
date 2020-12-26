# JavaScript

# 目錄
[變數命名標準_型別_字首](#變數命名標準_型別_字首)

[常數_變數_函數](#常數_變數_函數)

[array](#array)

[資料型態_Data_Types](#資料型態_Data_Types)

[input](#input)

[objet](#objet)
* [Object_Methods](#Object_Methods)
  
[date](#date)
* [Compare_Dates](#Compare_Dates)

[json](#json)
* [PHP](#PHP)

[BOM](#BOM)
* [DOM_Traversing](#DOM_Traversing)
* [Event](#Event)
* [API](#API)

[OOP](#OOP_Object_oriented_programming)

## 變數命名標準_型別_字首
~~~
array 	 陣列	a
boolean  布林值	b
float  	 浮點數	l
function 函式	fn
int 	 整型	i
object   物件	o
regular  正則	r
string   字串	s
~~~

## 常數_變數_函數
~~~
//const
const x=3;

//var
var x=3;

//let 不允許宣告同變數
let numberOfStudents

//function
function setBackgroundColor()
~~~

## array
~~~
var fruits = ['Apple', 'Banana'];
var first = fruits[0];

取得陣列長度 (length)
// 輸出 2
console.log(fruits.length)

你可以用 push() 方法來新增元素到陣列最後面：
var fruits = ['Apple', 'Banana'];

fruits.push('Orange');
fruits[fruits.length] = 'Orange';

// 輸出 ["Apple", "Banana", "Orange"]
console.log(fruits);

fruits.unshift('Orange');
// 輸出 ["Orange", "Apple", "Banana"]
console.log(fruits);
~~~

## 資料型態_Data_Types
typeof 運算字用來判斷一個運算元 (operand) 是什麼資料型態。
~~~
// 輸出 string
console.log(typeof 'hello');
// 輸出 number
var num = 1;
console.log(typeof num);
~~~

## input
~~~
console.log('Hello')
console.log('變數abc的值', abc)
console.log(test.length)

//alert屬於window物件
window.alert('Hello')
alert('Hello')

document.write('Hello')

//innerHTML
document.getElementById("demo").innerHTML = 'Hello'
<div id="demo"></div>
~~~

## objet
~~~
var obj = {x:2,y:4,z:6};
console.log(obj['x']);
console.log(obj.x);
====================================
var myObj = new Object();
var myObj = {};
var propName = 'color';

// 建立一個叫 color 的屬性，值是 blue
myObj.color = 'blue';
myObj['color'] = 'blue';
myObj[propName] = 'blue';

// 存取物件屬性
var myColor = myObj.color;
var myColor = myObj['color'];
console.log(myObj[propName]);
~~~
### Object_Methods
~~~
var me = {
    firstName: 'Mike',
    lastName: 'Lee',
    age: 30,
    fullName: function() {
        return this.firstName + ' ' + this.lastName;
    }
}

// name = 'Mike Lee'
var name = me.fullName();
~~~
## date
~~~
var today = new Date();
new Date(milliseconds);

new Date(year, month[, date[, hours[, minutes[, seconds[, milliseconds]]]]]);

// Sun Dec 17 1995 23:30:15 GMT+0800 (CST)
var birthday = new Date(1995, 11, 17, 23, 30, 15);
~~~
dateString
~~~
new Date(dateString);

// Tue Mar 15 2016 08:00:00 GMT+0800 (CST)
var someday = new Date('Wed Mar 15 2016 08:00:00 GMT+0800 (CST)');
~~~
### Compare_Dates
~~~
var today = new Date();
var someday = new Date(2022, 10, 1);

if (someday > today) {
    alert('Today is before 2022/10/1.');
} else {
    alert('Today is after 2022/10/1.');
}

但如果你要比較兩個日期是否相等 - 運算子 ==, !=, === 或 !==，你沒辦法直接比較，而是要先將 Date 物件用 date.getTime() 轉換為數值型態才能比較：

var d1 = new Date(2016, 1, 1);
var d2 = new Date(2016, 1, 1);

var same = d1.getTime() === d2.getTime();    // true
var notSame = d1.getTime() !== d2.getTime(); // false
~~~

## json
~~~
用來將 JSON 字串轉換成 JavaScript 物件。
JSON.parse(text)

// [1, 5, "false"]
JSON.parse('[1, 5, "false"]');

myObj = JSON.parse(this.responseText);
echo json_encode($response); 

用來將 JavaScript 物件轉換成 JSON 字串。
JSON.stringify(value)

// '[1,"false",false]'
JSON.stringify([1, 'false', false]);
~~~
### PHP
json_decode() 用來將 JSON 文字解析成 PHP 資料型態。
json->array,object[參數有false]
~~~php
<?php
$json = '{"a":1,"b":2}';
var_dump(json_decode($json, true));
?>

array(5) {
    ["a"] => int(1)
    ["b"] => int(2)
}
~~~
json_encode() 用來將 PHP 資料型態轉換成 JSON 文字。
array->json
~~~php
<?php
$arr = array('a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5);
echo json_encode($arr);
?>

{"a":1,"b":2,"c":3,"d":4,"e":5}
~~~

## BOM
瀏覽器物件模型 BOM (Browser Object Model)
~~~
window: 讓你可以存取操作瀏覽器視窗
screen: 讓你可以存取使用者的螢幕畫面資訊
location: 讓你可以存取操作頁面的網址 (URL)
history: 讓你可以操作瀏覽器的上一頁、下一頁
navigator: 讓你可以存取瀏覽器資訊
Popup: 讓你可以使用瀏覽器內建的彈跳視窗
Timer: 讓你可以使用瀏覽器內建的計時器
cookie: 讓你可以管理瀏覽器的 cookie
~~~

### DOM_Traversing
~~~
var elem = document.getElementById('id');
var elem = document.getElementsByTagName('p');
var elem = document.getElementsByName('name');
var test = parentDOM.getElementsByClassName('class');

~~~
document.getElementById 用來根據 id 取得一個 HTML 元素。

### Event
~~~
<button onclick="triggerAlert();">click me</button>

$('p').click(function() {
  $(this).css('background-color', 'blue');
});

$('p').click();
~~~

### API
API = DOM + JavaScript。

### OOP_Object_oriented_programming

~~~
定義類別的屬性 (Property) - this

var Person = function (nickname) {
    this.nickname = nickname;
};


類別的實例 (Instance)，物件 - new

var mike = new Person('Mike');

~~~


箭頭函式(Arrow Functions)

https://www.fooish.com/

https://www.fooish.com/json/parser.html


~~~javascript
document.addEventListener('DOMContentLoaded',function() {
	// 作用函數
	// var setRadioValue = function(name,value) {
	//選項的內容
	var elems = document.getElementsByName('user_Num_method');

	//json的數值
	var permission = <?php echo json_encode($r) ?>;
	//列出第一欄紀錄的數值
	var permission_value_Num = permission['permission_value'];

	for(var i = 0,len = elems.length;i<len;i++) {
		var elem = elems.item(i);
		//elem.value//選項內容的數值
		if(elem.value == permission_value_Num) {
			elem.checked = true;
			break;
		}
	}
// 	// }
});

// $(document).ready(function(){
	function getTestNum(){
		var elems = document.getElementsByName('user_Num_method');
		for(var i = 0,len = elems.length;i<len;i++) {
			var elem = elems.item(i);
			if(elem.checked) {
				// alert(elem.value);
				$.ajax({
					url: '/testDeal/',
					type: 'post',
					data: {
						permission_type_id:" ",
						permission_value:elem.value
						},
					dataType: 'json',
					success: function(json) {
						if(json['success']){
							// $(obj).parent('div').remove();
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				break;
			}
		}
	}
// });
~~~

