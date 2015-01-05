`setTimeout(function(){$(".alert.fade.in").hide('highlight', '', 800)}, 2500)`

$ ->
  $(".alert.fade.in").click ->
    $(this).hide('highlight',  '',  800)
