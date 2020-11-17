<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="jquery.min.js"></script>
</head>
<body>
    <div id="content"></div>
<script>

// $(document).on("ready", function(){
//     loadData();
// }); 
// var loadData = function(){
//     $.ajax({
//         type:"POST",
//         url:"db.php"
//     }).done(function(data){
//         console.log(data);
//         var users = JSON.parse(data);
//         for(var i in users){
//             $("#content").append(users[ i ].name + " " + users[ i ].msg + "<br>");
//         }
//     });
// }
// $(document).ready(function() {
//     startLoop();
// });
var frequency = 5000; // 5 seconds in miliseconds
var interval = 0;
// STARTS and Resets the loop
function startLoop() {
    if (interval > 0) clearInterval(interval); // stop
    interval = setInterval("loadData()", frequency); // run
}
function loadData() {
    $.ajax({
        type: "POST",
        url: "db.php"
    }).done(function(data) {
        console.log(data);
        var users = JSON.parse(data);
        $("#content").empty();
        for (var i in users) {
            $("#content").append(users[i].name + " " + users[i].msg + "<br>");
        }
    });
}
</script>

</body>
</html>

