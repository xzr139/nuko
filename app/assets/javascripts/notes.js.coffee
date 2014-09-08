
$ ->
  $('.btn.btn-primary.stock-button.stock-bt').click ->
    $.ajax
      url: "/#{location.pathname.split('/')[1]}/stocks"
      type: 'POST'
      data:
        note_id: $(this).attr('data-note-id')
        user_id: $(this).attr('data-user-id')
      success: (data) ->
