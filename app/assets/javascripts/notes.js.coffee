createStock = (current) ->
  notStocked = $(current).text().replace(/\s+/g,  "") == I18n.t('notes.stock_this_note') && $(current).attr('data-stocked') == 'false'

  $.ajax
    url: "/stocks"
    type: "PATCH"
    data:
      note_id: $(current).attr('data-note-id')
      user_id: $(current).attr('data-user-id')
    complete: (data) ->
      if notStocked
        $(current).text(I18n.t('common.stocked'))
      else
        $(current).parent().parent().hide('blind', '', 800)


validationOnInput = ->
  $('#new_note').validate
    rules: {
      'note[title]': {
        required: true
        maxlength: 40
      }
      'note[tag_list]': {
        required: true
        maxlength: 40
      }
      'note[content]': {
        required: true
        maxlength: 5000
      }
    }
    messages: {
      'note[title]': {
        required: I18n.t('validation.required_title')
        maxlength: I18n.t('validation.max_length', limit: 40)
      }
      'note[tag_list]': {
        required: I18n.t('validation.required_tag_list')
        required: '文字が入力されていません'
        maxlength: I18n.t('validation.max_length', limit: 40)
      }
      'note[content]': {
        required: I18n.t('validation.required_content')
        maxlength: I18n.t('validation.max_length', limit: 5000)
      }
    }

$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale;
  I18n.locale = locale;
  I18n.fallbacks = true;

  validationOnInput()

  $('.btn.btn-primary.stock-button.stock-bt').click ->
    createStock(this)
