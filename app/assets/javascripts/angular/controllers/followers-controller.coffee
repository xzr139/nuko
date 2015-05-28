'use strict'

app.controller 'FollowersCtrl', ['$scope', ($scope) ->
  $scope.follow = (userId) ->
    $.ajax
      url: "/followers"
      type: "PATCH"
      data:
        user_id: userId
      complete: (data) ->
        $("#follow-bt").addClass("follow-bt")

  $scope.unfollow = (userId) ->
    $.ajax
      url: "/followers"
      type: "PATCH"
      data:
        user_id: userId
      complete: (data) ->
        $("#follow-bt").removeClass("follow-bt")
]
