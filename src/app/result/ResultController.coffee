'use strict'

angular.module('hoay.result', [])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/result',
      controller: 'ResultController',
      templateUrl: 'result/result.tpl.html'
])

.controller 'ResultController'
, ($scope, $navigate, $log)->
  $log.info "ResultController"

  $scope.prev = ->
    $navigate.back()

  $scope.next = ->
    $navigate.go '/settings', 'modal'
