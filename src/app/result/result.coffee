# module definition
# ------------------------------------------------------------
angular.module('hoay.result', [
  'ajoslin.mobile-navigate'
  'ngRoute'
  'hoay.dates'
])

# constants
# ------------------------------------------------------------
  .constant 'RESULT_SUB_VIEW_STATE',
    YEARS_TOTAL: 'years-total'
    MONTHS_TOTAL: 'months-total'
    DAYS_TOTAL: 'days-total'
    SUM: 'sum'

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
  'RESULT_SUB_VIEW_STATE'
  ($scope, $navigate, $log, dateModel, SUB_VIEW_STATE)->

    init = ->
      $scope.dateModel = dateModel
      $scope.subViewState = SUB_VIEW_STATE.SUM

    $scope.next = ->
      $navigate.go '/settings', 'modal'

    $scope.prev = ->
      $navigate.back()

    $scope.showTotalYears = ->
      $scope.subViewState = SUB_VIEW_STATE.YEARS_TOTAL

    $scope.isYearsTotalViewState = ->
      $scope.subViewState is SUB_VIEW_STATE.YEARS_TOTAL

    $scope.showTotalMonths = ->
      $scope.subViewState = SUB_VIEW_STATE.MONTHS_TOTAL

    $scope.isMonthsTotalViewState = ->
      $scope.subViewState is SUB_VIEW_STATE.MONTHS_TOTAL

    $scope.showTotalDays = ->
      $scope.subViewState = SUB_VIEW_STATE.DAYS_TOTAL

    $scope.isDaysTotalViewState = ->
      $scope.subViewState is SUB_VIEW_STATE.DAYS_TOTAL

    $scope.showSum = ->
      $scope.subViewState = SUB_VIEW_STATE.SUM

    $scope.isSumViewState = ->
      $scope.subViewState is SUB_VIEW_STATE.SUM

    init()


  ]
