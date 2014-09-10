# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

validationOnInput = ->
  $('.edit_user').validate
    rules: {
      'user[nick_name]': {
        required: true
        maxlength: 15
      }
      'user[bio]': {
        maxlength: 300
      }
    }
    messages: {
      'user[nick_name]': {
        required: '文字が入力されていません'
        maxlength: "40文字以内にして下さい"
      }
      'user[bio]': {
        maxlength: "5000文字以内にして下さい"
      }
    }

$ ->
  $("textarea").autosize()
  $("input[id=user_avatar]").change ->
    $("#avatar-input").val this.value.split('\\').pop()

  validationOnInput()
