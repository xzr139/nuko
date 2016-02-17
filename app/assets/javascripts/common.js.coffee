setTimeout (->
  $('.alert.fade.in').hide 'highlight', '', 800
  return
), 2500

$ ->
  autosize($("textarea"))
  $(".alert.fade.in").click ->
    $(this).hide('highlight', '', 800)
