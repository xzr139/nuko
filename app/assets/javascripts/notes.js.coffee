createStock = (current) ->
  stocked = $(current).text().replace(/\s+/g,  "") == I18n.t('common.stocked')

  $.ajax
    url: "/stocks"
    type: "PATCH"
    data:
      note_id: $(current).attr('data-note-id')
      user_id: $(current).attr('data-user-id')
    complete: (data) ->
      unless stocked
        $(current).text(I18n.t('common.stocked'))
        $(".number-of-stocks > .counts").text(parseInt($(".number-of-stocks > .counts").text().replace(/\s+/g,   "")) + 1)
      else
        if location.pathname.match(/stocks/i)
          $(current).parent().parent().hide('blind', '', 800)
        else
          $(current).text(I18n.t('notes.stock_this_note'))
          $(".number-of-stocks > .counts").text(parseInt($(".number-of-stocks > .counts").text().replace(/\s+/g,   "")) - 1)

$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale
  I18n.locale = locale
  I18n.fallbacks = true

  $("abbr.timeago").timeago()
  $('.btn.btn-primary.stock-button.stock-bt').click ->
    createStock(this)
