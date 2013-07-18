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
    .when '/',
      controller: 'resultController',
      templateUrl: 'result/result.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller 'resultController', [
  '$scope',
  '$navigate',
  '$log',
  'dateModel'
  ($scope, $navigate, $log, dateModel)->

    startDate = dateModel.startDate
    endDate = dateModel.endDate

    startMoment = moment startDate
    endMoment = moment endDate

    getDays = ->
      endMoment.diff startMoment, 'days', true

    getMonths = ->
      endMoment.diff startMoment, 'months', true

    getYears = ->
      endMoment.diff startMoment, 'years', true

    $scope.endDate = endDate
    $scope.startDate = startDate

    $scope.days = getDays()
    $scope.months = getMonths()
    $scope.years = getYears()

    $scope.next = ->
      $navigate.go '/settings', 'modal'

    $scope.prev = ->
      $navigate.back()

]
