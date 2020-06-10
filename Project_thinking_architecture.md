# Project_thinking_architecture

## 先思考會使用怎樣的元素：
活動或是線上商城的建構為主題。
圖片，產品資料以及價格。
會員註冊以及登入所需資料內容。

## 知道整體的架構有哪些的內容
<img src="https://github.com/iachievedream/demo_code/blob/master/picture/project_thinking_architecture.png" width="50%" height="50%" />

## 思考這些元素該怎樣的搭配
資料庫的設計：
會員資料：
id,name,password,name_content

CRETE TABLE ''(
    id int(5) not null,
    name varchar(10) not null,
    user varchar(15) not null,
    password varchar(20) not null
);


產品資料：
id,product,money,product_content

## 思考前端的架構

前端的內容：
註冊頁面，登入頁面，
產品展售頁面，結帳頁面，
留言頁面

排版：

## 思考後端的架構

