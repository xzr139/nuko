'use strict'

app.controller 'TagsController', ['$scope', ($scope) ->
  $scope.follow = (targetId) ->
    $.ajax
      url: "/tags/#{targetId}/follow"
      type: "PATCH"
      data:
        target_id: targetId
      complete: (data) ->
        $("#follow-bt").addClass("follow-bt")

  $scope.unfollow = (targetId) ->
    $.ajax
      url: "/tags/#{targetId}/follow"
      type: "PATCH"
      data:
        target_id: targetId
      complete: (data) ->
        $("#follow-bt").removeClass("follow-bt")
]
