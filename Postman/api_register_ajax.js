var requestURL = "http://127.0.0.1:8000/api/";
$.ajax({
  "url": requestURL,
  "method": "GET",
  "timeout": 0,
  "headers": {
    "Accept": "application/json",
    "Content-Type": "application/json"
  },
  success: function (response) {
    $('.info').html('抓到資料囉!');
    // $('.info').append(response.message);// 搜尋術，.each使用vue
    $.each(response.data[0], function (index, element) {
      $('.info').append(
        $('<li>', { text: [index] + '：' + element }),
        // $('<li>', { text: [index] +  '地址：' + element[0]}),
        $('<p>')
      );
    });
  },
  error: function (jqXHR, textStatus, errorThrown) {
    document.getElementById("message").innerHTML = errorThrown;
  }
});

// $.ajax({
//     url: requestURL,
//     dataType: "json",
//     type: "GET",
//     // data: data, // 不用JSON.stringify()
//     // data: JSON.stringify(dataJSON),
//     contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // 不能用 'application/json; charset=utf-8'
//     success: function (returnData) {
//         // response.data;
//         // alert(response); //這裡目前印出 
//         console.log(returnData);
//     },
//     // error: function (xhr, ajaxOptions, thrownError) {
//     //     console.log(xhr.status);
//     //     console.log(thrownError);
//     // }
// });

//     success: function (response) {
//         const charge = [];
//         charge.push(...response);
//         createDomElement(charge);
//     },
//     error: function (thrownError) {
//         console.log(thrownError);

// function createDomElement(charge) {
//     const domElements = charge.map(place => {
//         return `
//                 <li>
//                 <p class="location">位置： ${ place.author}</p>
//                 </li>
//                 `;
//     }).join("");
//     const chargeList = document.querySelector('.charge-list');
//     chargeList.innerHTML = domElements;
// }
