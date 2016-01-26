class window.Editor
  previewPath: '/api/notes/preview.html'

  constructor: (@textArea, @previewArea) ->
    @monitorKeyup @textArea
    @initializePreview()

  initializePreview: () =>
    if @isNotBlank(@textArea)
      @fetchParsedHtml(@textArea.val()).then (data) =>
        @previewArea.html data

  monitorKeyup: (target) ->
    target.on 'keyup', =>
      @fetchParsedHtml(target.val()).then (data) =>
        @previewArea.html data

  fetchParsedHtml: (markdown) =>
    return $.ajax
      url: @previewPath,
      data:
        markdown: markdown
      type: 'POST'
      dataType: 'html'

  isNotBlank: (target) =>
    target.val().length
