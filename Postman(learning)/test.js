const endpoint = 'https://data.kcg.gov.tw/dataset/a98754a3-3446-4c9a-abfc-58dc49f2158c/resource/48d4dfc4-a4b2-44a5-bdec-70f9558cd25d/download/yopendata1070622opendatajson-1070622.json';
$.ajax({
    type: "GET",
    url: endpoint,
    dataType: "json",
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
                <p class="location">位置： ${ place.Location}</p>
                <p class="address">地址：${ place.Address}</p>
                </li>
                `;
    }).join("");

    const chargeList = document.querySelector('.charge-list');
    chargeList.innerHTML = domElements;
}
