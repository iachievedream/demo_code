# README

js練習
## 基本的顯示
~~~js
console.log("Hello World！！");//console的顯示
alert("content");//彈出視窗的顯示
~~~
## 變數
~~~js
var name;
let name;//不允許變數重複
const PI = 3.14;
~~~
## 計算
~~~js
console.log(1 + 2); // 印出 3

var redius = 10;
const PI = 3.14;
var perimeter = 2*redius*PI;
console.log("圓周長為" + perimeter); // 印出 圓周長結果
~~~

## 顯示到html裡面(前者為id，後者為js的變數)
~~~js
document.getElementById('perimeter_id').textContent = perimeter;
~~~
## funtion
~~~js
<body>
    <p>x為<em id="x_num"></em> 公分</p>
    <p>相加結果為：<em id="num_id"></em></p>
</body>
<script>
function add(x , y){
    add_num = x + y;
    console.log(add_num);//console顯示
    return add_num ;//輸出到add的函數
}

num = add(2,1);
document.getElementById('num_id').textContent = num;
</script>
~~~

## array 

~~~js
var test = ["abc", "efg", "123","456"];
console.log(array.length);   //長度為四的array個數，
console.log(array[0]);

test.push("push");//增加至最後一個
test.unshift("unshift");//增加至最前面一個
console.log(test);
//["unshift", "abc", "efg", "123","456", "push"]

test.pop();//取出最後一個
console.log(test);
//["unshift", "abc", "efg", "123","456"]

test.shift();//取出最前面一個
console.log(test);
//["abc", "efg", "123","456"]

~~~

## object


參考資料：[JavaScript 新手筆記](https://ithelp.ithome.com.tw/users/20108856/ironman/2474)


