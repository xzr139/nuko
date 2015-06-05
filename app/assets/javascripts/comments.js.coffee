validationOnInput = ->
  $('#new_comment').validate
    rules: {
      'comment[content]': {
        required: true
      }
    }
    messages: {
      'comment[content]': {
        required: I18n.t('validation.required_content')
      }
    }

$ ->
  validationOnInput()
