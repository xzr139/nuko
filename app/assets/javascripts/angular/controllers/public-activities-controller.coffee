'use strict'

app.controller 'PublicActivitiesController', ['$scope', 'Activity', ($scope, Activity) ->
  $scope.init = (activity_id) ->
    $scope.activity_id = activity_id

  $scope.update = ($event) ->
    Activity.update({id: $scope.activity_id})
]
