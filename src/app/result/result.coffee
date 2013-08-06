# module definition
# ------------------------------------------------------------
angular.module('hoay.result', [])

# config
# ------------------------------------------------------------
.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/result',
      controller: 'resultController',
      templateUrl: 'result/result.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller 'resultController', [
  '$scope',
  '$navigate',
  '$log',
  'DateModel'
  ($scope, $navigate, $log, dateModel)->

    $scope.dateModel = dateModel

    $scope.monthsPercent = 45

    $scope.subViewState = 'sum'

    $scope.next = ->
      $navigate.go '/settings', 'modal'

    $scope.prev = ->
      $navigate.back()

    $scope.showTotalYears =->
      $scope.subViewState = 'total-years'

    $scope.showTotalMonths =->
      $scope.subViewState = 'total-months'

    $scope.showTotalDays =->
      $scope.subViewState = 'total-days'

    $scope.showSum = ->
      $scope.subViewState = 'sum'


]
