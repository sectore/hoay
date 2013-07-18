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
.controller 'resultController'
, ($scope, $navigate, $log)->
  $log.info "ResultController"

  $scope.prev = ->
    $navigate.back()

  $scope.next = ->
    $navigate.go '/settings', 'modal'
