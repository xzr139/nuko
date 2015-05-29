'use strict'

app.controller 'FollowersController', ['$scope', 'FollowActivity', ($scope, FollowActivity) ->
  $scope.follow = (userId) ->
    FollowActivity.update({ user_id: userId })
]
