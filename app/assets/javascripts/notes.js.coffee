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

$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale;
  I18n.locale = locale;
  I18n.fallbacks = true;
  $('.btn.btn-primary.stock-button.stock-bt').click ->
    createStock(this)
