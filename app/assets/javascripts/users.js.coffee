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
        required: I18n.t('validation.required_nick_name')
        maxlength: I18n.t('validation.max_length', limit: 15)
      }
      'user[bio]': {
        maxlength: I18n.t('validation.max_length', limit: 300)
      }
    }

$ ->
  $("textarea").autosize()
  $("input[id=user_avatar]").change ->
    $("#avatar-input").val this.value.split('\\').pop()

  validationOnInput()
