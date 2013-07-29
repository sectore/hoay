'use strict'

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

    $scope.next = ->
      $navigate.go '/settings', 'modal'

    $scope.prev = ->
      $navigate.back()

    charts = ["all", "years", "months", "days"]
    selectedChartIndex = 0
    $scope.chart = charts[selectedChartIndex]

    $scope.nextChart = ->
      if selectedChartIndex is charts.length - 1
      then selectedChartIndex = 0
      else selectedChartIndex++

      $scope.chart = charts[selectedChartIndex]

    $scope.updateStartDate = ->
      dateModel.setStart new Date(1967,1,3)
      dateModel.setEnd new Date(1989,5,17)

    $scope.updateStartDate2 = ->
      dateModel.setStart new Date(1988,2,5)
      dateModel.setEnd new Date(2013,1,30)
]
