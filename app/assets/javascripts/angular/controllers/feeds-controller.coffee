'use strict'

app.controller 'FeedsCtrl', ['$scope', ($scope) ->
  if Boolean(location.pathname.match(/public/g))
    $scope.publicSelected = true
  else
    $scope.feedSelected = true
]
