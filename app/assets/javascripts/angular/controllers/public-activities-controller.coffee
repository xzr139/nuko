'use strict'

app.controller 'PublicActivitiesController', ['$scope', 'Activity', ($scope, Activity) ->
  $scope.update = (activity_id) ->
    Activity.update({ id: activity_id })
]
