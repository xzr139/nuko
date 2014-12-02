app.controller 'FollowersCtrl', ['$scope', ($scope) ->
  $scope.follow = (id) ->
    $.ajax
      url: "/users/" + id + "/followers"
      type: "PATCH"
      complete: (data) ->
        $("#follow-bt").addClass("liked-bt")

  $scope.unfollow = (id) ->
    $.ajax
      url: "/users/" + id + "/followers"
      type: "PATCH"
      complete: (data) ->
        $("#follow-bt").removeClass("liked-bt")
]
