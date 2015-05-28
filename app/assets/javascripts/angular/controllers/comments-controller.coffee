'use strict'

app.controller 'CommentsController', ['$scope', ($scope) ->
  $scope.sendLike = (id) ->
    $.ajax
      url: "/comments/" + id + "/like"
      type: "PATCH"
      complete: (data) ->
        $(".fa.fa-thumbs-up").parent().addClass("liked-bt")

  $scope.sendUnLike = (id) ->
    $.ajax
      url: "/comments/" + id + "/unlike"
      type: "PATCH"
      complete: (data) ->
        $(".fa.fa-thumbs-up").parent().removeClass("liked-bt")
]

