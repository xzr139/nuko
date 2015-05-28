app.controller 'bootstrapCtrl', ['$scope', ($scope) ->
  $scope.hide = ->
    $(".alert.fade.in").hide()
    return true
]
