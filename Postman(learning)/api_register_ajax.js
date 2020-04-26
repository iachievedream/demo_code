var requestURL = "http://127.0.0.1:8000/api/";
// $.ajax({
//     url: requestURL,
//     dataType: "json",
//     // data: data,
//     // type: "POST",
//     type: "GET",
//     // data: data, // 不用JSON.stringify()
//     // data: JSON.stringify(dataJSON),
//     // contentType: "application/json;charset=utf-8",
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
$.ajax({
    url: requestURL,
    dataType: "json",
    type: "GET",
    contentType: "application/json;charset=utf-8",
    success: function (response) {
        const charge = [];
        charge.push(...response);
        createDomElement(charge);
    },
    error: function (thrownError) {
        console.log(thrownError);
    }
});

function createDomElement(charge) {
    const domElements = charge.map(place => {
        return `
                <li>
                <p class="location">位置： ${ place.author}</p>
                </li>
                `;
    }).join("");
    const chargeList = document.querySelector('.charge-list');
    chargeList.innerHTML = domElements;
}


//     success: function (response) {
//         // response.data;
//         // alert(response); //這裡目前印出 
//         // console.log(response);

//         const charge = [];
//         charge.push(...response);
//         createDomElement(charge);
//     },
//     error: function (thrownError) {
//         console.log(thrownError);
//     }
// });
// function createDomElement(charge) {
//     const domElements = charge.map(place => {
//         return `
//             <li>
//             <p class="location">位置： ${ place.author}</p>
//             </li>
//             `;
//     }).join("");

//     const chargeList = document.querySelector('.charge-list');
//     chargeList.innerHTML = domElements;
// }


// $.ajax({
//     // method: "GET",
//     type: "POST",
//     url: requestURL,
//     // data: data,
//     dataType: "json",
//     done(function (returnData) {
//         console.log(returnData);
//     }),
// });