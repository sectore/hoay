'use strict'

angular.module('hoay.calculate', [])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/',
      controller: 'CalculateController',
      templateUrl: 'calculate/calculate.tpl.html'
])

.controller 'CalculateController'
, ($scope, $navigate)->
  $scope.world = "calculate"

  $scope.showResult = ->
    $navigate.go '/result'

  $scope.showSettings = ->
    $navigate.go '/settings', 'modal'

  $scope.showInfo = ->
    $navigate.go '/info', 'modal'

