'use strict'

app.controller 'FeedsController', ['$scope', ($scope) ->
  if /public/.test(location.pathname)
    $scope.publicSelected = true
  else
    $scope.feedSelected = true
]
