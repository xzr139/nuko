app.controller 'BootstrapController', ['$scope', ($scope) ->
  $scope.hide = ->
    $(".alert.fade.in").hide()
    return true
]
