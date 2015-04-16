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
        $(".number-of-stocks > .counts").text(parseInt($(".number-of-stocks > .counts").text().replace(/\s+/g,   "")) + 1)
      else
        if location.pathname.match(/stocks/i)
          $(current).parent().parent().hide('blind', '', 800)
        else
          $(current).text(I18n.t('notes.stock_this_note'))
          $(".number-of-stocks > .counts").text(parseInt($(".number-of-stocks > .counts").text().replace(/\s+/g,   "")) - 1)


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
        maxlength: 10000
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

app.controller 'FeedsCtrl', ['$scope', ($scope) ->
  if Boolean(location.pathname.match(/public/g))
    $scope.publicSelected = true
  else
    $scope.feedSelected = true
]

app.controller 'newNoteCtrl', ['$scope', ($scope) ->
  $scope.tags = new Array

  for i in [0...1]
    $scope.tags[i] = {}
    i++

  $scope.addTag = (index) ->
    $scope.tags[index + 1] = {}
    return

  $scope.deleteTag = (index) ->
    $scope.tags.splice index, 1
    return

  $scope.last = ->
    $scope.tags.length <= 5
]
$ ->
  locale = $('html').attr('lang')
  I18n.defaultLocale = locale
  I18n.locale = locale
  I18n.fallbacks = true

  $("abbr.timeago").timeago()

  validationOnInput()

  $('.btn.btn-primary.stock-button.stock-bt').click ->
    createStock(this)
