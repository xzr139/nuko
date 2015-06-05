'use strict'

app.controller 'CommentsController', ['$scope', 'Like', ($scope, Like) ->
  $scope.sendLike = (id) ->
    Like.update({ id: id })
]

