
$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale;
  I18n.locale = locale;
  I18n.fallbacks = true;
  $('.btn.btn-primary.stock-button.stock-bt').click ->
    current = this

    if $(current).text().replace(/\s+/g,  "") == I18n.t('notes.stock_this_note') && $(current).attr('data-stocked') == 'false'
      $.ajax
        url: "/#{locale}/stocks"
        type: 'POST'
        data:
          note_id: $(current).attr('data-note-id')
          user_id: $(current).attr('data-user-id')
          callback_url: location.pathname
        complete: (data) ->
          $(current).text(I18n.t('common.stocked'))
    else
      $.ajax
        url: "/#{locale}/stocks"
        type: 'PATCH'
        data:
          note_id: $(current).attr('data-note-id')
          user_id: $(current).attr('data-user-id')
          callback_url: location.pathname
        complete: (data) ->
          if $(current).text().replace(/\s+/g,   "") == I18n.t('notes.stock_this_note')
            $(current).text(I18n.t('common.stocked'))
          else
            $(current).text(I18n.t('notes.stock_this_note'))
