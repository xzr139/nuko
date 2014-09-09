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
        $(current).text(I18n.t('notes.stock_this_note'))


validationOnInput = ->
  $('#new_note').validate
    rules: {
      'note[title]': {
        required: true
        maxlength: 40
      }
      'note[tag_list]': {
        required: true
        maxlength: 5000
      }
      'note[content]': {
        required: true
        maxlength: 5000
      }
    }
    messages: {
      'note[title]': {
        required: '文字が入力されていません'
        maxlength: "40文字以内にして下さい"
      }
      'note[tag_list]': {
        required: '文字が入力されていません'
        maxlength: "40文字以内にして下さい"
      }
      'note[content]': {
        required: true
        maxlength: "5000文字以内にして下さい"
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
