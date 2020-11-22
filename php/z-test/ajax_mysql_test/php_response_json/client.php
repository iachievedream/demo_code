<p id="demo"></p>

<script>
var xmlhttp = new XMLHttpRequest();

xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    // myObj = JSON.parse(this.responseText);
    // document.getElementById("demo").innerHTML = myObj.name+" "+myObj.age+" "+myObj.city;
    myObj = JSON.parse(this.responseText);
    document.getElementById("demo").innerHTML = myObj.id+myObj.value1;
  }
};
xmlhttp.open("GET", "server.php", true);
xmlhttp.send();
</script>