$(document).ready(function() {
    $('.add-todo').click(function() {
        const text = $('input[name=todo]').val()
        // alert(text)

        $('list').append(`
        <div class="list-item">
            <div class="list-item_state">0</div>
            <div class="list_item_content">${text}</div>
            <button class="list_item_action">recart no complete</button>
        </div>
        `)
        $('input[name=todo]').val('')
    })
})