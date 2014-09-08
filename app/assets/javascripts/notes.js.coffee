
$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale;
  I18n.locale = locale;
  I18n.fallbacks = true;

  $('.btn.btn-primary.stock-button.stock-bt').click ->
    current = this
    $.ajax
      url: "/#{locale}/stocks"
      type: 'POST'
      data:
        note_id: $(this).attr('data-note-id')
        user_id: $(this).attr('data-user-id')
      complate: (data) ->
        $(current).text(I18n.t('notes.stock_this_note'))
