## vue

用Webpack把vue把它包起來，devtpul

<a href="https://askiebaby.github.io/what-is-webpack/">關於 Webpack，它是什麼？能夠做什麼？為什麼？怎麼做？— freeCodeCamp 的筆記</a><br>

~~~
<div id="app">
    <div v-html="message.name"></div>
    <div v-html="message.action"></div>
</div>
<script>
new Vue({
    el: '#app',
    data: {
        message:{
            name:'ab',
            action:'hello'
        }
  mounted () {
方法待查

    }
})
</script>
~~~

vue要注意的是html的v-html要先有，<br>
再來才是vue的檔案，所以vue替換的檔案要放在html最後面才能順利執行。
