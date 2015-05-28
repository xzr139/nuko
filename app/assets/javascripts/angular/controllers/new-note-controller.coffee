'use strict'

app.controller 'newNoteCtrl', ['$scope', ($scope) ->
  $scope.tags = new Array

  for i in [0...1]
    $scope.tags[i] = {}
    i++

  $scope.addTag = (index) ->
    $scope.tags[index + 1] = {}

  $scope.deleteTag = (index) ->
    $scope.tags.splice index, 1

  $scope.last = ->
    $scope.tags.length < 5

  $scope.mergeTags = ->
    tagName = new String
    $("[name='tag_list']").each ->
      tagName += "," + $(this).val()
    $("#note_tag_list").attr("value", tagName.slice(1))

  $scope.parseMarkdown = ->
    $("#preview").html(marked($scope.content))
    return
]

