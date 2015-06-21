'use strict'

app.controller 'FeedsController', ['$scope', ($scope) ->
  if Boolean(location.pathname.match(/public/g))
    $scope.publicSelected = true
  else
    $scope.feedSelected = true
]
