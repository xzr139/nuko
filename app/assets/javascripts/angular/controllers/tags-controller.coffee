'use strict'

app.controller 'TagsController', ['$scope', 'TagFollowActivity', ($scope, TagFollowActivity) ->
  $scope.follow = (targetId) ->
    TagFollowActivity.update({ target_id: targetId })
]
